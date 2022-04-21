import UIKit

class FirstViewController: UIViewController {
    
    var coloredCircle: UIView = UIView()
    var didTapCircle: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        coloredCircle.frame = CGRect(x: Int.random(in: 1..<350), y: Int.random(in: 1..<650), width: 100, height: 100)
        coloredCircle.backgroundColor = .red
        self.view.addSubview(coloredCircle)
        
        didTapCircle.frame = coloredCircle.bounds
        didTapCircle.setTitle("Tap", for: .normal)
        didTapCircle.addTarget(self, action: #selector(didTapCircleFunc), for: .touchUpInside)
        
        coloredCircle.layer.cornerRadius = 50
        coloredCircle.clipsToBounds = true
        
        coloredCircle.addSubview(didTapCircle)
    }
    
    @objc func didTapCircleFunc(){
        coloredCircle.frame = CGRect(x: Int.random(in: 1..<350), y: Int.random(in: 1..<650), width: 100, height: 100)
    }

}

    
