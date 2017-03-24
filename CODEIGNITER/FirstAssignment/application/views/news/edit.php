
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
        <td><label for="fname">First Name</label></td>
        <td><input type="input" name="fname" size="50" value="<?php echo $news_item['FirstName'] ?>" /></td>
    </tr>
	<tr>
        <td><label for="lname">Last Name</label></td>
        <td><input type="input" name="lname" size="50" value="<?php echo $news_item['LastName'] ?>" /></td>
    </tr>
	<tr>
        <td><label for="nickname">Nickname</label></td>
        <td><input type="input" name="nickname" size="50" value="<?php echo $news_item['Nickname'] ?>" /></td>
    </tr>
	<tr>
        <td><label for="email">Email Address</label></td>
        <td><input type="input" name="email" size="50" value="<?php echo $news_item['EmailAddress'] ?>" /></td>
    </tr>
	<tr>
        <td><label for="HomeAddress">Home Address</label></td>
        <td><input type="input" name="HomeAddress" size="50" value="<?php echo $news_item['HomeAddress'] ?>" /></td>
    </tr>
	<tr>
        <td><label for="Gender">Gender</label></td>
        <td><input type="input" name="Gender" size="50" value="<?php echo $news_item['Gender'] ?>" /></td>
    </tr>
	<tr>
        <td><label for="Cellphone">Phone Number</label></td>
        <td><input type="input" name="Cellphone" size="50" value="<?php echo $news_item['Cellphone'] ?>" /></td>
    </tr>
	<tr>
        <td><label for="Comment">Comment</label></td>
        <td><input type="text" name="Comment" rows="10" cols="40" value="<?php echo $news_item['Comment'] ?>" /></td>
    </tr>
    <tr>
        <td></td>
        <td><input type="submit" name="submit" value="Edit news item" /></td>
    </tr>
</table>
</form>