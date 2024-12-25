# Форк [`oscript-library/cli`](https://github.com/oscript-library/cli)

Данная библиотека для языка OScript позволяет создавать консольные приложения с разбором и проверкой аргументов.

## Изменения

#### 1. Добавлены ключевые слова [ANY], [ЛЮБОЙ] в грамматику парсера

Указывается в спек, когда порядок опций и аргументов не важен:

``` bsl
Приложение.Спек = "[ANY]";
```

#### 2. Поддержка пустых значений опций

Позволяет обрабатывать пустые значения опций: `myapp -f ''`, либо `myapp -f '  '`

#### 3. Детализация ошибки `Ошибка чтения параметров команды` при парсинге опций и аргументов

Ошибка `Ошибка чтения параметров команды` дополняется следующими сообщениями:
- Ожидается опция `-x`
- Неожидаемая опция `-x`
- Ожидается опция `-x` вместо `-y`
- Опция `-x` должна содержать значение
- Опция `-x` должна содержать значение после знака =
- Ожидается аргумент `ARG`
- Ожидается аргумент `ARG` вместо опции `-x`
- Неожидаемый параметр `wrong`

#### 4. Исправлена ошибка `Значение не является значением объектного типа` при передаче несуществующей опции:

Вместо ошибки `Значение не является значением объектного типа` ожидалась ошибка `Ошибка чтения параметров команды: Неожидаемая опция -x`

``` bsl
Приложение = Новый КонсольноеПриложение("myapp", "", ЭтотОбъект);
Приложение.УстановитьСпек("-y");
Приложение.Опция("y", "", "").ТБулево();
Приложение.УстановитьОсновноеДействие(ЭтотОбъект);

АргументыКоманды = Новый Массив;
АргументыКоманды.Добавить("-x=false");

Приложение.Запустить(АргументыКоманды);
```
