################################################################################

sub select_menu {
	
	return [
		
		{
			name  => 'users',
			label => '����',
			items => [
				{
					name  => 'books_overdue',
					label => '��������',
					off   => !$_USER -> {is_mgr},
				},		
			],
		},
		
		($_USER -> {id_user_client} ? {
			href  => "/?type=users&id=$_USER->{id_user_client}",
			label => sql ('users(label)' => $_USER->{id_user_client}),
		} : ()),
		
		{
			name  => 'titles',
			label => '�����',
			items => [
				{
					name  => 'titles_boring',
					label => '������������',
					off   => !$_USER -> {is_mgr},
				},
				{
					name  => 'books_mint',
					label => '����������',
					off   => !$_USER -> {is_mgr},
				},
				{
					name  => 'books_decrepit',
					label => '������',
					off   => !$_USER -> {is_mgr},
				},
			],
		},
		{
			name    => '_vocs',
			label   => '�����������',
			off     => !$_USER -> {is_mgr},
			no_page => 1,
			items => [
				{
					name  => 'rubrics',
					label => '�������',				
				},
				{
					name  => 'levels',
					label => '������',
				},
			],
		},

	];

}

1;
