import UIKit

class ViewController: UIViewController {
    var circle: UIView = UIView()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        circle.frame = CGRect(x: screenWidth/2 + 50, y: screenHeight/2 + 100, width: 100, height: 100)
        circle.backgroundColor = .red
        self.view.addSubview(circle)
        circle.layer.cornerRadius = 50
        
        moveAsRectangle()
        timer = Timer.scheduledTimer(timeInterval: 11, target: self, selector: #selector(moveAsRectangle), userInfo: nil, repeats: true)
    }
    
    @objc func moveAsRectangle(){
        UIView.animate(withDuration: 3) {
            self.circle.center = CGPoint(x: self.circle.center.x, y: self.circle.center.y - 400)
        } completion: { animation in
                UIView.animate(withDuration: 2) {
                    self.circle.center = CGPoint(x: self.circle.center.x - 200, y: self.circle.center.y)
                } completion: { animation in
                    UIView.animate(withDuration: 3){
                        self.circle.center = CGPoint(x: self.circle.center.x, y: self.circle.center.y + 400)
                    } completion: { animation in
                        UIView.animate(withDuration: 2){
                            self.circle.center = CGPoint(x: self.circle.center.x + 200, y: self.circle.center.y)
                        }
                    }
                }
        }
    }
    
    @IBAction func didTapToSecondScreen(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: SecondViewController = str.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

