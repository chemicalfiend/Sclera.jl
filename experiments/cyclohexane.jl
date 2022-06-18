using Sclera

function cyclohexane()
    
    bounding_box = [[10.0, 0.0, 0.0], [0.0, 10.0, 0.0], [0.0, 0.0, 10.0]]u"Å"
    sys = periodic_system([:C => [0, 0.51, 2.162]u"Å",
                           :C => [0, 0, 0.72]u"Å",
                           :C => [1.25, 0.51, 0]u"Å",
                           :C => [2.498, 0.0, 0.722]u"Å",
                           :C => [2.497, 0.51, 2.164]u"Å",
                           :C => [1.248, 0.0, 2.884]u"Å"],
                            bounding_box)
    draw(sys)

end
