#Использовать logos

Перем Опция Экспорт; // ПараметрКоманды - Ссылка на класс опции
Перем ОпцииИндекс Экспорт; // Соответствие - Ссылка на текущий индекс опций
Перем Обязательный Экспорт; // Булево

Перем Лог;

Процедура ПриСозданииОбъекта(КлассОпции, Индекс, ОбязательнаяОпция = Истина)
	
	Лог.Отладка("Создан парсер для опции %1", КлассОпции.Имя);
	Опция = КлассОпции;
	ОпцииИндекс = Индекс;
	Обязательный = ОбязательнаяОпция;

КонецПроцедуры

// Выполняет поиск опции в массиве входящих аргументов
//
// Параметры:
//   ВходящиеАргументы - Массив - входящие аргументы приложения
//   КонтекстПоиска - Объект - ссылка на класс КонтекстПарсера
//
//  Возвращаемое значение:
//   Объект.РезультатПоискаПараметра - ссылка на класс РезультатПоискаПараметра
//
Функция Поиск(Знач ВходящиеАргументы, КонтекстПоиска) Экспорт

	Аргументы = Новый Массив;

	Для каждого Арг Из ВходящиеАргументы Цикл
		Аргументы.Добавить(Арг);
	КонецЦикла;

	Результат = Новый РезультатПоискаПараметра(Аргументы);
	Лог.Отладка("Начало поиска опции");
	Лог.Отладка("Количество входящих аргументов %1", Аргументы.Количество());

	Если Аргументы.Количество() = 0 
		ИЛИ КонтекстПоиска.СбросОпций Тогда
		Лог.Отладка("Не найдено аргументов <%1> или СбросОпций <%2>", Аргументы.Количество(), КонтекстПоиска.СбросОпций );

		Результат.Найден = Опция.УстановленаИзПеременнойОкружения;

		Если Обязательный И НЕ (Результат.Найден ИЛИ КонтекстПоиска.СбросОпций) Тогда
			Результат.Ошибка = ОшибкаОжидаетсяОпция(Опция.Имя);
		КонецЕсли;

		Возврат Результат;
	КонецЕсли;

	Индекс = 0;
			
	Пока Индекс <= Аргументы.Вграница() Цикл
		
		ТекущийАргумент = Аргументы[Индекс];

		Если ТекущийАргумент = "-" Тогда
			Индекс = Индекс + 1;
			Продолжить;
		ИначеЕсли ТекущийАргумент = "--" Тогда
			Результат.Найден = Опция.УстановленаИзПеременнойОкружения;
			Возврат Результат;
		ИначеЕсли СтрНачинаетсяС(ТекущийАргумент, "--") Тогда

			РезультатПоиска = НайтиДлиннуюОпцию(Аргументы, Индекс, КонтекстПоиска);
			Лог.Отладка("Длинная опция найдена: %1", РезультатПоиска.Найден);
			Если РезультатПоиска.Найден Тогда
				Возврат РезультатПоиска;
			КонецЕсли;

			Результат.Ошибка = РезультатПоиска.Ошибка;
				
			Если РезультатПоиска.ДополнительныеСвойства.ПрибавочныйИндекс = 0 Тогда
				Результат.Найден = Опция.УстановленаИзПеременнойОкружения;
				Результат.Аргументы = Аргументы;
				Возврат Результат;
			КонецЕсли;

			Индекс = Индекс + РезультатПоиска.ДополнительныеСвойства.ПрибавочныйИндекс;
		
		ИначеЕсли СтрНачинаетсяС(ТекущийАргумент, "-") Тогда

			РезультатПоиска = НайтиКороткуюОпцию(Аргументы, Индекс, КонтекстПоиска);
			Лог.Отладка("Короткая опция найдена: %1", РезультатПоиска.Найден);
			Если РезультатПоиска.Найден Тогда
				Возврат РезультатПоиска;
			КонецЕсли;
			
			Результат.Ошибка = РезультатПоиска.Ошибка;
				
			Если РезультатПоиска.ДополнительныеСвойства.ПрибавочныйИндекс = 0 Тогда
				Результат.Найден = Опция.УстановленаИзПеременнойОкружения;
				Результат.Аргументы = Аргументы;
				Возврат Результат;
			КонецЕсли;

			Индекс = Индекс + РезультатПоиска.ДополнительныеСвойства.ПрибавочныйИндекс;
	
		Иначе
			Результат.Найден = Опция.УстановленаИзПеременнойОкружения;
			Возврат Результат;
		КонецЕсли;

	КонецЦикла;

	Результат.Найден = Опция.УстановленаИзПеременнойОкружения;
	Возврат Результат;

