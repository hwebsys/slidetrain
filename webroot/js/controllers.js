function SlideListCtrl($scope, $http) {
	//jsonpの取得用URI
	var here = location.href.replace('index.htm', '');
    var uri = here + 'jsonsample.php'
    //var uri ='http://search.twitter.com/search.json?q=yuu'
      + '?callback=JSON_CALLBACK';

	var achieved = JSON.parse(localStorage.getItem('achieved'));
	var result = new Array();
	//jsonpでデータを取得
    $http.jsonp(uri).
	    success(function(data, status, headers, config) {
			//複数データをチェック
			for( var key in data) {
				//非表示リストに入っていなければ
				if($.inArray(data[key]['id'], achieved) == -1) {
					//出力データに追加
					result.push( data[key] );
				}
			};
			//出力データを渡す
    		$scope.slides = result;
			//console.log('success');
    	}).
    	error(function(data, status, headers, config) {
			console.log('error');
    	});
}
