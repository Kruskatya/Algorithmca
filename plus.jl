# робот рисует плюс из начальной позиции и возвращается в неё

using HorizonSideRobots
robot = Robot("untitled.sit", animate=true)


function plus_marker!(robot)
    for side in (Nord, West, Sud, Ost)
        steps_marks!(robot, side)   
        back!(robot, inverse(side))
    end   
    putmarker!(robot) 
end

# робот доходит до конца поля, проставляя флажки
function steps_marks!(robot, side)
    while ! isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
    end
end

# робот возвращается в начально е положение по флажкам
function back!(robot, side)
    while ismarker(robot)
        move!(robot, side)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))