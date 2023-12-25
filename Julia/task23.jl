include("sample.jl")
r = Robot("task23.sit",animate = true)

function rmoveline!(r::Robot,side::HorizonSide,steps::Int,rev::Int)
    movestep!(r,side)
    if isborder(r,side)
        side = HorizonSide(mod(Int(side)+2,4))
        rev += 1
    end
    if rev==0
        return rmoveline!(r,side,steps+1,rev)
    end
    if rev==1
        return rmoveline!(r,side,steps,rev)
    end
    if rev==2
        if steps>-1
            return rmoveline!(r,side,steps-2,rev)
        else
            return "ready"
        end
    end
end

rmoveline!(r,Nord,0,0)