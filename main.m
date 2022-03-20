%Liebmanns_standard_method
function output_vector = Liebmanns_standard_method (grid_dimension,top_boundary_temperature,bottom_boundary_temperature,left_boundary_temperature,right_boundary_temperature,iteration_times,initial_guessing_temperature)

%{
Function variables explanations are as bellow:

grid_dimension: Assume the grid dimension is a square, for a dimension of N
x N meshgrid, put the value of N into the grid_dimension variable. For
example, for a 10 x 10 meshgrid, grid_dimension is 10.

top_boundary_temperature: The initial boundary temperature of the
top edge.

bottom_boundary_temperature: The initial boundary temperature of the
bottom edge.

left_boundary_temperature: The initial boundary temperature of the
left edge.

right_boundary_temperature: The initial boundary temperature of the
right edge.

iteration_times: The number of iterations required for the computation.

initial_guessing_temperature: Here we assume the guessing temperature values of the
system is the same in each element in the meshgrid.
%}


%Each of the function variables declared above is now assigned with an alphabet variable for better readability.
N=grid_dimension;
T=top_boundary_temperature;        
B=bottom_boundary_temperature;  
L=left_boundary_temperature;
R=right_boundary_temperature;
Z=iteration_times;
I=initial_guessing_temperature;

%Since we are dealing with point instead of grid, for a N x N meshgrid,
%there will be N+1 of points along its respective axis. We initialize all the
%element points with zeros. Assign the array to a vector variable call V.
V= zeros(N+1,N+1); 

%Assign the boundary conditions to all respective edges of the system
V(1,:)=T;
V(N+1,:)=B;
V(:,1)=L;
V(:,N+1)=R;

%Fill in the initial guessing temperature to all elements in a row by row, left to right manner
for i= 2:N
    for j= 2:N
        V(i,j)= I;
    end
end

%Assign the V vector to a new variable for Liebmanns method 

updated_array=V;
for o = 1:Z
    for x =N:-1:2
        for y =2:N
            updated_array(x,y)=(V(x-1,y)+V(x+1,y)+V(x,y-1)+V(x,y+1))/4;
        end
    end
    number_of_iteration=o
    V=updated_array
end
output=('Final Temperature Distribution using Liebmanns standard method')
V
x=[0:N];
y=(N:-1:0);
surf(x,y,V)
grid
xlabel('X position')
ylabel('Y Position')
zlabel('Temperature °C')
title('Temperature Distribution in the system using Liebmanns standard method')
end
