label => '�����',

columns => {

	id_title => '(titles)',       # ������������
	no       => 'string',         # �����
	id_user  => 'select(users)',  # ���� ������
	dt_to    => 'date',           # �� ����� ����

},

keys => {
	id_title => 'id_title',
	id_user  => 'id_user',
	no       => 'no',
},

