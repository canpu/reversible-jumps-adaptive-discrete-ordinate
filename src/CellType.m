%% File Information
% Author: Can Pu
% Date of Creation: June 4, 2018
% Date of Last Modification: June 4, 2018

%% Class Definition
classdef CellType
    % Class Name: CellType
    % Properties:   x_width
    %               y_width
    % Methods:  constructor(dx, dy)
    properties
        x_width
        y_width
    end
    
    methods
        function obj = CellType(dx, dy)
            % Function: constructor
            % Inputs:   dx
            %           dy
            assert(dx > 0 & dy > 0, 'Cell width must be positive.')
            obj.x_width = dx;
            obj.y_width = dy;
        end
    end
end
