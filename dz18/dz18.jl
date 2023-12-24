using HorizonSideRobots
r = Robot("untitled.sit", animate = true)
include("all.jl")


function spiral!(stop_condition, robot, side=Nord)
    n = 1
    while !stop_condition()
        go_steps!(() -> stop_condition(), robot, side, n)
        if stop_condition()
            continue
        end
        side = left(side)
        go_steps!(() -> stop_condition(), robot, side, n)
        if stop_condition()
            continue
        end
        side = left(side)
        n += 1
    end
end

spiral!(() -> ismarker(r), r)