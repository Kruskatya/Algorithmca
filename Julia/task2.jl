using  HorizonSideRobots
include("all_functions.jl")
r=Robot("task1.sit", animate=true)
#go_to_start(r,3,3)



steps_Nord,steps_Ost=go_to_angle(r)
perimetr(r)
go_to_position(r,steps_Nord,steps_Ost)


