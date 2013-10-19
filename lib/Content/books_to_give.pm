
################################################################################

sub recalculate_books_to_give {

	require_content 'books';

	recalculate_books ();

}

################################################################################

sub do_update_books_to_give {
	
	$_REQUEST {_id_user} or die "#_id_user#:Вы забыли указать читателя";
	
	my $user = sql (users => $_REQUEST {_id_user}, 'levels');
	
	$_REQUEST {_dt_to} = dt_add (today (), $user -> {level} -> {days});
	
	local $_REQUEST {type} = 'books';

	do_update_DEFAULT ();
	
	esc ();

}

################################################################################

sub get_item_of_books_to_give {

	my $data = sql (books => $_REQUEST {id}, 'titles');
	
	$data -> {id_user} = $_USER -> {id_user_client};

	add_vocabularies ($data,
		users => {filter => "id_level > 0"}
	);

	return $data;

}

1;
