<?php
//set time zone location sesuai negara, jadikan Asia Jakarta
date_default_timezone_set('Asia/Jakarta');

//set koneksi ke server sesuai host, user, password dan database
$server="localhost";
$user="root";
$pass="";
$database="Web_sparepart";

//koneksikan ke server
$conect=mysqli_connect($server,$user,$pass,$database) or die('Error Connection Network');

//buat parameter untuk mempercepat penulisan url misal https://www.develindo.com atau http://localhost/folderwebanda

$hostname="http://localhost/web_sparepart";
?>