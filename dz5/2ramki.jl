# робот рисует основную рамку из флажков и маленькую рамку вокруг границы внутри поля

using HorizonSideRobots


function num_markers!(robot)
    nsteps_sud = numsteps_along!(robot, Sud)
    nsteps_west = numsteps_along!(robot, West)
    nsteps_sud2 = 0
    if ! isborder(robot, Sud)
        nsteps_sud2 = numsteps_along!(robot, Sud)
    end
    side = Ost
    move_line!(robot, side)
    while ! isborder(robot, Nord)
        move!(robot, Nord)
        side = inverse(side)
        move_line!(robot, side)
    end
    little_marks!(robot, side)
    back!(robot)
    for side in (Nord, Ost, Sud, West)
        set_markers_line!(robot, side)
    end
    #робот в ЮЗ углу
    move_along!(robot, Nord, nsteps_sud2)
    move_along!(robot, Ost, nsteps_west)
    move_along!(robot, Nord, nsteps_sud)
end

#///////////////////////////////////////////////////

function little_marks!(robot, side)
    for sid in (Nord, Sud)
        #нижняя граница маленькой рамки
        while isborder(robot, sid)
            putmarker!(robot)
            move!(robot, side)
        end
        #боковая граница
        putmarker!(robot)
        move!(robot, sid)
        side = inverse(side)
        while isborder(robot, side)
            putmarker!(robot)
            move!(robot, sid)
        end
    putmarker!(robot)
    move!(robot, side)
    end
    putmarker!(robot)
end

function set_markers_line!(robot, side)
    while ! isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
    end  
end


function back!(robot)
    for side in (Sud, West)
        while ! isborder(robot, side)
            move!(robot, side)
        end
    end    
end

function move_line!(robot, side)
    while (! isborder(robot, Nord)) && (! isborder(robot, side))
        move!(robot, side)
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