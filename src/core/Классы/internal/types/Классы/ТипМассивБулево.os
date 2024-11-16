
Перем ОписаниеОшибкиКласса;

// Возвращает строковое представление значения типа
//
// Параметры:
//   Значение - массив - значение типа
//
//  Возвращаемое значение:
//   строка - значение в строковом представлении
//
Функция ВСтроку(Значение) Экспорт
	
	Возврат ПреобразоватьМассивВСтроку(Значение);
	
КонецФункции

// Преобразует и устанавливает входящее значение к значению типа
//
// Параметры:
//   ВходящееЗначение - Булево - Значение флага
//   Значение - массив - переменная для установки значения
//
//  Возвращаемое значение:
//   массив - конвертированные значение
//
Функция УстановитьЗначение(Знач ВходящееЗначение, Значение) Экспорт

	Если ТипЗнч(ВходящееЗначение) = Тип("Булево") Тогда
		Значение.Добавить(ВходящееЗначение);
	Иначе
		Попытка
			Значение.Добавить(Булево(ВходящееЗначение));
		Исключение
			ОписаниеОшибкиКласса = ОписаниеОшибки();
		КонецПопытки;
	КонецЕсли;
	
	Возврат Значение;

КонецФункции 

// Возвращает описание ошибки и устанавливает признак ошибки 
//
// Параметры:
//   ЕстьОшибка - булево - произвольная переменная
//
//  Возвращаемое значение:
//   Строка - описание текущей ошибки преобразования типов
//
Функция Ошибка(ЕстьОшибка = Ложь) Экспорт
	
	Если НЕ ПустаяСтрока(ОписаниеОшибкиКласса) Тогда
		ЕстьОшибка = Истина;
	КонецЕсли;

	Возврат ОписаниеОшибкиКласса;
	
КонецФункции

Функция ПреобразоватьМассивВСтроку(МассивЗначений)

	Если НЕ ТипЗнч(МассивЗначений) = Тип("Массив") Тогда
		Возврат "";
	КонецЕсли;

	МассивСтрок = Новый Массив;
	Для Каждого Значение Из МассивЗначений Цикл
		МассивСтрок.Добавить(Формат(Значение, "БЛ=Ложь; БИ=Истина"));
	КонецЦикла;

	Возврат СтрСоединить(МассивСтрок, ", ");

КонецФункции

ОписаниеОшибкиКласса = "";