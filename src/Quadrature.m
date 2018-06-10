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
    % Methods:  constructor(type) - supported types are 'interior' and
    %               'boundary'; the order is fixed to 2
    properties (SetAccess = protected, GetAccess = public, Hidden = false)
        order
        pt
        wt
    end
    
    methods (Access = public)
        function obj = Quadrature(varargin)
            if nargin == 0
                return;
            end
            switch varargin{1}
                case 'interior'
                    obj.order = 2;
                    tmp = 1 / sqrt(3);
                    obj.pt = ([-tmp -tmp; -tmp tmp; tmp -tmp; tmp tmp] + 1) / 2;
                    obj.wt = 0.25 * ones(4, 1);
                case 'boundary'
                    obj.order = 2;
                    tmp = 1 / sqrt(3);
                    obj.pt = ([-tmp; tmp] + 1) / 2;
                    obj.wt = 0.5 * ones(2, 1);
                otherwise
                    error('The specified type of quadrature is not supported.');
            end
        end
    end
end