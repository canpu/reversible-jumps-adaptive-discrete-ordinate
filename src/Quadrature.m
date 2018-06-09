%% File Information
% Authors: Can Pu
% Date of Creation: June 9, 2018
% Date of Last Modification: June 9, 2018
% Notes:    1. The file needs the toolbox "Vectorized Numerical
%               Integration", which can be downloaded from
%               https://www.mathworks.com/matlabcentral/fileexchange/48931-vectorized-numerical-integration-matlab?s_tid=mwa_osa_a

%% Class Definition
classdef Quadrature < handle
    % Class Name: Quadrature
    % Brief: The class supports Gauss-Legendre quadrature of order 2 for
    %           the interior and boundary of a reference square, and
    %           Legendre-Chebyshev quadrature for angular discretization
    % Properties:   order
    %               pt - the abscissae
    %               wt - a row vector of weights
    % Methods:  constructor(type, varargin) - supported types are
    %               'interior', 'boundary' and 'angular'; when type is
    %               'angular', a specified even order is needed, otherwise
    %               the order is fixed to 2
    properties (SetAccess = private, GetAccess = public, Hidden = false)
        order
        pt
        wt
    end
    
    methods (Access = public)
        function obj = Quadrature(type, varargin)
            switch type
                case 'interior'
                    assert(nargin == 1, 'When an Quadrature object is interior, the order is fixed to 2.');
                    obj.order = 2;
                    tmp = 1 / sqrt(3);
                    obj.pt = ([-tmp -tmp; -tmp tmp; tmp -tmp; tmp tmp] + 1) / 2;
                    obj.wt = 0.25 * ones(4, 1);
                case 'boundary'
                    assert(nargin == 1, 'When an Quadrature object is boundary, the order is fixed to 2.');
                    obj.order = 2;
                    tmp = 1 / sqrt(3);
                    obj.pt = ([-tmp; tmp] + 1) / 2;
                    obj.wt = 0.5 * ones(2, 1);
                case 'angular'
                    assert(nargin == 2, 'When an Quadrature object is "angular", the order (an even positive integer) needed to be provided.');
                    n = varargin{1};
                    assert(n > 0, 'The angular order must a be positive integer.');
                    assert(mod(n, 2) == 0, 'The angular order cannot be set to odd.');
                    [mu, w_mu] = GLegIntP(n);
                    [eta, w_eta] = GCIntP(n);
                    [mu, eta] = meshgrid(mu, eta);
                    [w_mu, w_eta] = meshgrid(w_mu, w_eta);
                    mu = mu(:);
                    eta = eta(:);
                    w_mu = w_mu(:);
                    w_eta = w_eta(:);
                    obj.order = n;
                    obj.pt = [mu, eta];
                    obj.wt = w_mu .* w_eta;
                otherwise
                    error('The specified type of quadrature is not supported.');
            end
        end
    end
end