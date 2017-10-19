<template>
  <div id="contain"></div>
</template>
<script>
/* eslint-disable */
export default {
  methods: {
    init () {
      var PIXI = require('pixi.js')
      var renderer = PIXI.autoDetectRenderer(256, 256)
      var stage = new PIXI.Container()
      document.body.appendChild(renderer.view)
      renderer.view.style.border = '1px dashed black'
      renderer.resize(512, 512)
      renderer.backgroundColor = 0x061639
      renderer.render(stage)
    },
    // 图像旋转
    rotatingboy () {
      var contain = document.getElementById('contain')
      var PIXI = require('pixi.js')
      var app = new PIXI.Application(800, 600, {backgroundColor: 0x1099bb})
      contain.appendChild(app.view)
      var bunny = PIXI.Sprite.fromImage('../../static/boy.png')
      bunny.anchor.set(0.5)
      bunny.x = app.renderer.width/2
      bunny.y = app.renderer.height/2
      app.stage.addChild(bunny)
      app.ticker.add(function(delta){
        bunny.rotation+=0.1*delta
      })
    },
    // 图像点击放大
    clickbody () {
      var PIXI = require('pixi')
      var app = new PIXI.Application(800, 600, {backgroundColor: 0x1099bb})
      var contain = document.getElementById('contain')
      contain.appendChild(app.view)
      PIXI.settings.SCALE_MODE = PIXI.SCALE_MODES.NEAREST
      var sprite = PIXI.Sprite.fromImage('../../static/boy.png')
      sprite.anchor.set(0.5)
      sprite.x = app.renderer.width/2
      sprite.y = app.renderer.height/2
      sprite.interactive = true
      sprite.buttonMode = true
      sprite.on('pointerdown', () => {
        sprite.scale.x *= 1.25
        sprite.scale.y *= 1.25
      })
      app.stage.addChild(sprite)
    },
    pivot () {
      var PIXI = require('pixi')
      var app = new PIXI.Application(800, 600, {backgroundColor: 0x1099bb})
      var contain = document.getElementById('contain')
      contain.appendChild(app.view)
      var container = new PIXI.Container()
      app.stage.addChild(container)
      var texture = PIXI.Texture.fromImage('../../static/boy.png')
      for (let i = 0;i<25;i++){
        var boy = new PIXI.Sprite(texture)
        boy.anchor.set(0.5)
        boy.x = (i%5)*100
        boy.y = Math.floor(i/5)*100
        container.addChild(boy)
      }
      container.x = app.renderer.width/2
      container.y = app.renderer.height/2
      container.pivot.x = container.width/2
      container.pivot.y = container.height/2
      app.ticker.add(delta => {
        container.rotation -= 0.01*delta
      })
    },
    cufilter () {
      var PIXI = require('pixi')
      var app = new PIXI.Application(800, 600, {backgroundColor: 0x1099bb})
      var contain = document.getElementById('contain')
      contain.appendChild(app.view)
      var background = PIXI.Sprite.fromImage('../../static/chenglong.png')
      background.width = app.renderer.width
      background.height = app.renderer.height
      app.stage.addChild(background)
      app.stop()
      let filter
      PIXI.loader.add('shader', '../../static/shader.frag')
      .load((loader, res)=>{
        filter = new PIXI.Filter(null, res.shader.data)
        background.filters = [filter]
        app.start()
      })
      app.ticker.add((delta)=>{
        filter.uniforms.customUniform += 0.04*delta
      })
    },
    graphics () {
      var PIXI = require('pixi')
      var app = new PIXI.Application(800, 600, {backgroundColor: 0x1099bb})
      var contain = document.getElementById('contain')
      contain.appendChild(app.view)
      let graphics = new PIXI.Graphics()
      graphics.beginFill(0xFF3300)
      graphics.lineStyle(4, 0xffd900, 1)
      graphics.moveTo(50, 50)
      graphics.lineTo(250, 50)
      graphics.lineTo(100, 100)
      graphics.lineTo(50, 50)
      graphics.endFill()
      graphics.lineStyle(2, 0x0000FF, 1)
      graphics.beginFill(0xFF700B, 1)
      graphics.drawRect(150, 450, 300, 100, 15)
      graphics.endFill()
      graphics.lineStyle(0)
      graphics.beginFill(0xFFFF0B, 0.5)
      graphics.drawCircle(470, 90, 60)
      graphics.endFill()
      app.stage.addChild(graphics)
    },
    textureMesh () {
      var PIXI = require('pixi')
      var app = new PIXI.Application(800, 600, {backgroundColor: 0x1099bb})
      var contain = document.getElementById('contain')
      contain.appendChild(app.view)
      let count = 0, ropeLength = 918/20, points = []
      for (let i = 0;i<25;i++){
        points.push(new PIXI.Point(i*ropeLength, 0))
      }
      let strip = new PIXI.mesh.Rope(PIXI.Texture.fromImage('../../static/snake.png'), points)
      strip.x = -40
      strip.y = 300
      app.stage.addChild(strip)
      var g = new PIXI.Graphics()
      g.x = strip.x
      g.y = strip.y
      app.stage.addChild(g)
      app.ticker.add(() => {
        count += 0.1
        for (let i = 0;i<points.length;i++){
          points[i].y = Math.sin((i*0.5)+count)*30
          points[i].x = i*ropeLength + Math.cos((i*0.3)+count)*20
        }
        g.clear()
        g.lineStyle(2, 0xffc2c2)
        g.moveTo(points[0].x, points[0].y)
        for (let j = 1;j<points.length; j++){
          g.lineTo(points[j].x, points[j].y)
        }
        for (let j = 1;j<points.length;j++){
          g.beginFill(0xff0022)
          g.drawCircle(points[j].x, points[j].y, 10)
          g.endFill()
        }
      })
    },
    animatedSprite () {
      var PIXI = require('pixi')
      var app = new PIXI.Application()
      var contain = document.getElementById('contain')
      contain.appendChild(app.view)
      app.stop()
      PIXI.loader.add('spritesheet', '../../static/mc.json')
      .load(()=>{
        let explosionTextures = [], i
        for (i=0;i<26;i++){
          let texture = PIXI.Texture.fromFrame('Explosion_Sequence_A ' + (i+1) + '.png')
          explosionTextures.push(texture)
        }
        for(i=0;i<50;i++){
          let explosion = new PIXI.extras.AnimatedSprite(explosionTextures)
          explosion.x = Math.random()*app.renderer.width
          explosion.y = Math.random()*app.renderer.height
          explosion.anchor.set(0.5)
          explosion.rotation = Math.random()*Math.PI
          explosion.scale.set(0.75 + Math.random()*0.5)
          explosion.gotoAndPlay(Math.random()*27)
          app.stage.addChild(explosion)
        }
      })
      app.start()
    },
    batch () {
      var PIXI = require('pixi')
      var app = new PIXI.Application()
      var contain = document.getElementById('contain')
      contain.appendChild(app.view)
      let sprites = new PIXI.particles.ParticleContainer(10000, {
        scale: true,
        position: true,
        rotation: true,
        uvs: true,
        alpha: true
      })
      app.stage.addChild(sprites)
      var maggots = []
      var totalSprites = app.renderer instanceof PIXI.WebGLRenderer ? 10000 : 100
      for (let i = 0;i<totalSprites;i++){
        var dude = PIXI.Sprite.fromImage('../../static/tinyMaggot.png')
        dude.tint= Math.random()*0xE8D4CD
        dude.anchor.set(0.5)
        dude.scale.set(0.8+Math.random()*0.3)
        dude.x=Math.random()*app.renderer.width
        dude.y=Math.random()*app.renderer.height
        dude.tint=Math.random()*0x808080
        dude.direction=Math.random()*Math.PI*2
        dude.turningSpeed=Math.random()-0.8
        dude.speed=(2+Math.random()*2)*0.2
        dude.offset=Math.random()*100
        maggots.push(dude)
        sprites.addChild(dude)
      }
      let dudeBoundsPadding = 100
      let dudeBounds = new PIXI.Rectangle(
        -dudeBoundsPadding,
        -dudeBoundsPadding,
        app.renderer.width + dudeBoundsPadding*2,
        app.renderer.height + dudeBoundsPadding*2
      )
      let tick = 0
      app.ticker.add(()=>{
        for (let i = 0;i<maggots.length;i++){
          var dude = maggots[i]
          dude.scale.y = 0.95 + Math.sin(tick + dude.offset)*0.05
          dude.direction += dude.turningSpeed * 0.01
          dude.x += Math.sin(dude.direction) * (dude.speed * dude.scale.y)
          dude.y += Math.cos(dude.direction) * (dude.speed * dude.scale.y)
          dude.rotation = -dude.direction + Math.PI
          if (dude.x < dudeBounds.x) {
            dude.x += dudeBounds.width
          }
          else if (dude.x > dudeBounds.x + dudeBounds.width){
            dude.x -= dudeBounds.width
          }
          if (dude.y < dudeBounds.y){
            dude.y += dudeBounds.height
          }else if (dude.y > dudeBounds.y + dudeBounds.height){
            dude.y -= dudeBounds.height
          }
        }
        tick += 0.1
      })
    },
    cacheAsBitmap () {
      var PIXI = require('pixi')
      var app = new PIXI.Application()
      var contain = document.getElementById('contain')
      contain.appendChild(app.view)
      app.stop()
      let aliens = []
      var alienFrames = [
          'eggHead.png',
          'flowerTop.png',
          'helmlok.png',
          'skully.png'
      ];
      let count = 0
      let alienContainer = new PIXI.Container()
      alienContainer.x = 400
      alienContainer.y = 300
      app.stage.interactive = true
      app.stage.addChild(alienContainer)
      PIXI.loader.add('spritesheet', '../../static/monsters.json')
      .load(() => {
        for (let i =0;i<100;i++){
          let frameName = alienFrames[i%4]
          let alien = PIXI.Sprite.fromFrame(frameName)
          alien.tint = Math.random()*0xFFFFFF
          alien.x = Math.random()*800 - 400
          alien.y = Math.random()*600 - 300
          alien.anchor.x = 0.5
          alien.anchor.y = 0.5
          aliens.push(alien)
          alienContainer.addChild(alien)
        }
        app.start()
      })
      app.stage.on('pointertap', ()=>{
        alienContainer.cacheAsBitmap = !alienContainer.cacheAsBitmap
      })
      app.ticker.add(()=>{
        for(let i =0;i<100;i++){
          let alien = aliens[i]
          alien.rotation += 0.1
        }
        count += 0.01
        alienContainer.scale.x = Math.sin(count)
        alienContainer.scale.y = Math.sin(count)
        alienContainer.rotation += 0.01
      })
    }
  },
  mounted () {
    this.cacheAsBitmap()
  }
}
</script>

