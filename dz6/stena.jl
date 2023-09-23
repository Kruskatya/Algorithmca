# робот ищет проход в бесконечной стене и обходит её

using HorizonSideRobots

function find_hole!(robot)
    side = Ost
    n = 0
    while isborder(robot, Nord)
        n += 1
        mov!(robot, side, n)
        side = inverse(side)
    end
    move!(robot, Nord)
    mov!(robot, side, div(n,2))
    
end

function mov!(robot, side, n::Integer)
    for _ in 1:n
        move!(robot, side)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2,4))