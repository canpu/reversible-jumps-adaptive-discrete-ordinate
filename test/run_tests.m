function run_tests()
    addpath('../src');

    %% Polynomial 
    runtests('PolynomialTest');

    %% Quadrature 
    runtests('QuadratureTest');

    %% DiscreteOrdinateSolver
    runtests('DiscreteOrdinateSolverTest');
    

end
