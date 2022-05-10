import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var label2: UILabel!
    @IBOutlet var animalLable: UILabel!
    
    var string2: String = ""
    var animalStatus: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label2.text = string2
        animalLable.text = animalStatus
        
        self.title = "Второй экран"
        
        let thirdScreen = UIBarButtonItem(title: "Third Screen", style: .done, target: self, action: #selector(openThirdScreen))
        navigationItem.rightBarButtonItem = thirdScreen
    }

    @IBAction func didTapMe2(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: ThirdViewController = str.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        vc.string3 = string2
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }
    
    @objc func openThirdScreen(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: ThirdViewController = str.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        vc.string3 = string2
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
