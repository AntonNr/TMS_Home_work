import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet var label3: UILabel!
    
    var string3: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label3.text = string3
        
        self.title = "Третий экран"
        
        let fourScreen = UIBarButtonItem(title: "Four Screen", style: .done, target: self, action: #selector(openFourScreen))
        navigationItem.rightBarButtonItem = fourScreen
    }

    @IBAction func didTapMe3(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: FourthViewController = str.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        
        vc.string4 = string3
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }
    
    @objc func openFourScreen(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: FourthViewController = str.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        
        vc.string4 = string3
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
