using AtomsBase
using Unitful
using UnitfulAtomic
using GLMakie

ustrip_vec(x) = ustrip.(x)

function scatter_points()
    
    coords = [[1.0, 0.0, 0.0], [10.0, 0.0, 3.0], [5.0, 5.0, 5.0]]
    points = Point3f.(coords)
    scatter!(points)
    lines(points)

end

function scatter_atoms()
        
    #f = Figure()
    #ax = Axis3(f[1, 1], aspect=:data)
    
    bounding_box = [[10.0, 0.0, 0.0], [0.0, 10.0, 0.0], [0.0, 0.0, 10.0]]u"Å"
    
    sys = periodic_system([:C => [0, 0, 1.0]u"Å",                                                    :C => [0, 0, 1.5]u"Å",
                           :N => [0, 0, 2.0]u"Å"],
                             bounding_box)
    points = Point3f.(ustrip_vec.(position(sys)))
    scatter(points)

end
