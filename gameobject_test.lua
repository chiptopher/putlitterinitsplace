require("gameobject")

function testNewCreatesObjectsWithDifferentState()
    litter1 = GameObject:new(0, 0)
    litter2 = GameObject:new(100, 0)

    lu.assertEquals(litter1.x, 0)
    lu.assertEquals(litter2.x, 100)
end


function testOverlapReturnsTrueWhenObjectsAreSameSizeAndLocation()
    litter1 = GameObject:new(0, 0, 100, 100)
    litter2 = GameObject:new(0, 0, 100, 100)

    lu.assertTrue(litter1:overlaps(litter2))
end

function testOverlapReturnsFalseWhenObjectsDontOverlap()
    litter1 = GameObject:new(0, 0, 50, 50)
    litter2 = GameObject:new(51, 51, 100, 100)

    lu.assertFalse(litter1:overlaps(litter2))
end
