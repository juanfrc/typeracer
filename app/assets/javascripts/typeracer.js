$(document).ready(function(){

	var quote = "Great ambition is. great ambition is."

		//empezar aplicación
		$('.start').on("click", function(){
		$('.start').hide(),
		$('.square').append("<div id='countdown'></div>"),
		timer()
	});

	var counter = 0
	var words = quote.split(" ")
	edited_quote = quote
	// console.log(words)

	//resultado en tiempo y wmp
	var score = function(quote) {
		var characters = quote.length;
		// average 5 characters per word
		time = Math.round(((end_time - initial_time)/1000)*100)/100
		// console.log("segundos" +time)
		wpm = Math.round((characters * 60 / (5*time)) * 100) / 100
		// console.log("palabras:"+wpm)
		// console.log(wpm)
	}

	//Funcion para revisar sí la palabra que se ingresa es la correcta
	$(".square").keyup("#typing", function(e){		
		var test = $(this).find('#typing');

		//Cuando una palabra es igual
		if(e.keyCode == 32 && counter == 1){
			// console.log("borra text")
			delete_word();
			// highlight(words[0])
			counter = 0;
			test.val("");
			// console.log("que se va a cambiar " + edited_quote)
			$('.quote h3').html(edited_quote)
			// edited_quote = edited_quote.split(' ').shift().join(' ');
			// console.log($('.quote h3').html());
			// console.log(edited_quote);
		}

		//revisa sí es igual a la palabra
		if(test.val() == words[0]) {
			// console.log("revisa palabra");
			counter = 1;
			// console.log(counter);
			words.shift()
			// console.log(words)
		}

		//Cuando termina de escribir
		if(words.length == 0){
			test.val("");
			counter = 0;
			end_time = Date.now()
			score(quote)
			$('.quote').after("<button class='restart'>New game?</button>");
			$('.quote').find('h3').remove(),
			$('.quote').append("<h3>Time: "+time+" seconds<br>WPM: "+wpm+" </h3>"),
			// $('.quote').append("<h3>Time: "+time+"<br>WPM: "+wpm+" </h3>")
			$('#typing').remove(),
			words.push(1);
		}
	});

		//Funcion para resetear  juego
	$('.square').on("click", ".restart", function(){
		$('.restart').hide(),
		$('.quote').remove(),
		$('#countdown360_countdown').show(),
		// quote = $('.quote h3').html(),
		edited_quote = quote,
		timer(),
		words = quote.split(" ")
		// console.log(words)
	});

	//funcion que permite que hace cuenta regresiva
	var timer = function() {
		$("#countdown").countdown360({
	    radius      : 60.5,
	    seconds     : 5,
	    strokeWidth : 15,
	    fillStyle   : '#0276FD',
	    strokeStyle : '#003F87',
	    fontSize    : 50,
	    fontColor   : '#FFFFFF',
	    autostart: false,
	    onComplete  : function () { 
				$('#countdown360_countdown').hide(),
	    	$('.square').append("<div class='quote'><h3>"+quote+"</h3></div>"),
				$('.quote').after("<input type='text' name='typing' id='typing' placeholder='Type your text here' autofocus>"),
				$('#typing').focus(),
				initial_time = Date.now()
				// highlight(words[0])
	    }
  	}).start()
	}

	//función para eliminar una palabra del texto
	var delete_word = function(){
		edited_quote = edited_quote.split(' ');
		edited_quote.shift();
		edited_quote = edited_quote.join(" ");
	}
});


