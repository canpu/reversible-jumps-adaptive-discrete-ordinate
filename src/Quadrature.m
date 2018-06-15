%% File Information
% Authors: Can Pu
% Date of Creation: June 9, 2018
% Date of Last Modification: June 14, 2018
% Notes:    1. The file needs the toolbox "Vectorized Numerical
%               Integration", which can be downloaded from
%               https://www.mathworks.com/matlabcentral/fileexchange/48931-vectorized-numerical-integration-matlab?s_tid=mwa_osa_a

%% Class Definition
classdef Quadrature < handle
    % Class Name: Quadrature
    % Brief: The class supports Gauss-Legendre quadrature of order n for
    %           the interior of a reference square
    % Properties:   order
    %               pt - the abscissae
    %               wt - a row vector of weights
    % Methods:  constructor(order)
    properties (SetAccess = protected, GetAccess = public, Hidden = false)
        order
        pt
        wt
    end
    
    methods (Access = public)
        function obj = Quadrature(varargin)
            assert(nargin <= 1);
            if nargin == 1
                order = varargin{1};
                obj.order = order;
                [x, w_x] = GLegIntP(order);
                x = (x + 1) / 2;
                w_x = w_x / 2;
                y = x;
                w_y = w_x;
                [x, y] = meshgrid(x, y);
                [w_x, w_y] = meshgrid(w_x, w_y);
                x = x(:);
                y = y(:);
                w_x = w_x(:);
                w_y = w_y(:);
                obj.order = order;
                obj.pt = [x, y];
                obj.wt = w_x .* w_y;
            end
        end
    end
end