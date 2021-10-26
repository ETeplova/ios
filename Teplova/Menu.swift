import UIKit

struct Hero {
    var name: String
    var image: UIImage?
}

class Menu {
    var heroes = [Hero]()
    func setup() {
        let captain = Hero(name: "Captain America", image: UIImage(named: "p1"))
        let nR = Hero(name: "Natasha Romanoff", image: UIImage(named: "p2"))
        let robert = Hero(name: "Iron Man", image: UIImage(named: "p3"))
        self.heroes = [captain, nR, robert]
    }
}
