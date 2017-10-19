<template>
  <div class="hello">
  </div>
</template>

<script>
/* eslint-disable */
export default {
  name: 'hello',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  },
  methods: {
    pixiTest () {
      var type='WebGL'
      if(!PIXI.utils.isWebGLSupported()){
        type='canvas'
      }
      PIXI.utils.sayHello(type)
      var stage = new PIXI.Container(),
      renderer = PIXI.autoDetectRenderer(256, 256);
      document.body.appendChild(renderer.view);

      //Use Pixi's built-in `loader` object to load an image
      PIXI.loader
        .add("/static/images/cat.png")
        .load(setup);

      //This `setup` function will run when the image has loaded
      function setup() {

        //Create the `cat` sprite from the texture
        var cat = new PIXI.Sprite(
          PIXI.loader.resources["/static/images/cat.png"].texture
        );
        cat.position.set(96, 96);
        cat.scale.set(0.5, 0.5);
        //Add the cat to the stage
        stage.addChild(cat);
        
        //Render the stage   
        renderer.render(stage);
      }
    }
  },
  mounted () {
    this.pixiTest()
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
