#использовать "../src/core"
#Использовать asserts
#Использовать logos
#Использовать delegate

Перем юТест;
Перем Лог;

Функция ПолучитьСписокТестов(Знач Тестирование) Экспорт

	юТест = Тестирование;
	
	ИменаТестов = Новый Массив;
	
	// Скорость выполнения команды
	ИменаТестов.Добавить("ТестДолжен_ПроверитьСкоростьРаботуКомандыПриложения");
		
	// Работа с опциями и аргументами
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьПолучениеЗначенияАргументаПоИмени");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьПолучениеЗначенияОпцииПоИмени");

	ИменаТестов.Добавить("ТестДолжен_ПроверитьУстановкуЗначенийОпций");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьУстановкуМножественныхЗначенийОпций");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьУстановкуЗначенийАргументов");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьУстановкуМножественныхАргументовОпций");
	ИменаТестов.Добавить("ТестДолжен_ПроверитьУстановкуПустыхЗначенийОпций");
	
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьГруппировкуОпций");
	
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьНеобязательностьОпций");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьНеобязательностьАргументов");

	// ИменаТестов.Добавить("ТестДолжен_ПроверитьВзаимоисключающиеОпции");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьПовторяемыеВзаимоисключающиеОпции");
	
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьРаботуСОднимТиреВАргументах");
	ИменаТестов.Добавить("ТестДолжен_ПроверитьСбросОпцийПередАргументами");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьСбросМножественныхОпций");
	
	ИменаТестов.Добавить("ТестДолжен_СтандартнуюСтрокуИспользования");
	ИменаТестов.Добавить("ТестДолжен_СтандартнуюСтрокуИспользования_МассивАргументов");
	ИменаТестов.Добавить("ТестДолжен_СтандартнуюСтрокуИспользования_МассивАргументовНесколькоАргументов");
	ИменаТестов.Добавить("ТестДолжен_СтандартнуюСтрокуИспользования_ОбязательнаяОпция");
	// ИменаТестов.Добавить("ТестДолжен_СложныеСлучаиФормированияСтрокиИспользования");

	ИменаТестов.Добавить("ТестДолжен_ПроверитьВыводСправки");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьВыводВерсии");

	// ИменаТестов.Добавить("ТестДолжен_ПроверитьВыполнениеОбработчикаПередВыполнениемКоманды");
	// ИменаТестов.Добавить("ТестДолжен_ПроверитьВыполнениеОбработчикаПослеВыполненияКоманды");

	ИменаТестов.Добавить("ТестДолжен_ПроверитьЧтениеОпцийИАргументовРодителяКомандыБезВызоваПроцедуры");
	ИменаТестов.Добавить("ТестДолжен_ПроверитьЧтениеОпцийИАргументовРодителяКоманды");
	ИменаТестов.Добавить("ТестДолжен_ПроверитьЧтениеОпцийИАргументовРодителяКомандыПервогоУровня");
	
	ИменаТестов.Добавить("ТестДолжен_ПроверитьТекстОшибок");

	Возврат ИменаТестов;

КонецФункции

Процедура ВыполнитьКоманду(Знач ВыполняемаяКоманда) Экспорт
	Лог.Отладка("Полезная работа команды: %1", ВыполняемаяКоманда.ПолучитьИмяКоманды());	
КонецПроцедуры 

Процедура ТестДолжен_ПроверитьСкоростьРаботуКомандыПриложения() Экспорт
	
	Спек = "[--login] [--realm] [--note] [--no-copy] [--gen [--length] [--min-length] [--max-length] [--no-upper] [--no-lower] [--no-digit] [--no-symbol] [--no-similar] [--min-upper] [--max-upper] [--min-lower] [--max-lower] [--min-digit] [--max-digit] [--min-symbol] [--max-symbol] [--exclude]]";
	ИмяПроцедурыОбъекта = "КомандаСкоростьРаботуКомандыПриложения";

	ТестовыеСлучаи = Новый Массив;

	
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("", Спек, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--gen", Спек, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--gen --length 42", Спек, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--length 42 --gen", Спек, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--min-length 10 --length 42 --gen", Спек, Истина));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--min-length 10 --no-symbol --no-lower --length 42 --gen", Спек, Истина));
	
	Для каждого Тест Из ТестовыеСлучаи Цикл
		
		РезультатВыполнения = ВыполненаКомандаПриложения(Тест.Спек, ИмяПроцедурыОбъекта, Тест.Аргументы);

		Утверждения.ПроверитьРавенство(РезультатВыполнения, Тест.Результат, "Команда должна выполниться успешно! Входящие аргументы" + СтрСоединить(Тест.Аргументы));

	КонецЦикла;



КонецПроцедуры


