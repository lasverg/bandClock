var canvas = document.getElementById('canvas1');
var ctx = canvas.getContext('2d');
var cxt = canvas.getContext('2d');

ctx.strokeStyle = '#FE14A9';
ctx.lineWidth = 20;
ctx.lineCap = 'round';

//EXTRA Configure

//cxt.strokeStyle = '#B3FE01';
//cxt.lineWidth = 20;
//cxt.lineCap = 'round';



ctx.shadowBlur = 17;
ctx.shadowColor = '#FE14A9';


function degToRed(degree) {
    var factor = Math.PI / 180;
    return degree * factor;
}

function renderTime() {
    var now = new Date();
    var today = now.toDateString();
    var time = now.toLocaleTimeString();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds();
    var milliseconds = now.getMilliseconds();
    var newSeconds = seconds + (milliseconds / 1000);

  
  //Background 
    //gradient = ctx.createRadialGradiant(250, 250, 5, 250, 250, 300);
    //gradient.addColorStop(0, '#E91E63');
   // gradient.addColorStop(1, '#000000');
    //ctx.fillStyle = gradient;
    ctx.fillStyle = '#333';
    ctx.fillRect(0, 0, 500, 500);
  //Hours
    ctx.beginPath();
    ctx.arc(250, 250, 200, degToRed(270), degToRed((hours * 30) - 90));
    ctx.stroke();
  
  //Munites
    ctx.beginPath();
    ctx.arc(250, 250, 170, degToRed(270), degToRed((minutes * 6) - 90));
    ctx.stroke();
  
  //Seconds
    cxt.beginPath();
    cxt.arc(250, 250, 140, degToRed(270), degToRed((newSeconds * 6) - 90));
    cxt.stroke();
  
  //Date
    ctx.font = '25px Consolas';
    ctx.fillStyle = '#FE14A9';
    ctx.fillText(today, 160, 250);
  
  //Time
    ctx.font = '20px Consolas';
    ctx.fillStyle = '#FE14A9';
    ctx.fillText(time, 200, 280);
}
setInterval(renderTime, 40);