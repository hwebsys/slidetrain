$(function(){

	//ローカルストレージのデータをクリア
	$('button#clearLocalStorage').bind('click', function(){
		localStorage.clear();
		location.reload();	
	});

	//ローカルから非表示リスト取得
	var achieved = JSON.parse(localStorage.getItem('achieved'));
	if( !achieved ) {
		achieved = new Array();
	}

	//angularの読み込みが終わった後に処理。（正式な方法わからず）
	var count = 1500;//表示までの時間（ミリ秒）
	setTimeout(function(){

		//削除ボタン
		$(".close").bind("click", function(){
			//alert( $(this).closest('li').attr('id'));
			$(this).closest('li').hide('slow');//非表示
			achieved.push( Number($(this).closest('li').attr('id')) );//非表示リストに追加
			localStorage.setItem('achieved', JSON.stringify(achieved));//非表示リストをローカルに保存
		});
	}, count);

	//topの説明部分の非表示処理
	$(".close").bind("click", function(){
		$(this).closest('#topmessage').hide('slow');//非表示
		achieved.push( 'topmessage' );//非表示リストに追加
		localStorage.setItem('achieved', JSON.stringify(achieved));//非表示リストをローカルに保存
	});
	//topの説明部分で、非表示が保存済みなら隠す
	if($.inArray('topmessage', achieved) != -1) {
		$( '#topmessage' ).hide();
	}
	
});

