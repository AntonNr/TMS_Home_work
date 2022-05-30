import UIKit

class SecondViewController: UIViewController {
   
    var imageView = UIImageView()
    var images = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3")]
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createImageGalery()
    }
    
    func createImageGalery(){
        imageView.frame = CGRect(x: 0, y: 200, width: Int(self.view.frame.width), height: 300)
        imageView.image = images[currentIndex]
        self.view.addSubview(imageView)
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        left.direction = .left
        self.view.addGestureRecognizer(left)
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        right.direction = .right
        self.view.addGestureRecognizer(right)
    }
    
    @objc func didSwipe(sender: UISwipeGestureRecognizer){
        switch sender.direction{
        case .left:
            UIView.animate(withDuration: 1){
                self.imageView.frame = CGRect(x: (-1) * self.view.frame.width, y: 200, width: self.view.frame.width, height: 300)
            } completion: { animation in
                self.currentIndex = self.currentIndex + 1
                if self.currentIndex >= self.images.count{
                    self.currentIndex = 0
                }
                
                self.imageView.image = self.images[self.currentIndex]
                
                self.imageView.frame = CGRect(x: self.view.frame.width, y: 200, width: self.view.frame.width, height: 300)
                
                UIView.animate(withDuration: 1){
                    self.imageView.frame = CGRect(x: 0, y: 200, width: self.view.frame.width, height: 300)
                }
            }
            break
        case .right:
            UIView.animate(withDuration: 1){
                self.imageView.frame = CGRect(x: self.view.frame.width, y: 200, width: self.view.frame.width, height: 300)
            } completion: { animation in
                self.currentIndex = self.currentIndex - 1
                if self.currentIndex < 0{
                    self.currentIndex = 2
                }
                
                self.imageView.image = self.images[self.currentIndex]
                
                self.imageView.frame = CGRect(x: (-1) * self.view.frame.width, y: 200, width: self.view.frame.width, height: 300)
                
                UIView.animate(withDuration: 1){
                    self.imageView.frame = CGRect(x: 0, y: 200, width: self.view.frame.width, height: 300)
                }
            }
            break
        default:
            break
        }
    }
}
