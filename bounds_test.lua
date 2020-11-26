require("bounds")

function test_inBounds_returnsTrueWhenTestIsWithinBoundaries()
    lu.assertTrue(inBounds(0, 100, 50))
end
