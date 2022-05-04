import UIKit

class GestureCircle: UIViewController {

    var circle: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let swipeGestureUp = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeUp))
        swipeGestureUp.direction = .up
        self.view.addGestureRecognizer(swipeGestureUp)
        
        let swipeGestureDown = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeDown))
        swipeGestureDown.direction = .down
        self.view.addGestureRecognizer(swipeGestureDown)
        
        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeLeft))
        swipeGestureLeft.direction = .left
        self.view.addGestureRecognizer(swipeGestureLeft)
        
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeRight))
        swipeGestureRight.direction = .right
        self.view.addGestureRecognizer(swipeGestureRight)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        circle.frame = CGRect(x: screenWidth/2 - 50, y: screenHeight/2 - 50, width: 100, height: 100)
        circle.backgroundColor = .red
        self.view.addSubview(circle)
        circle.layer.cornerRadius = 50
    }
    
    @objc func didSwipeUp(){
        if circle.frame.minY - 10 < 10
        {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY, width: 100, height: 100)
        } else {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY - 75, width: 100, height: 100)
        }
    }
    
    @objc func didSwipeDown(){
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height

        if circle.frame.minY + 10 > screenHeight - 295
        {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY, width: 100, height: 100)
        } else {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY + 75, width: 100, height: 100)
        }
   }
    
    @objc func didSwipeLeft(){
        if circle.frame.minX - 10 < 0
        {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY, width: 100, height: 100)
        } else {
            circle.frame = CGRect(x: circle.frame.minX - 75, y: circle.frame.minY, width: 100, height: 100)
        }
   }
    
    @objc func didSwipeRight(){
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
              
        if circle.frame.maxX + 10 > screenWidth
        {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY, width: 100, height: 100)
        } else {
            circle.frame = CGRect(x: circle.frame.minX + 75, y: circle.frame.minY, width: 100, height: 100)
        }
   }
    
    @IBAction func didTapFirstTask(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: ViewController = str.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }
}
