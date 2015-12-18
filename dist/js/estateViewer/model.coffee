EV = window.ToT.EstateViewer

class LandTile
    constructor: (x, y) ->
        @pos = {x: x, y: y}
        @model = 'models/land_tiles/land_tile_fine.dae'

class EV.Model
    constructor: (@controller) ->
        @land_tiles = []

        for x in [0..9]
            for y in [0..4]
                @land_tiles.push new LandTile(x,y)
