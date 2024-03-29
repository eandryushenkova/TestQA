﻿#language: ru

@tree
@ДвиженияДокументов

Функционал: проверка движения документа Поступление товаров

Как тестировщик я хочу
проверить движения документов Поступления товаров
чтобы убедиться, что документ делает движения по нужным регистрам

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0501 подготовительный сценарий (движения документа Поступление товаров)
	Когда экспорт основных данных
	Когда загрузка документа Поступление услуг

	И я выполняю код встроенного языка на сервере
		//|'Documents.PurchaseInvoice.FindByNumber(1001).GetObject().Write(DocumentWriteMode.Posting);'|
		|'Документы.PurchaseInvoice.НайтиПоНомеру(1001).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

Сценарий: _0502 проверка движений документа Поступление товаров по регистру R1001 Закупки
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
	И в таблице "List" я перехожу к строке
		| 'Номер' |
		| '1 001' |
	И я нажимаю на кнопку с именем 'FormReportDocumentRegistrationsReportRegistrationsReport'
	Тогда открылось окно 'Движения документа'
	И из выпадающего списка с именем "FilterRegister" я выбираю точное значение 'R1001 Закупки'
	И я нажимаю на кнопку с именем 'GenerateReport'
	И табличный документ "ResultTable" равен:
		| 'Поступление товаров и услуг 1 001 от 04.02.2024 21:19:05' | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| 'Движения документа по регистрам'                          | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| 'Регистр  "R1001 Закупки"'                                 | ''                    | ''           | ''      | ''                  | ''             | ''                       | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | ''                  |
		| ''                                                         | 'Period'              | 'Resources'  | ''      | ''                  | ''             | 'Dimensions'             | ''                          | ''                             | ''       | ''                                                         | ''                        | ''                                     | 'Attributes'        |
		| ''                                                         | ''                    | 'Количество' | 'Сумма' | 'Сумма без налогов' | 'Сумма скидки' | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Инвойс'                                                   | 'Характеристика'          | 'Ключ строки'                          | 'Отложенный расчет' |
		| ''                                                         | '04.02.2024 21:19:05' | '1'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 04.02.2024 21:19:05' | 'Услуга'                  | '7ec8171f-91e4-4094-af00-90d18136ae4e' | 'Да'                |
		| ''                                                         | '04.02.2024 21:19:05' | '1'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 04.02.2024 21:19:05' | 'Услуга'                  | '7ec8171f-91e4-4094-af00-90d18136ae4e' | 'Нет'               |
		| ''                                                         | '04.02.2024 21:19:05' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 04.02.2024 21:19:05' | 'Услуга'                  | '7ec8171f-91e4-4094-af00-90d18136ae4e' | 'Нет'               |
		| ''                                                         | '04.02.2024 21:19:05' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 04.02.2024 21:19:05' | 'Услуга'                  | '7ec8171f-91e4-4094-af00-90d18136ae4e' | 'Нет'               |
		| ''                                                         | '04.02.2024 21:19:05' | '1'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 04.02.2024 21:19:05' | 'Услуга'                  | '7ec8171f-91e4-4094-af00-90d18136ae4e' | 'Нет'               |
		| ''                                                         | '04.02.2024 21:19:05' | '2'          | ''      | ''                  | ''             | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поступление товаров и услуг 1 001 от 04.02.2024 21:19:05' | 'Товар без характеристик' | 'fb8ef5aa-838a-434f-bc2c-7f3422150377' | 'Да'                |
		| ''                                                         | '04.02.2024 21:19:05' | '2'          | '171,8' | '143,17'            | ''             | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поступление товаров и услуг 1 001 от 04.02.2024 21:19:05' | 'Товар без характеристик' | 'fb8ef5aa-838a-434f-bc2c-7f3422150377' | 'Нет'               |
		| ''                                                         | '04.02.2024 21:19:05' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поступление товаров и услуг 1 001 от 04.02.2024 21:19:05' | 'Товар без характеристик' | 'fb8ef5aa-838a-434f-bc2c-7f3422150377' | 'Нет'               |
		| ''                                                         | '04.02.2024 21:19:05' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поступление товаров и услуг 1 001 от 04.02.2024 21:19:05' | 'Товар без характеристик' | 'fb8ef5aa-838a-434f-bc2c-7f3422150377' | 'Нет'               |
		| ''                                                         | '04.02.2024 21:19:05' | '2'          | '200'   | '166,67'            | ''             | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поступление товаров и услуг 1 001 от 04.02.2024 21:19:05' | 'Товар без характеристик' | 'fb8ef5aa-838a-434f-bc2c-7f3422150377' | 'Нет'               |
	
	И я закрываю все окна клиентского приложения
		
Сценарий: _0502 проверка движений документа Поступление товаров по регистру R1021 Взаиморасчеты с поставщиками
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/Document.PurchaseInvoice"
	И в таблице "List" я перехожу к строке
		| 'Номер' |
		| '1 001' |
	И я нажимаю на кнопку с именем 'FormReportDocumentRegistrationsReportRegistrationsReport'
	Тогда открылось окно 'Движения документа'
	И из выпадающего списка с именем "FilterRegister" я выбираю точное значение 'R1021 Взаиморасчеты с поставщиками'
	И я нажимаю на кнопку с именем 'GenerateReport'
	Тогда табличный документ "ResultTable" содержит строки по шаблону:
		| 'Поступление товаров и услуг 1 001 от 04.02.2024 21:19:05' | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
		| 'Движения документа по регистрам'                          | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
		| 'Регистр  "R1021 Взаиморасчеты с поставщиками"'            | ''            | ''                    | ''          | ''                       | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | ''                  | ''                             |
		| ''                                                         | 'Record type' | 'Period'              | 'Resources' | 'Dimensions'             | ''                          | ''                             | ''       | ''            | ''            | ''                           | ''                   | 'Attributes'        | ''                             |
		| ''                                                         | ''            | ''                    | 'Сумма'     | 'Организация'            | 'Структурное подразделение' | 'Вид мультивалютной аналитики' | 'Валюта' | 'Контрагент'  | 'Партнер'     | 'Соглашение'                 | 'Документ основание' | 'Отложенный расчет' | 'Закрытие авансов поставщиков' |
		| ''                                                         | 'Приход'      | '*'                   | ''          | 'Собственная компания 1' | ''                          | 'В валюте бюджетирования'      | 'EUR'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Да'                | ''                             |
		| ''                                                         | 'Приход'      | '*'                   | '343,6'     | 'Собственная компания 1' | ''                          | 'В локальной валюте страны'    | 'EUR'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
		| ''                                                         | 'Приход'      | '*'                   | '400'       | 'Собственная компания 1' | ''                          | 'ru наименование не заполнено' | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
		| ''                                                         | 'Приход'      | '*'                   | '400'       | 'Собственная компания 1' | ''                          | 'В валюте отчетности'          | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
		| ''                                                         | 'Приход'      | '04.02.2024 21:19:05' | '400'       | 'Собственная компания 1' | ''                          | 'Валюта соглашения, USD'       | 'USD'    | 'Поставщик 2' | 'Поставщик 2' | 'Соглашение с поставщиком 2' | ''                   | 'Нет'               | ''                             |
	
		
	//И я закрываю все окна клиентского приложения		




		


	
