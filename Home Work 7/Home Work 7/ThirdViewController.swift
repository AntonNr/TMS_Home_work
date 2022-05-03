import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet var label3: UILabel!
    
    var string3: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label3.text = string3
    }

    @IBAction func didTapMe3(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: FourViewController = str.instantiateViewController(withIdentifier: "FourViewController") as! FourViewController
        
        vc.string4 = string3
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }
    
}
