# робот закрашивает всё поле и возвращается в начальное положение

using HorizonSideRobots


function num_markers!(robot)
    nsteps_west = numsteps_along!(robot, West)
    nsteps_sud = numsteps_along!(robot, Sud)
    side = Ost
    set_markers_line!(robot, side)
    while ! isborder(robot, Nord)
        move!(robot, Nord)
        putmarker!(robot)
        side = inverse(side)
        set_markers_line!(robot, side)
    end
    #робот в одном из углов у северной границы
    along!(robot, Sud)
    along!(robot, West)
    putmarker!(robot)
    #робот в ЮЗ углу
    move_along!(robot, Ost, nsteps_west)
    move_along!(robot, Nord, nsteps_sud)
end

function set_markers_line!(robot, side)
    while ! isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
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

function along!(robot, side)
    while ! isborder(robot, side)
        move!(robot, side)
    end
end

function move_along!(robot, side, kol_steps)
    for i in 1:kol_steps
        move!(robot, side)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))