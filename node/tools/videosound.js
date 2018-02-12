var ffmpeg = require('ffmpeg')
new ffmpeg('./new/03.mp4').then(function (video) {

  video.fnExtractSoundToMP3('n3.mp3', function (err, file) {
      if (err) {
          console.log(err);
      } else {
        console.log('文件名 => ' + file);
      }
  });

}, function (err) {

  console.log(err);

});