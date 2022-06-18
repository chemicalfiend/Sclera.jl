using Sclera

function scatter_atoms()
    
    bounding_box = [[10.0, 0.0, 0.0], [0.0, 10.0, 0.0], [0.0, 0.0, 10.0]]u"Å"
    sys = periodic_system([:C => [0, 0, 1.0]u"Å",
                           :C => [0, 0, 1.5]u"Å",
                           :N => [0, 0, 2.0]u"Å"],
                          bounding_box)
    
    draw(sys)

end
