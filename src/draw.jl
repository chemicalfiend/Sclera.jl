export 
    ustrip_vec,
    draw


ustrip_vec(x) = ustrip.(x)

function draw(sys::AbstractSystem)
    b = ustrip_vec.(bounding_box(sys))
    f = Figure()
    ax = Axis3(f[1, 1])
    
    masses = atomic_mass(sys)

    # need to draw the box correctly.
    xmax = max(b[1][1], b[2][1], b[3][1])
    ymax = max(b[1][2], b[2][2], b[3][2])
    zmax = max(b[1][3], b[2][3], b[3][3])
    limits!(ax, 0, xmax, 0, ymax, 0, zmax)

    points = Point3f.(ustrip_vec.(position(sys)))
    scatter(points; markersize=ustrip.(masses), colormap=:thermal)
end
