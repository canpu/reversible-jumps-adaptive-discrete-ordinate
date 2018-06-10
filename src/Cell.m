%% File Information
% Authors: Anqi Bao and Can Pu
% Date of Creation: June 4, 2018
% Date of Last Modification: June 9, 2018

%% Class Definition
classdef Cell < handle
    % Class Name: Cell
    % Properties:   x_start
    %               y_start
    %               x_width
    %               y_width
    %               basis - the basis polynomials of order 2 in the reference
    %                   square [0,1]X[0,1]
    %               int_quad - Gauss-Legendre quadrature for the interior
    %                   of the [0,1]X[0,1] unit square
    %               bound_quad - Guass-Legendre quadrature for the unit
    %                   line segment [0,1]
    %               angular_quad - Legendre-Chebyshev quadrature for unit
    %                   spherical surface
    %               angular_order - the order of angular quadrature set
    %               interaction - a row vector of interaction
    %                   parameters at the interior quadrature points
    %               absorption
    %               scattering
    %               external_source
    %               scattering_source
    %               psi_int - a matrix of angular flux at the interior
    %                   quadrature points; each row index represents
    %                   different direction and each column index
    %                   represents different interior quadrature point
    %               psi_bound - a cell of matrix of angular flux at boundary
    %                   quadrature points; each cell is a boundary with 1 -
    %                   bottom, 2 - right, 3 - top, 4 - left; each row
    %                   index represents a different direction, and each
    %                   column index represents a different quadrature
    %                   point
    %               psi_node - a matrix of angular flux at interior
    %                   quadrature point; quadrature point is indexed by
    %                   column and direction is indexed by row
    % Methods:  constructor(x_start, y_start, x_width, y_width) - create a
    %               cell with specified position and width
    %           set_interaction(interaction_function_handle) - compute the
    %               interaction parameters at interior quadrature points;
    %               the function handle should be able to deal with
    %               vectorized inputs
    %           set_absorption(absorption_function_handle)
    %           set_scattering(scattering_function_handle)
    %           set_external_source(external_source_function_handle)
    %           update_scattering_souce - update the scattering source at
    %               interior quadrature points using the angular flux there
    %               and the scattering parameters at those points
    
    properties (GetAccess = public, Constant = true, Hidden = false)
        basis = Polynomial.get_unit_square_basis()
        basis_grad = Polynomial.get_unit_square_basis_gradient()
        int_quad = Quadrature('interior')
        bound_quad = Quadrature('boundary')
    end
    
    properties (SetAccess = private, GetAccess = public, Hidden = false)
        x_start
        y_start
        x_width
        y_width
        
        angular_quad
        
        interaction
        absorption
        scattering
        external_source
        scattering_source
        
        psi_int
        psi_bound
        psi_node
    end
    
    properties (Access = private)
        int_pt	% the Gauss-Legendre quadrature points scaled to the real rectangle 
    end
    
    methods (Access = public)
        
        function obj = Cell(x_start, y_start, x_width, y_width, angular_order)
            % Function: constructor
            % Inputs:   x_start
            %           y_start
            %           x_width
            %           y_width
            %           angular_order
            obj.x_start = x_start;
            obj.y_start = y_start;
            obj.x_width = x_width;
            obj.y_width = y_width;
            obj.angular_quad = AngularQuadrature(angular_order);
            obj.int_pt = [obj.int_quad.pt(:, 1) * obj.x_width + obj.x_start, ...
            	obj.int_quad.pt(:, 2) * obj.y_width + obj.y_start];
        end
        
        function set_interaction(obj, interaction_fcn)
            obj.interaction = interaction_fcn(obj.int_pt(:, 1), obj.int_pt(:, 2));
        end
        
        function set_absorption(obj, absorption_fcn)
            obj.absorption = absorption_fcn(obj.int_pt(:, 1), obj.int_pt(:, 2));
        end
        
        function set_scattering(obj, scattering_fcn)
            obj.scattering = scattering_fcn(obj.int_pt(:, 1), obj.int_pt(:, 2));
        end
        
        function set_external_source(obj, external_source_fcn)
            obj.external_source = external_source_fcn(obj.int_pt(:, 1), obj.int_pt(:, 2));
        end
        
        function update_scattering_source(obj)
            % Function: update_scattering_source
            % Brief: Update the scattering source based on angular flux at 
            %           quadrature points and scattering parameter
            obj.scattering_source = obj.psi_int .* obj.scattering;
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
