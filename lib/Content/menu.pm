################################################################################

sub select_menu {
	
	return [
		
		{
			name  => 'users',
			label => '����',
		},
		
		($_USER -> {id_user_client} ? {
			href  => "/?type=users&id=$_USER->{id_user_client}",
			label => sql ('users(label)' => $_USER->{id_user_client}),
		} : ()),
		
		{
			name  => 'titles',
			label => '�����',
		},
		{
			name  => 'rubrics',
			label => '�������',
			off   => !$_USER -> {is_mgr},
		},

	];

}

1;
