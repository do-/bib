label => 'Книги',

columns => {

	label     => 'string',          # Наименование
	author    => 'string',          # Автор
	id_rubric => 'select(rubrics)', # Рубрика
	cnt       => 'int',             # Количество экземпляров
	cnt_free  => 'int',             # Количество свободных экземпляров

},

keys => {
	label => 'label',
},

