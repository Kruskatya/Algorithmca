using HorizonSideRobots
r = Robot("untitled.sit", animate = true)

function along_with_rekursia(r::Robot, side::HorizonSide)
    if isborder(r, side)
        return
    end
    move!(r, side)
    along_with_rekursia(r, side)
end