Процедура ТестДолжен_ПроверитьЧтениеОпцийИАргументовРодителяКомандыБезВызоваПроцедуры () Экспорт

	Команда = ПодготовитьТестовуюКоманду();

	ОпцияМассив = Команда.Опция("e env", Новый Массив, "Тестовый массив опций").ТМассивСтрок();
	АргументСтрока = Команда.Аргумент("ARG", "", "Тестовый простой необязательный аргумент").Обязательный(Ложь);

	ВложеннаяКоманда = Команда.ДобавитьПодкоманду("sub s", "", ЭтотОбъект);
	ОпцияМассив = ВложеннаяКоманда.Опция("e env", Новый Массив, "Тестовый массив опций").ТМассивСтрок();

	Аргументы = Новый Массив;
	
	Аргументы.Добавить("-e=Знач1");
	Аргументы.Добавить("-e=Знач2");
	Аргументы.Добавить("-e=Знач3");
	Аргументы.Добавить("ЗначениеАргумента");

	Аргументы.Добавить("sub");

	РезультатВыполнения = ВыполнитьКомандуПриложения(Команда, Аргументы);

	Утверждения.ПроверитьИстину(РезультатВыполнения, "Команда должна выполниться");

	Утверждения.ПроверитьРавенство(ВложеннаяКоманда.ЗначениеОпцииКомандыРодителя("e").Количество(), 3 , "Результат <ОпцияМассив> должны совпадать");
	Утверждения.ПроверитьРавенство(ВложеннаяКоманда.ЗначениеОпции("e").Количество(), 0 , "Результат <ОпцияМассив> должны совпадать");
	Утверждения.ПроверитьРавенство(ВложеннаяКоманда.ЗначениеАргумента("ARG"), "ЗначениеАргумента" , "Результат <АргументСтрока> должны совпадать");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтениеОпцийИАргументовРодителяКоманды() Экспорт
	
	Команда = ПодготовитьТестовуюКоманду();

	ОпцияМассив =Команда.Опция("e env", Новый Массив, "Тестовый массив опций").ТМассивСтрок();
	АргументСтрока = Команда.Аргумент("ARG", "", "Тестовый простой необязательный аргумент").Обязательный(Ложь);

	ВложеннаяКоманда = Команда.ДобавитьПодкоманду("sub s", "", ЭтотОбъект);
	
	Аргументы = Новый Массив;
	
	Аргументы.Добавить("-e=Знач1");
	Аргументы.Добавить("-e=Знач2");
	Аргументы.Добавить("-e=Знач3");
	Аргументы.Добавить("ЗначениеАргумента");

	Аргументы.Добавить("sub");

	РезультатВыполнения = ВыполнитьКомандуПриложения(Команда, Аргументы);

	Утверждения.ПроверитьИстину(РезультатВыполнения, "Команда должна выполниться");

	Утверждения.ПроверитьРавенство(ВложеннаяКоманда.ЗначениеОпцииКомандыРодителя("e").Количество(), 3 , "Результат <ОпцияМассив> должны совпадать");
	Утверждения.ПроверитьРавенство(ВложеннаяКоманда.ЗначениеАргументаКомандыРодителя("ARG"), "ЗначениеАргумента" , "Результат <АргументСтрока> должны совпадать");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтениеОпцийИАргументовРодителяКомандыПервогоУровня() Экспорт

	Команда = ПодготовитьТестовуюКоманду();

	ОпцияМассив =Команда.Опция("e env", Новый Массив, "Тестовый массив опций").ТМассивСтрок();
	АргументСтрока = Команда.Аргумент("ARG", "", "Тестовый простой необязательный аргумент").Обязательный(Ложь);

	ВложеннаяКоманда = Команда.ДобавитьПодкоманду("sub s", "", ЭтотОбъект);
	ВложеннаяКоманда2 = ВложеннаяКоманда.ДобавитьПодкоманду("subsub ss", "", ЭтотОбъект);
	
	Аргументы = Новый Массив;
	
	Аргументы.Добавить("-e=Знач1");
	Аргументы.Добавить("-e=Знач2");
	Аргументы.Добавить("-e=Знач3");
	Аргументы.Добавить("ЗначениеАргумента");

	Аргументы.Добавить("sub");

	Аргументы.Добавить("subsub");

	РезультатВыполнения = ВыполнитьКомандуПриложения(Команда, Аргументы);

	Утверждения.ПроверитьИстину(РезультатВыполнения, "Команда должна выполниться");

	Утверждения.ПроверитьРавенство(ВложеннаяКоманда2.ЗначениеОпцииКомандыРодителя("e").Количество(), 3 , "Результат <ОпцияМассив> должны совпадать");
	Утверждения.ПроверитьРавенство(ВложеннаяКоманда2.ЗначениеАргументаКомандыРодителя("ARG"), "ЗначениеАргумента" , "Результат <АргументСтрока> должны совпадать");


КонецПроцедуры

