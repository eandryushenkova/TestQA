﻿#language: ru

@tree

Функционал: Тестирование отчета D2001 Продажи

Как тестировщик я хочу
протестировать отчет D2001 Продажи 
чтобы проверить корректность формирования отчета

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Подготовительный сценарий
	Когда Экспорт основных данных
	Когда Экспорт документов продажи
	И я выполняю код встроенного языка на сервере
		|'Документы.SalesInvoice.НайтиПоНомеру(1,Дата(2024,1,1)).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.SalesInvoice.НайтиПоНомеру(2,Дата(2024,1,1)).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.SalesReturn.НайтиПоНомеру(1,Дата(2024,1,1)).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

Сценарий: проверка отчета D2001 Продажи
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	Тогда открылось окно 'D2001 Продажи'
	И в табличном документе 'Result' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе "Result" заполнится ячейка "R8C4" в течение 20 секунд
	Дано Табличный документ "Result" равен макету "Продажи1" по шаблону	

