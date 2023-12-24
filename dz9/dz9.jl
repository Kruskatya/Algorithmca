using HorizonSideRobots
r = Robot("untitled.sit", animate = true)
include("all.jl")

num_sud_steps, num_west_steps = go_along!(r, Sud), go_along!(r, West)
mode = mod(num_sud_steps, 2) == mod(num_west_steps, 2)

q = ChessRobotN(r, 1, mode)
check_chess(q, 0, 0)

snake!(q, (Ost, Nord))

go_steps!(get_base_robot(q), Nord, num_sud_steps)
go_steps!(get_base_robot(q), Ost, num_west_steps)