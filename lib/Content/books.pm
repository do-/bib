

################################################################################

sub do_take_books {

	sql_do ('UPDATE books SET id_user = NULL, dt_to = NULL WHERE id = ?', $_REQUEST {id});	

}

################################################################################

sub do_undelete_books {

	my $data = sql (books => $_REQUEST {id});	

	vld_unique (books => {field => 'no', value => $data -> {no}}) or die "#_no#:Этот номер зарегистрирован для актуальной книги. Восстановление невозможно";

	sql_do ("UPDATE books SET fake = 0 WHERE id = ?", $_REQUEST {id});

	esc ();

}

################################################################################

sub recalculate_books {

	my $data = sql (books => $_REQUEST {id});
	
	my ($cnt, $cnt_free) = sql_select_array (qq {
	
		SELECT
			COUNT(*),
			SUM(CASE WHEN id_user IS NOT NULL THEN 1 ELSE 0 END)
		FROM
			books
		WHERE
			fake = 0
			AND id_title = ?
			
	}, $data -> {id_title});
	
	sql_do (
	
		'UPDATE titles SET cnt = ?, cnt_free = ? WHERE id = ?',
	
		$cnt,
		
		$cnt_free,
		
		$data -> {id_title},
		
	);

}

################################################################################

sub do_update_books {

	$_REQUEST {_no} or die "#_no#:Вы забыли ввести номер";
	
	vld_unique (books => {field => 'no'}) or die "#_no#:Этот номер уже зарегистрирован";
	
	do_update_DEFAULT ();
	
	esc ();

}

################################################################################

sub get_item_of_books { # Экземпляры книг

	my $data = sql (books => $_REQUEST {id}, 'titles', 'users');

	$data -> {no_del} ||= 1 if !$_USER -> {is_mgr};

	$_REQUEST {__read_only} ||= !($_REQUEST {__edit} || $data -> {fake} > 0);

#	add_vocabularies ($data,
#		voc_foo => {order => "id", filter => "id=$$data{id_books}"}
#	);

#	$_REQUEST {first} += 0;
#	
#	$data -> {clones} = sql (books => [
#		['label LIKE', substr ($data -> {label}, 0, ($_REQUEST {first} ||= 10)) . '%'],
#	]);

#	sql ($data, books_log => [
#	
#		[ id_books => $data -> {id} ],
#		
#		[ ORDER       => ['id DESC'] ],
#		[ LIMIT       => 'start, -50 BY id'],
#		
#	], 'voc_something(*)', 'log(dt)', 'users');

	return $data;

}

1;
