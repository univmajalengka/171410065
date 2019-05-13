<?php require_once('Connections/koneksi.php'); ?>
<?php
if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  if (PHP_VERSION < 6) {
    $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  }

  $theValue = function_exists("mysql_real_escape_string") ? mysql_real_escape_string($theValue) : mysql_escape_string($theValue);

  switch ($theType) {
    case "text":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;    
    case "long":
    case "int":
      $theValue = ($theValue != "") ? intval($theValue) : "NULL";
      break;
    case "double":
      $theValue = ($theValue != "") ? doubleval($theValue) : "NULL";
      break;
    case "date":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;
    case "defined":
      $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
      break;
  }
  return $theValue;
}
}

$editFormAction = $_SERVER['PHP_SELF'];
if (isset($_SERVER['QUERY_STRING'])) {
  $editFormAction .= "?" . htmlentities($_SERVER['QUERY_STRING']);
}

if ((isset($_POST["MM_update"])) && ($_POST["MM_update"] == "form1")) {
  $updateSQL = sprintf("UPDATE matakuliah SET kode_mk=%s, nama=%s, sks=%s, semester=%s, aktif=%s, jenis=%s WHERE kode=%s",
                       GetSQLValueString($_POST['kode_mk'], "text"),
                       GetSQLValueString($_POST['nama'], "text"),
                       GetSQLValueString($_POST['sks'], "int"),
                       GetSQLValueString($_POST['semester'], "int"),
                       GetSQLValueString($_POST['aktif'], "text"),
                       GetSQLValueString($_POST['jenis'], "text"),
                       GetSQLValueString($_POST['kode'], "int"));

  mysql_select_db($database_koneksi, $koneksi);
  $Result1 = mysql_query($updateSQL, $koneksi) or die(mysql_error());

  $updateGoTo = "matakuliah.php";
  if (isset($_SERVER['QUERY_STRING'])) {
    $updateGoTo .= (strpos($updateGoTo, '?')) ? "&" : "?";
    $updateGoTo .= $_SERVER['QUERY_STRING'];
  }
  header(sprintf("Location: %s", $updateGoTo));
}

$colname_matakuliah = "-1";
if (isset($_GET['kode'])) {
  $colname_matakuliah = $_GET['kode'];
}
mysql_select_db($database_koneksi, $koneksi);
$query_matakuliah = sprintf("SELECT * FROM matakuliah WHERE kode = %s", GetSQLValueString($colname_matakuliah, "int"));
$matakuliah = mysql_query($query_matakuliah, $koneksi) or die(mysql_error());
$row_matakuliah = mysql_fetch_assoc($matakuliah);
$totalRows_matakuliah = mysql_num_rows($matakuliah);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Sistem Informasi Ploting Jadwal Kuliah</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <div class="brand-logo">
                <a href="index.html">
                    <b class="logo-abbr"><img src="images/logo.png" alt=""> </b>
                    <span class="logo-compact"><img src="./images/logo-compact.png" alt=""></span>
                    <span class="brand-title">
                        <img src="images/logo-text.png" alt="">
                    </span>
                </a>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">    
            <div class="header-content clearfix">
                
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="toggle-icon"><i class="icon-menu"></i></span>
                    </div>
                </div>
                <div class="header-left">
                    <div class="input-group icons">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                        </div>
                        <input type="search" class="form-control" placeholder="Search Dashboard" aria-label="Search Dashboard">
                        <div class="drop-down   d-md-none">
							<form action="#">
								<input type="text" class="form-control" placeholder="Search">
							</form>
                        </div>
                    </div>
                </div>
                <div class="header-right">
                    <ul class="clearfix">
                        <li class="icons dropdown">
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                <span class="activity active"></span>
                                <img src="images/user/1.png" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile   dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        
                                        <li><a href="logout.php"><i class="icon-key"></i> <span>Logout</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li>
                        <a href="home.php" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Home</span>
                        </a>
                    </li>
                     <li>
                        <a href="dosen.php" aria-expanded="false">
                            <i class="icon-user menu-icon"></i><span class="nav-text">Dosen</span>
                        </a>
                    </li>
                     <li>
                        <a href="matakuliah.php" aria-expanded="false">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">Mata Kuliah</span>
                        </a>
                    </li>
                    <li class="nav-label">Perkuliahan</li>
                    <li>
                        <a href="hari.php" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Hari</span>
                        </a>
                    </li>
                     <li>
                        <a href="jadwal.php" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Jadwal</span>
                        </a>
                    </li>
                     <li>
                        <a href="jadwalkuliah.php" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Jadwal Kuliah</span>
                        </a>
                    </li>
                     <li>
                        <a href="jam.php" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Jam</span>
                        </a>
                    </li>
                     <li>
                        <a href="ruang.php" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Ruang</span>
                        </a>
                    </li>
                     <li>
                        <a href="waktuts.php" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Wktu tk Tersedia</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

          <div class="container-fluid">
            <form method="post" name="form1" action="<?php echo $editFormAction; ?>">
              <table align="center">
                <tr valign="baseline">
                  <td nowrap align="right">Kode:</td>
                  <td><?php echo $row_matakuliah['kode']; ?></td>
                </tr>
                <tr valign="baseline">
                  <td nowrap align="right">Kode_mk:</td>
                  <td><input type="text" name="kode_mk" value="<?php echo htmlentities($row_matakuliah['kode_mk'], ENT_COMPAT, 'utf-8'); ?>" size="32"></td>
                </tr>
                <tr valign="baseline">
                  <td nowrap align="right">Nama:</td>
                  <td><input type="text" name="nama" value="<?php echo htmlentities($row_matakuliah['nama'], ENT_COMPAT, 'utf-8'); ?>" size="32"></td>
                </tr>
                <tr valign="baseline">
                  <td nowrap align="right">Sks:</td>
                  <td><input type="text" name="sks" value="<?php echo htmlentities($row_matakuliah['sks'], ENT_COMPAT, 'utf-8'); ?>" size="32"></td>
                </tr>
                <tr valign="baseline">
                  <td nowrap align="right">Semester:</td>
                  <td><input type="text" name="semester" value="<?php echo htmlentities($row_matakuliah['semester'], ENT_COMPAT, 'utf-8'); ?>" size="32"></td>
                </tr>
                <tr valign="baseline">
                  <td nowrap align="right">Aktif:</td>
                  <td><input type="text" name="aktif" value="<?php echo htmlentities($row_matakuliah['aktif'], ENT_COMPAT, 'utf-8'); ?>" size="32"></td>
                </tr>
                <tr valign="baseline">
                  <td nowrap align="right">Jenis:</td>
                  <td><input type="text" name="jenis" value="<?php echo htmlentities($row_matakuliah['jenis'], ENT_COMPAT, 'utf-8'); ?>" size="32"></td>
                </tr>
                <tr valign="baseline">
                  <td nowrap align="right">&nbsp;</td>
                  <td><input type="submit" value="Update record"></td>
                </tr>
              </table>
              <input type="hidden" name="MM_update" value="form1">
              <input type="hidden" name="kode" value="<?php echo $row_matakuliah['kode']; ?>">
            </form>
            <p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
          </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright &copy; Aldhea 2019</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>

</body>

</html>
<?php
mysql_free_result($matakuliah);

mysql_free_result($datadosen);
?>
