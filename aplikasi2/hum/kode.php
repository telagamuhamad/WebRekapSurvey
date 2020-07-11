<?php
session_start();
header("Content-type: image/png");

$captcha_image = imagecreatefrompng("../assets/images/icon/cap2.png");
$captcha_font = imageloadfont("../assets/fonts/font.gdf");
$captcha_text = substr(md5(uniqid('')),0,4);

$_SESSION['kode_session'] = $captcha_text;

$captcha_color = imagecolorallocate($captcha_image,167,0,0);
imagestring($captcha_image,$captcha_font,20,0,$captcha_text,$captcha_color);
imagepng($captcha_image);
imagedestroy($captcha_image);
?>