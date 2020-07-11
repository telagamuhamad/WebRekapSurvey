<?php
//abaikan error yang muncul pada browser
error_reporting(0);
//sesi dimulai
session_start();
//panggil koneksi.php untuk menghubungkan ke database
include "../assets/relasi/koneksi.php";

//jika sesi sudah admin (sudah pernah login)  maka akan  di direct ke halaman home.php
if(isset($_SESSION["data_admin"]))
{
 header("location:home.php");
}

 $user = mysqli_real_escape_string($conect, $_POST['email_admin']);
 $pass = mysqli_real_escape_string($conect, $_POST['password_admin']);
 $pass_md5= md5($pass);
 $kode = mysqli_real_escape_string($conect, $_POST['kode']);


  if(isset($_POST['login'])){
    if($user == ""){
    $er_email="<div class='alert alert-warning alert-dismissible' role='alert'>
    <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
    <span aria-hidden='true'>&times;</span></button>
    <strong>Username Kosong !</strong> <br> Username wajib diisi</div>";
    }
    elseif($pass == ""){
    $er_pass="<div class='alert alert-warning alert-dismissible' role='alert'>
    <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
    <span aria-hidden='true'>&times;</span></button>
    <strong>Password Kosong !</strong> <br> Password Wajib diisi</div>";
    }
    elseif($_SESSION['kode_session'] != $kode){
    $er_kode="<div class='alert alert-warning alert-dismissible' role='alert'>
    <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
    <span aria-hidden='true'>&times;</span></button>
    <strong>Kode Salah !</strong> <br> Ulangi Kode Dengan Benar</div>";
    }
    else{
    //cek apakah username terdaftar atau tidak di tb_admin
    $sql_cek=mysqli_query($conect, "SELECT * FROM tb_admin where email_admin='$user' and pass_admin='$pass_md5'");
    $cek_admin=mysqli_num_rows($sql_cek);
    if($cek_admin == "0"){
        //jika username dan password tidak terdaftar di tb_admin
    $er_email="<div class='alert alert-danger alert-dismissible' role='alert'>
    <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
    <span aria-hidden='true'>&times;</span>
    </button><strong>Login Gagal !</strong> <br>Username dan Password tidak valid</div>";
    }
    else{
        //jika username dan password terdaftar di tb_admin maka akan menuju halaman home.php
    $_SESSION['data_admin']=$user;
    echo "<script>alert('Selamat Datang di Halaman Admin !');document.location='home.php'</script>";

     }
   }
 }

$iweb=mysqli_fetch_array(mysqli_query($conect, "select * from tb_identitas where id_identitas='1'"));

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="<?php echo $iweb['katakunci'];?>">
        <meta name="description" content="<?php echo $iweb['deskripsi'];?>" />
        <meta name="author" content="<?php echo $iweb['pembuat'];?>">
        <title><?php echo $iweb['nama_website'];?></title>
        <link rel="Shortcut Icon" href="<?php echo $hostname;?>/assets/images/logo/<?php echo $iweb['logo'];?>" type="image/x-icon" />
        <!-- Bootstrap core CSS -->
        <link href="<?php echo $hostname;?>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <!-- Custom styles template ini-->
        <link href="<?php echo $hostname;?>/style_admin.css" rel="stylesheet" type="text/css" media="all">
        <!-- Custom Fonts Awesome-->
        <link href="<?php echo $hostname;?>/assets/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <script src="<?php echo $hostname;?>/assets/js/jquery.min.js"></script>
        <script src="<?php echo $hostname;?>/assets/js/bootstrap.js"></script>
        <script src="<?php echo $hostname;?>/assets/js/ie10-viewport-bug-workaround.js"></script>

    </head>
    <body class="bodylogin">
    <div class="container"> <!-- start container -->
         <div class="row"><!-- start row -->
              <div class="col-lg-12"><!-- start col lg 12-->
                   <div class="login"><!-- start class login -->
                        <p><b>LOGIN ADMIN WEB</b></p>
                   <hr>
                   <!-- start form login -->
                   <form action="" method="post">
                   <div class="form-group"><!--start form-group-->
                        <label>Email</label>
                        <div class="input-group input-group-sm"><span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
                        <input type="text" name="email_admin" placeholder="Email" class="form-control" maxlength="40" value="<?php echo $_POST['email_admin'];?>" autofocus>
                        </div>
                   </div><!--/form-group-->

                   <?php echo $er_email;?>

                   <div class="form-group"><!--start form-group-->
                        <label>Password</label>
                        <div class="input-group  input-group-sm">
                        <span class="input-group-addon"><i class="fa fa-lock fa-fw"></i></span>
                        <input id="pass1" type="password" name="password_admin" placeholder="Password" class="form-control" value="<?php echo $_POST['Password_admin'];?>" maxlength="15">
                        </div>
                        </div><!--/form-group-->
                   <?php echo $er_pass;?>
                   <div class="form-group text-center"><!--start form-group-->

                        <img id="kd" alt="kode" src="<?php echo 'kode.php';?>">
                        <hr>
                        <input id="kode" type="text" name="kode" placeholder="Masukan Kode diatas" class="form-control text-center" value="<?php echo $_POST['kode'];?>" maxlength="6">
                        </div><!--/form-group-->
                   <?php echo $er_kode;?>

                   <button class="btn btn-danger" type="submit" name="login">Log In</button>
                   <a href="./" class="btn btn-default btn-sm">Reset</a>
                   </form>
                   <!-- end form login -->
		</div><!-- end class login -->
	</div><!-- end col lg 12 -->
 </div><!-- end row -->
</div><!-- end container -->
    </body>
</html>
