function run_tests()
    addpath('../src');

    %% Quadrature 
    runtests('QuadratureTest');

    %% DiscreteOrdinateSolver
    runtests('DiscreteOrdinateSolverTest');
    

end
