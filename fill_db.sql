create table tests (id serial primary key,
				   name varchar(200),
				   hard_level int,
				   description varchar(2000));

create table questions(id serial primary key,
					  test_id int,
					  question_text varchar(500),  
					  FOREIGN KEY (test_id) REFERENCES tests (id));
					  
create table possible_answers (id serial primary key,
							  questions_id int,
							  ansver_text varchar(500),  
							  is_correct  int,  
							  FOREIGN KEY (questions_id) REFERENCES questions (id));					  

create table test_subject(id serial primary key,
						  name varchar(500),
						  surname varchar(500), 
						  lastname varchar(500),
						  note	varchar(500));
						  
create table test_results(id serial primary key,
						  test_id int,
						  test_subject_id int, 
						  correct_count int,  
						  vrong_count int,  
						  test_date date,
						  FOREIGN KEY (test_id) REFERENCES tests (id),
						  FOREIGN KEY (test_subject_id) REFERENCES test_subject (id));
						  
-- Создаем тест						  
insert into tests values(1, 'Basic java test', 2, 'Тест для курса Otus. Java developer. Basic');
-- Вносим вопросы
insert into questions values (1, 1, 'Какой из перечисленных типов не является примитивом?'); -- 
insert into questions values (2, 1, 'Можно ли создать объект абстрактного класса?');
insert into questions values (3, 1, 'Что в себе содержит интерфейс'); 
-- Вносим варианты ответа
insert into possible_answers values(1, 1, 'int', 0);
insert into possible_answers values(2, 1, 'String', 1);
insert into possible_answers values(3, 1, 'boolean', 0);
insert into possible_answers values(4, 2, 'float', 0);
insert into possible_answers values(5, 2, 'real', 0);
--
insert into possible_answers values(1, 2, 'да', 0);
insert into possible_answers values(2, 2, 'нет', 1);
insert into possible_answers values(3, 2, 'да, если очень захочется', 0); 
--
insert into possible_answers values(1, 2, 'реализацию методов', 0);
insert into possible_answers values(2, 2, 'только сигнатуру методов без их реализации.', 1);
insert into possible_answers values(3, 2, 'ничего из перечисленного', 0); 
-- Внесем подопытного					  
insert into test_subject values(1, 'Василий', 'Петрович', 'Иванов', 'я попал сюда случайно');
-- Результаты прохождения		  
insert into test_subject values(1, 1, 1, 0, 3, CURRENT_DATE);
