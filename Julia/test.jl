using  HorizonSideRobots
r=Robot(animate=true)
function go_to_start(r)
        move!(r,Nord)
        move!(r,Ost)
        move!(r,Nord)
        move!(r,Ost)
        move!(r,Nord)
        move!(r,Ost)
end
function move_to_border(r,side)
    while !isborder(r,side)
        move!(r,side)
        putmarker!(r)
    end
end
function move_back(r,side)
    while ismarker(r)
        move!(r,side)
    end
end
function inverse(side::HorizonSide)
    return HorizonSide(mod(Int(side)+2, 4)) 
end
go_to_start(r)
for j in [Nord,Sud,Ost,West]
    move_to_border(r,j)
    move_back(r,inverse(j))
end