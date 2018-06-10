%% File Information
% Authors: Can Pu
% Date of Creation: June 4, 2018
% Date of Last Modification: June 9, 2018

%% Class Definition
classdef Polynomial < handle
    % Class Name: Polynomial
    % Brief: A polynomial with two variables x and y of degree 3
    % Properties:   coeff - a 1X8 vector of coefficients of monomials; the
    %                   cofficients are associated with x^2y, xy^2, x^2, 
    %                   xy, y^2, x, y, and const in order
    % Methods:  constructor(coeff)
    %           eval(x, y) - evaluate the polynomial at the specified
    %               position
    %           gradient() - compute the gradient (a 2X1 array of
    %           	polynomials) of the polynomial
    %           generate_unit_square_basis (Static) - Get the polynomial
    %               basis of degree 2 in a sqaure [0, 1] X [0, 1]
    properties (SetAccess = private, GetAccess = public, Hidden = false)
        coeff
    end
    
    methods (Access = public)
        function obj = Polynomial(coeff)
            % Function: Constructor
            % Brief: Initialize an object with specified coefficients
            coeff = [coeff(:)' zeros(1, max(0, 8 - numel(coeff)))];
            obj.coeff = coeff(1:8);
        end
        
        function val = eval(obj, x, y)
            % Function Name: eval
            % Brief: Evaluate the value of the polynomial at given position
            % Input: x, y
            % Notes: This function works with vectors of x's and y's
            assert(all(size(x) == size(y)), 'The size of x and y must match.');
            val = obj.coeff(1) * x.^2 .* y + obj.coeff(2) * x .* y.^2 + ...
                obj.coeff(3) * x.^2 + obj.coeff(4) * x .* y + ...
                obj.coeff(5) * y.^2 + obj.coeff(6) * x + obj.coeff(7) * y + ...
                obj.coeff(8);
        end
        
        function grad_polynomial = gradient(obj)
            % Function Name: gradient
            % Brief: compute the gradient of the polynomial and return a
            %           2X1 array of polynomials
            grad_polynomial = [Polynomial([0 0 0 2*obj.coeff(1) ...
                obj.coeff(2) 2*obj.coeff(3) obj.coeff(4) obj.coeff(6)]); ...
                Polynomial([0 0 obj.coeff(1) 2*obj.coeff(2) 0 obj.coeff(4) ...
                2*obj.coeff(5) obj.coeff(7)])];
        end
    end
    
    methods (Static = true)
        function basis = get_unit_square_basis()
            % Function Name: get_unit_square_basis
            % Breif: Get the polynomial basis of degree 2 in a sqaure
            %           [0, 1] X [0, 1]
            % Output: basis - an 8X1 array of Polynomial objects; the eight
            %           polynomials are for nodes (0, 0), (0, 1), (1, 1), (1,0),
            %           (0, 0.5), (0.5, 1), (1, 0.5), (0.5, 0) in order
            basis = [
                Polynomial([-2 -2 2 5 2 -3 -3 1]); Polynomial([2 -2 0 -1 2 0 -1 0]); ...
                Polynomial([2 2 0 -3 0 0 0 0]); Polynomial([-2 2 2 -1 0 -1 0 0]); ...
                Polynomial([0 4 0 -4 -4 0 4 0]); Polynomial([-4 0 0 4 0 0 0 0]); ...
                Polynomial([0 -4 0 4 0 0 0 0]); Polynomial([4 0 -4 -4 0 4 0 0])];
        end
        
        function basis_grad = get_unit_square_basis_gradient()
            % Function Name: get_unit_square_basis_gradient
            % Breif: Get the gradient of polynomial basis of degree 2 in a
            %           sqaure [0, 1] X [0, 1]
            % Output: basis - an 8X2 array of Polynomial objects; the eight
            %           polynomials are for nodes (0, 0), (0, 1), (1, 1), (1,0),
            %           (0, 0.5), (0.5, 1), (1, 0.5), (0.5, 0) in order;
            %           the first column corresponds to differentiation wrt
            %           x while the second is associated with y
             basis = Polynomial.get_unit_square_basis(); %#ok<NASGU>
             grad = @(polynomial) polynomial.gradient()'; %#ok<NASGU>
             cmd = '[grad(basis(1))';
             for i = 2:8
                 cmd = [cmd, '; grad(basis(', num2str(i), '))']; %#ok<AGROW>
             end
             cmd = [cmd, ']'];
             basis_grad = eval(cmd);
        end
    end
end
