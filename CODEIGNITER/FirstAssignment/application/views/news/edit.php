
<h2><?php echo $title; ?></h2>

<?php echo validation_errors(); ?>

<?php echo form_open('news/edit/'.$news_item['id']); ?>
<table>
    <tr>
        <td><label for="title">Title</label></td>
        <td><input type="input" name="title" size="50" value="<?php echo $news_item['title'] ?>" /></td>
    </tr>
    <tr>
        <td><label for="text">Text</label></td>
        <td><textarea name="text" rows="10" cols="40"><?php echo $news_item['text'] ?></textarea></td>
    </tr>
	<tr>
        <td><label for="fname">First name</label></td>
        <td><input type="input" name="fname" size="50" value="<?php echo $news_item['First name'] ?>" /></td>
    </tr>
	<tr>
        <td><label for="lname">Last name</label></td>
        <td><input type="input" name="lname" size="50" value="<?php echo $news_item['Last name'] ?>" /></td>
    </tr>
	<tr>
        <td><label for="nickname">Nickname</label></td>
        <td><input type="input" name="nickname" size="50" value="<?php echo $news_item['Nickname'] ?>" /></td>
    </tr>
	<tr>
        <td><label for="email">Email Address</label></td>
        <td><input type="input" name="email" size="50" value="<?php echo $news_item['Email Address'] ?>" /></td>
    </tr>
	<tr>
        <td><label for="nickname">Home Address</label></td>
        <td><input type="input" name="nickname" size="50" value="<?php echo $news_item['Home Address'] ?>" /></td>
    </tr>
	<tr>
        <td><label for="nickname">Gender</label></td>
        <td><input type="input" name="nickname" size="50" value="<?php echo $news_item['Gender'] ?>" /></td>
    </tr>
	<tr>
        <td><label for="nickname">Phone Number</label></td>
        <td><input type="input" name="nickname" size="50" value="<?php echo $news_item['Cellphone'] ?>" /></td>
    </tr>
	<tr>
        <td><label for="nickname">Comment</label></td>
        <td><input type="text" name="nickname" rows="10" cols="40" value="<?php echo $news_item['Comment'] ?>" /></td>
    </tr>
    <tr>
        <td></td>
        <td><input type="submit" name="submit" value="Edit news item" /></td>
    </tr>
</table>
</form>