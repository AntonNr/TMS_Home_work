import UIKit

class ViewController: UIViewController {
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var leftConstraint: NSLayoutConstraint!
    @IBOutlet var rightConstraint: NSLayoutConstraint!
    
    var password: String = ""
    var count = 0
    var passwordNums = ["_" , "_" , "_" , "_"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didTapOne() {
        password.append(contentsOf: "1")
        changeLabel(number: "1")
    }
    
    @IBAction func didTapTwo() {
        password.append(contentsOf: "2")
        changeLabel(number: "2")
    }
    
    @IBAction func didTapThree() {
        password.append(contentsOf: "3")
        changeLabel(number: "3")
    }
    
    @IBAction func didTapFour() {
        password.append(contentsOf: "4")
        changeLabel(number: "4")
    }
    
    @IBAction func didTapFive() {
        password.append(contentsOf: "5")
        changeLabel(number: "5")
    }
    
    @IBAction func didTapSix() {
        password.append(contentsOf: "6")
        changeLabel(number: "6")
    }
    
    @IBAction func didTapSeven() {
        password.append(contentsOf: "7")
        changeLabel(number: "7")
    }
    
    @IBAction func didTapEight() {
        password.append(contentsOf: "8")
        changeLabel(number: "8")
    }
    
    @IBAction func didTapNine() {
        password.append(contentsOf: "9")
        changeLabel(number: "9")
    }
    
    @IBAction func didTapNull() {
        password.append(contentsOf: "0")
        changeLabel(number: "0")
    }
    
    @IBAction func didTapDelete() {
        password.removeAll()
        passwordLabel.text = "_ _ _ _"
        passwordNums[0] = "_"
        passwordNums[1] = "_"
        passwordNums[2] = "_"
        passwordNums[3] = "_"
        count = 0
    }
    
    func changeLabel(number: String){
        switch(count){
        case 0: passwordNums[0] = number
            passwordLabel.text = "\(passwordNums[0]) _ _ _"
        case 1: passwordNums[1] = number
            passwordLabel.text = "\(passwordNums[0]) \(passwordNums[1]) _ _"
        case 2: passwordNums[2] = number
            passwordLabel.text = "\(passwordNums[0]) \(passwordNums[1]) \(passwordNums[2]) _"
        case 3:passwordNums[3] = number
            passwordLabel.text = "\(passwordNums[0]) \(passwordNums[1]) \(passwordNums[2]) \(passwordNums[3])"
        
            if password == UserDefaults.standard.string(forKey: UserDefaultsKey.keyPassword.rawValue){
                passwordLabel.textColor = .green
                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let viewControllerPhoto: ViewControllerPhoto = mainStoryboard.instantiateViewController(withIdentifier: "ViewControllerPhoto") as! ViewControllerPhoto
                self.navigationController?.pushViewController(viewControllerPhoto, animated: true)
            } else {
                passwordLabel.textColor = .red
                UIView.animate(withDuration: 0.2, delay: 0, options: .allowAnimatedContent) {
                    self.leftConstraint.constant -= 15
                    self.rightConstraint.constant += 15
                    self.passwordLabel.center.x -= 15
                } completion: { _ in UIView.animate(withDuration: 0.2, delay: 0, options: .allowAnimatedContent) {
                    self.leftConstraint.constant += 30
                    self.rightConstraint.constant -= 30
                    self.passwordLabel.center.x += 30
                } completion: { _ in UIView.animate(withDuration: 0.2, delay: 0, options: .allowAnimatedContent) {
                    self.leftConstraint.constant -= 15
                    self.rightConstraint.constant += 15
                    self.passwordLabel.center.x -= 15
                } completion: { _ in
                    self.passwordLabel.textColor = .black
                    self.didTapDelete()
                }
                }
                }
            }
            
        default: break
        }
        count += 1
    }

    enum UserDefaultsKey: String {
        case keyPassword = "keyPassword"
    }
}
