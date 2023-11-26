/*
1. Создать структуру работника пиццерии. В ней должны быть такие свойства, 
как имя, зарплата и должность. Должностей пока может быть две: или кассир, или повар. 
Добавить в класс пиццерии массив с работниками

2. Создать класс столика, в нем должны быть свойство, в котором содержится количество мест 
и функция, которая на вход принимает количество гостей, которое хотят посадить, 
а возвращает true, если места хватает и false, если места не хватает. 
Изначальное количество мест задается в инициализаторе

3. Добавить в класс пиццерии свойство, в котором хранится массив столиков. 
У класса столика добавить свойство, в котором хранится пиццерия, в которой стоит столик. 
Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра
*/

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

struct Worker {
  var name: String
  var salary: Double
  enum Position {
    case cashier
    case cook
  }
  var position: Position
}

class PizzaShop {
    var menu: [Menu] = []
    var workers: [Worker] = []
    var tables: [Table] = []

    init(tables: [Table]) {
        self.tables = tables
    }

    func addMenuItem(item: Menu) {
        menu.append(item)
    }

    func addWorker(worker: Worker) {
        workers.append(worker)
    }

    func getAllMenu() -> [Menu] {
        return menu
    }

    func getAllWorkers() -> [Worker] {
      return workers
    }

    func isThereTable(guestsNumber: Int) -> Bool {
        for table in self.tables {
            if table.isSeatsEnough(guestsNumber: guestsNumber) == true {
                return true
                break
            }
        }
        return false
    }
}

protocol OpeningClosing {
    func open()
    func close()
}

extension PizzaShop: OpeningClosing {
    func open() {
        print("Pizza shop is now open")
    }
    
    func close() {
        print("Pizza shop is now closed")
    }
}

class Table {
    var seatsNumber: Int
    var pizzaShop: PizzaShop?

    init(seatsNumber: Int) {
        self.seatsNumber = seatsNumber
    }

    func isSeatsEnough(guestsNumber: Int) -> Bool {
        return guestsNumber <= seatsNumber
    }
}

let pizza = Pizza(price: 10.99, type: .margherita, isThick: false, adds: [.cheese])
let potato = FriedPotato(price: 5.99, size: .large)

let pizzaShop = PizzaShop(tables: [Table(seatsNumber: 4), Table(seatsNumber: 6), Table(seatsNumber: 2)])
pizzaShop.addMenuItem(item: pizza)
pizzaShop.addMenuItem(item: potato)

var menu = pizzaShop.getAllMenu()
for item in menu {
  print("\(item.name):, $\(item.price)")
}

pizzaShop.open()
print(pizzaShop.isThereTable(guestsNumber: 3))
print(pizzaShop.isThereTable(guestsNumber: 8))
pizzaShop.close()


