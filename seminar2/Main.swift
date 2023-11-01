/*
1. Написать функцию, которая на вход принимает число: 
сумма, которую пользователь хочет положить на вклад, 
следующий аргумент это годовой процент, 
третий аргумент это срок Функция возвращает сколько денег получит пользователь по итогу.
*/

func estimatedAmount(sum: Double, interest: Double, term: Int) -> Double {
    var estimatedAmount = sum
    for _ in 1...term {
        estimatedAmount += estimatedAmount * interest / 100
    }
    return estimatedAmount
}

print("Итоговая сумма вклада:")
print(estimatedAmount(sum: 10000, interest: 4.5, term: 5))

/*
2. Создать перечисление, которое содержит 3 вида пиццы и создать переменные с каждым видом пиццы.
*/


enum Pizza: String {
    case margherita = "Маргарита"
    case napoletana = "Неаполетана"
    case calcone = "Кальцоне"
}

let margheritaPizza = Pizza.margherita
let napoletanaPizza = Pizza.napoletana
let calconePizza = Pizza.calcone

/*
3. Добавить возможность получения названия пиццы через rawValue
*/

print(margheritaPizza.rawValue)
print(napoletanaPizza.rawValue)
print(calconePizza.rawValue)