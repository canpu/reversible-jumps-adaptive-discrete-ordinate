%% File Information
% Authors: Can Pu
% Date of Creation: June 9, 2018
% Date of Last Modification: June 14, 2018

%% Unit Tests Definition
classdef QuadratureTest < matlab.unittest.TestCase
    % Class Name: QuadratureDiscreteOrdinateSolverTest
    % Tests:    verify_interior_quadrature
    properties
        quadrature;
        order = 8;
        tol = 1e-14;
    end
    
    methods (TestMethodSetup)
        function createTestObject(test)
            test.quadrature = Quadrature(test.order);
        end
    end
    
    methods (Test)
        function verify_interior_quadrature(test)
            [x, w_x] = GLegIntP(test.order);
            x = x / 2 + 0.5;
            w_x = w_x / 2;
            y = x;
            w_y = w_x;
            test.verifySize(test.quadrature.pt, [test.order^2 2], ...
                'The dimension of the angular quadrature abscissae is incorrect');
            test.verifySize(test.quadrature.wt, [test.order^2 1], ...
                'The dimension of the angular quadrature weights is incorrect');
            test.verifyEqual(unique(test.quadrature.pt(:, 1)), x, ...
                'The Gauss-Legendre quadrature abscissae are incorrect');
            test.verifyEqual(unique(test.quadrature.pt(:, 2)), y, ...
                'The Gauss-Legendre quadrature abscissae are incorrect');
            test.verifyEqual(test.quadrature.wt(1:test.order:end), w_x .* w_y(1), ...
                'The angular Gauss-Chebyshev quadrature abscissae are incorrect');
        end
    end
end