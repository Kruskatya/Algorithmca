using  HorizonSideRobots
include("all_functions.jl")
r=Robot("task1.sit", animate=true)


#go_to_start(r,3,3)
for j in [Nord,Sud,Ost,West]
    move_to_border(r,j)
    move_back(r,inverse(j))
end