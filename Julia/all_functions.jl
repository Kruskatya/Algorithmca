function go_to_start(r,x,y) #причапали на старт, потому что я не умею создавать обстановку
    for _ in 1:x    
        move!(r,Ost)
    end
    for _ in 1:y    
        move!(r,Nord)
    end
end

function move_to_border(r,side) #газуем до границы, ставим маркеры
    while !isborder(r,side)
        move!(r,side)
        putmarker!(r)
    end
end

function move_back(r,side) #газуем назад, пока есть маркеры
    while ismarker(r)
        move!(r,side)
    end
end

function inverse(side::HorizonSide) #Реверсируем направление
    return HorizonSide(mod(Int(side)+2, 4)) 
end

function go_to_angle(r) #Гоним в левый нижний уголок, вернем путь
    counter_sud,counter_west=0,0
    while !isborder(r,Sud)
        move!(r,Sud)
        counter_sud+=1
    end
    while !isborder(r,West)
        move!(r,West)
        counter_west+=1
    end
    return counter_sud, counter_west 
end

function go_to_position(r,steps_Nord,steps_Ost) #Гоним туда, откуда начали
    for i in 1:steps_Nord
        move!(r,Nord)
    end
    for i in 1:steps_Ost
        move!(r,Ost)
    end
end

function perimetr(r)
    for i in (0,3,2,1)
        move_to_border(r,HorizonSide(i))
    end
end