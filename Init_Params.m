% Initital the number of UAVs
Params.num_UAVs = 6;
Params.range = 10;

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

% Initial the grids of mission area
Nx = round((max(Params.Mission_Area{2}(:,1)) - min(Params.Mission_Area{2}(:,1)))/Params.range);
Ny = round((max(Params.Mission_Area{2}(:,2)) - min(Params.Mission_Area{2}(:,2)))/Params.range);
Params.num_grids = Nx*Ny;                              % num of vertex
Params.grids = zeros(Params.num_grids, 2);             % location of vertex
for ii = 1: Nx
    for jj = 1: Ny
        Params.grids((ii-1)*Ny + jj, :) = [Params.range/2 + (ii-1)*Params.range,...
         Params.range/2 + (jj-1)*Params.range];
    end
end

% Delete the grid points not in ileagal area, inclde points outside mission area, 
% points in Prohibited/Interference/Obstacle area
idx = [];
for ii = 1: Params.num_grids
    if ~In_Area(Params.grids(ii, :), Params.mission_area, 'P') ||...
        In_Area(Params.grids(ii, :), Params.prohibited_area, 'P')||...
        In_Area(Params.grids(ii, :), Params.interference_area, 'I')||...
        In_Area(Params.grids(ii, :), Params.Obstacle_Area, 'O')
        idx = [idx; ii];
    end
end
Params.grids(idx, :) = [];
Params.num_grids = size(Params.grids, 1);