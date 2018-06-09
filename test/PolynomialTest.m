%% File Information
% Authors: Can Pu
% Date of Creation: June 9, 2018
% Date of Last Modification: June 9, 2018

%% Unit Tests Definition
classdef PolynomialTest < matlab.unittest.TestCase
    % Class Name: QuadratureDiscreteOrdinateSolverTest
    % Tests:    verify_coefficient_length
    %           verify_gradient
    properties
        polynomial
    end
 
    methods (Test)
        function verify_coefficient_length(test)
            test.polynomial = Polynomial(1:2);
            test.verifySize(test.polynomial.coeff, [1, 8], ...
                'The constructor of Polynomial is incorrect.');
            test.polynomial = Polynomial(1:10);
            test.verifySize(test.polynomial.coeff, [1, 8], ...
                'The constructor of Polynomial is incorrect.');
        end
        
        function verify_gradient(test)
            coeff = diag(ones(1, 8));
            dx_coeff = zeros(8);
            dy_coeff = zeros(8);
            dx_coeff(1, 4) = 2;
            dy_coeff(1, 3) = 1;
            dx_coeff(2, 5) = 1;
            dy_coeff(2, 4) = 2;
            dx_coeff(3, 6) = 2;
            dx_coeff(4, 7) = 1;
            dy_coeff(4, 6) = 1;
            dy_coeff(5, 7) = 2;
            dx_coeff(6, 8) = 1;
            dy_coeff(7, 8) = 1;
            for i = 1:8
                test.polynomial = Polynomial(coeff(i, :));
                test.verifyEqual(test.polynomial.gradient(), ...
                    [Polynomial(dx_coeff(i, :)); Polynomial(dy_coeff(i, :))], ...
                    'The gradient method of Polynomial class is incorrect.');
            end
        end
    end
end