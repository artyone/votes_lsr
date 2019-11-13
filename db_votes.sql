-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 12 2019 г., 10:52
-- Версия сервера: 5.6.43
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db_votes`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `tome` int(11) NOT NULL,
  `name_tome_ru` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` tinyint(4) NOT NULL DEFAULT '0',
  `name_tome_eng` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_ru` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `opisanie_ru` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_eng` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `opisanie_eng` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `questions`
--

INSERT INTO `questions` (`id`, `tome`, `name_tome_ru`, `number`, `name_tome_eng`, `question_ru`, `opisanie_ru`, `question_eng`, `opisanie_eng`) VALUES
(1, 1, 'Экологический аспект', 1, 'Environmental topics', '1. Управление материальными ресурсами', '    -	контроль качества используемых материальных ресурсов <br>\r\n    -	подход к управлению материалоемкостью производства <br>\r\n    -	материалы, израсходованные при производстве продукции <br>\r\n    -	повторно используемые материальные ресурсы <br>', '1. Material resources management\r\n\r\n', '-	quality control of material resources used<br>\r\n-	management approach to material consumption of production<br>\r\n-	materials used for the manufacturing process<br>\r\n-	recycled input materials used<br>'),
(2, 1, 'Экологический аспект', 2, 'Environmental topics', '2. Климатическая стратегия и энергоэффективность', '            -	подход к управлению энергетическими ресурсами (топливо, электроэнергия, энергия на отопление и др.) <br>\r\n- мероприятия и планы компании в области повышения энергоэффективности <br>\r\n            -	объем потребления энергетических ресурсов и энергоемкость <br>\r\n            -	подход к управлению выбросами парниковых газов <br>\r\n            -	мероприятия и планы компании по снижению выбросов парниковых газов <br>\r\n            -	количество выбросов парниковых газов, их интенсивность <br>', '2. Climate strategy and energy efficiency\r\n', '-	management approach to energy consumption within the organization (total fuel consumption, electricity consumption, heating consumption,  cooling/ steam consumption)<br>\r\n-	energy efficiency initiatives and plans <br>\r\n-	energy consumption and energy intensity <br>\r\n-	management approach to greenhouse gas emissions <br>\r\n-	initiatives and plans to reduce greenhouse gas emissions <br>\r\n-	total amount of greenhouse gas emissions, intensity <br>'),
(3, 1, 'Экологический аспект', 3, 'Environmental topics', '3. Управление водными ресурсами', '-	подход компании к осуществлению забора и сброса воды <br>\r\n-	мероприятия и планы компании по снижению негативных воздействий на водные объекты <br>\r\n-	количество забираемой и сбрасываемой воды по источникам/принимающим объектам<br>\r\n-	описание системы оборотного водоснабжения<br>', '3. Water resources management', '-	approach to water consumption and discharge <br>\r\n-	initiatives and plans to reduce negative impacts on water bodies <br>\r\n-	total water withdrawal and discharge by source/destination<br>\r\n-	description of the water recycling system <br>'),
(4, 1, 'Экологический аспект', 4, 'Environmental topics', '4. Сохранения биоразнообразия', '-	подход к управлению воздействием компании на биоразнообразие регионов присутствия<br>\r\n-	характер существенных воздействий, затрагиваемые виды, длительность воздействия<br>\r\n-	производственные площадки, расположенные или прилегающие к охраняемым природным территориям и территориям с высокой ценностью биоразнообразия<br>', '4. Biodiversity conservation', '-	management approach to the biodiversity of the regions of presence <br>\r\n-	significant impact of activities on biodiversity, species affected, duration of impacts<br>\r\n-	operational sites located or adjacent to protected areas and areas of high biodiversity value  <br>\r\n'),
(5, 1, 'Экологический аспект', 5, 'Environmental topics', '5. Выбросы в атмосферу', '-	подход к управлению выбросами загрязняющих веществ <br>\r\n-	мероприятия и планы компании по очистке и снижению выбросов в атмосферу<br>\r\n-	количество выбросов загрязняющих веществ, их интенсивность <br>', '5. Air emissions\r\n\r\n', '-	management approach for emissions <br>\r\n-	initiatives and plans to clean and reduce air emissions <br>\r\n-	total amount of emissions, intensity <br>'),
(6, 1, 'Экологический аспект', 6, 'Environmental topics', '6. Управление отходами', '-	подход к управлению накоплением, хранением и размещением/утилизацией/обезвреживанием отходов <br>\r\n-	мероприятия и планы компании по снижению объемов образования отходов и их повторному использованию<br>\r\n-	объем образования отходов с разбивкой по классам опасности <br>\r\n-	способы обращения с отходами <br>	\r\n', '6. Waste management\r\n', '-	management approach to generation, storage, disposal/recycling/decontamination <br>\r\n-	initiatives and plans to reduce waste generation and reuse waste <br>\r\n-	total weight of waste by type and disposal method <br>'),
(7, 1, 'Экологический аспект', 7, 'Environmental topics', '7. Соответствие требованиям экологического законодательства', '-	мониторинг и учет изменений требований законодательства<br>\r\n-	подход к осуществлению контроля за соблюдением требований законодательства<br>\r\n-	денежное значение штрафов и число административных и судебных санкций за несоблюдение экологического законодательства<br>', '7. Environmental Compliance \r\n', '-	monitoring and consideration of changes in legislative requirements <br>\r\n-	management approach to  compliance with legislative requirements<br>\r\n-	significant fines and non-monetary sanctions for non-compliance with environmental laws and/or regulations<br>'),
(8, 2, 'Социальный аспект', 8, 'Social topics', '8. Привлечение и удержание персонала', '-	описание политики компании по восполнению кадровых ресурсов и их дальнейшему удержанию<br>\r\n-	общее количество и процент вновь нанятых сотрудников, текучесть кадров <br>\r\n-	льготы, предоставляемые сотрудникам, работающим на условиях полной занятости и на условиях временной/неполной занятости <br>\r\n-	подход в области материального вознаграждения <br>', '8. Employee attraction and retention\r\n', '-	description of the company’s policy for replenishment of human resources and their further retention <br>\r\n-	total number of employees, new employee hires and employee turnover  <br>\r\n-	Benefits which are standard for full-time employees and temporary/part-time employees <br>\r\n-	Approach to remuneration of employees  <br>'),
(9, 2, 'Социальный аспект', 9, 'Social topics', '9. Здоровье и безопасность на рабочем месте', '-	описание системы управления вопросами охраны труда и безопасности  <br>\r\n-	процесс идентификации опасности, оценки рисков и расследования несчастных случаев <br>\r\n-	обучение по вопросам охраны труда и безопасности на рабочем месте <br>\r\n-	забота о здоровье работников, в том числе предоставление доступа к медицинским сервисам и услугам <br>\r\n-	виды и уровень производственного травматизма, а также меры, направленные на повышение уровня безопасности  <br>', '9. Occupational Health and Safety ', '-	occupational health and safety management system <br>\r\n-	hazard identification, risk assessment, and incident investigation <br>\r\n-	worker training on occupational health and safety<br>\r\n-	promotion of worker health, occupational health services <br>\r\n-	work-related injuries, actions taken to improve the level of safety <br>'),
(10, 2, 'Социальный аспект', 10, 'Social topics', '10. Обучение и развитие персонала', '-	описание программ обучения сотрудников по повышению их квалификации (внутренние учебные курсы, финансовая поддержка внешнего обучения, предоставление учебных отпусков) <br>\r\n-	подход к оценке результативности деятельности персонала  <br>\r\n-	среднее количество часов обучения, приходящееся на одного сотрудника <br>', '10. Employee training and education', '-	programs for upgrading employee skills (corporate training programs, financial support for external training, the provision of study leave) <br>\r\n-	approach to assessing the performance of employees<br>\r\n-	average hours of training per year per employee<br>'),
(11, 2, 'Социальный аспект', 11, 'Social topics', '11. Разнообразие и равные возможности', '-	подход компании к обеспечению разнообразия и равных возможностей среди персонала  <br>\r\n-	состав основных категорий персонала в разбивке по полу, возрасту и прочим показателям разнообразия <br>\r\n-	отношение базового оклада мужчин и женщин в разбивке по категориям работников <br>', '11. Diversity and equal opportunity', '-	management approach to diversity and equal opportunity<br> \r\n-	diversity of governance bodies and employees (gender, age group, other indicators of diversity) <br>\r\n-	ratio of basic salary and remuneration of women to men  <br>'),
(12, 2, 'Социальный аспект', 12, 'Social topics', '12. Оценка соблюдения прав человека', '-	информация о предприятиях, в отношении которых проводилась оценка на предмет соблюдения прав человека <br>\r\n-	информация об обучении сотрудников политикам или процедурам в области прав человека <br>\r\n-	инвестиционные соглашения и контракты, включающие положения, относящиеся к вопросам прав человека <br>', '12. Human rights assessment', '-	operations that have been subject to human rights reviews or impact assessments<br>\r\n-	employee training on human rights policies or procedures<br>\r\n-	significant investment agreements and contracts that include human rights clauses or that underwent human rights screening<br>'),
(13, 2, 'Социальный аспект', 13, 'Social topics', '13. Качество продукции и безопасность потребителя', '-	описание подхода компании к управлению воздействием, которое оказывают производимые товары и услуги на здоровье и безопасность клиентов <br>\r\n-	товары и услуги, в отношении которых проводится оценка их воздействия на здоровье и безопасность клиентов  <br>\r\n-	количество случаев несоответствия нормативным требованиям и добровольно взятым обязательствам, касающихся воздействия продукции и услуг на здоровье и безопасность потребителя <br>\r\n-	подход к взаимодействию с клиентами <br>', '13. Product quality and customer safety ', '-	management approach to assessment of the health and safety impacts of product and service categories <br>\r\n-	incidents of non-compliance concerning the health and safety impacts of products and services <br>\r\n-	customer relationship approach <br>'),
(14, 2, 'Социальный аспект', 14, 'Social topics', '14. Развитие регионов присутствия', '-	информация о взаимодействии подразделений компаний с населением регионов присутствия  <br>\r\n-	существенное положительное и отрицательное воздействие компании на экономику, социальную и культурную среду регионов присутствия  <br>\r\n-	описание инвестиций в инфраструктуру, осуществляемые на коммерческой основе, в натуральной форме или безвозмездно  <br>\r\n-	благотворительная деятельность компании  <br>', '14. Developing the regions of presence ', '-	operations with implemented local community engagement <br>\r\n-	operations with significant actual and potential negative impacts on communities and local economies<br>\r\n-	extent of development of significant infrastructure investments and services supported <br>\r\n-	charity activities of the company<br>'),
(15, 3, 'Корпоративное управление', 15, 'Corporate governance', '15. Состав и структура органов корпоративного управления', '-	структура корпоративного управления и подход к ее формированию  <br>\r\n-	состав Совета директоров и Правления (количество членов, независимые директора, разнообразие по полу, возрасту, квалификации)  <br>\r\n-	управление устойчивым развитием в структуре управления компанией  <br>', '15. Composition and structure of corporate governance bodies', '-	approach to corporate governance structure <br>\r\n-	composition of the Board of Directors and the Executive Committee (number of members, independent directors, diversity by gender, age, qualifications)<br>\r\n-	management of sustainability issues in corporate governance system<br>'),
(16, 3, 'Корпоративное управление', 16, 'Corporate governance', '16. Вовлечение органов корпоративного управления в ESG вопросы', '-	роль в разработке измеримых ESG целей, задач и стратегии, оценке результатов деятельности в области устойчивого развития, интеграции ESG вопросов в общую стратегию компании   <br>\r\n-	количество заседаний, на которых рассматривались вопросы в области устойчивого развития <br>\r\n-	управление ESG рисками и возможностями <br>\r\n-	KPI руководства и связь вознаграждения с ESG показателями  <br>\r\n', '16. Involvement of corporate governance bodies in ESG issues', '-	role of governance bodies in the development of measurable ESG goals, objectives and strategies, evaluation of the sustainability results, integration of ESG issues in the company’s  business strategy <br>\r\n-	number of Board meetings addressing sustainability issues<br>\r\n-	management of ESG risks and opportunities<br>\r\n-	management KPIs and connection with remuneration<br>'),
(17, 3, 'Корпоративное управление', 17, 'Corporate governance', '17. Экономическая ценность для заинтересованных сторон', '-	информация о финансовых результатах компании и основных факторах, повлиявших на их достижение  <br>\r\n-	распределение созданной экономической ценности между заинтересованными сторонами  (поставщиками, сотрудниками, государством, обществом) <br>', '17. Economic value for stakeholders ', '-	information about financial results and the main factors affecting them <br>\r\n-	distribution of created economic value among company’s stakeholders (suppliers, employees, government, community)<br>'),
(18, 3, 'Корпоративное управление', 18, 'Corporate governance', '18. Этика и противодействие коррупции', '-	описание подхода к оценке рисков, связанных с коррупцией  <br>\r\n-	информирование и обучение руководящих органов и сотрудников о политике и методах противодействия коррупции  <br>\r\n-	общее количество и описание подтвержденных случаев коррупции и предпринятых действий <br>\r\n-	механизм подачи жалоб и обращений <br>', '18. Ethics and countering corruption', '-	management approach to assessment of risks related to corruption <br>\r\n-	communication and training of employees and governance bodies about anti-corruption policies and procedures <br>\r\n-	confirmed incidents of corruption and actions taken <br>\r\n-	grievance mechanism<br>'),
(19, 3, 'Корпоративное управление', 19, 'Corporate governance', '19. Закупки и оценка поставщиков', '-	подход к осуществлению закупочной деятельности  <br>\r\n-	подход к выбору поставщиков и обеспечению добросовестной конкуренции  <br>\r\n-	описание подхода к проведению экологической оценки поставщиков, а также оценки в области охраны труда и промышленной безопасности, управления персоналом <br>', '19. Procurement practices and supplier evaluation', '-	management approach to procurement <br>\r\n-	approach to suppliers selection and development of fair competition <br>\r\n-	approach to assessment of supplier practices using sustainability criteria (in the areas of environmental protection, occupational health and safety, personnel management)<br>\r\n-	number of suppliers assessed using sustainability criteria<br>\r\n-	measures taken based on the results of supplier sustainability assessment<br>'),
(20, 4, 'Другие темы', 20, 'Other', '20. Зеленое строительство', '-	информация о проектах, направленных на строительство зданий, негативное воздействие которых на окружающую среду и человека минимально, в том числе информация о том, за счет чего достигается эта цель:  <br>\r\n•	эффективного использования энергии, воды и других ресурсов;  <br>\r\n•	сокращения отходов, выбросов и других воздействий на окружающую среду;  <br>\r\n•	повышения качества здания, его долговечности и комфорта.  <br>\r\n-	информация об экосертификации строительных объектов  <br> ', '20. Green building', '-	information on the construction projects aimed to reduce or eliminate negative impacts on people and the environment, including the information about how this goal is achieved: <br>\r\n•	efficient use of energy, water and other resources <br>\r\n•	reduction of waste, emissions and other environmental impacts <br>\r\n•	improving the quality of the building, its durability and comfort <br>\r\n-	environmental certification of construction projects <br>'),
(21, 4, 'Другие темы', 21, 'Other', '21. Современные технологии в строительстве', '-	информация об используемых технологиях и инновациях, в том числе:  <br>\r\n•	влияющих на качество и экологичность строительных материалов;  <br>\r\n•	совершенствующих процессы проектирования и строительства.  <br>\r\n', '21. Technologies in construction', '-	information on technologies and innovations used, including those that: <br>\r\n•	affect the quality and environmental friendliness of building materials <br>\r\n•	develop design and construction processes <br>'),
(22, 5, 'Комментарии', 22, 'Comments', '22. Комментарии и пожелания в отношении отчета об устойчивом развитии Группы ЛСР', '', '22. Comments and suggestions regarding the sustainability report of LSR Group', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `hash`, `language`, `link`) VALUES
(1, 'tihonov@ya.ru', 'Artem\r\n', 'f7bb52e7c228d5a8833374f6b8f4d71d', 'ru', 'http://test01.loc?code=f7bb52e7c228d5a8833374f6b8f4d71d&lang=ru'),
(2, 'ivanov@ya.ru', 'Ivan', '770ef97cc58957bcb7a158c77ac05240', 'eng', 'http://test01.loc?code=770ef97cc58957bcb7a158c77ac05240&lang=eng'),
(3, 'av@mail.ru', '', '62cc254b896527686bd13582f167e173', 'eng', 'http://test01.loc?code=62cc254b896527686bd13582f167e173&lang=eng');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `hash` (`hash`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
