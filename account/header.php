<?php
if (isset($_COOKIE['remember'])) {
    $token = $_COOKIE['remember'];
    $sql = "select * from customer
         where token = '$token'
         limit 1";
    $result = mysqli_query($connect, $sql);
    $number_rows = mysqli_num_rows($result);
    if ($number_rows == 1) {
        $each = mysqli_fetch_array($result);
        if (!isset($_SESSION)) {
            session_start();
        }
        $_SESSION['id'] = $each['id'];
        $_SESSION['name'] = $each['name'];
    }
}
?>
<?php require '../admin/connect.php'; ?>
<link rel="stylesheet" href="../assets/css/header.css">
<link rel="stylesheet" href="../assets/css/style.css">
<script src="https://kit.fontawesome.com/19302221dc.js" crossorigin="anonymous"></script>
<header>
    <nav class="header">

        <input type="checkbox" name="" id="check">
        <label for="check" class="checkbtn">
            <i class="fa fa-bars"></i>
        </label>

        <div class="logo">
            <a href="../index.php">Logo</a>
        </div>

        <div class="menu">
            <ul class="ul_1">
                <li>
                    <a href="../index.php">Trang chủ </a>
                </li>
                <li>
                    <a href="../products.php">Cửa hàng</a>
                </li>
                <li>
                    <a href="../products.php">Áo <i class="fas fa-caret-down"></i></a>
                    <div class="sub_menu">
                        <?php
                        $sql_category = "select * from category_detail where category_id=1";
                        $result_category = mysqli_query($connect, $sql_category);
                        ?>
                        <ul>
                            <?php foreach ($result_category as $each) { ?>
                                <li><a href=""><?php echo $each['name'] ?></a></li>
                            <?php } ?>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="../products.php">Quần <i class="fas fa-caret-down"></i></a>
                    <div class="sub_menu">
                        <?php
                        $sql_category = "select * from category_detail where category_id=2";
                        $result_category = mysqli_query($connect, $sql_category);
                        ?>
                        <ul>
                            <?php foreach ($result_category as $each) { ?>
                                <li><a href=""><?php echo $each['name'] ?></a></li>
                            <?php } ?>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="../products.php">Phụ kiện <i class="fas fa-caret-down"></i></a>
                    <div class="sub_menu">
                        <?php
                        $sql_category = "select * from category_detail where category_id=3";
                        $result_category = mysqli_query($connect, $sql_category);
                        ?>
                        <ul>
                            <?php foreach ($result_category as $each) { ?>
                                <li><a href=""><?php echo $each['name'] ?></a></li>
                            <?php } ?>
                        </ul>
                    </div>
                </li>

            </ul>

        </div>
        <div class="icon">
            <ul class="ul_2">
                <li>
                    <a href="../view_cart.php"><i class="fas fa-shopping-cart"></i></a>
                </li>
                <li>
                    <?php
                    if (!isset($_SESSION)) {
                        session_start();
                    }
                    if (empty($_SESSION['id'])) {
                    ?>
                        <a href="../signin.php" class="profile"> Đăng nhập </a>
                    <?php } else { ?>
                        <label class="profile"><i class="fas fa-user"></i>
                            <?php echo $_SESSION['name']; ?>
                        </label>
                        <div class="sub_menu">
                            <ul>
                                <li><a href="../account">Tài khoản</a></li>
                                <li><a href="../view_cart.php">Đơn hàng</a></li>
                                <li><a href="../signout.php">Đăng xuất</a></li>
                            </ul>
                        </div>
                    <?php } ?>
                </li>
            </ul>
        </div>
    </nav>
</header>