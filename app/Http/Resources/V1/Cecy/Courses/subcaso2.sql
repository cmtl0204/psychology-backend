INSERT INTO public.courses(
	id, responsible_id, academic_period_id, level_id, area_id, certified_type_id, course_type_id, modality_id, participant_type_id, availability_id, speciality_id, state_id, career_id, photo_id, abbreviation, approved_at, category, code, cost, duration, expired_at, facilities, free, name, needs, needed_at, nro_record, local_proposal, objective, observation, practical_phase, practice_hours, proposed_at, project, setec_name, summary, target_group, theoretical_phase, theory_hours, evaluation_mechanisms, bibliographies, learning_enviroments, teaching_strategies, techniques_requisites, alignment)
	VALUES (5, 2, 20, 30, 1, 43, 29, 47, 40, 49, 1, 38, 100, 101, 'DOCKER AVANZADO', '2022-01-17', 'Tecnologia', 'COD006', 0, 120, '2021-03-01', 
		'Instalacion', true, 'JAVASCRIPT', 'necesidades', 
		'2021-02-15', 'PRO0012',  'local_proposaL', 
		'Desarrollar habilidades con javascript', 'Nuevo curso', 'fase practica', 120, 
		'2021-01-18', 'Proyecto', 'curso javascript', 'El curso es de javascript y para los estudiantes de yavirac', 'target_group', 
			'fase teorica', 30, '{ 
				"mechanisms":{ 
					"diagnostica": [], 
					"formativa": [],
					"final": []
				}
			}','{ 
				"bibliographies": []
			}','{ 
				"learning_enviroment": []
			}', '{ 
				"teaching_strategies":[]
			}', '{ 
				"requisitos":{ 
					"tecnicos": [], 
					"generales": []
				}
			}', 'Alineacion del curso');


	UPDATE courses set
	area_id=23,
	speciality_id=30,
	objective='ATUALIZACIÓN DEL OBJETIVO DEL CURSO',
	alignment='Alineacón del curso',
	techniques_requisites='{ 
				"requisitos":{ 
					"tecnicos": [], 
					"generales": []
				}
			}',
	teaching_strategies='{ 
				"teaching_strategies":[]
			}',
			evaluation_mechanisms='{ 
				"mechanisms":{ 
					"diagnostica": [], 
					"formativa": [],
					"final": []
				}
			}',
			learning_environments='{ 
				"learning_enviroment": []
			}',
			bibliographies='{ 
				"bibliographies": []
			}'
		where courses.id=1;
	


// INSERTAR PREREQUISITOS 

INSERT INTO public.prerequisites(
	id, course_id, prerequisite_id)
	VALUES (3, 4, 2);

// ACTUALIZA PREREQUISITOS 

UPDATE prerequisites SET prerequisite_id=2 WHERE prerequisites.course_id=3

// INSERTAR TEMAS Y SUUBTEMAS

	INSERT INTO public.topic(
	id, course_id, parent_id, description, level_id)
	VALUES (7, 4,  null, 'Componentes y eventos', 7);

// ACTUALIZAR TEMAS Y SUUBTEMAS

UPDATE topics SET parent_id=2, description='nuevo tema', level_id=6 WHERE topics.course_id=3


SELECT 
id, area_id, speciality_id, name, alignment, objective,
techniques_requisites,
teaching_strategies,
evaluation_mechanisms,
learning_environments,
bibliographies,
practice_hours,
theory_hours
FROM public."courses";


// CONSULTA PREREQUISITOS
select pre.id, c.name, pre.course_id, pre.prerequisite_id from public."courses" as c
join public."prerequisites" as pre on c.id=pre.course_id
where c.id=4 or c.id=1

select c.id, c.name from public."courses" as c
where c.id=2 or c.id=3

// CONSULTA TOPICS

SELECT id, course_id, parent_id, description, level_id
	FROM public.topics; where topics.course_id=1

select t.id, c.name, t.course_id, t.parent_id, t.description, t.level_id from public."courses" as c
join public."topics" as t on c.id=t.course_id
where c.id=1
