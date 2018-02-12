var ffmpeg = require('ffmpeg')
try {
	var process = new ffmpeg('./xps/xps1.mp4');
	process.then(function (video) {
		// Callback mode
		video.fnExtractFrameToJPG('xps1', {
			// start_time: '10',
			// duration_time: '5',
			frame_rate : 25,
			number : 5000,
			file_name : '%d'
		}, function (error, files) {
			if (!error)
				console.log('Frames: ' + files);
		});
	}, function (err) {
		console.log('Error: ' + err);
	});
} catch (e) {
	console.log(e.code);
	console.log(e.msg);
}
