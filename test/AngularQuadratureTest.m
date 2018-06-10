%% File Information
% Authors: Can Pu
% Date of Creation: June 9, 2018
% Date of Last Modification: June 10, 2018

%% Unit Tests Definition
classdef AngularQuadratureTest < matlab.unittest.TestCase
    % Class Name: AngularQuadratureDiscreteOrdinateSolverTest
    % Tests:    verify_angular_quadrature
    properties
        quadrature;
        order
        tol
    end
 
    methods (TestMethodSetup)
        function createTestObject(test)
            test.order = 16;
            test.quadrature = AngularQuadrature(test.order);
            test.tol = 1e-14;
        end
    end
    
    methods (Test)
        function verify_angular_quadrature(test)
            [x_mu, w_mu] = GLegIntP(test.order);
            [x_eta, w_eta] = GCIntP(test.order);
            test.verifySize(test.quadrature.pt, [test.order^2 2], ...
                'The dimension of the angular quadrature abscissae is incorrect');
            test.verifySize(test.quadrature.wt, [test.order^2 1], ...
                'The dimension of the angular quadrature weights is incorrect');
            test.verifyEqual(unique(test.quadrature.pt(:, 1)), x_mu, ...
                'The angular Gauss-Legendre quadrature abscissae are incorrect');
            test.verifyEqual(unique(test.quadrature.pt(:, 2)), x_eta, ...
                'The angular Gauss-Chebyshev quadrature abscissae are incorrect');
            test.verifyEqual(test.quadrature.wt(1:test.order:end), w_mu .* w_eta, ...
                'The angular Gauss-Chebyshev quadrature abscissae are incorrect');
        end
    end
end