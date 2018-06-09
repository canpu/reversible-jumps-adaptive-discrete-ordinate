%% File Information
% Authors: Can Pu
% Date of Creation: June 4, 2018
% Date of Last Modification: June 6, 2018

%% Class Definition
classdef Cell < handle
    % Class Name: Cell
    % Properties:   x_start
    %               y_start
    %               x_width
    %               y_width
    %               int_quad_pt - a matrix consisting of quadrature
    %                   points in the interior of the cell; each row is a
    %                   quadrature point (x, y)
    %               int_quad_wt - a vector consisting of weights of
    %                   associated abscissae for interior quadrature
    %               bound_quad_pt - a matrix consisting of quadrature
    %                   points on the boundary of the cell; each column is
    %                   a boundary with 1 be right, 2 be top, 3 be left and
    %                   4 be bottom; each element specifies a point on the
    %                   associated boundary; since one of x- and
    %                   y-coordinate is fixed on a boundary, we only store
    %                   the coordinate that is varying on the corresponding
    %                   boundary; for example, on the top boundary, we only
    %                   need to store x
    %               bound_quad_wt - a vector consisting of weights of
    %                   associated abscissae for boundary quadrature
    % Methods:  constructor(x_start, y_start, x_width, y_width) - create a
    %               cell with specified position and width, and compute the
    %               location of quadrature abscissae plus material
    %               properties
    %
    %           set_interaction(interaction_function_handle) - compute the
    %               interaction parameters at interior quadrature points;
    %               the function handle should be able to deal with
    %               vectorized inputs
    %           set_absorption(absorption_function_handle)
    %           set_scattering(scattering_function_handle)
    %           set_external_source(external_source_function_handle)
    %           update_scattering_source()
    properties
        x_start
        y_start
        x_width
        y_width
        
        int_quad_pt
        int_quad_wt
        bound_quad_pt
        bound_quad_wt
        
        interaction_quad_pt
        absorption_quad_pt
        scattering_quad_pt
        external_source_quad_pt
        scattering_source_quad_pt
        
        psi_int_quad_pt
        psi_bound_quad_pt
        psi_node_pt
    end
    
    methods
        function obj = Cell(x_start, y_start, x_width, y_width, ...
                unit_square_quad_pt, unit_square_quad_wt, ...
                standard_gl_quad_pt, standard_gl_quad_wt)
            % Function: constructor
            % Inputs:   x_start
            %           y_start
            %           unit_square_quad_pt - the quadrature in [0, 1]X[0,
            %               1] would be transformed to interior quadrature 
            %           unit_square_quad_wt
            %           standard_gl_quad_pt - the quadrature on [-1, 1]
            %               would be transformed to the boundary quadrature
            obj.x_start = x_start;
            obj.y_start = y_start;
            obj.x_width = x_width;
            obj.y_width = y_width;
            
        end
        
        function set_interaction(obj, interaction_fcn)
            % Function: set_interaction
            % Brief: Compute the interaction parameters at the interior
            %           quadrature points
            % Inputs:   interaction_fcn - the function handle shoule be
            %               able to deal with vectorized inputs (x, y)
            obj.interaction_quad_pt = interaction_fcn(obj.int_quad_pt(:, 1), ...
                obj.int_quad_pt(:, 2));
        end
        
        function set_absorption(obj, absorption_fcn)
            % Function: set_absorption
            % Brief: Compute the absorption parameters at the interior
            %           quadrature points
            % Inputs:   absorption_fcn - the function handle shoule be
            %               able to deal with vectorized inputs (x, y)
            obj.absorption_quad_pt = absorption_fcn(obj.int_quad_pt(:, 1), ...
                obj.int_quad_pt(:, 2));
        end
        
        function set_scattering(obj, scattering_fcn)
            % Function: set_scattering
            % Brief: Compute the scattering parameters at the interior
            %           quadrature points
            % Inputs:   scattering_fcn - the function handle shoule be
            %               able to deal with vectorized inputs (x, y)
            obj.scattering_quad_pt = scattering_fcn(obj.int_quad_pt(:, 1), ...
                obj.int_quad_pt(:, 2));
        end
        
        function set_external_source(obj, external_source_fcn)
            % Function: set_external_source
            % Brief: Compute the external source at the interior
            %           quadrature points
            % Inputs:   external_source_fcn - the function handle shoule be
            %               able to deal with vectorized inputs
            obj.external_source_quad_pt = external_source_fcn(obj.int_quad_pt(:, 1), ...
                obj.int_quad_pt(:, 2));
        end
        
        function update_scattering_source(obj)
            % Function: update_scattering_source
            % Brief: Update the scattering source based on angular flux and
            %           scattering parameter
            %% Fill this section by code
            % Compute psi_quad_pt by interpolation
            obj.scattering_source_quad_pt = psi_quad_pt .* obj.scattering_quad_pt;
        end
        
        function set_angular_flux_bound_quad_pt(angular_flux_bound_quad_pt)
            %% Has not started working on this function
        end
        
        function angular_flux_bound_quad_pt = get_angular_flux_bound_quad_pt(obj)
            %% Has not started working on this function
        end
        
        function compute_local_matrix()
            %% Has not started working on this function
        end
        
        function sweep(obj, direction_index)
            %% Has not started working on this function
        end
        
    end
end