Процедура ТестДолжен_ПроверитьУстановкуЗначенийОпций() Экспорт

	Спек = "";
	ИмяПроцедурыОбъекта = "КомандаПростыеОпции";

	ТестовыеСлучаи = Новый Массив;
	
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--bool", Спек, "Истина;;0"));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--string Строка", Спек, "Ложь;Строка;0"));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--int 42", Спек, "Ложь;;42"));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--string Строка --bool", Спек, "Истина;Строка;0"));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--int 42 --bool", Спек, "Истина;;42"));

	Для каждого Тест Из ТестовыеСлучаи Цикл
		
		Команда = ВыполнитьКомандаПриложения(Тест.Спек, ИмяПроцедурыОбъекта, Тест.Аргументы);

		ЗначениеБулева = Команда.ЗначениеОпции("bool");
		ЗначениеСтрока = Команда.ЗначениеОпции("string");
		ЗначениеЧисло = Команда.ЗначениеОпции("int");

		МассивРезультата = СтрРазделить(Тест.Результат, ";", Истина);

		Утверждения.ПроверитьРавенство(ЗначениеБулева, Булево(МассивРезультата[0]), "Результаты должны совпадать" + СтрСоединить(Тест.Аргументы));
		Утверждения.ПроверитьРавенство(ЗначениеСтрока, Строка(МассивРезультата[1]), "Результаты должны совпадать" + СтрСоединить(Тест.Аргументы));
		Утверждения.ПроверитьРавенство(ЗначениеЧисло, Число(МассивРезультата[2]), "Результаты должны совпадать" + СтрСоединить(Тест.Аргументы));
		
	КонецЦикла;

КонецПроцедуры

Процедура ТестДолжен_ПроверитьУстановкуПустыхЗначенийОпций() Экспорт

	Спек = "";
	ИмяПроцедурыОбъекта = "КомандаПростыеОпции";

	МассивПустыхЗначений = Новый Массив;
	МассивПустыхЗначений.Добавить("");
	МассивПустыхЗначений.Добавить(" ");
	МассивПустыхЗначений.Добавить("   ");

	МассивОпций = Новый Массив();
	МассивОпций.Добавить("-s");
	МассивОпций.Добавить("--string");

	Для Каждого ИмяОпции Из МассивОпций Цикл
		Для Каждого ПустоеЗначение Из МассивПустыхЗначений Цикл

			Аргументы = Новый Массив();
			Аргументы.Добавить(ИмяОпции);
			Аргументы.Добавить(ПустоеЗначение);

			Команда = ВыполнитьКомандаПриложения(Спек, ИмяПроцедурыОбъекта, Аргументы);
			ЗначениеОпции = Команда.ЗначениеОпции("string");

			Утверждения.ПроверитьРавенство(ЗначениеОпции, ЗначениеОпции, "Результат <ЗначениеОпции> должен совпадать с <ПустоеЗначение>");
			
		КонецЦикла;
	КонецЦикла;
КонецПроцедуры

Процедура ТестДолжен_СтандартнуюСтрокуИспользования() Экспорт
	
	Спек = "";
	ИмяПроцедурыОбъекта = "КомандаПростыеОпции";

	Команда = ПодготовитьТестовуюКоманду(Спек);

	ОпцияМассив =Команда.Опция("e env", Новый Массив, "Тестовый массив опций").ТМассивСтрок();
	АргументСтрока = Команда.Аргумент("ARG", "", "Тестовый простой необязательный аргумент").Обязательный(Ложь);
	
	Аргументы = Новый Массив;
	
	Аргументы.Добавить("-e=Знач1");
	Аргументы.Добавить("-e=Знач2");
	Аргументы.Добавить("-e=Знач3");
	Аргументы.Добавить("ЗначениеАргумента");

	РезультатВыполнения = ВыполнитьКомандуПриложения(Команда, Аргументы);

	Утверждения.ПроверитьИстину(РезультатВыполнения, "Команда должна выполниться");

	Утверждения.ПроверитьРавенство(ОпцияМассив.Значение.Количество(), 3 , "Результат <ОпцияМассив> должны совпадать");
	Утверждения.ПроверитьРавенство(АргументСтрока.Значение, "ЗначениеАргумента" , "Результат <АргументСтрока> должны совпадать");

	Команда = ПодготовитьТестовуюКоманду(Спек);

	ОпцияМассив =Команда.Опция("e env", Новый Массив, "Тестовый массив опций").ТМассивСтрок();
	АргументСтрока = Команда.Аргумент("ARG", "", "Тестовый простой необязательный аргумент").Обязательный(Ложь);
	
	Аргументы = Новый Массив;
	
	Аргументы.Добавить("-e=Знач1");
	Аргументы.Добавить("-e=Знач2");
	Аргументы.Добавить("-e=Знач3");
	//Аргументы.Добавить("ЗначениеАргумента");

	РезультатВыполнения = ВыполнитьКомандуПриложения(Команда, Аргументы);

	Утверждения.ПроверитьИстину(РезультатВыполнения, "Команда должна выполниться");

	Утверждения.ПроверитьРавенство(ОпцияМассив.Значение.Количество(), 3 , "Результат <ОпцияМассив> должны совпадать");
	Утверждения.ПроверитьРавенство(АргументСтрока.Значение, "" , "Результат <АргументСтрока> должны совпадать");



