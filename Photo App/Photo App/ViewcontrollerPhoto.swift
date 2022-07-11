import UIKit

struct ImageData{
    let id: String
    let imageData: Data
}

struct Comment: Codable{
    let id: String
    var comment: String
}

class ViewControllerPhoto: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var imageView = UIImageView()
    var currentIndex = 0
    var images:[UIImage] = []
    var positionOfImage = 0
    @IBOutlet var bottomSize: NSLayoutConstraint!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let authorizationViewController: ViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let navigationController = UINavigationController(rootViewController: authorizationViewController)
        self.present(navigationController, animated: true)
        
        let addImageButton = UIBarButtonItem(title: "+", style: .done, target: self, action: #selector(openPhotoGallery))
        navigationItem.rightBarButtonItem = addImageButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        createImageGalery()
    }

    @objc func keyboardWillShow(notification: NSNotification){
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        bottomSize.constant = value.cgRectValue.size.height
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        
    }
    
    func createImageGalery(){
        imageView.frame = CGRect(x: 0, y: 100, width: Int(self.view.frame.width), height: 374)
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
            positionOfImage += 1
            UIView.animate(withDuration: 1){
                self.imageView.frame = CGRect(x: (-1) * self.view.frame.width, y: 100, width: self.view.frame.width, height: 374)
            } completion: { animation in
                self.currentIndex += 1
                if self.currentIndex >= self.images.count{
                    self.currentIndex = 0
                }
                
                self.imageView.image = self.images[self.currentIndex]
                
                self.imageView.frame = CGRect(x: self.view.frame.width, y: 100, width: self.view.frame.width, height: 374)
                
                UIView.animate(withDuration: 1){
                    self.imageView.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 374)
                }
            }
            break
        case .right:
            positionOfImage -= 1
            UIView.animate(withDuration: 1){
                self.imageView.frame = CGRect(x: self.view.frame.width, y: 100, width: self.view.frame.width, height: 374)
            } completion: { animation in
                self.currentIndex -= 1
                if self.currentIndex < 0 {
                    self.currentIndex = self.images.count - 1 
                }
                
                self.imageView.image = self.images[self.currentIndex]
                
                self.imageView.frame = CGRect(x: (-1) * self.view.frame.width, y: 100, width: self.view.frame.width, height: 374)
                
                UIView.animate(withDuration: 1){
                    self.imageView.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 374)
                }
            }
            break
        default:
            break
        }
    }
    
    @objc func openPhotoGallery(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true)
    }
    
    @IBAction func didTapSaveComment(){
        var currentImage: ImageData?
        if let imageData: Data = UserDefaults.standard.object(forKey: UserDefaultsKey.kPhoto.rawValue) as? Data{
            if var commentArray: [Comment] = try? PropertyListDecoder().decode(Array<Comment>.self, from: imageData){
                commentArray[positionOfImage].comment = textField.text ?? ""
            }
        }
        //textField.clearButtonMode = .whileEditing
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
        images.append(image) 
        imageView.image = images.last
        imageView.image = images[currentIndex]
        picker.dismiss(animated: true)
        }
    }
}

enum UserDefaultsKey: String {
    case kPhoto = "kPhoto"
}

//if let comment: String = textField.text{
//            let newComment = Comment(id: currentImage?.id ?? "", comment: comment)
//            let keyPhoto: String = newComment.comment
//            if let imageData: Data =  UserDefaults.standard.object(forKey:  UserDefaultsKey.kPhoto.rawValue) as? Data{
//                if var commentArray: [Comment] = try? PropertyListDecoder().decode(Array<Comment>.self, from: imageData){
//                    commentArray[0].comment = newComment.comment
//                }
//            }
//        }
