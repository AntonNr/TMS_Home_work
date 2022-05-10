import UIKit

class FourthViewController: UIViewController {

    @IBOutlet var label4: UILabel!
    
    var string4: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label4.text = string4
        
        self.title = "Четвёртый экран"
        
        let fiveScreen = UIBarButtonItem(title: "Five Screen", style: .done, target: self, action: #selector(openFiveScreen))
        navigationItem.rightBarButtonItem = fiveScreen
    }

    @IBAction func didTapMe4(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: FifthViewController = str.instantiateViewController(withIdentifier: "FifthViewController") as! FifthViewController
        
        vc.string5 = string4
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }
    
    @objc func openFiveScreen(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: FifthViewController = str.instantiateViewController(withIdentifier: "FifthViewController") as! FifthViewController
        
        vc.string5 = string4
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