КонецФункции

Функция НайтиКороткуюОпцию(Знач Аргументы, Индекс, КонтекстПоиска)
	Лог.Отладка("Класс опции %1", ТипЗнч(Опция));
	Лог.Отладка("Ищу короткую опцию %1", Опция.Имя);

	ТекущийАргумент = Аргументы[Индекс];

	Если СтрДлина(ТекущийАргумент) < 2 Тогда	
		Возврат РезультатПоискаОтрицательный(Аргументы);
	КонецЕсли;
	
	Если Сред(ТекущийАргумент, 3, 1) = "=" Тогда
		
		Результат = РезультатПоискаОтрицательный(Аргументы);
	
		Имя = Лев(ТекущийАргумент, 2);

		КлассОпции = ОпцииИндекс[Имя];
		Если КлассОпции = Неопределено Тогда
			Лог.Отладка("Неопределенная опция: %1", Строка(Имя));
			Результат.Ошибка = ОшибкаНеожидаемаяОпция(Имя);
			Возврат Результат;
		КонецЕсли;

		Если Не КлассОпции.Имя = Опция.Имя Тогда
			Результат.Ошибка = ОшибкаОжидаетсяВместо(Опция.Имя, Имя);
			Результат.ДополнительныеСвойства.ПрибавочныйИндекс = 1;
			Возврат Результат;
		КонецЕсли; 
		
		Значение = Сред(ТекущийАргумент, 4);

		Если ПустаяСтрока(СокрЛП(Значение)) Тогда
			Результат.Ошибка = СтрШаблон("Опция %1 должна содержать значение после знака =", Имя);
			Возврат Результат;
		КонецЕсли;

		ОпцииКонтекст = КонтекстПоиска.Опции[Опция];
		Если ОпцииКонтекст = Неопределено Тогда
			ОпцииКонтекст = Новый Массив;
		КонецЕсли;
		ОпцииКонтекст.Добавить(Значение);
		КонтекстПоиска.Опции.Вставить(Опция, ОпцииКонтекст);
		
		Аргументы.Удалить(Индекс);
		Результат.ДополнительныеСвойства.ПрибавочныйИндекс = 1;
		Результат.Аргументы = Аргументы;
		Результат.Найден = Истина;

		Возврат Результат;

	КонецЕсли;

	ЧтениеСтроки = Новый ЧтениеСтроки(ТекущийАргумент);
	ИщемОпцию = ЧтениеСтроки.ВЧтениеСтрокиС(1); 

	ИИ = 0;

	Лог.Отладка("Строка опции: %1", ИщемОпцию.ВСтроку(ИИ));

	Ошибка = Неопределено;
	Пока Не ПустаяСтрока(ИщемОпцию.ВСтрокуС(ИИ)) Цикл

		ИмяОпции = ИщемОпцию.ВСтроку(ИИ, ИИ);
		Лог.Отладка("ИмяОпции: %1", ИмяОпции);
		КлассОпции = ОпцииИндекс["-" + ИмяОпции];
		
		Лог.Отладка("КлассОпции: %1", Строка(КлассОпции));
		
		Если КлассОпции = Неопределено Тогда
			Лог.Отладка("Неопределенная опция: %1", Строка(ИмяОпции));
			Ошибка = ?(Ошибка = Неопределено, ОшибкаНеожидаемаяОпция(ИмяОпции), Ошибка);
			Возврат РезультатПоискаОтрицательный(Аргументы, Ошибка);
		КонецЕсли;

		Лог.Отладка("КлассОпции.ТипОпции: %1 ", КлассОпции.ТипОпции);
		
		Если КлассОпции.ТипОпции = Тип("Булево") 
			Или КлассОпции.ТипОпции = Тип("Массив") И КлассОпции.ТипЭлементаОпции = Тип("Булево") Тогда
			
			Если Не КлассОпции.Имя = Опция.Имя Тогда
				ИИ = ИИ + 1;
				Лог.Отладка("Не нашли опцию %1, %2 <> %3", ИмяОпции, КлассОпции.Имя, Опция.Имя);
				Ошибка = ОшибкаОжидаетсяВместо(Опция.Имя, ИмяОпции);
				Продолжить;
			КонецЕсли; 

			ОпцииКонтекст = КонтекстПоиска.Опции[Опция];
			Если ОпцииКонтекст = Неопределено Тогда
				ОпцииКонтекст = Новый Массив;
			КонецЕсли;
			ОпцииКонтекст.Добавить(Истина);
			Лог.Отладка("Добавили.значение <%2> опции <%1> в контекст", Опция.Имя , Истина);
			КонтекстПоиска.Опции.Вставить(Опция, ОпцииКонтекст);
			
			Лог.Отладка("Вычисление остаточного ими от <%1> до индекса <%2> после индекса <%3> ",
						ИщемОпцию.ВСтроку(),
						ИщемОпцию.ВСтрокуПо(ИИ - 1),
						ИщемОпцию.ВСтрокуС(ИИ + 1));
			ОстаточноеИмя = ИщемОпцию.ВСтрокуПо(ИИ - 1) + ИщемОпцию.ВСтрокуС(ИИ + 1);
			Лог.Отладка("Остаточное имя <%1> опции ", ОстаточноеИмя );
			Если ПустаяСтрока(ОстаточноеИмя) Тогда
				Аргументы.Удалить(Индекс);
				Возврат РезультатПоискаПоложительный(Аргументы, 1);
			КонецЕсли;

			Аргументы[Индекс] = "-" + ОстаточноеИмя;
			Возврат РезультатПоискаПоложительный(Аргументы);
		
		КонецЕсли;

		Значение = ИщемОпцию.ВСтрокуС(ИИ + 1);
			
		Если ПустаяСтрока(Значение) Тогда
			
			Если Аргументы.Вграница() - Индекс = 0 Тогда
				Если Не КлассОпции.Имя = Опция.Имя Тогда
					Ошибка = ОшибкаОжидаетсяВместо(Опция.Имя, ИмяОпции);
				Иначе
					Ошибка = ОшибкаТребуетсяЗначение(ИмяОпции);
				КонецЕсли;
				Возврат РезультатПоискаОтрицательный(Аргументы, Ошибка);
			КонецЕсли;

			Если Не КлассОпции.Имя = Опция.Имя Тогда
				Ошибка = ОшибкаОжидаетсяВместо(Опция.Имя, ИмяОпции);
				Возврат РезультатПоискаОтрицательный(Аргументы, Ошибка, 2);
			КонецЕсли;

			Значение = Аргументы[Индекс + 1];
			Лог.Отладка("Значение найденной опции равно <%1>", Значение);
		
			Если СтрНачинаетсяС(Значение, "-") Тогда
				Возврат РезультатПоискаОтрицательный(Аргументы, ОшибкаТребуетсяЗначение(ИмяОпции));
			КонецЕсли;
			
			ОпцииКонтекст = КонтекстПоиска.Опции[Опция];
			Если ОпцииКонтекст = Неопределено Тогда
				ОпцииКонтекст = Новый Массив;
			КонецЕсли;
			ОпцииКонтекст.Добавить(Значение);
			КонтекстПоиска.Опции.Вставить(Опция, ОпцииКонтекст);
			
			Лог.Отладка("Имя опции <%1> равно <%2> ", ИмяОпции, ИщемОпцию.ВСтроку());
		
			Если СтрДлина(ИмяОпции) = СтрДлина(ИщемОпцию.ВСтроку()) Тогда
				Аргументы.Удалить(Индекс);
				Аргументы.Удалить(Индекс); 
				
				Возврат РезультатПоискаПоложительный(Аргументы, 2);
			
			КонецЕсли;
			
			НовыйАргумент = СтрЗаменить(ИщемОпцию.ВСтроку(), ИмяОпции, "");
			Аргументы[Индекс] = "-" + НовыйАргумент;
			Аргументы.Удалить(Индекс + 1); // удаление значения
					
			Возврат РезультатПоискаПоложительный(Аргументы, 1);

		КонецЕсли;

		Если Не КлассОпции.Имя = Опция.Имя Тогда
			Ошибка = ОшибкаОжидаетсяВместо(Опция.Имя, ИмяОпции);
			Возврат РезультатПоискаОтрицательный(Аргументы, Ошибка, 1);
		КонецЕсли; 

		ОпцииКонтекст = КонтекстПоиска.Опции[Опция];
		Если ОпцииКонтекст = Неопределено Тогда
			ОпцииКонтекст = Новый Массив;
		КонецЕсли;
		Лог.Отладка("Значение найденной опции равно <%1>", Значение);
		
		ОпцииКонтекст.Добавить(Значение);
		КонтекстПоиска.Опции.Вставить(Опция, ОпцииКонтекст);
		
		ОстатокИмени = ИщемОпцию.ВСтрокуПо(ИИ - 1);
		Лог.Отладка("Остаток имени <%1>", ОстатокИмени);
		
		Если ПустаяСтрока(ОстатокИмени) Тогда
			Аргументы.Удалить(Индекс); // удаление значения, т.к. индекс уже сдвинулся.
			
			Возврат РезультатПоискаПоложительный(Аргументы, 1);
		
		КонецЕсли;
		
		Аргументы[Индекс] = "-" + ОстатокИмени;
		
		Возврат РезультатПоискаПоложительный(Аргументы, 0);
	
	КонецЦикла;

	Ошибка = ?(Обязательный, ОшибкаНеожидаемаяОпция(ТекущийАргумент), Неопределено);

	Возврат РезультатПоискаОтрицательный(Аргументы, Ошибка, 1);

