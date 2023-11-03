/*
1. Создать перечисление с видами пиццы (хотя бы 4 - 5 кейсов)

2. Создать структуру пиццы, она должна содержать стоимость, вид пиццы, толстое или тонкое тесто 
и добавки (например, дополнительно добавить пепперони, помидоры, сыр). 
Вид пиццы должен быть вложенным типом для структуры пиццы. 
Подсказка: добавки лучше также сделать перечислением.
*/

struct Pizza {
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
3. Создать класс пиццерии, добавить массив с возможными пиццами. 
Переменная с массивом должна быть приватной. Массив задается в инициализаторе.
*/

class PizzaShop {
    private var pizzas: [Pizza] = []
    
    init() {
        let margheritaPizza = Pizza(price: 9.99, type: .margherita, isThick: false, adds: [.cheese])
        let pepperoniPizza = Pizza(price: 11.99, type: .pepperoni, isThick: true, adds: [.cheese, .pepperoni])
        let hawaiianPizza = Pizza(price: 12.99, type: .hawaiian, isThick: true, adds: [.cheese, .tomatoes])
        let capricciosaPizza = Pizza(price: 13.99, type: .capricciosa, isThick: true, adds: [.cheese, .tomatoes, .pepperoni])
        let fourCheesePizza = Pizza(price: 14.99, type: .fourCheese, isThick: false, adds: [.cheese])
        
        pizzas = [margheritaPizza, pepperoniPizza, hawaiianPizza, capricciosaPizza, fourCheesePizza]
    }

    /*
    4. Написать в классе пиццерии функции для добавления новой пиццы и для получения всех доступных пицц.
    */

    func addPizza(pizza: Pizza) {
        pizzas.append(pizza)
    }
    
    func getAllPizzas() -> [Pizza] {
        return pizzas
    }
}

/*
5. Создать экземпляр класса пиццерии и добавить в него несколько пицц.
*/

let pizzaShop = PizzaShop()
let pizzas = pizzaShop.getAllPizzas()
print(pizzas)

let newPizza = Pizza(price: 15.99, type: .margherita, isThick: false, adds: [.cheese, .tomatoes])
pizzaShop.addPizza(pizza: newPizza)

let updatedPizzas = pizzaShop.getAllPizzas()
print()
print(updatedPizzas)

/*
6. Написать функцию, которая будет решать квадратное уравнение. 
На вход функция получает коэффициенты a, b, c, d (ax^2 + bx+ c = d), а возвращает корни уравнения.
*/

func QuadraticEquation(a: Double, b: Double, c: Double, d: Double) -> (Double, Double?)? {
    // Если a равно нулю, то решаем, как линейное уравнение
    if a == 0 {
        guard b != 0 else {
            return nil
        }
        return ((d - c) / b, nil)
    }
    
    // Вычисляем дискриминант
    let discriminant = b * b - 4 * a * (c - d)
    
    // Проверяем, что дискриминант >= 0
    guard discriminant >= 0 else {
        return nil
    }
    
    // Вычисляем корни уравнения
    let x1 = (-b - sqrt(discriminant)) / (2 * a)
    let x2 = (-b + sqrt(discriminant)) / (2 * a)
    
    return (x1, x2)
}
 
let coefficients = (-1.0, 2.0, 1.0, 0.0)
if let roots = QuadraticEquation(a: coefficients.0, b: coefficients.1, c: coefficients.2, d: coefficients.3) {
    if let root1 = roots.1 {
        print("Корни уравнения: \(roots.0), \(root1)")
    } else {
        print("Корень уравнения: \(roots.0)")
    }
} else {
    print("Уравнение не имеет решений")
}