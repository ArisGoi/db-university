-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(`enrolment_date`)
FROM `students`
GROUP BY YEAR(`enrolment_date`)

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(`id`) AS 'n_insegnanti', `office_address`
FROM `teachers`
GROUP BY `office_address`

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exams`.`id`, `courses`.`name`, ROUND(AVG(`exam_student`.`vote`), 1) AS 'media_voti'
FROM `exams`
JOIN `exam_student`
ON `exam_student`.`exam_id` = `exams`.`id`
JOIN `courses`
ON `courses`.`id` = `exams`.`course_id`
GROUP BY `exams`.`id`

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `departments`.`name` AS 'department_name', COUNT(`degrees`.`name`) AS 'degree_count'
FROM `departments`
JOIN `degrees`
ON `degrees`.`department_id` = `departments`.`id`
GROUP BY `departments`.`name`