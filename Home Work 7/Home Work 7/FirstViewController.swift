import UIKit

class Animal{
    var voice: String
    var age: String
    var size: String
    
    init(voice: String, years: String, size: String){
        self.voice = voice
        self.age = years
        self.size = size
    }
}

class FirstViewController: UIViewController {
    @IBOutlet var label1: UILabel!
    
    var string1: String = ""
    
    var Dog = Animal(voice: "Гав-гав", years: "5", size: "Маленький")
    var animalStatus: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label1.text = string1
        self.title = "Первый экран"
        
        let secondScreen = UIBarButtonItem(title: "Second Screen", style: .done, target: self, action: #selector(openSecondScreen))
        navigationItem.rightBarButtonItem = secondScreen
    }
    
    @IBAction func didTapMe1(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: SecondViewController = str.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        vc.string2 = "Передаю"
        
        vc.animalStatus = Dog.voice + "\n" + Dog.age + "\n" + Dog.size
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }
    
    @objc func openSecondScreen(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: SecondViewController = str.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        vc.string2 = "Передаю"
        
        vc.animalStatus = Dog.voice + "\n" + Dog.age + "\n" + Dog.size
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

