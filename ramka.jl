# робот рисует рамку из флажков и возвращается в начальное положение

using HorizonSideRobots
robot = Robot("untitled.sit", animate=true)


function num_markers!(robot)
    nsteps_west = numsteps_along!(robot, West)
    nsteps_sud = numsteps_along!(robot, Sud)
    for side in (Nord, Ost, Sud, West)
        set_markers_line!(robot, side)
    end
    along!(robot, Nord, nsteps_sud)
    along!(robot, Ost, nsteps_west )
end

function set_markers_line!(robot, side)
    while ! isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
    end  
end


function along!(robot, side, nstep)
    for _ in 1:nstep
        move!(robot,side)
    end 
end

function numsteps_along!(robot, side)
    num = 0
    while ! isborder(robot, side)
        move!(robot, side)
        num+=1
    end
    return num
end