КонецФункции

Функция НайтиДлиннуюОпцию(Знач Аргументы, Индекс, КонтекстПоиска)
	Лог.Отладка("Класс опции %1", ТипЗнч(Опция));
	Лог.Отладка("Ищу длинную опцию %1", Опция.Имя);

	ТекущийАргумент = Аргументы[Индекс];
	
	МассивСтрокаАргумента = СтрРазделить(ТекущийАргумент, "=");
	
	ИмяОпции = МассивСтрокаАргумента[0];
	Лог.Отладка("Определели имя длинной опции %1", ИмяОпции);

	КлассОпции = ОпцииИндекс[ИмяОпции];
	Лог.Отладка("Класс опции по имени %1", КлассОпции);
	
	Если КлассОпции = Неопределено Тогда		
		Ошибка = ОшибкаНеожидаемаяОпция(ИмяОпции);
		Возврат РезультатПоискаОтрицательный(Аргументы, Ошибка);
	КонецЕсли; 

	Если МассивСтрокаАргумента.Количество() = 2 Тогда
		
		Лог.Отладка("Строка содержит <=> второй элемент массива %1", МассивСтрокаАргумента[1]);

		Если Не КлассОпции.Имя = Опция.Имя Тогда
			Ошибка = ОшибкаОжидаетсяВместо(Опция.Имя, ИмяОпции);
			Возврат РезультатПоискаОтрицательный(Аргументы, Ошибка, 1);
		КонецЕсли; 

		Значение = МассивСтрокаАргумента[1];

		Если ПустаяСтрока(Значение) Тогда
			Ошибка = ОшибкаТребуетсяЗначение(ИмяОпции);
			Возврат РезультатПоискаОтрицательный(Аргументы, Ошибка);
		КонецЕсли;
		
		ОпцииКонтекст = КонтекстПоиска.Опции[Опция];
		Если ОпцииКонтекст = Неопределено Тогда
			ОпцииКонтекст = Новый Массив;
		КонецЕсли;
		ОпцииКонтекст.Добавить(Значение);
		Лог.Отладка("Значение длинной опции <%1>", Значение);
		КонтекстПоиска.Опции.Вставить(Опция, ОпцииКонтекст);
		
		Аргументы.Удалить(Индекс);
	
		Возврат РезультатПоискаПоложительный(Аргументы, 1);

	ИначеЕсли КлассОпции.ТипОпции = Тип("Булево")
		Или КлассОпции.ТипОпции = Тип("Массив") И КлассОпции.ТипЭлементаОпции = Тип("Булево") Тогда
		
		Если Не КлассОпции.Имя = Опция.Имя Тогда
			Ошибка = ОшибкаОжидаетсяВместо(Опция.Имя, ИмяОпции);
			Возврат РезультатПоискаОтрицательный(Аргументы, Ошибка, 1);
		КонецЕсли; 
		
		ОпцииКонтекст = КонтекстПоиска.Опции[Опция];
		Если ОпцииКонтекст = Неопределено Тогда
			ОпцииКонтекст = Новый Массив;
		КонецЕсли;
		ОпцииКонтекст.Добавить(Истина);
		КонтекстПоиска.Опции.Вставить(Опция, ОпцииКонтекст);
		
		Аргументы.Удалить(Индекс);
	
		Возврат РезультатПоискаПоложительный(Аргументы, 1);
	
	Иначе

		Лог.Отладка("Разница между <%1> и %2 меньше 2", Аргументы.Вграница(), Индекс);

		Если Аргументы.Количество() - Индекс < 2 Тогда				
			Если Не КлассОпции.Имя = Опция.Имя Тогда
				Ошибка = ОшибкаОжидаетсяВместо(Опция.Имя, ИмяОпции);
			Иначе
				Ошибка = ОшибкаТребуетсяЗначение(ИмяОпции);
			КонецЕсли;
			Возврат РезультатПоискаОтрицательный(Аргументы, Ошибка);
		КонецЕсли;

		Если Не КлассОпции.Имя = Опция.Имя Тогда
			Ошибка = ОшибкаОжидаетсяВместо(Опция.Имя, ИмяОпции);
			Возврат РезультатПоискаОтрицательный(Аргументы, Ошибка, 2);
		КонецЕсли; 

		Значение = Аргументы[Индекс + 1];
		
		Если СтрНачинаетсяС(Значение, "-") Тогда
			Возврат РезультатПоискаОтрицательный(Аргументы, ОшибкаТребуетсяЗначение(ИмяОпции));
		КонецЕсли;

		Лог.Отладка("Значение длинной опции <%1>", Значение);
		
		Если ПустаяСтрока(Значение) Тогда
			Возврат РезультатПоискаОтрицательный(Аргументы, ОшибкаТребуетсяЗначение(ИмяОпции));
		КонецЕсли;
		
		ОпцииКонтекст = КонтекстПоиска.Опции[Опция];
		Если ОпцииКонтекст = Неопределено Тогда
			ОпцииКонтекст = Новый Массив;
		КонецЕсли;
		ОпцииКонтекст.Добавить(Значение);
		КонтекстПоиска.Опции.Вставить(Опция, ОпцииКонтекст);
		
		Аргументы.Удалить(Индекс);
		Аргументы.Удалить(Индекс); // удаление значения, т.к. индекс уже сдвинулся.
			
		Возврат РезультатПоискаПоложительный(Аргументы, 1);

	КонецЕсли;
