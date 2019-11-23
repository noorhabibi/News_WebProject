<div class="row">
	<div class="col-md-12">
		<h3>
			<?php echo $data['news']->title; ?>
		</h3>
		<img src="<?php echo assets_url('uploads/' . $data['news']->image); ?>" class="img-responsive news-image" alt="<?php echo $data['news']->title; ?>" />
		<p class="author-info alert alert-warning">
			<?php
			$author = get_user_profile($news->iduser);
			echo (
				$author[0]->gravatar_email ?
					'<img src="' . get_gravatar( $author[0]->gravatar_email, 16) . '" class="gravatar" title="' . ($author[0]->display_name ? $author[0]->display_name : $author[0]->first_name . ' ' . substr($author[0]->last_name, 0, 1)) . '" /> '
					: '<i class="fa fa-fw fa-user"></i> '
			     )
			     . ( $author[0]->display_name ?  $author[0]->display_name :  $author[0]->first_name . ' ' . substr($author[0]->last_name, 0, 1));
			?>
			<i class="fa fa-fw fa-calendar-o"></i> <?php echo date('d M, Y h:i a', strtotime($data['news']->add_date)); ?>
			<?php
			echo (
				($category = get_category($data['news']->idpost)) ?
					'<i class="fa fa-fw fa-filter"></i> <a href="' . base_url().('index.php/news/category/' . $category[0]->idcategory) . '">' . $category[0]->title . '</a>'
					: ''
			);
			?>
		</p>
		<div class="news-detail">
			<?php echo nl2br($data['news']->body); ?>
		</div>
		<?php
		if($tags = get_tags($data['news']->idpost)) {
			echo '<div class="tags">';
			echo 'Terms: ';
			foreach($tags as $tag) {
				echo ' <i class="fa fa-fw fa-link"></i> <a href="' . base_url('index.php/news/tag/' . $tag->idtag) . '">' . $tag->title . '</a> ';
			}
			echo '</div>';
		}
		?>
	</div>
</div>