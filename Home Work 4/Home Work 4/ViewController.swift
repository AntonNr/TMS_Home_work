import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var information: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        information.isHidden = true
        }
    
    @IBAction func buyMiller(){
        if Manager.shared.beerList[0].volume > 0{
        Manager.shared.beerList.first!.volume = Manager.shared.beerList[0].volume - 1
        Manager.shared.revenue += 2.5
        }else{
            information.isHidden = false
            information.text = "Miller закончилась!"
        }
    }
    
    @IBAction func buyHeineken(){
        if Manager.shared.beerList[1].volume > 0{
        Manager.shared.beerList[1].volume = Manager.shared.beerList[1].volume - 1
        Manager.shared.revenue += 1.9
        }else{
            information.isHidden = false
            information.text = "Heineken закончилась!"
        }
    }
    
    @IBAction func buyCorona(){
        if Manager.shared.beerList[2].volume > 0 {
        Manager.shared.beerList[2].volume = Manager.shared.beerList[2].volume - 1
        Manager.shared.revenue += 3.9
        }else{
            information.isHidden = false
            information.text = "Corona закончилась!"
        }
    }
    
    @IBAction func endOfShift(){
        information.isHidden = false
        information.text = "Выручка: \(String(Manager.shared.revenue))\nОсталось:\nMiller:\(String(Manager.shared.beerList[0].volume))\nHeineken:\(String(Manager.shared.beerList[1].volume))\nCorona:\(String(Manager.shared.beerList[2].volume))"
        resettingOfBeerAndRevenue()
    }
    
    func resettingOfBeerAndRevenue(){
        Manager.shared.beerList[0].volume = 30
        Manager.shared.beerList[1].volume = 50
        Manager.shared.beerList[2].volume = 15
        Manager.shared.revenue = 0
    }
}

class Beer{
    var name: String
    var cost: Double
    var country: String
    var volume: Int
    
    init(name: String, cost: Double, country: String, volume: Int){
        self.name = name
        self.cost = cost
        self.country = country
        self.volume = volume
    }
}

class Manager{
    static let shared = Manager()
    
    var beerList: [Beer] = []
    let Miller = Beer(name: "Miller", cost: 2.5, country: "USA", volume: 30)
    let Heineken = Beer(name: "Heineken", cost: 1.9, country: "USA", volume: 50)
    let Corona = Beer(name: "Corona Extra", cost: 3.9, country: "Mexico", volume: 15)
    var revenue: Double = 0.0
    
    init(){
        beerList.append(contentsOf: [Miller, Heineken, Corona])
    }
}
