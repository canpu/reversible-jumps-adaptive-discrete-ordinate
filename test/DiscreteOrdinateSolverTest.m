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
        end
    end
 
    methods (Test)
        
    end
 
end