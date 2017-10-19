<template>
  <div></div>
</template>
<script>
/* eslint-disable */
export default {
  data () {
    return {
    }
  },
  methods: {
    test () {
      var THREE = require('three')
      var scene = new THREE.Scene();
			var camera = new THREE.PerspectiveCamera( 75, window.innerWidth/window.innerHeight, 0.1, 1000 );
      camera.position.set(0, 0, 100);
      camera.lookAt(new THREE.Vector3(0, 0, 0));
			var renderer = new THREE.WebGLRenderer();
			renderer.setSize( window.innerWidth, window.innerHeight );
			document.body.appendChild( renderer.domElement );
      var material = new THREE.LineBasicMaterial({ color: 0x0000ff });
			var geometry = new THREE.Geometry();
      geometry.vertices.push(new THREE.Vector3(-10, 0, 0));
      geometry.vertices.push(new THREE.Vector3(0, 10, 0));
      geometry.vertices.push(new THREE.Vector3(10, 0, 0));
			var line = new THREE.Line(geometry, material);
			scene.add( line )
			var animate = function () {
				requestAnimationFrame( animate );
				renderer.render(scene, camera);
			};
			animate();
    }
  },
  mounted () {
		this.test()
  }
}
</script>