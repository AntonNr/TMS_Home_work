import UIKit

class FourViewController: UIViewController {

    @IBOutlet var label4: UILabel!
    
    var string4: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label4.text = string4
    }

    @IBAction func didTapMe4(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: FifthViewController = str.instantiateViewController(withIdentifier: "FifthViewController") as! FifthViewController
        
        vc.string5 = string4
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }
    
}
