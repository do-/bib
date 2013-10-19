label => 'Книги',

columns => {

	id_title => '(titles)',       # Наименование
	no       => 'string',         # Номер
	id_user  => 'select(users)',  # Кому выдана
	dt_to    => 'date',           # До какой даты

},

keys => {
	id_title => 'id_title',
	id_user  => 'id_user',
	no       => 'no',
},

