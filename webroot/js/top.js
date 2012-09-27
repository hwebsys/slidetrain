$(function(){

	//ローカルストレージのデータをクリア
	$('button#clearLocalStorage').bind('click', function(){
		localStorage.clear();
		location.reload();	
	});

	//console.log(localStorage.getItem('achieved'));

	//保存してあるデータを取得
	var achieved = JSON.parse(localStorage.getItem('achieved'));
	//console.log(typeof(achieved));

	if (achieved !== null) {
		//console.log('not empty'+achieved);
		for ( var key in achieved ) {
			//console.log( achieved[key] );
			$('#' + achieved[key]).hide();
		};
	} else {
		console.log('empty!');
		achieved = new Array();
	}

	$("span.close").bind("click", function(){
		//alert( $(this).closest('li').attr('id'));
		$(this).closest('li').hide('slow');
		achieved.push( $(this).closest('li').attr('id') );
		localStorage.setItem('achieved', JSON.stringify(achieved));

	});


});

