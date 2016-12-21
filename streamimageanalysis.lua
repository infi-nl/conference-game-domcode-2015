function get_name()
        return "STREAM_IMAGE ANALYSIS (EASY)"
end
 
function get_description()
        return { "READ AN X VALUE FROM IN", "READ A Y VALUE FROM IN", "PLOT A WHITE POINT AT THAT COORDINATE" }
end
 
function get_streams()
        -- Initialize the image grid to all zeros (black):
        image = {}
        for i = 1,30*18 do
                image[i] = 0
        end
       
        -- Generate and plot 19 coordinate pairs:
        -- NOTE: Arrays in Lua start at 1, which is actually quite a nuisance to work with if you're at all
        --       used to arrays that start at 0 and the tricks that you can do to index them. It also doesn't
        --       help that for loops are inclusive on both ends! Kind of makes me wish I implemented custom
        --       levels in a real programming language like TIS-ASM...
        input = {}
        for i = 0,18 do
                x = math.random(0,29)
                y = math.random(0,17)
                input[i*2+1] = x
                input[i*2+2] = y
                image[1+x+y*30] = 3
        end
       
        return {
                { STREAM_INPUT, "IN", 1, input },
                { STREAM_IMAGE, "", 2, image },
        }
end
 
function get_layout()
        return {
                TILE_COMPUTE,   TILE_COMPUTE,   TILE_COMPUTE,   TILE_COMPUTE,
                TILE_COMPUTE,   TILE_COMPUTE,   TILE_COMPUTE,   TILE_COMPUTE,
                TILE_COMPUTE,   TILE_COMPUTE,   TILE_COMPUTE,   TILE_COMPUTE,
        }
end