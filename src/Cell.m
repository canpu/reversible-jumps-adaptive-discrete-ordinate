%% File Information
% Authors: Can Pu
% Date of Creation: June 4, 2018
% Date of Last Modification: June 4, 2018

%% Class Definition
classdef Cell
    % Class Name: Cell
    % Properties:   x_center
    %               y_center
    %               cell_type_index
    %               int_quad_pt - a matrix consisting of quadrature
    %                   points in the interior of the cell; each row is a
    %                   quadrature point (x, y)
    % Methods:  constructor(x_center, y_center, cell_type_index) - create a
    %               cell with specified position and width, and compute the
    %               location of quadrature abscissae plus material
    %               properties
    properties
        x_center
        y_center
        cell_type_index
        
        int_quad_pt
        bound_quad_pt
        
        inter_quad_pt
        absorption_quad_pt
        scattering_quad_pt
        source_quad_pt
    end
    
    methods
        function obj = Cell(x_center, y_center, cell_type_index, quad_pt)
            % Function: constructor
            % Inputs:   x_center
            %           y_center
            %           cell_type_index
            obj.x_center = x_center;
            obj.y_center = y_center;
            obj.cell_type_index = cell_type_index;
            
        end
    end
end
