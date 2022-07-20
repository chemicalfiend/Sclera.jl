export draw_from_chemfiles

using Chemfiles
using GLMakie

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
    
    xs = []
    ys = []
    
    connections = []

    for i in 1:length(is)
        #push!(xs, p[is[i]])
        #push!(ys, p[js[i]])
        
        push!(connections, Observable(Point3f.([p[is[i]][1], p[js[i]][1]], [p[is[i]][2], p[js[i]][2]], [p[is[i]][3], p[js[i]][3]])))


    end


    #f = Figure()
    #ax = Axis3(f[1, 1])
    points = Point3f.(p)
    
    #print(connections)

    scatter!(points; markersize=masses)
    lines!(connections)
     
end


