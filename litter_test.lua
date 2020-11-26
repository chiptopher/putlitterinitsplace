require("litter")

function testUpdateMovesLitter()
    litter = Litter:new(0, 0, 10, 10)
    litter:update(1)
    lu.assertEquals(litter.y, 100)
end

function testUpdateWontMoveLitterPastFloor()
    litter = Litter:new(0, 0, 10, 10)
    litter.y = floorLocation;
    litter:update(1)
    lu.assertEquals(litter.y, floorLocation)
end

function testUpdateDoesntMoveObjectIfGrabbed()
    litter = Litter:new(0, 0, 10, 10)
    litter.grabbed = true

    litter:update(1)

    lu.assertEquals(litter.y, 0)
    lu.assertEquals(litter.x, 0)
end

function testNewCreatesObjectsWithDifferentState()
    litter1 = Litter:new(0, 0, 10, 10)
    litter2 = Litter:new(0, 0, 10, 10)

    litter1:update(1)

    lu.assertEquals(litter1.y, 100)
    lu.assertEquals(litter2.y, 0)
end

function testGrabSetsGrabbedOnLitterIfGivenCoordinatesWithinBounds()
    litter = Litter:new(0, 0, 100, 100)
    doGrabTest(litter, 100, 100, true)
    doGrabTest(litter, 99, 99, true)
    doGrabTest(litter, 101, 101, false)
    doGrabTest(litter, 0, 0, true)
end

function doGrabTest(litter, x, y, expected)
    litter:grab(x, y)
    lu.assertEquals(litter.grabbed, expected)
    litter.grabbed = false
end