КонецФункции

// Возвращает приоритет текущего парсера
//
//  Возвращаемое значение:
//   число - приоритет текущего парсера
//
Функция Приоритет() Экспорт
	Возврат 1;
КонецФункции

// Возвращает имя текущего парсера
//
//  Возвращаемое значение:
//   строка - имя текущего парсера всегда начинается с "-" и добавляется имя опции
//
Функция ВСтроку() Экспорт
	Возврат "-" + Опция.Имя;
КонецФункции

Функция РезультатПоискаОтрицательный(Аргументы, Ошибка = Неопределено, ПрибавочныйИндекс = 0)
	РезультатПоиска = Новый РезультатПоискаПараметра(Аргументы, Ложь, Ошибка);
	РезультатПоиска.ДополнительныеСвойства.Вставить("ПрибавочныйИндекс", ПрибавочныйИндекс);
	Возврат РезультатПоиска;
КонецФункции

Функция РезультатПоискаПоложительный(Аргументы, ПрибавочныйИндекс = 0)
	РезультатПоиска = Новый РезультатПоискаПараметра(Аргументы, Истина);
	РезультатПоиска.ДополнительныеСвойства.Вставить("ПрибавочныйИндекс", ПрибавочныйИндекс);
	Возврат РезультатПоиска;