КонецПроцедуры

Процедура ТестДолжен_СтандартнуюСтрокуИспользования_МассивАргументов() Экспорт
	
	Спек = "";
	ИмяПроцедурыОбъекта = "КомандаПростыеОпции";

	Команда = ПодготовитьТестовуюКоманду(Спек);

	ОпцияМассив =Команда.Опция("e env", Новый Массив, "Тестовый массив опций").ТМассивСтрок();
	АргументСтрока = Команда.Аргумент("ARG", "", "Тестовый простой необязательный аргумент").ТМассивСтрок().Обязательный(Ложь);
	
	Аргументы = Новый Массив;
	
	Аргументы.Добавить("-e=Знач1");
	Аргументы.Добавить("-e=Знач2");
	Аргументы.Добавить("-e=Знач3");
	Аргументы.Добавить("ЗначениеАргумента");
	Аргументы.Добавить("ЗначениеАргумента");

	РезультатВыполнения = ВыполнитьКомандуПриложения(Команда, Аргументы);

	Утверждения.ПроверитьИстину(РезультатВыполнения, "Команда должна выполниться");

	Утверждения.ПроверитьРавенство(ОпцияМассив.Значение.Количество(), 3, "Результат <ОпцияМассив> должны совпадать");
	Утверждения.ПроверитьРавенство(АргументСтрока.Значение.Количество(), 2, "Результат <АргументСтрока> должны совпадать");

	// Необязательный массив
	// Аргументы не переданы

	Команда = ПодготовитьТестовуюКоманду(Спек);

	ОпцияМассив =Команда.Опция("e env", Новый Массив, "Тестовый массив опций").ТМассивСтрок();
	АргументСтрока = Команда.Аргумент("ARG", "", "Тестовый простой необязательный аргумент").ТМассивСтрок().Обязательный(Ложь);
	
	Аргументы = Новый Массив;
	
	Аргументы.Добавить("-e=Знач1");
	Аргументы.Добавить("-e=Знач2");
	Аргументы.Добавить("-e=Знач3");

	РезультатВыполнения = ВыполнитьКомандуПриложения(Команда, Аргументы);

	Утверждения.ПроверитьИстину(РезультатВыполнения, "Команда должна выполниться");

	Утверждения.ПроверитьРавенство(ОпцияМассив.Значение.Количество(), 3, "Результат <ОпцияМассив> должны совпадать");
	Утверждения.ПроверитьРавенство(АргументСтрока.Значение.Количество(), 0, "Результат <АргументСтрока> должны совпадать");


	// Просто массив
	Команда = ПодготовитьТестовуюКоманду(Спек);

	ОпцияМассив =Команда.Опция("e env", Новый Массив, "Тестовый массив опций").ТМассивСтрок();
	АргументСтрока = Команда.Аргумент("ARG", "", "Тестовый простой необязательный аргумент").ТМассивСтрок();
	
	Аргументы = Новый Массив;
	
	Аргументы.Добавить("-e=Знач1");
	Аргументы.Добавить("-e=Знач2");
	Аргументы.Добавить("-e=Знач3");
	Аргументы.Добавить("ЗначениеАргумента");
	Аргументы.Добавить("ЗначениеАргумента");

	РезультатВыполнения = ВыполнитьКомандуПриложения(Команда, Аргументы);

	Утверждения.ПроверитьИстину(РезультатВыполнения, "Команда должна выполниться");

	Утверждения.ПроверитьРавенство(ОпцияМассив.Значение.Количество(), 3, "Результат <ОпцияМассив> должны совпадать");
	Утверждения.ПроверитьРавенство(АргументСтрока.Значение.Количество(), 2, "Результат <АргументСтрока> должны совпадать");

КонецПроцедуры

