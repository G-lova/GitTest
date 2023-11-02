/*
1. Есть словарь с видами чая и их стоимостью. 
Есть очередь людей, которые хотят заказать чай 
(можно представить её в виде массива видов чая, которые хотят заказать).
Необходимо последовательно выводить в консоль сколько заплатит покупатель 
(необходимо вывести его номер по порядку, чай, который он заказал, и стоимость).
*/

let teaPrices = ["Черный чай": 100, "Зеленый чай": 120, "Мятный чай": 80]

let orderQueue = ["Зеленый чай", "Мятный чай", "Черный чай"]

func printOrderInfo(queueNumber: Int, teaType: String, price: Int) {
    print("Покупатель №\(queueNumber) заказал \(teaType) и заплатил \(price) рублей")
}

for (index, teaOrder) in orderQueue.enumerated() {
        printOrderInfo(queueNumber: index+1, teaType: teaOrder, price: teaPrices[teaOrder]!)
   
}

/*
2. Есть массив [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]. 
Необходимо создать новый массив, который будет состоять из элементов старого, 
но не должно быть nil, не должно быть 0 и 4, а также массив должен быть отсортирован по возрастанию.
*/

let oldArray: [Int?] = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]

let filteredArray = oldArray.compactMap { $0 }.filter { $0 != 0 && $0 != 4 }

let newArray = filteredArray.sorted()

print(newArray)

/*
3. Написать функцию, которая на вход принимает целое число, 
а возвращает массив, который сформирован по следующим правилам: 
количество элементов соответствует переданному числу, массив начинается с 1, 
каждый последующий элемент больше предыдущего в 2 раза.
*/

func generateArray(_ count: Int) -> [Int] {
    var result: [Int] = []
    
    var i: Int = 1
    for _ in 1...count {
        result.append(i)
        i = i * 2
    }
    
    return result
}

let number = 5
let newArray = generateArray(number)
print(newArray)