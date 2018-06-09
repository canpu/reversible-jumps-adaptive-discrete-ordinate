%% File Information
% Authors: Can Pu
% Date of Creation: June 9, 2018
% Date of Last Modification: June 9, 2018

%% Unit Tests Definition
classdef QuadratureTest < matlab.unittest.TestCase
    % Class Name: QuadratureDiscreteOrdinateSolverTest
    % Tests:    verify_interior_quadrature
    %           verify_boundary_quadrature
    %           verify_angular_quadrature
    properties
        quadrature;
        tol = 1e-14;
    end
 
    methods (Test)
        function verify_interior_quadrature(test)
            test.quadrature = Quadrature('interior');
            test.verifySize(test.quadrature.wt, [4, 1], ...
                'Dimensionality of the interior quadrature weights is incorrect.');
            test.verifySize(test.quadrature.pt, [4, 2], ...
                'Dimensionality of the interior quadrature abscissae is incorrect.');
            test.verifyEqual(sum(test.quadrature.wt), 1, ...
                'The interior quadrature weight is incorrect.');
            test.verifySize(unique(test.quadrature.wt), [1, 1], ...
                'The interior quadrature weight is incorrect.');
            test.verifyTrue(all(abs(abs(unique(test.quadrature.pt - 0.5)) - 0.5/sqrt(3)) < test.tol), ...
                'The interior quadrature abscissae is incorrect.');
        end
        
        function verify_boundary_quadrature(test)
            test.quadrature = Quadrature('boundary');
            test.verifySize(test.quadrature.wt, [2, 1], ...
                'Dimensionality of the boundary quadrature weights is incorrect.');
            test.verifySize(test.quadrature.pt, [2, 1], ...
                'Dimensionality of the boundary quadrature abscissae is incorrect.');
            test.verifyEqual(sum(test.quadrature.wt), 1, ...
                'The boundary quadrature weight is incorrect.');
            test.verifySize(unique(test.quadrature.wt), [1, 1], ...
                'The boundary quadrature weight is incorrect.');
            test.verifyTrue(abs(test.quadrature.pt(end) - 0.5 - 0.5/sqrt(3)) < test.tol && ...
                abs(0.5 - test.quadrature.pt(1) - 0.5/sqrt(3)) < test.tol, ...
                'The boundary quadrature abscissae is incorrect.');
        end
        
        function verify_angular_quadrature(test)
            order = 16;
            test.quadrature = Quadrature('angular', order);
            [x_mu, w_mu] = GLegIntP(order);
            [x_eta, w_eta] = GCIntP(order);
            test.verifySize(test.quadrature.pt, [order^2 2], ...
                'The dimension of the angular quadrature abscissae is incorrect');
            test.verifySize(test.quadrature.wt, [order^2 1], ...
                'The dimension of the angular quadrature weights is incorrect');
            test.verifyEqual(unique(test.quadrature.pt(:, 1)), x_mu, ...
                'The angular Gauss-Legendre quadrature abscissae are incorrect');
            test.verifyEqual(unique(test.quadrature.pt(:, 2)), x_eta, ...
                'The angular Gauss-Chebyshev quadrature abscissae are incorrect');
            test.verifyEqual(test.quadrature.wt(1:order:end), w_mu .* w_eta, ...
                'The angular Gauss-Chebyshev quadrature abscissae are incorrect');
        end
    end
end