export draw_from_chemfiles

function draw_from_chemfiles(fname)
    trajectory = Trajectory(fname)
    frame = read(trajectory)   
    pos = positions(frame).data
    top = Topology(frame)
    b = transpose(bonds(top))
    
    is = []
    js = []

    for i in 1:bonds_count(top)
        push!(is, (convert(Int64, b[i, 1]) + 1))
        push!(js, (convert(Int64, b[i, 2]) + 1))
    end
        

    masses = []

    for i in 0:(size(top)-1)
        a = Atom(top, i)
        push!(masses, mass(a))
    end
    
    p = []

    for i in 1:length(pos)
        if (i % 3 == 0)
            push!(p, [ pos[i-2], pos[i-1], pos[i] ])
        end
    end

    points = Point3f.(p)
    
    scatter(points)
    
end