КонецФункции

Функция ОшибкаТребуетсяЗначение(Имя)
	Возврат СтрШаблон("Опция %1 должна содержать значение", ВосстановитьТиреПередОпцией(Имя));	
КонецФункции

Функция ОшибкаНеожидаемаяОпция(Имя)
	Возврат СтрШаблон("Неожидаемая опция %1", ВосстановитьТиреПередОпцией(Имя));	
КонецФункции

Функция ОшибкаОжидаетсяОпция(Имя)
	Возврат СтрШаблон("Ожидается опция %1", ВосстановитьТиреПередОпцией(Имя));
КонецФункции

Функция ОшибкаОжидаетсяВместо(Имя, ИмяВместо)
	Если Не Обязательный Тогда
		Возврат Неопределено;
	КонецЕсли;

	Возврат СтрШаблон("Ожидается опция %1 вместо %2", 
		ВосстановитьТиреПередОпцией(Имя), 
		ВосстановитьТиреПередОпцией(ИмяВместо));
КонецФункции

Функция ВосстановитьТиреПередОпцией(Имя)
	
	Если СтрНачинаетсяС(Имя, "-") Тогда
		Возврат Имя;
	КонецЕсли;

	Если СтрДлина(Имя) > 1 Тогда
		Возврат "--" + Имя;
	Иначе
		Возврат "-" + Имя;
	КонецЕсли;
	
КонецФункции

Лог = Логирование.ПолучитьЛог("oscript.lib.cli_class_opt");