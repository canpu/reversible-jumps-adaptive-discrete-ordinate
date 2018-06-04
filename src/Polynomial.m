%% File Information
% Authors: Can Pu
% Date of Creation: June 4, 2018
% Date of Last Modification: June 4, 2018

%% Class Definition
classdef Polynomial
    % Class Name: Polynomial
    % Brief: A polynomial with two variables x and y of degree 2
    % Properties:   coeff - a 1X6 vector of coefficients of monomials; the
    %                   cofficients are associated with x^2, xy, y^2, x, y,
    %                   and const in order
    % Methods:  constructor(coeff)
    %           eval(x, y) - evaluate the polynomial at the specified
    %               position
    %           gradient() - compute the gradient (a 2X1 array of
    %           	polynomials) of the polynomial
    properties
        coeff = [0 0 0 0 0 1]
    end
    
    methods
        function obj = Polynomial(coeff)
            % Function: Constructor
            % Brief: Initialize an object with specified coefficients
            obj.coeff = coeff;
        end
        
        function val = eval(obj, x, y)
            % Function Name: eval
            % Brief: Evaluate the value of the polynomial at given position
            % Input: x, y
            % Notes: This function works with vectors of x's and y's
            val = obj.coeff(1) * x.^2 + obj.coeff(2) * x .* y + ...
                obj.coeff(3) * y.^2 + obj.coeff(4) * x + obj.coeff(5) * y + ...
                obj.coeff(6);
        end
        
        function grad_polynomial = gradient(obj)
            % Function Name: gradient
            % Brief: compute the gradient of the polynomial and return a
            %           2X1 array of polynomials
            grad_polynomial = [Polynomial([0 0 0 2*obj.coeff(1) obj.coeff(2) + obj.coeff(4)]); ...
                Polynomial([0 0 0 obj.coeff(2) 2*obj.coeff(3) obj.coeff(5)])];
        end
    end
end
