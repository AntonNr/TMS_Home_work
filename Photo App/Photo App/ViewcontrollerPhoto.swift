import UIKit

class ViewControllerPhoto: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet var imageView: UIImageView!
    
    var images:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addImageButton = UIBarButtonItem(title: "+", style: .done, target: self, action: #selector(openPhotoGallery))
        navigationItem.rightBarButtonItem = addImageButton
    }

    @objc func openPhotoGallery(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        images.append(image!) // чем можно заменить force unwrapped?
        imageView.image = images.last
        picker.dismiss(animated: true)
    }
}

