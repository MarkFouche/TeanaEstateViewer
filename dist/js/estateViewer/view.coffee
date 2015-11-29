EV = window.ToT.EstateViewer

class EV.View
    constructor: (@container, @controller, @model) ->
        @scene = new THREE.Scene()
        @camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000)
        @renderer = new THREE.WebGLRenderer()

        @renderer.setSize(window.innerWidth, window.innerHeight)
        document.body.appendChild( @renderer.domElement )

        @camera.position.z = 5

        @create_land()
        @render()

    create_land: () =>
        geometry = new THREE.BoxGeometry( 1, 1, 1 )
        material = new THREE.MeshBasicMaterial( { color: 0x00ff00 } )
        @cube = new THREE.Mesh( geometry, material )
        @cube.matrixAutoUpdate = false;
        @scene.add @cube

    render: () =>
        requestAnimationFrame( @render )
        @cube.rotation.x += 0.1
        @cube.rotation.y += 0.1
        @cube.updateMatrix();
        @renderer.render( @scene, @camera )
