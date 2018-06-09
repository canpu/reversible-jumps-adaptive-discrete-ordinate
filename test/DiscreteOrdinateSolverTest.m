%% File Information
% Authors: Can Pu
% Date of Creation: June 9, 2018
% Date of Last Modification: June 9, 2018

%% Unit Tests Definition
classdef DiscreteOrdinateSolverTest < matlab.unittest.TestCase
    % Class Name: DiscreteOrdinateSolverTest
    % Tests:    verify_basis_for_unit_square
    properties
        discrete_ordinate_solver;
    end
 
    methods (TestMethodSetup)
        function createTestObject(test)
            test.discrete_ordinate_solver = DiscreteOrdinateSolver;
            test.discrete_ordinate_solver.generate_unit_square_basis();
        end
    end
 
    methods (Test)
        function verify_basis_for_unit_square(test)
            x = [0 0 1 1 0 0.5 1 0.5];
            y = [0 1 1 0 0.5 1 0.5 0];
            expected = diag(ones(1, 8));
            for i = 1:8
                test.verifyEqual(test.discrete_ordinate_solver.unit_square_basis(i).eval(x, y), expected(i, :), ...
                    ['The basis polynomial NO.', num2str(i), ' for the reference square is incorrect.']);
            end
        end
    end
 
end