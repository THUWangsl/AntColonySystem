% Initital the number of UAVs
Params.num_UAVs = 6;

% Initial the mission area, include prohibited area\interference area
% \obstacle area
% cell{1} is the number of areas, cell{2:end} is the corresponding area
% vertex ordered colockwise or anticolockwise, which are N by 2 matrixs
Params.mission_area = cell(1,2);
Params.prohibited_area = cell(1,2);
Params.interference_area = cell(1,2);
Params.obstacle_area = cell(1,2);

Params.Mission_Area{2} = 1;
Params.Mission_Area{2} = [0,0; 60, 0; 60, 60; 0, 60];
Params.Prohibited_Area{1} = 1;
Params.Prohibited_Area{2} = [7,8,6]*2;
Params.Interference_Area{1} = 1;
Params.Interference_Area{2} = [22, 12, 8];
Params.Obstacle_Area{1} = 1;
Params.Obstacle_Area{2} = [4,19;10,16;16,20;12,26]*2.5 -[0,6];

% Initial Parameters of Ant Colony System
Params.num_ants = 25;
Params.num_nearest_neighbors = 20;
Params.alpha = 1.0;
Params.beta = 2.0;
Params.rho = 0.5;
Params.q_0 = 0.0;
Params.max_tries = 10;
Params.max_tour = 200;
Params.max_iteration = 2200;
Params.optimal = 1;
Params.u_gb = Inf;
Params.acs_flag = true;
Params.as_flag = false;