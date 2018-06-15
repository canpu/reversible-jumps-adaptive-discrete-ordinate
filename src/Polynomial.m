%% File Information
% Author: Can Pu
% Date of Creation: June 4, 2018
% Date of Last Modification: June 14, 2018

%% Class Definition
classdef Polynomial < handle
    % Class Name: Polynomial
    % Brief: A polynomial with two variables x and y of degree 2
    % Properties:   coeff - a 1X4 vector of coefficients of monomials; the
    %                   cofficients are associated with xy, x, y and const 
    %                   in order
    % Methods:  constructor(coeff)
    %           eval(x, y) - evaluate the polynomial at the specified
    %               position
    %           gradient() - compute the gradient (a 2X1 array of
    %           	polynomials) of the polynomial
    properties (SetAccess = private, GetAccess = public, Hidden = false)
        coeff
    end
    
    methods (Access = public)
        function obj = Polynomial(coeff)
            % Function: Constructor
            % Brief: Initialize an object with specified coefficients
            coeff = [coeff(:)' zeros(1, 4 - numel(coeff))];
            obj.coeff = coeff(1:4);
        end
        
        function val = eval(obj, x, y)
            % Function Name: eval
            % Brief: Evaluate the value of the polynomial at given position
            % Input: x, y
            % Notes: This function works with matrices or vectors of x's
            %           and y's
            assert(all(size(x) == size(y)), 'The size of x and y must match.');
            val = obj.coeff(1) * x .* y + obj.coeff(2) * x + ...
                obj.coeff(3) * y + obj.coeff(4);
        end
        
        function grad_polynomial = gradient(obj)
            % Function Name: gradient
            % Brief: Compute the gradient of the polynomial and return a
            %           2X1 array of polynomials
            grad_polynomial = [Polynomial([0 0 obj.coeff(1) obj.coeff(2)]); ...
                Polynomial([0 obj.coeff(1) 0 obj.coeff(3)])];
        end
        
        function polynomial = transform_from_unit_square(obj, x_start, x_width, ...
                y_start, y_width)
            % Function Name: transform_from_unit_square
            % Brief: Transform the definition of the polynomial from unit
            %           square [0, 1] X [0, 1] to [x_start, x_start + x_width]
            %           X [y_start, y_start + y_width]
            assert(x_width > 0 & y_width > 0, 'Width in the x- and y-direction must be positive.');
            dxdy = x_width * y_width;
            polynomial = Polynomial([obj.coeff(1) / dxdy, ...
                obj.coeff(2) / x_width - obj.coeff(1) * y_start / dxdy, ...
                obj.coeff(3) / y_width - obj.coeff(1) * x_start / dxdy, ...
                obj.coeff(4) + x_start * y_start / dxdy ...
                    - obj.coeff(2) * x_start / x_width ...
                    - obj.coeff(3) * y_start / y_width]);
        end
    end
    
    methods (Static = true)
        function polynomials = get_unit_square_basis()
            % Function Name: get_unit_square_basis
            % Breif: Get the polynomial basis of order 1 in a sqaure
            %           [0, 1] X [0, 1]
            % Output: polynomials - an 4X1 array of Polynomial objects; the four
            %           polynomials are for nodes (0, 0), (0, 1), (1, 1), (1,0),
            %           in order
            persistent basis;
            if isempty(basis)
                basis = [Polynomial([1 -1 -1 1]); Polynomial([-1 0 1 0]);
                    Polynomial([1 0 0 0]); Polynomial([-1 1 0 0])];
            end
            polynomials = basis;
        end
    end
end
