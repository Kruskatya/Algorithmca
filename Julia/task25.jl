include("sample.jl")
r = Robot("task1.sit",animate = true)

function f(robot::Robot, side, marker::Bool,condition::Bool)
    if condition    
        if marker==true
                putmarker!(r)
        end
        if !isborder(r,side)
            move!(r,side)
        end
        if isborder(r,side)
            if marker
                putmarker(r)
            end
            condition=false
        end
            return(f(r,side,!marker,condition))
    end
        
end

f(r,Nord,false,true) #можно заменить на false, начнет 