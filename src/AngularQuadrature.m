%% File Information
% Authors: Can Pu
% Date of Creation: June 9, 2018
% Date of Last Modification: June 9, 2018
% Notes:    1. The file needs the toolbox "Vectorized Numerical
%               Integration", which can be downloaded from
%               https://www.mathworks.com/matlabcentral/fileexchange/48931-vectorized-numerical-integration-matlab?s_tid=mwa_osa_a

%% Class Definition
classdef AngularQuadrature < Quadrature
    % Class Name: AngularQuadrature
    % Brief: The class is a Legendre-Chebyshev quadrature set 
    %           for angular discretization
    % Properties:   order
    %               pt - the abscissae
    %               wt - a row vector of weights
    %               quad_direction_indices - a matrix recording what quadrant
    %                   each angular pt belongs to; a column represents a
    %                   quadrant (from 1 to 4) while each column vector
    %                   consists of the indices of angular points belonging
    %                   to that quadrant
    % Methods:  constructor(order)
    properties (SetAccess = private, GetAccess = public, Hidden = false)
        quadrant_indices
    end
    
    methods (Access = public)
        function obj = AngularQuadrature(order)
            assert(order > 0, 'The angular order must a be positive integer.');
            assert(mod(order, 2) == 0, 'The angular order cannot be set to odd.');
            [mu, w_mu] = GLegIntP(order);
            [eta, w_eta] = GCIntP(order);
            [mu, eta] = meshgrid(mu, eta);
            [w_mu, w_eta] = meshgrid(w_mu, w_eta);
            mu = mu(:);
            eta = eta(:);
            w_mu = w_mu(:);
            w_eta = w_eta(:);
            obj.order = order;
            obj.pt = [mu, eta];
            obj.wt = w_mu .* w_eta;
            natural_numbers = (1:order * order)';
            obj.quadrant_indices = [ ...
                natural_numbers((obj.pt(:, 1) > 0) & obj.pt(:, 2) > 0), ...
                natural_numbers((obj.pt(:, 1) < 0) & obj.pt(:, 2) > 0), ...
                natural_numbers((obj.pt(:, 1) < 0) & obj.pt(:, 2) < 0), ...
                natural_numbers((obj.pt(:, 1) > 0) & obj.pt(:, 2) < 0)];
        end
    end
end