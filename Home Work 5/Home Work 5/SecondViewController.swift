import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func didTapToCreateSquares(){
        let square1 = UIView(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
        square1.backgroundColor = .blue
        self.view.addSubview(square1)
        
        let square2 = UIView(frame: CGRect(x: 67, y: 225, width: 50, height: 50))
        square2.backgroundColor = .red
        self.view.addSubview(square2)
        
        let square3 = UIView(frame: CGRect(x: 125, y: 230, width: 50, height: 50))
        square3.backgroundColor = .green
        self.view.addSubview(square3)
        
        let square4 = UIView(frame: CGRect(x: 300, y: 600, width: 75, height: 75))
        square4.backgroundColor = .purple
        self.view.addSubview(square4)
        
        let square5 = UIView(frame: CGRect(x: 250, y: 100, width: 90, height: 90))
        square5.backgroundColor = .cyan
        self.view.addSubview(square5)
        
        let square6 = UIView(frame: CGRect(x: 250, y: 300, width: 150, height: 150))
        square6.backgroundColor = .brown
        self.view.addSubview(square6)
        
        let square7 = UIView(frame: CGRect(x: 25, y: 500, width: 125, height: 125))
        square7.backgroundColor = .black
        self.view.addSubview(square7)
        
        let square8 = UIView(frame: CGRect(x: 30, y: 350, width: 112, height: 112))
        square8.backgroundColor = .link
        self.view.addSubview(square8)
        
        let square9 = UIView(frame: CGRect(x: 175, y: 350, width: 50, height: 50))
        square9.backgroundColor = .magenta
        self.view.addSubview(square9)
        
        let square10 = UIView(frame: CGRect(x: 275, y: 500, width: 75, height: 75))
        square10.backgroundColor = .orange
        self.view.addSubview(square10)
    }
}
