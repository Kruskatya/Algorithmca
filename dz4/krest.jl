# робот рисует крестик из начальной позиции и возвращается в неё

using HorizonSideRobots


function plus_marker!(robot)
    for side in (Nord, West, Sud, Ost)
        steps_marks!(robot, side)   
        back!(robot, inverse(side))
    end   
    putmarker!(robot) 
end

# робот доходит до конца поля, проставляя флажки
function steps_marks!(robot, side)
    while (! isborder(robot, side)) && (! isborder(robot, rever(side)))
        move!(robot, rever(side))
        move!(robot, side)
        putmarker!(robot)
    end
end

# робот возвращается в начальноe положение по флажкам
function back!(robot, side)
    while ismarker(robot)
        move!(robot, rever(side))
        move!(robot, side)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))

function rever(side)
    if side==Nord
        return Ost
    end
    if side==Sud
        return West
    end
    if side==West
        return Nord
    end
    if side==Ost
        return Sud
    end 
end 