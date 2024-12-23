// Выполняет поиск любого парсера в массиве входящих аргументов
//
// Параметры:
//   Аргументы - Массив - входящие аргументы приложения
//   КонтекстПоиска - Объект - ссылка на класс КонтекстПарсера
//
//  Возвращаемое значение:
//   Объект.РезультатПоискаПараметра - ссылка на класс РезультатПоискаПараметра
//
Функция Поиск(Аргументы, КонтекстПоиска) Экспорт
	
	Результат  = Новый РезультатПоискаПараметра(Аргументы, Истина);
	
	Возврат Результат;

КонецФункции

// Возвращает приоритет текущего парсера
//
//  Возвращаемое значение:
//   число - приоритет текущего парсера
//
Функция Приоритет() Экспорт
	Возврат 10;
КонецФункции

// Возвращает имя текущего парсера
//
//  Возвращаемое значение:
//   строка - имя текущего парсера всегда "*"
//
Функция ВСтроку() Экспорт
	Возврат "*";
КонецФункции
