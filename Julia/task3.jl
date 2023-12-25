using  HorizonSideRobots
include("all_functions.jl")
r=Robot("task1.sit", animate=true)
#go_to_start(r,3,3)

steps_Nord,steps_Ost=go_to_angle(r)
napr=3
while !isborder(r,Nord)
    putmarker!(r)
    move_to_border(r,HorizonSide(napr))
    move!(r,Nord)
    global napr=mod(Int(napr)+2, 4)
end
putmarker!(r)
move_to_border(r,HorizonSide(napr))
go_to_angle(r)
go_to_position(r,steps_Nord,steps_Ost)
