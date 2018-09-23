//
//  CreateItemViewController.swift
//  collector
//
//  Created by Jonathan Cochran on 9/5/18.
//  Copyright © 2018 Jonathan Cochran. All rights reserved.
//

import UIKit
import CoreData
class CreateItemViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
   // var managedObjectContext:NSManagedObjectContext!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var cameraBtn: UIBarButtonItem!
    var pickerController = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerController.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cameraBtn.isEnabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    

    
    func openImagePicker(source: UIImagePickerController.SourceType){
        let chosenPicker = UIImagePickerController()
        chosenPicker.delegate = self
        chosenPicker.sourceType = source
        present(chosenPicker, animated: true, completion: nil)
    }

    @IBAction func mediaFolderTapped(_ sender: Any) {
        openImagePicker(source: .photoLibrary)
    }
    
    @IBAction func cameraBtnTapped(_ sender: Any) {
        openImagePicker(source: .camera)
    }
    
    @IBAction func addBtnTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let collectible = Collectible(context: context)
            collectible.title = titleTextField.text
            collectible.image = imageView.image?.jpegData(compressionQuality: 1.0)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
        }
           navigationController?.popViewController(animated: true)
}

    
   //func createImageItem(with image:UIImage) {
   //      let createImage = Collectible(context: managedObjectContext)
   //     createImage.image = NSData(data: UIImageJPEGRepresentation(image, 1.0)!) as Data
   // }


}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
