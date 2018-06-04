%% File Information
% Authors: Anqi Bao
% Date of Creation: June 4, 2018
% Date of Last Modification: June 4, 2018

%% Class Definition
classdef Polynomial
    % Class Name: Polynomial
    % Brief: A polynomial with two variables x and y
    % Properties:   degree
    %               coeff - a row vector of coefficients of monomials; the
    %                   cofficients a_i is supposed to be sorted in such a
    %                   manner like a_1*x^3 + a_2*x^2y + a_3*xy^2 + a_4*y^3
    %                   + a_5*x^2 + a_6*xy + a_7*y^2 + a_8*x + a_9*y + a_10
    % Methods:  set_degree(n) - set the degree of the polynomial and
    %               initialize the coefficient vector
    %           eval(x, y) - evaluate the polynomial at the specified
    %               position
    %           gradient() - compute the gradient (a 2X1 array of
    %           	polynomials) of the polynomial
    properties
        degree = 0
        coeff = 1
    end
    methods
        
        function obj = set_degree(obj, n)
            % Function Name: set_degree
            % Brief: Set the degree of the polynomial and
            %               initialize the coefficient vector
            % Input: n
            n = floor(n);
            assert(n >= 0, 'The degree of a polynomial cannot be negative.');
            obj.degree = n;
            obj.coeff = ones(1, (n+1) * (n+2) / 2);
        end
        
        function val = eval(obj, x, y)
            % Function Name: eval
            % Brief: Evaluate the value of the polynomial at given position
            % Input: x, y
            % Notes: This function should work with arrays of x's and y's
            %% Replace this section with code
        end
        
        function grad_polynomial = gradient(obj)
            % Function Name: gradient
            % Brief: compute the gradient of the polynomial and return a
            %           2X1 array of polynomials
            %% Replace this section with code
        end
    end
end