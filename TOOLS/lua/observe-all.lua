-- Test script for property change notification mechanism.
-- Note that watching/reading some properties can be very expensive, or
-- require the player to synchronously wait on network (when playing
-- remote files), so you should in general only watch properties you
-- are interested in.

local utils = require("mp.utils")

local function observe(name)
    mp.observe_property(name, "native", function(prop, val)
        print("property '" .. prop .. "' changed to '" ..
              utils.to_string(val) .. "'")
    end)
end

for _, name in ipairs(mp.get_property_native("property-list")) do
    observe(name)
end

for _, name in ipairs(mp.get_property_native("options")) do
    observe("options/" .. name)
end
