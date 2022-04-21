import UIKit

class ThirdViewController: UIViewController {
    var topButton: UIButton = UIButton()
    var leftButton: UIButton = UIButton()
    var rightButton: UIButton = UIButton()
    var bottomButton: UIButton = UIButton()
    var circle: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
        
        topButton.frame = CGRect(x: screenWidth/2 - 25, y: screenHeight - 200, width: 50, height: 50)
        topButton.backgroundColor = .darkGray
        topButton.setTitle("Up", for: .normal)
        self.view.addSubview(topButton)
        
        bottomButton.frame = CGRect(x: screenWidth/2 - 25, y: screenHeight - 150, width: 50, height: 50)
        bottomButton.backgroundColor = .darkGray
        bottomButton.setTitle("Down", for: .normal)
        self.view.addSubview(bottomButton)
        
        leftButton.frame = CGRect(x: screenWidth/2 - 75, y: screenHeight - 150, width: 50, height: 50)
        leftButton.backgroundColor = .darkGray
        leftButton.setTitle("Left", for: .normal)
        self.view.addSubview(leftButton)
        
        rightButton.frame = CGRect(x: screenWidth/2 + 25, y: screenHeight - 150, width: 50, height: 50)
        rightButton.backgroundColor = .darkGray
        rightButton.setTitle("Right", for: .normal)
        self.view.addSubview(rightButton)
        
        topButton.addTarget(self, action: #selector(didTapUp), for: .touchUpInside)
        bottomButton.addTarget(self, action: #selector(didTapDown), for: .touchUpInside)
        leftButton.addTarget(self, action: #selector(didTapLeft), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(didTapRight), for: .touchUpInside)
    }
    
    @objc func didTapUp(){
        if circle.frame.minY - 10 < 10
        {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY, width: 100, height: 100)
        } else {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY - 10, width: 100, height: 100)
        }
    }
    
    @objc func didTapDown(){
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height

        if circle.frame.minY + 10 > screenHeight - 295
        {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY, width: 100, height: 100)
        } else {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY + 10, width: 100, height: 100)
        }
    }
    
    @objc func didTapLeft(){
        if circle.frame.minX - 10 < 0
        {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY, width: 100, height: 100)
        } else {
            circle.frame = CGRect(x: circle.frame.minX - 10, y: circle.frame.minY, width: 100, height: 100)
        }
    }
    
    @objc func didTapRight(){
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
                
              
        if circle.frame.maxX + 10 > screenWidth
        {
            circle.frame = CGRect(x: circle.frame.minX, y: circle.frame.minY, width: 100, height: 100)
        } else {
            circle.frame = CGRect(x: circle.frame.minX + 10, y: circle.frame.minY, width: 100, height: 100)
        }
    }
}
