EV = window.ToT.EstateViewer

class EV.View
    TILE_SIZE = 22.48

    constructor: (@container, @controller, @model) ->
        @scene = new THREE.Scene()
        @camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000)
        @renderer = new THREE.WebGLRenderer()

        @renderer.setSize(window.innerWidth, window.innerHeight)
        document.body.appendChild( @renderer.domElement )

        @camera.position.z = 500

        light = new THREE.AmbientLight( 0xAAAAAA )
        @scene.add( light )

        @create_land()
        @render()

        window.addEventListener('resize', @on_window_resize, false)

    create_land: () =>
        for land_tile in @model.land_tiles
            do (land_tile) =>
                loader = new THREE.ColladaLoader()
                loader.load( land_tile.model, (result) =>
                    model = result.scene
                    model.position.x = TILE_SIZE * land_tile.pos.x
                    model.position.y = TILE_SIZE * land_tile.pos.y
                    @scene.add(model)
                )

        geometry = new THREE.BoxGeometry( 1, 1, 1 )
        material = new THREE.MeshBasicMaterial( { color: 0x00ff00 } )
        @cube = new THREE.Mesh( geometry, material )
        @cube.matrixAutoUpdate = false
        @scene.add @cube

    on_window_resize: () =>
        @camera.aspect = window.innerWidth / window.innerHeight
        @camera.updateProjectionMatrix()
        @renderer.setSize( window.innerWidth, window.innerHeight )

    render: () =>
        requestAnimationFrame( @render )
        @cube.rotation.x += 0.1
        @cube.rotation.y += 0.1
        @cube.updateMatrix();
        @renderer.render( @scene, @camera )
