#Использовать logos

Перем Опции Экспорт; // Массив - элементы ПараметрКоманды - Ссылка на класс опции
Перем ОпцииИндекс Экспорт; // Соответствие - Ссылка на текущий индекс опций
Перем Аргументы Экспорт; // Массив - элементы ПараметрКоманды - Ссылка на класс аргумента
Перем АргументыИндекс Экспорт; // Соответствие - Ссылка на текущий индекс аргумента

Перем Лог;

Процедура ПриСозданииОбъекта(ВходящиеОпции, ВходящиеОпцииИндекс, ВходящиеАргументы, ВходящиеАргументыИндекс)
	Опции = ВходящиеОпции;
	ОпцииИндекс = ВходящиеОпцииИндекс;
	Аргументы = ВходящиеАргументы;
	АргументыИндекс = ВходящиеАргументыИндекс;
КонецПроцедуры

// Выполняет поиск опций в массиве входящих аргументов
//
// Параметры:
//   ВходящиеАргументы - Массив - входящие аргументы приложения
//   КонтекстПоиска - Объект - ссылка на класс КонтекстПарсера
//
//  Возвращаемое значение:
//   Объект.РезультатПоискаПараметра - ссылка на класс РезультатПоискаПараметра
//
Функция Поиск(Знач ВходящиеАргументы, КонтекстПоиска) Экспорт

	АргументыОбрабатываемые = Новый Массив;

	Для каждого Арг Из ВходящиеАргументы Цикл
		АргументыОбрабатываемые.Добавить(Арг);
	КонецЦикла;

	РезультатПопыткиПоиска = ПопыткаПоиска(АргументыОбрабатываемые, КонтекстПоиска);

	Если НЕ РезультатПопыткиПоиска.Найден Тогда
		Возврат Новый РезультатПоискаПараметра(АргументыОбрабатываемые, Ложь, РезультатПопыткиПоиска.Ошибка);
	КонецЕсли;

	АргументыДляЦикла = РезультатПопыткиПоиска.Аргументы;
	
	Пока Истина Цикл

		РезультатПопыткиПоискаВЦикле = ПопыткаПоиска(АргументыДляЦикла, КонтекстПоиска);
		
		Если НЕ РезультатПопыткиПоискаВЦикле.Найден Тогда
			Возврат Новый РезультатПоискаПараметра(РезультатПопыткиПоискаВЦикле.Аргументы, Истина);
		КонецЕсли;
		
		АргументыДляЦикла = РезультатПопыткиПоискаВЦикле.Аргументы;

	КонецЦикла;
	
	Возврат Новый РезультатПоискаПараметра(АргументыОбрабатываемые, Ложь);

КонецФункции

Функция ПопыткаПоиска(Знач АргументыОбрабатываемые, КонтекстПоиска)

	Если АргументыОбрабатываемые.Количество() = 0 
		ИЛИ КонтекстПоиска.СбросОпций Тогда
		Возврат Новый РезультатПоискаПараметра(АргументыОбрабатываемые, Ложь);
	КонецЕсли;

	Для каждого ОпцияПоиска Из Опции Цикл
		
		Если Не КонтекстПоиска.НеВключенныеОпции[ОпцияПоиска.Значение] = Неопределено Тогда
			Лог.Отладка("Исключен поиск опцию %1", ОпцияПоиска.Ключ.Имя);
			Продолжить;
		КонецЕсли;

		Лог.Отладка("Ищу опцию %1", ОпцияПоиска.Ключ.Имя);
		Лог.Отладка("Ищу опцию тип %1", ОпцияПоиска.Значение);
		
		КлассПоиска = Новый ОпцияПарсера(ОпцияПоиска.Значение, ОпцииИндекс);
		РезультатПоиска = КлассПоиска.Поиск(АргументыОбрабатываемые, КонтекстПоиска);
		
		Лог.Отладка("Длина аргументов <%1> ", АргументыОбрабатываемые.Количество());
		Лог.Отладка("Результат поиска опции %1 = <%2>", ОпцияПоиска.Ключ.Имя, РезультатПоиска.Найден);
		Лог.Отладка("Длина аргументов после поиска <%1> ", РезультатПоиска.Аргументы.Количество());
		
		Если РезультатПоиска.Найден Тогда
			
			Если ОпцияПоиска.Значение.УстановленаИзПеременнойОкружения Тогда
				
				КонтекстПоиска.НеВключенныеОпции.Вставить(ОпцияПоиска.Значение, Истина);
	
			КонецЕсли;
			
			Возврат РезультатПоиска;

		КонецЕсли;

		Если ЗначениеЗаполнено(РезультатПоиска.Ошибка)
			И ОшибкиПарсера.ОшибкаТребуетВнимания(РезультатПоиска.Ошибка) Тогда
			Возврат Новый РезультатПоискаПараметра(АргументыОбрабатываемые, Ложь, РезультатПоиска.Ошибка);
		КонецЕсли;

	КонецЦикла;

	Для каждого АргументПоиска Из Аргументы Цикл
		
		Лог.Отладка("Ищу аргумент %1", АргументПоиска.Ключ.Имя);
		Лог.Отладка("Ищу аргумент тип %1", АргументПоиска.Значение);
		
		КлассПоиска = Новый АргументыПарсера(АргументПоиска.Значение);
		РезультатПоиска = КлассПоиска.Поиск(АргументыОбрабатываемые, КонтекстПоиска);
		
		Лог.Отладка("Длина аргументов <%1> ", АргументыОбрабатываемые.Количество());
		Лог.Отладка("Результат поиска аргумента %1 = <%2>", АргументПоиска.Ключ.Имя, РезультатПоиска.Найден);
		Лог.Отладка("Длина аргументов после поиска <%1> ", РезультатПоиска.Аргументы.Количество());
		
		Если РезультатПоиска.Найден Тогда
			Возврат РезультатПоиска;
		КонецЕсли;

		Если ЗначениеЗаполнено(РезультатПоиска.Ошибка)
			И ОшибкиПарсера.ОшибкаТребуетВнимания(РезультатПоиска.Ошибка) Тогда
			Возврат Новый РезультатПоискаПараметра(АргументыОбрабатываемые, Ложь, РезультатПоиска.Ошибка);
		КонецЕсли;

	КонецЦикла;

	Возврат Новый РезультатПоискаПараметра(АргументыОбрабатываемые, Ложь);

КонецФункции

// Возвращает приоритет текущего парсера
//
//  Возвращаемое значение:
//   число - приоритет текущего парсера
//
Функция Приоритет() Экспорт
	Возврат 2;
КонецФункции

// Возвращает имя текущего парсера
//
//  Возвращаемое значение:
//   строка - имя текущего парсера, на основании имени опции
//
Функция ВСтроку() Экспорт
	Представление = "-";
	ДлинаОпции = 2;

	Для каждого Опция Из Опции Цикл

		ИмяОпции = Опция.Ключ.Синонимы[0];
		Если СтрНачинаетсяС(ИмяОпции, "-") Тогда
			ИмяОпции = Сред(ИмяОпции, ДлинаОпции);
		КонецЕсли;
			
		Представление = Представление + ИмяОпции;
			
	КонецЦикла;

	Для каждого Аргумент Из Аргументы Цикл

		ИмяАргумента = Аргумент.Ключ.Синонимы[0];	
		Представление = Представление + ИмяАргумента;
			
	КонецЦикла;

	Возврат Представление;
КонецФункции

Лог = Логирование.ПолучитьЛог("oscript.lib.cli_class_optionsAndArgs");