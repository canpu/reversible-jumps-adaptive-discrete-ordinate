%% File Information
% Authors: Anqi Bao and Can Pu
% Date of Creation: June 3, 2018
% Date of Last Modification: June 9, 2018
% Notes:    1. The file needs the toolbox "Vectorized Numerical
%               Integration", which can be downloaded from
%               https://www.mathworks.com/matlabcentral/fileexchange/48931-vectorized-numerical-integration-matlab?s_tid=mwa_osa_a
%           2. The file is not completed.

%% Class Definition
classdef DiscreteOrdinateSolver < handle
    % Class name: DiscreteOrdinateSolver
    % Breif: The class is a discrete ordinate solver for a 2D
    %           isotropic advection-scattering problem
    % Properties:   angular_order - the order of discrete ordinate
    %                   discretization on the unit spherical surface; we
    %                   only allow even orders in this project
    %               
    %               x_start, x_end, y_start, y_end - limits of the domain
    %               interaction_fcn, absorption_fcn, scattering_fcn,
    %                   source_fcn - the function handles depending on
    %                   spatial position (x, y)
    % Methods:  set_domain_lim(x_start, x_end, y_start, y_end)
    %           set_interaction_function(function_handle)
    %           set_absorption_function(function_handle)
    %           set_scattering_function(function_handle)
    %           set_source_function(function_handle)
    %           set_spatial_order(n) - set spatial_order to n, and compute
    %               the spatial Guass-Legendre quadrature set in [-1, 1]
    %               (spatial_pt and spatial_wt)
    %           set_angular_order(n) - set angular order to n, compute
    %               the angular Gauss-Legendre X Gauss-Chebyshev quadrature
    %               set (angular_pt and angular_wt) and record the indices
    %               of directions by which quadrant they belong to in
    %               quad_dir_indices
    %          
    % Notes:    1. To be added: refinement, derefinement, the Cell class,
    %                               the evaluate function, the error
    %                               function, single cell sweep, iterate,
    %                               basis polynomial, Jacobian
    properties (Access = 'public')
        
        % Quadrature
        spatial_order = 2
        spatial_pt = [-1/sqrt(3); 1/sqrt(3)]
        spatial_wt = [1; 1]
        angular_order = 2
        angular_pt = [-1/sqrt(3); 1/sqrt(3)]
        angular_wt = [pi/2; pi/2]
        quad_dir_indices = [4 2 1 3]
        
        unit_square_basis
        incoming_flux
        
        % Geometry Properties
        x_start = 0
        x_end = 1
        y_start = 0
        y_end = 1
        
        % Material Properties
        interaction_fcn = @(x, y) 1
        absorption_fcn = @(x, y) 0.5
        scattering_fcn = @(x, y) 0.5
        source_fcn = @(x, y) 1
        
        % Cell Data
        cells
        act_cell_indices
        dis_cell_indices
        
    end
    methods (Access = 'public')
        
        function obj = set_domain_lim(obj, x_start, x_end, y_start, y_end)
            % Function: set the starting and ending points along x- and
            %               y-axis of the domain, and initiate the cell
            %               type array, cell array, active cell indices
            %               dissected cell indices
            % Inputs:   x_start
            %           x_end
            %           y_start
            %           y_end
            assert(x_start < x_end & y_start < y_end, 'The starting point cannot exceeding the ending point.');
            obj.x_start = x_start;
            obj.x_end = x_end;
            obj.y_start = y_start;
            obj.y_end = y_end;
            obj.cells = Cell((x_end + x_start) / 2, (y_end + y_start) / 2, ...
                1, obj.spatial_pt);
        end
        
        function obj = set_interaction_function(obj, function_handle)
            % Function: set the function handle for interaction parameter
            % Inpupt: function_handle - the function handle for interaction
            obj.interaction_fcn = function_handle;
        end
        
        function obj = set_absorption_function(obj, function_handle)
            % Function: set the function handle for absorption parameter
            % Inpupt: function_handle - the function handle for absorption
            obj.absorption_fcn = function_handle;
        end
        
        function obj = set_scattering_function(obj, function_handle)
            % Function: set the function handle for scattering parameter
            % Inpupt: function_handle - the function handle for scattering
            obj.scattering_fcn = function_handle;
        end
        
        function obj = set_source_function(obj, function_handle)
            % Function: set the function handle for external source
            % Inpupt: function_handle - the function handle for source
            obj.source_fcn = function_handle;
        end
        
        function obj = set_spatial_order(obj, n)
            % Function: set the degree of polynomials used in spatial
            %	discretization and compute the corresponding quadrature
            %	set
            % Input: n - the order of Gauss-Legendre quadrature set; has to
            %           be 2 for now
            assert(n == 2, 'Currently the solver only works with spatial Gauss-Legendre quadrature of order 2.');
            obj.spatial_order = n;
            [obj.spatial_pt, obj.spatial_wt] = GLegIntP(n);
        end
        
        function generate_quadrature(obj, n)
            % Function: set the order of angular discretization, compute
            %   the corresponding quadrature set and group directions by
            %   quadrant
            % Inpupt: n - the order of Gauss-Legendre and Gauss-Chebyshev
            %   quadrature sets; has to be even for now
                    
        end
        
        function obj = set_uniform_mesh(obj, nx, ny)
            % Function Name: set_uniform_mesh
            % Brief: Generate uniform mesh with specified number of cells
            %           along each axis
            % Inputs:   nx - the number of cells along x-axis
            %           ny - the number of cells along y-axis
            %% Has not started working on this function yet
        end
        
        
        
        
        
        function sweep(obj, varargin)
            %% Has not started working on this function yet
        end
        
        function source_iterate(obj, tolerance)
            %% We do not work on this function in Phase 1
        end
        
        function val = eval(obj, x, y)
            %% Has not started working on this function yet
        end
        
        function refine(obj, cell_index)
            %% We do not complete this function in Phase 1
        end
        
        function derefine(obj, cell_index)
            %% We do not complete this function in Phase 1
        end
        
    end
end
