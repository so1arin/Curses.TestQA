﻿#language: ru

@tree

Функционал: проверка возможности ввода количества услуги

Как Менеджер по закупкам я хочу
проверить, что в поле Количество вида номенклатуры Услуга
нельзя вводить произвольное количество   

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: проверка расчета суммы в строке ТЧ
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Заказ (создание)"
	И из выпадающего списка с именем 'Организация' я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем 'Покупатель' я выбираю точное значение 'Магазин "Бытовая техника"'
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Большой"
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000038" | "Ремонт"       |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	Попытка
		И я запоминаю случайное число в диапазоне от "1" до "500" в переменную 'СлучайноеКоличество'
		И в таблице 'Товары' в поле 'Количество' я ввожу текст '$СлучайноеКоличество$'
	Исключение
		И я вывожу сообщение в менеджер тестирования "Нельзя ввести количество для услуги"
	И я закрываю текущее окно