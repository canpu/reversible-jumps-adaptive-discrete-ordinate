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
    properties (Access = 'private')
        coeff
    end
    
    methods (Access = 'public')
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
end
