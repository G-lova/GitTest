protocol Menu {
    var name: String {get}
    var price: Double {get}
}

struct Pizza: Menu {
    var name: String {
        "Pizza \(self.type)"
    }
    enum PizzaType {
        case margherita
        case pepperoni
        case hawaiian
        case capricciosa
        case fourCheese
    }
    enum Adds {
        case pepperoni
        case tomatoes
        case cheese
    }
    
    var price: Double
    var type: PizzaType
    var isThick: Bool
    var adds: [Adds]
}

/*
1. Необходимо создать структуру картошки фри, в которой будет стоимость и размер картошки 
и сделать так, чтобы в классе пиццерии была одна переменная, 
в которую можно было бы класть и пиццу, и картошку фри.
*/

struct FriedPotato: Menu {
    var name: String {
        "Fried potato \(self.size)"
    }
    var price: Double
    enum Size {
        case small
        case medium
        case large
    }
    var size: Size
}

/*
2. Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню.
*/

class PizzaShop {
    var menu: [Menu] = []

    func addMenuItem(item: Menu) {
        menu.append(item)
    }
}

/*
3. Создайте протокол, в котором будут содержаться функции открытия и закрытия.
*/

protocol OpeningClosing {
    func open()
    func close()
}

/*
4. Написать расширение для класса пиццерии, в котором будет реализован протокол из пункта 3.
*/

extension PizzaShop: OpeningClosing {
    func open() {
        print("Pizza shop is now open")
    }
    
    func close() {
        print("Pizza shop is now closed")
    }
}

let pizza = Pizza(price: 10.99, type: .margherita, isThick: false, adds: [.cheese])
let potato = FriedPotato(price: 5.99, size: .large)

let pizzaShop = PizzaShop()
pizzaShop.addMenuItem(item: pizza)
pizzaShop.addMenuItem(item: potato)

for item in pizzaShop.menu {
    if let pizza = item as? Pizza {
        print("\(pizza.name):, $\(pizza.price)")
    } else if let potato = item as? FriedPotato {
        print("\(potato.name), $\(potato.price)")
    }
}

pizzaShop.open()
pizzaShop.close()

/*
5. Написать функцию, в которой происходит вычитание одного числа из другого. 
Функция должна работать и с Int, и с Double.Функция должна возвращать результат вычитания.
*/

func subtraction<T: Numeric>(a:T, b:T) -> T {
    a - b
}

print(subtraction(a:5.9, b:3))