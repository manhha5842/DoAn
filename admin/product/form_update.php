<?php require'../menu_top.php'?>

<?php require '../connect.php';

$id=$_GET['id'];

$sql="select * from product where id='$id'";
$result=mysqli_query($connect,$sql);
$each=mysqli_fetch_array($result);

$sql_nsx="select * from manufactures";
$result_nsx=mysqli_query($connect,$sql_nsx);

$sql_the_loai="select * from category";
$result_the_loai=mysqli_query($connect,$sql_the_loai);
?>
	<form action="process_update.php" method="post" enctype="multipart/form-data">
		Tên sản phẩm 
		<br>
		<input type="hidden" name="id" value="<?php echo $each['id']?>">
		<input type="text" name="name" value="<?php echo $each['name']?>">
		<br>
		Giá
		<br>
		<input type="number" name="price" value="<?php echo $each['price']?>">
		<br>
		Ảnh

		<input type="file" name="img_new" >
		<br>
		Ảnh củ
		<img width="80" src="photos/<?php echo $each['img'] ?>" alt="" >
		<input type="hidden" name="img_old" value="<?php echo $each['img']?>">
		
		<br>
		Mô tả sản phẩm
		<textarea name="description"><?php echo $each['description']?></textarea>
		<br>
		Nhà sản xuất
		<select name="id_manufactures"> 
			<?php foreach ($result_nsx as $key => $manufactures) { ?>

				<option value="<?php echo $manufactures['id'] ?>"
						<?php if($manufactures['id'] == $each['id_category']) {?>
						selected
						<?php } ?>
						>
					<?php echo $manufactures['name']?> 
						
					</option>

			<?php }  ?>
		</select>
		<br>
		Thể loại
		<select name="id_category"> 
			<?php foreach ($result_the_loai as $key => $categorys) { ?>

				<option value="<?php echo $categorys['id']?>"
					<?php if($categorys['id'] == $each['id_category']) { ?>
						selected
					<?php } ?>
					>
					<?php echo $categorys['name']?>
						
					</option>

			<?php }  ?>
		</select>
		<br>
		<button>Sửa</button>
	</form>
<?php require'../menu_bottom.php'?>