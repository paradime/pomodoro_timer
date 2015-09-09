var workTimer = function (seconds, p) {
	while(seconds < 1500){
		p.innerHTML = seconds;
		setTimeout(workTimer(seconds+1, p), 1000);
	}
};

function startRestTimer() {

};

var startTimer = function () {
// use setInterval ?
	workTimer(0, document.getElementById("time"));
};

btn = document.getElementById("start");
