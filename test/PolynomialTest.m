%% File Information
% Authors: Can Pu
% Date of Creation: June 8, 2018
% Date of Last Modification: June 14, 2018

%% Unit Tests Definition
classdef PolynomialTest < matlab.unittest.TestCase
    % Class Name: PolynomialTest
    % Tests:    verify_coefficient_length
    %           verify_gradient
    %           verify_basis_for_unit_square
    %           verify_transform_from_unit_square
    properties
        polynomial
        tolerance = 1e-14;
    end
 
    methods (Test)
        function verify_coefficient_length(test)
            test.polynomial = Polynomial(1:2);
            test.verifyEqual(test.polynomial.coeff, [1 2 0 0], ...
                'The constructor of Polynomial is incorrect.');
            test.polynomial = Polynomial(1:10);
            test.verifyEqual(test.polynomial.coeff, 1:4, ...
                'The constructor of Polynomial is incorrect.');
        end
        
        function verify_gradient(test)
            coeff = diag(ones(1, 4));
            dx_coeff = zeros(4);
            dy_coeff = zeros(4);
            dx_coeff(1, 3) = 1;
            dy_coeff(1, 2) = 1;
            dx_coeff(2, 4) = 1;
            dy_coeff(3, 4) = 1;
            for i = 1:4
                test.polynomial = Polynomial(coeff(i, :));
                test.verifyEqual(test.polynomial.gradient(), ...
                    [Polynomial(dx_coeff(i, :)); Polynomial(dy_coeff(i, :))], ...
                    'The gradient method of Polynomial class is incorrect.');
            end
        end
        
        function verify_basis_for_unit_square(test)
            x = [0 0 1 1];
            y = [0 1 1 0];
            expected = diag(ones(1, 4));
            unit_square_basis = Polynomial.get_unit_square_basis();
            for i = 1:4
                test.verifyEqual(unit_square_basis(i).eval(x, y), expected(i, :), ...
                    ['The basis polynomial NO.', num2str(i), ' for the reference square is incorrect.']);
            end
        end
        
        function verify_transform_from_unit_square(test)
            x_start = 17;
            x_width = 3;
            y_start = -5;
            y_width = 4;
            test.polynomial = Polynomial([1 2 3 4]);
            x_test_trans = [14 14 23 23 17 17 20 20 18 18 18 19 19 19];
            y_test_trans = [-9 3 -9 3 -5 -1 -5 -1 -4 -3 -2 -4 -3 -2];
            x_test_unit = [-1 -1 2 2 0 0 1 1 1/3 1/3 1/3 2/3 2/3 2/3];
            y_test_unit = [-1 2 -1 2 0 1 0 1 1/4 1/2 3/4 1/4 1/2 3/4];
            transformed = test.polynomial.transform_from_unit_square(x_start, ...
                x_width, y_start, y_width);
            diff = norm(test.polynomial.eval(x_test_unit, y_test_unit) ...
                - transformed.eval(x_test_trans, y_test_trans), inf);
            test.verifyTrue(diff < test.tolerance, 'The polynomial is not correctly transformed from unit square to the given rectangule.');
        end
    end
end