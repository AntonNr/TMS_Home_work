import UIKit

class ViewController: UIViewController {
    
    var viewArray: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapGesture))
        self.view.addGestureRecognizer(tapGesture)
    }

    @objc func didTapGesture(sender: UITapGestureRecognizer){
        
        for (index, view) in viewArray.enumerated(){
            let viewPoint = sender.location(in: view)
            if (viewPoint.x > 0 && viewPoint.x < 50) && (viewPoint.y > 0 && viewPoint.y < 50){
                view.removeFromSuperview()
                viewArray.remove(at: index)
                return
            }
        }
        
        let point = sender.location(in: self.view)
        
        let newView = UIView(frame: .init(x: point.x - 25, y: point.y - 25, width: 50, height: 50))
        newView.backgroundColor = .purple
        
        newView.layer.cornerRadius = 25
        newView.clipsToBounds = true
        
        viewArray.append(newView)
        self.view.addSubview(newView)
    }

    @IBAction func didTapSecondTask(){
        let str: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: GestureCircle = str.instantiateViewController(withIdentifier: "GestureCircle") as! GestureCircle
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }
    
}

