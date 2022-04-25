import UIKit

enum styleOfSquares: Int{
    case redColor = 1
    case blackColor = 2
    case blueColor = 3
    case greenColor = 4
    case linkColor = 5
    case brownColor = 6
    case orangeColor = 7
    case magentaColor = 8
    case cyanColor = 9
    case purpleColor = 10
    
    func getColor() -> UIColor{
        switch self{
        case .redColor:
            return .red
        case .blackColor:
            return .black
        case .blueColor:
            return .blue
        case .greenColor:
            return .green
        case .linkColor:
            return .link
        case .brownColor:
            return .brown
        case .orangeColor:
            return .orange
        case .magentaColor:
            return .magenta
        case .cyanColor:
            return .cyan
        case .purpleColor:
            return .purple
        }
    }
    
    func getText() -> String{
        switch self{
        case .redColor:
            return "Red"
        case .blackColor:
            return "Black"
        case .blueColor:
            return "Blue"
        case .greenColor:
            return "Green"
        case .linkColor:
            return "Link"
        case .brownColor:
            return "Brown"
        case .orangeColor:
            return "Orange"
        case .magentaColor:
            return "Magenta"
        case .cyanColor:
            return "Cyan"
        case .purpleColor:
            return "Purple"
        }
    }
}


class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    var squares = [UIButton]()
    
    
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
        let sizeOfSquare = Int(textField.text!)
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = Int(screenSize.width)
        var xPosition = 10
        var yPosition = 150
        
        for index in 0..<squares.count{
            self.squares[index].removeFromSuperview()
        }
        squares.removeAll()
        
        for _ in 1...(.random(in: 5...20)){
            squares.append(UIButton())
        }
        
        for index in 0..<squares.count{
            if xPosition + sizeOfSquare! + 10 > screenWidth{
                yPosition = sizeOfSquare! + yPosition
                xPosition = 10
            }
            
            squares[index].frame = CGRect(x: xPosition, y: yPosition, width: sizeOfSquare!, height: sizeOfSquare!)
            xPosition = (Int(squares[index].frame.maxX) + 10)
            
            let randStyle: styleOfSquares! = styleOfSquares(rawValue: .random(in: 1...10))
            
            squares[index].setStyle(styleOfSquares: randStyle)
            self.view.addSubview(squares[index])
        }
    }
}

extension UIButton{
    func setStyle(styleOfSquares: styleOfSquares){
        self.backgroundColor = styleOfSquares.getColor()
        self.setTitle(styleOfSquares.getText(), for: .normal)
    }
}
