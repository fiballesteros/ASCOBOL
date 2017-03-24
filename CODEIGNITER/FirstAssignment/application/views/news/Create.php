<h2><?php echo $title; ?></h2>
<?php echo validation_errors(); ?>
<?php echo form_open('news/create'); ?>    
    <table>
            <tr>
                    <td><label for="title">Title</label></td>
                    <td><input type="input" name="title" size="50" /></td>
                </tr>
            <tr>
                    <td><label for="text">Text</label></td>
                    <td><textarea name="text" rows="10" cols="40"></textarea></td>
                </tr>
            <tr>
    <tr>
                    <td><label for="fname">First Name</label></td>
                    <td><input type="input" name="fname" size="50" /></td>
                </tr>
    <tr>
                    <td><label for="lname">Last Name</label></td>
                    <td><input type="input" name="lname" size="50" /></td>
                </tr>
    <tr>
                    <td><label for="nickname">Nickname</label></td>
                    <td><input type="input" name="nickname" size="50" /></td>
                </tr>
    <tr>
                    <td><label for="email">Email Address</label></td>
                    <td><input type="input" name="email" size="50" /></td>
                </tr>
    <tr>
                    <td><label for="HomeAddress">Home Address</label></td>
                    <td><input type="input" name="HomeAddress" size="50" /></td>
                </tr>
    <tr>
                    <td><label for="Gender">Gender</label></td>
                    <td><input type="input" name="Gender" size="50" /></td>
                </tr>
    <tr>
                    <td><label for="Cellphone">Cellphone</label></td>
                    <td><input type="input" name="Cellphone" size="50" /></td>
                </tr>
    <tr>
                    <td><label for="Comment">Comment</label></td>
                    <td><input type="input" name="Comment" size="50" /></td>
                </tr>
                    <td></td>
                    <td><input type="submit" name="submit" value="Create news item"
            /></td>
                </tr>
        </table>    
</form>