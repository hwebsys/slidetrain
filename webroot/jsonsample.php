<?php
$sample_array	= array(
	array(
		'id' => 'slide1',
		'title' => '5 Reasons Why Social Media Was Born For SMEs',
		'href' => 'http://www.slideshare.net/tomorrow_people/5-reasons-why-social-media-was-born-for-sm-es',
		'img' => array(
			'src' => '//cdn.slidesharecdn.com/ss_thumbnails/5reasonswhysocialmediawasbornforsmes-120925085917-phpapp02-thumbnail-2.jpg?1348649444',
		),
	),
	array(
		'id' => 'slide2',
		'title' => 'Doodle Type Information for my Real Estate Business',
		'href' => 'http://www.slideshare.net/iprorand/listing-presentation-total-market-overview',
		'img' => array(
			'src' => '//cdn.slidesharecdn.com/ss_thumbnails/rand-120925181223-phpapp02-video-thumbnail-2.jpg?1348676282',
		),
	),
);
header( 'Content-Type: text/javascript; charset=utf-8' );
echo $_GET['callback'] . "(";
echo $json_value = json_encode( $sample_array );
echo ');';
