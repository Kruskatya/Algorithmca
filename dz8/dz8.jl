using HorizonSideRobots
robot = Robot("untitled.sit", animate = true)

function find_mark!(robot)
    n = 0
    while ! ismarker(robot)
        for side in (Nord, Ost, Sud, West)
            if ! ismarker(robot)
                n = wh_side(side, n)
                mov!(robot, side, n)
            end
        end
    end    
end

function mov!(robot, side, n::Integer)
    for i in 1:n
        move!(robot, side)
    end
end

function wh_side(side, n)
    if side == Nord || side == Sud
        n += 1
    end
    return n
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))