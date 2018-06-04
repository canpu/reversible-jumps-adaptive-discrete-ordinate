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
    % Methods:  constructor(x_center, y_center, cell_type_index)
    properties
        x_center
        y_center
        cell_type_index
    end
    
    methods
        function obj = Cell(x_center, y_center, cell_type_index)
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
