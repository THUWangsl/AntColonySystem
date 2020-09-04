function in_area = In_Area(point, area, area_type)
% Determine whether a point is in a typical area
in_area = 0;
switch area_type
    case 'P'
        if In_Prohibited_Area(point, area)
            in_area = 1;
        end
    case 'I'
        if In_Interference_Area(point, area)
            in_area = 1;
        end
    case 'O'
        if In_Obstacle_Area(point, area)
            in_area = 1;
        end
end
end

function in_area = In_Prohibited_Area(Point, Prohibited_Area)
% 判断某个点是否在禁飞区内
% 输入：
% Point             某个点的坐标
% Prohibited_Area   禁飞区
% 输出：
% in_area           是否在禁飞区内，0：不在禁飞区内，1：在禁飞区内

in_area = 0;
for ii = 2: Prohibited_Area{1} + 1
    if norm(Prohibited_Area{ii}(1:2) - Point) < Prohibited_Area{ii}(3)
        in_area = 1;
    end
end
end

function in_area = In_Interference_Area(Point, Interference_Area)
% 判断某个点是否在干扰区内
% 输入：
% Point                 某个点的坐标
% Interference_Area     干扰区
% 输出：
% in_area               是否在干扰区内，0：不在干扰区内，1：在干扰区内

in_area = 0;
for ii = 2: Interference_Area{1} + 1
    if norm(Point - Interference_Area{ii}(1:2)) <= Interference_Area{ii}(3)
        in_area = 1;
    end
end
end

function in_area = In_Obstacle_Area(Point, Obstacle_Area)
% 判断某个点是否在障碍区内
% 输入：
% Point                 某个点的坐标
% Obstacle_Area         障碍区
% 输出：
% in_area               是否在障碍区内，0：不在障碍区内，1：在障碍区内

in_area = 0;
for ii = 2: Obstacle_Area{1} + 1
    N = size(Obstacle_Area{ii}, 1);
    angle = zeros(N,1);
    for jj = 1: N - 1
        angle(jj) = Cal_Angle(Obstacle_Area{ii}(jj,:) - Point, Obstacle_Area{ii}(jj+1, :) - Point);
    end
    angle(N) = Cal_Angle(Obstacle_Area{ii}(N,:) - Point, Obstacle_Area{ii}(1, :) - Point);
    if abs(sum(angle) - 2*pi) < 10e-12
        in_area = 1;
    end
end
end