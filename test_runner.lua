lu = require('luaunit')
require("bounds_test")
require("litter_test")
require("gameobject_test")

os.exit( lu.LuaUnit.run() )
