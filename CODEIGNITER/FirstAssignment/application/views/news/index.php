<h2><?php echo $title; ?></h2>

<table border='1' cellpadding='4'>
    <tr>
        <td><strong>Title</strong></td>
        <td><strong>Content</strong></td>
		<td><strong>First Name</strong></td>
		<td><strong>Last Name</strong></td>
		<td><strong>Nickname</strong></td>
		<td><strong>Email Address</strong></td>
		<td><strong>Home Address</strong></td>
		<td><strong>Gender</strong></td>
		<td><strong>Phone Number</strong></td>
		<td><strong>Comments</strong></td>
		<td><strong>Action</strong></td>
    </tr>
    <?php foreach ($news as $news_item): ?>
        <tr>
            <td><?php echo $news_item['title']; ?></td>
            <td><?php echo $news_item['text']; ?></td>
			<td><?php echo $news_item['FirstName']; ?></td>
			<td><?php echo $news_item['LastName']; ?></td>
			<td><?php echo $news_item['Nickname']; ?></td>
			<td><?php echo $news_item['EmailAddress']; ?></td>
			<td><?php echo $news_item['HomeAddress']; ?></td>
			<td><?php echo $news_item['Gender']; ?></td>
			<td><?php echo $news_item['Cellphone']; ?></td>
			<td><?php echo $news_item['Comment']; ?></td>
            <td>
                <a href="<?php echo site_url('news/'.$news_item['slug']); ?>">View</a> |
                <a href="<?php echo site_url('news/edit/'.$news_item['id']); ?>">Edit</a> |
                <a href="<?php echo site_url('news/delete/'.$news_item['id']); ?>" onClick="return confirm('Are you sure you want to delete?')">Delete</a>
            </td>
        </tr>
    <?php endforeach; ?>
</table>