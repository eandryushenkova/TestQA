﻿#language: ru

@tree

Функционал: Условие: заполнение поля Организация

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Условие: заполнение поля Организация
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	И я нажимаю кнопку выбора у поля с именем "Partner"
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'       |
		| '12'  | 'Розничный клиент 1' |
	И в таблице "List" я выбираю текущую строку 
	// Если поле с именем "Company" не заполнено Тогда - Такой шаг е работает
	Если поле с именем "Company" заполнено Тогда 
	Иначе
		И я нажимаю кнопку выбора у поля с именем "Company"
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'           |
			| '2'   | 'Собственная компания 2' |
		И в таблице "List" я выбираю текущую строку
	
	Когда открылось окно 'Заказ покупателя (создание) *'
	И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
	И в таблице "ItemList" я активизирую поле с именем "ItemListItem"
	И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListItem"
	Тогда открылось окно 'Номенклатура'
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'            | 'Ссылка'                  |
		| '2'   | 'Товар без характеристик' | 'Товар без характеристик' |
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я выбираю текущую строку
	И в таблице "ItemList" я завершаю редактирование строки
						