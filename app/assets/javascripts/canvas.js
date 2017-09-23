var ERROR_ANIMATION = (function() {

    return {
        init: init
    };

    var canvas,
        ctx,
        imgData,
        pix,
        WIDTH,
        HEIGHT,
        flickerInterval,
        self;

    function init() {
        canvas = document.getElementById('error');
        ctx = canvas.getContext('2d');
        canvas.width = WIDTH = window.innerWidth;
        canvas.height = HEIGHT = window.innerHeight;
        ctx.fillRect(0, 0, WIDTH, HEIGHT);
        ctx.fill();
        imgData = ctx.getImageData(0, 0, WIDTH, HEIGHT);
        pix = imgData.data;
        flickerInterval = setInterval(flickering, 50);
    };

    function flickering() {
        for (var i = 0; i < pix.length; i += 4) {
            var color = (Math.random() * 200) + 50;
            pix[i] = color;
            pix[i + 1] = color;
            pix[i + 2] = color;
        }
        ctx.putImageData(imgData, 0, 0);
    };
}());

ERROR_ANIMATION.init();