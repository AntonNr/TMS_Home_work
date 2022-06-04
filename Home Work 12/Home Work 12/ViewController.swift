import UIKit

class ViewController: UIViewController {

    @IBOutlet var leftSize: NSLayoutConstraint!
    @IBOutlet var menuView: UIView!
    @IBOutlet var touchView: UIView!
    var blurEffectView: UIVisualEffectView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        menuView.layer.zPosition = 1000
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideMenu))
        touchView.addGestureRecognizer(tapGesture)
        
    }
    
    func printOk(){
        print("OK")
    }
    
    func printHello(){
        print("Hello")
    }

    @IBAction func showMenu(){
        touchView.isHidden = false
        leftSize.constant = 0
        
        let blurEffect = UIBlurEffect(style: .dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.frame = self.view.bounds
        blurEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        touchView.addSubview(blurEffectView!)
        blurEffectView?.alpha = 0
        blurEffectView?.layer.zPosition = 0
        
        UIView.animate(withDuration: 2) {
            self.view.layoutIfNeeded()
            self.blurEffectView?.alpha = 1
        }
    }
    
    @IBAction func hideMenu(){
        leftSize.constant = -207
        
        UIView.animate(withDuration: 2) {
            self.view.layoutIfNeeded()
            self.blurEffectView?.alpha = 0
        } completion: { _ in
            self.view.removeBlurEffect()
            self.touchView.isHidden = true
        }
    }
    
    @IBAction func didTapShowAlert(){
        let alertViewController = UIAlertController(title: "Вход в аккаунт", message: "Введите пароль для входа в аккаунт:", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let textfield = alertViewController.textFields{
                print(textfield)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancle", style: .cancel) { _ in
            print("Отмена")
        }
        
        alertViewController.addTextField { textField in
            textField.placeholder = "Введите пароль"
            textField.isSecureTextEntry = true
        }
        
        alertViewController.addAction(okAction)
        alertViewController.addAction(cancelAction)
        self.present(alertViewController, animated: true)
    }
    
    @IBAction func showAlert(){
        showError(title: "Привет", message: "Просто привет", button1Title: "ОК", button1Action: printOk, button2Title: "Привет", button2Action: printHello)
    }
}

extension UIViewController{
    func showError(title: String, message: String, button1Title: String?, button1Action: (()->Void)? = nil, button2Title: String?, button2Action: (()->Void)? = nil){
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let button1Title = button1Title {
            let button1 = UIAlertAction(title: button1Title, style: .default) { _ in
                button1Action?()
            }
            alertViewController.addAction(button1)
        }
        
        if let button2Title = button2Title {
            let button2 = UIAlertAction(title: button2Title, style: .default) { _ in
                button2Action?()
            }
            alertViewController.addAction(button2)
        }
        
        self.present(alertViewController, animated: true)
    }
}

extension UIView{
    func removeBlurEffect(){
        for view in self.subviews {
            if view is UIVisualEffectView{
                view.removeFromSuperview()
            }
        }
    }
}
