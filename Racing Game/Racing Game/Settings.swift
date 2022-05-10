import UIKit

class Settings: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let rootScreen = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(didTapClose))
        navigationItem.leftBarButtonItem = rootScreen
    }

    @objc func didTapClose(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