Процедура ТестДолжен_СтандартнуюСтрокуИспользования_МассивАргументовНесколькоАргументов() Экспорт
	
	Спек = "";
	ИмяПроцедурыОбъекта = "КомандаПростыеОпции";

	Команда = ПодготовитьТестовуюКоманду(Спек);

	ОпцияМассив =Команда.Опция("e env", Новый Массив, "Тестовый массив опций").ТМассивСтрок();
	АргументСтрока = Команда.Аргумент("ARG", "", "Тестовый простой необязательный аргумент").ТМассивСтрок().Обязательный(Ложь);
	АргументСтрока2 = Команда.Аргумент("ARG2", "", "Тестовый простой необязательный аргумент").Обязательный();

	
	Аргументы = Новый Массив;
	
	Аргументы.Добавить("-e=Знач1");
	Аргументы.Добавить("-e=Знач2");
	Аргументы.Добавить("-e=Знач3");
	Аргументы.Добавить("ЗначениеАргумента");
	Аргументы.Добавить("ЗначениеАргумента2");

	РезультатВыполнения = ВыполнитьКомандуПриложения(Команда, Аргументы);

	Утверждения.ПроверитьИстину(РезультатВыполнения, "Команда должна выполниться");

	Утверждения.ПроверитьРавенство(ОпцияМассив.Значение.Количество(), 3, "Результат <ОпцияМассив> должны совпадать");
	Утверждения.ПроверитьРавенство(АргументСтрока.Значение.Количество(), 1, "Результат <АргументСтрока> должны совпадать");
	Утверждения.ПроверитьРавенство(АргументСтрока2.Значение, "ЗначениеАргумента2", "Результат <АргументСтрока2> должны совпадать");

КонецПроцедуры

Процедура ТестДолжен_СтандартнуюСтрокуИспользования_ОбязательнаяОпция() Экспорт
	
	Команда = ПодготовитьТестовуюКоманду();

	ОбычныйОпция = Команда.Опция("z", , "Необязательная опция").ТСтрока();
	ОпцияМассив = Команда.Опция("e env", Новый Массив, "Тестовый необязательный массив опций").ТМассивСтрок();
	ARG2 = Команда.Аргумент("ARG2", "", "Тестовый простой необязательный аргумент").ТМассивСтрок();
	
	СтрокаИспользования = СокрЛП(Команда.ПолучитьСтрокуИспользования());
	Утверждения.ПроверитьРавенство(СтрокаИспользования, "[ОПЦИИ] -- ARG2...", "Результат <СтрокаИспользования> должны совпадать");


	Команда = ПодготовитьТестовуюКоманду();

	ОбычныйОпция = Команда.Опция("z", , "Необязательная опция").ТСтрока();
	ОпцияМассив = Команда.Опция("e env", Новый Массив, "Тестовый обязательный массив опций").ТМассивСтрок().Обязательный(Истина);
	ARG2 = Команда.Аргумент("ARG2", "", "Тестовый простой необязательный аргумент").ТМассивСтрок();
	
	СтрокаИспользования = СокрЛП(Команда.ПолучитьСтрокуИспользования());
	Утверждения.ПроверитьРавенство(СтрокаИспользования, "[-z] -e... -- ARG2...", "Результат <СтрокаИспользования> должны совпадать");

	
	Команда = ПодготовитьТестовуюКоманду();

	ARG2 = Команда.Аргумент("ARG2", "", "Тестовый простой необязательный аргумент").ТМассивСтрок();
	
	СтрокаИспользования = СокрЛП(Команда.ПолучитьСтрокуИспользования());
	Утверждения.ПроверитьРавенство(СтрокаИспользования, "-- ARG2...", "Результат <СтрокаИспользования> должны совпадать");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьВыводСправки() Экспорт

	Спек = "";
	Команда = ПодготовитьТестовуюКоманду(Спек);
	ОпцияМассив = Команда.Опция("env", Новый Массив, "Тестовый массив опций").ТМассивСтрок();
	АргументСтрока2 = Команда.Аргумент("ARG2", "", "Тестовый простой необязательный аргумент").Обязательный();
	АргументСтрока = Команда.Аргумент("ARG", "", "Тестовый простой необязательный аргумент").ТМассивСтрок().Обязательный(Ложь);
	ОпцияПеречисление = Команда.Опция("enum e em", "yellow", "Опция перечисление").ТПеречисление()
						.Перечисление("yellow", "yellow", "Это желтый цвет")
						.Перечисление("red", "red" , "Это красный цвет")
						.Перечисление("blue", "blue", "Это синий цвет")
						;

	Команда.ВывестиСправку();

КонецПроцедуры

