using HorizonSideRobots
robot = Robot("untitled.sit", animate = true)

        
function mark_ramka!(robot::Robot)
    side_back, A = corner(robot)
    putmarker!(robot)
    for side in (Nord, West, Sud, Ost)
        while !isborder(robot, side)
            move!(robot, side)
            putmarker!(robot)
        end
    end
    go_back(robot, A, inverse(side_back))
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))
other(side::HorizonSide) = HorizonSide(2+mod(Int(side)+1, 2))

function go_back(robot::Robot, A, side::HorizonSide)
    for n in A
        along_num!(robot, side, n)
        side = otherside(side)
    end
end

function along_num!(robot::Robot, side, num)
    while num != 0
        move!(robot::Robot, side)
        num -= 1
    end
end

function corner(robot::Robot)
    A=Int[]
    side = Sud
    while ! isborder(robot, Sud) || ! isborder(robot, Ost)
        side = other(side)
        n = 0
        pushfirst!(A, along!(robot, side, n))
    end
    return side, A
end

function along!(robot::Robot, side::HorizonSide, n::Integer)
    while ! isborder(robot, side)
        move!(robot, side)

        n += 1
    end
    return n
end