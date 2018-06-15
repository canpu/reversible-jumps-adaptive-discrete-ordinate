function run_tests()
    addpath('../src');

    %% Polynomial 
    runtests('PolynomialTest');
    
    %% Quadrature 
    runtests('QuadratureTest');
    runtests('AngularQuadratureTest');
    
    %% DiscreteOrdinateSolver
    runtests('DiscreteOrdinateSolverTest');
    

end