Процедура ТестДолжен_ПроверитьСбросОпцийПередАргументами() Экспорт
	
	Команда = ПодготовитьТестовуюКоманду();

	ОпцияМассив =Команда.Опция("e env", Новый Массив, "Тестовый массив опций").ТМассивСтрок();
	ARG2 = Команда.Аргумент("ARG2", "", "Тестовый простой необязательный аргумент").ТМассивСтрок().Обязательный(Ложь);
	
	Аргументы = Новый Массив;
	
	Аргументы.Добавить("-e=Знач1");
	Аргументы.Добавить("-e=Знач2");
	Аргументы.Добавить("-e=Знач3");
	Аргументы.Добавить("--");
	Аргументы.Добавить("-v");
	Аргументы.Добавить("ARG2");
	Аргументы.Добавить("run");

	РезультатВыполнения = ВыполнитьКомандуПриложения(Команда, Аргументы);

	Утверждения.ПроверитьИстину(РезультатВыполнения, "Команда должна выполниться");
	Утверждения.ПроверитьРавенство(ОпцияМассив.Значение.Количество(), 3, "Результат <ОпцияМассив> должны совпадать");
	Утверждения.ПроверитьРавенство(ARG2.Значение.Количество(), 3, "Результат <ARG1> должны совпадать");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьТекстОшибок() Экспорт
	
	РазделительОшибок = "; ";

	Команда = ПодготовитьТестовуюКоманду();
	Команда.Аргумент("ARG", "", "Тест").ТСтрока();
	Команда.Опция("f force", "", "Тест").ТСтрока();
	Команда.Опция("b bool", "", "Тест").ТБулево();
	Команда.Опция("s string", "", "Тест").ТСтрока();

	ТестовыеСлучаи = Новый Массив();
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-x", "-f", ОшибкиПарсера.ОшибкаНеожидаемаяОпция("x")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-f val -x", "-f", ОшибкиПарсера.ОшибкаНеожидаемаяОпция("x")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-xb", "-f", ОшибкиПарсера.ОшибкаНеожидаемаяОпция("x")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-bx", "-f", ОшибкиПарсера.ОшибкаОжидаетсяОпцияВместо("f", "b")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-b", "-f -s", ОшибкиПарсера.ОшибкаОжидаетсяОпцияВместо("f", "b")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-f val -b", "-f -s", ОшибкиПарсера.ОшибкаОжидаетсяОпцияВместо("s", "b")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-s", "-f", ОшибкиПарсера.ОшибкаОжидаетсяОпцияВместо("f", "s")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-f val -s", "-f -b", ОшибкиПарсера.ОшибкаОжидаетсяОпцияВместо("b", "s")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-f val -s val", "-f -b", ОшибкиПарсера.ОшибкаОжидаетсяОпцияВместо("b", "s")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-f val", "-f -s", ОшибкиПарсера.ОшибкаОжидаетсяОпция("s")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-f", "-f", ОшибкиПарсера.ОшибкаТребуетсяЗначениеДляОпции("f")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-f", "[-f]", ОшибкиПарсера.ОшибкаТребуетсяЗначениеДляОпции("f")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-f", "-f | -s", ОшибкиПарсера.ОшибкаТребуетсяЗначениеДляОпции("f")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-b=", "-b", ОшибкиПарсера.ОшибкаТребуетсяЗначениеПослеЗнакаРавноДляОпции("b")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-b=", "[-b]", ОшибкиПарсера.ОшибкаТребуетсяЗначениеПослеЗнакаРавноДляОпции("b")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-x=false", "-b", ОшибкиПарсера.ОшибкаНеожидаемаяОпция("x")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("ARG", "-f", ОшибкиПарсера.ОшибкаНеожидаемыйПараметр("ARG")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("", "[-f | -b] -s", ОшибкиПарсера.ОшибкаОжидаетсяОпция("s")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-b", "[-b] -s", ОшибкиПарсера.ОшибкаОжидаетсяОпция("s")));		

	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--long", "--force", ОшибкиПарсера.ОшибкаНеожидаемаяОпция("long")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--force val --long", "--force", ОшибкиПарсера.ОшибкаНеожидаемаяОпция("long")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--bool", "--force", ОшибкиПарсера.ОшибкаОжидаетсяОпцияВместо("f", "bool")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--string", "--force", ОшибкиПарсера.ОшибкаОжидаетсяОпцияВместо("f", "string")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--force val --bool", "--force  --string", ОшибкиПарсера.ОшибкаОжидаетсяОпцияВместо("s", "bool")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--force val --string", "--force --bool", ОшибкиПарсера.ОшибкаОжидаетсяОпцияВместо("b", "string")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--force val --string val", "--force --bool", ОшибкиПарсера.ОшибкаОжидаетсяОпцияВместо("b", "string")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--force val", "--force --string", ОшибкиПарсера.ОшибкаОжидаетсяОпция("s")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("--force", "--force", ОшибкиПарсера.ОшибкаТребуетсяЗначениеДляОпции("force")));
	
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-x", "[ОПЦИИ]", ОшибкиПарсера.ОшибкаНеожидаемаяОпция("x")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-f", "[ОПЦИИ]", ОшибкиПарсера.ОшибкаТребуетсяЗначениеДляОпции("f")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-b=", "[ОПЦИИ]", ОшибкиПарсера.ОшибкаТребуетсяЗначениеПослеЗнакаРавноДляОпции("b")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("ARG", "[ОПЦИИ]", ОшибкиПарсера.ОшибкаНеожидаемыйПараметр("ARG")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-b ARG", "[ARG] [ОПЦИИ]", ОшибкиПарсера.ОшибкаНеожидаемыйПараметр("ARG")));	
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-b ARG", "ARG [ОПЦИИ]", ОшибкиПарсера.ОшибкаОжидаетсяАргументВместоОпции("ARG", "b")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("", "[ОПЦИИ] ARG", ОшибкиПарсера.ОшибкаОжидаетсяАргумент("ARG")));	

	ТестовыеСлучаи.Добавить(ТестовыйСлучай("", "ARG", ОшибкиПарсера.ОшибкаОжидаетсяАргумент("ARG")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("ARG -x", "ARG", ОшибкиПарсера.ОшибкаНеожидаемаяОпция("x")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-x ARG", "ARG", ОшибкиПарсера.ОшибкаОжидаетсяАргументВместоОпции("ARG", "x")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("ARG SRC", "ARG", ОшибкиПарсера.ОшибкаНеожидаемыйПараметр("SRC")));
	
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("ARG -x", "ARG -f", ОшибкиПарсера.ОшибкаНеожидаемаяОпция("x")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("ARG", "ARG -f", ОшибкиПарсера.ОшибкаОжидаетсяОпция("f")));	
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("", "[ARG] -f", ОшибкиПарсера.ОшибкаОжидаетсяОпция("f")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("-f val", "-f ARG", ОшибкиПарсера.ОшибкаОжидаетсяАргумент("ARG")));
	ТестовыеСлучаи.Добавить(ТестовыйСлучай("", "[-f] ARG", ОшибкиПарсера.ОшибкаОжидаетсяАргумент("ARG")));

	ТестовыеСлучаи.Добавить(ТестовыйСлучай("", "(-f | -b) -s", 
		ОшибкиПарсера.ОшибкаОжидаетсяОпция("f").Текст 
		+ РазделительОшибок 
		+ ОшибкиПарсера.ОшибкаОжидаетсяОпция("b").Текст));

	ТестовыеСлучаи.Добавить(ТестовыйСлучай("", "[ARG] [-s] ((-f [-s | ARG]) | -b) -s", 
		ОшибкиПарсера.ОшибкаОжидаетсяОпция("f").Текст 
		+ РазделительОшибок 
		+ ОшибкиПарсера.ОшибкаОжидаетсяОпция("b").Текст));

	Для Каждого ТестовыйСлучай Из ТестовыеСлучаи Цикл

		Команда.Спек = ТестовыйСлучай.Спек;
		Команда.НачалоЗапуска();

		ПараметрыМетода = Новый Массив();
		ПараметрыМетода.Добавить(ТестовыйСлучай.Аргументы);

		ТекстИсключения = "";
		Попытка
			Рефлектор = Новый Рефлектор;
			Рефлектор.ВызватьМетод(Команда, "Запуск", ПараметрыМетода);
		Исключение
			ТекстИсключения = ОписаниеОшибки();
			
			ПодстрокаПоиска = "Ошибка чтения параметров команды: ";
			НачальныйНомер = СтрНайти(ТекстИсключения, ПодстрокаПоиска) + СтрДлина(ПодстрокаПоиска);
			КоличествоСимволов = СтрДлина(ТекстИсключения) - НачальныйНомер;
			ТекстИсключения = Сред(ТекстИсключения, НачальныйНомер, КоличествоСимволов);
		КонецПопытки;

		Если ТипЗнч(ТестовыйСлучай.Результат) = Тип("Структура") Тогда
			Результат = ТестовыйСлучай.Результат.Текст;
		Иначе
			Результат = ТестовыйСлучай.Результат;
		КонецЕсли;

		Ожидаем.Что(ТекстИсключения).Равно(Результат);

	КонецЦИкла;
	
КонецПроцедуры

Функция ПодготовитьТестовуюКоманду(Спек = "") 

	Команда =  Новый КомандаПриложения("testapp", "Тестовое приложения", ЭтотОбъект);
	
	Если ЗначениеЗаполнено(Спек) Тогда
		Команда.Спек = Спек;
	КонецЕсли;

	Возврат Команда;
	
КонецФункции


Функция АргументыИзСтроки(СтрокаАргументов)

	Возврат СтрРазделить(СтрокаАргументов, " ");
	
КонецФункции


Функция ТестовыйСлучай(Знач Аргументы, Знач Спек, Знач Результат)
	
	Тест = Новый Структура;
	Тест.Вставить("Аргументы", СтрРазделить(Аргументы," "));
	Тест.Вставить("Спек", Спек);
	Тест.Вставить("Результат", Результат);

	Возврат Тест;
КонецФункции

Функция ВыполнитьКомандуПриложения(Команда, Аргументы)
	
	Команда.НачалоЗапуска();
	Попытка
		Команда.Запуск(Аргументы);
	Исключение
		Сообщить(ОписаниеОшибки());
		Возврат Ложь;
	КонецПопытки;
	
	Возврат Истина;

КонецФункции

Функция ВыполненаКомандаПриложения(Спек, ИмяПроцедурыОбъекта, Аргументы)
	
	Команда = Новый КомандаПриложения("test", "Тестовая команда", ЭтотОбъект);
	
	ПараметрыВыполнения = Новый Массив;
	ПараметрыВыполнения.Добавить(Команда);

	ОписаниеКоманды = Делегаты.Создать(ЭтотОбъект, ИмяПроцедурыОбъекта);
	ОписаниеКоманды.Исполнить(ПараметрыВыполнения);

	Команда.Спек = Спек;

	Команда.НачалоЗапуска();
	Попытка
		Команда.Запуск(Аргументы);
	Исключение
		Сообщить(ОписаниеОшибки());
		Возврат Ложь;
	КонецПопытки;
	
	Возврат Истина;

КонецФункции

Функция ВыполнитьКомандаПриложения(Спек, ИмяПроцедурыОбъекта, Аргументы)
	
	Команда = Новый КомандаПриложения("test", "Тестовая команда", ЭтотОбъект);
	
	ПараметрыВыполнения = Новый Массив;
	ПараметрыВыполнения.Добавить(Команда);

	ОписаниеКоманды = Делегаты.Создать(ЭтотОбъект, ИмяПроцедурыОбъекта);
	ОписаниеКоманды.Исполнить(ПараметрыВыполнения);

	Команда.Спек = Спек;

	Команда.НачалоЗапуска();
	Попытка
		Команда.Запуск(Аргументы);
	Исключение
		Сообщить(ОписаниеОшибки());
		Возврат Команда;
	КонецПопытки;
	
	Возврат Команда;

КонецФункции

Процедура КомандаСкоростьРаботуКомандыПриложения(Знач ВыполняемаяКоманда) Экспорт
	
	login = ВыполняемаяКоманда.Опция("login", "", "Login for credential, e.g. username or email.").ТСтрока();
	realm = ВыполняемаяКоманда.Опция("realm", "", "Realm for credential, e.g. website or WiFi AP name.").ТСтрока();
	note = ВыполняемаяКоманда.Опция("note", "", "Note for credential.").ТСтрока();
	noCopy = ВыполняемаяКоманда.Опция("no-copy", false, "Do not copy generated password to the clipboard.").Флаг();
	gen = ВыполняемаяКоманда.Опция("gen", false, "Generate a password.").Флаг();
	length = ВыполняемаяКоманда.Опция("length", 0, "Password length.").Тчисло();
	minLength = ВыполняемаяКоманда.Опция("min-length", 30, "Minimum length password.").Тчисло();
	maxL = ВыполняемаяКоманда.Опция("max-length", 40, "Maximum length password.").Тчисло();
	noUpper = ВыполняемаяКоманда.Опция("no-upper", false, "Exclude uppercase characters in password.").Флаг();
	noLow = ВыполняемаяКоманда.Опция("no-lower", false, "Exclude lowercase characters in password.").Флаг();
	noDigit = ВыполняемаяКоманда.Опция("no-digit", false, "Exclude digit characters in password.").Флаг();
	noSymbol = ВыполняемаяКоманда.Опция("no-symbol", false, "Exclude symbol characters in password.").Флаг();
	noSimilar = ВыполняемаяКоманда.Опция("no-similar", false, "Exclude similar characters in password.").Флаг();
	minUpper = ВыполняемаяКоманда.Опция("min-upper", 0, "Minimum number of uppercase characters in password.").Тчисло();
	maxUpper = ВыполняемаяКоманда.Опция("max-upper", -1, "Maximum number of uppercase characters in password.").Тчисло();
	minLow = ВыполняемаяКоманда.Опция("min-lower", 0, "Minimum number of lowercase characters in password.").Тчисло();
	maxLow = ВыполняемаяКоманда.Опция("max-lower", -1, "Maximum number of lowercase characters in password.").Тчисло();
	minDigit = ВыполняемаяКоманда.Опция("min-digit", 0, "Minimum number of digit characters in password.").Тчисло();
	maxDigit = ВыполняемаяКоманда.Опция("max-digit", -1, "Maximum number of digit characters in password.").Тчисло();
	minSym = ВыполняемаяКоманда.Опция("min-symbol", 0, "Minimum number of symbol characters in password.").Тчисло();
	maxSym = ВыполняемаяКоманда.Опция("max-symbol", -1, "Maximum number of symbol characters in password.").Тчисло();
	ex = ВыполняемаяКоманда.Опция("exclude", "", "Exclude specific characters from password.").ТСтрока();

КонецПроцедуры

Процедура КомандаПростыеОпции(Знач ВыполняемаяКоманда) Экспорт
	
	ВыполняемаяКоманда.Опция("bool", Ложь, "Login for credential, e.g. username or email.");
	ВыполняемаяКоманда.Опция("s string", "", "Realm for credential, e.g. website or WiFi AP name.");
	ВыполняемаяКоманда.Опция("int", 0, "Note for credential.");
	
КонецПроцедуры

Лог = Логирование.ПолучитьЛог("oscript.lib.cli_command");
//Лог.УстановитьУровень(УровниЛога.Отладка);