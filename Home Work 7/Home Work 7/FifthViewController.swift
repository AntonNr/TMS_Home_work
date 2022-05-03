import UIKit

class FifthViewController: UIViewController {

    @IBOutlet var label5: UILabel!
    
    var string5: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label5.text = string5
    }

    @IBAction func didTapMe5(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: FirstViewController = str.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        
        vc.string1 = string5
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }
    
}
