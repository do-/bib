label => '�����',

columns => {

	label     => 'string',          # ������������
	author    => 'string',          # �����
	id_rubric => 'select(rubrics)', # �������
	cnt       => 'int',             # ���������� �����������
	cnt_free  => 'int',             # ���������� ��������� �����������

},

keys => {
	label => 'label',
},

