
CREATE TYPE public.note_type AS ENUM (
    'dev_note',
    'address',
    'vim_note',
    'markdown',
    'quote',
    'password'
);


alter table notes add column note_type public.note_type;

update notes set note_type =
	(case
		when type_id = 1 THEN 'dev_note'::note_type
		when type_id = 2 THEN 'address'::note_type
		when type_id = 3 THEN 'vim_note'::note_type
		when type_id = 4 THEN 'password'::note_type
		when type_id = 5 THEN 'markdown'::note_type
		when type_id = 6 THEN 'quote'::note_type
		else 'unknown'
	end);






alter table notes drop column type_id;