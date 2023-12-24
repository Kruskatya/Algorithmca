using  HorizonSideRobots
r=Robot(animate=true, "untitled.sit")

function fourSide(r::Robot)
    for side in (HorizonSide(i) for i=0:3)
        num=0
        while try_move!(r, side)==true
            num+=1
        end
        putmarker!(r)
        along_num!(r, inverse(side), num)
    end
end

function try_move!(r::Robot, side::HorizonSide)
    n=0
    if isborder(r, side)==true
        while isborder(r, side)==true
            move!(r, other(side))
            n+=1
            if isborder(r, left(side))==true && isborder(r, side)==true
                along_num!(r, right(side), n)
                return false
            end
        end
        move!(r, side)
        while isborder(r, other(inverse(side)))==true
            move!(r, side)
        end
        along_num!(r, other(inverse(side)), n)
    else
        move!(r, side)
    end
    return true
end

function along_num!(r::Robot, side, num)
    while num!=0
        try_move!(r::Robot, side)
        num-=1
    end
end

inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,  4))
left(side::HorizonSide)=HorizonSide(mod(Int(side)+1, 4))
right(side::HorizonSide)=HorizonSide(mod(Int(side)+3, 4))