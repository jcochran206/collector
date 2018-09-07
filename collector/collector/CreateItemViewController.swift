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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cameraBtn.isEnabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
       }else {
        print("error with image conversion")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    

    
    func openImagePicker(source: UIImagePickerControllerSourceType){
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
            do {
                try self.managedObjectContext.save()
            }catch{
                print("\(error.localizedDescription)")
            }
            
        }
    }
    

    
   //func createImageItem(with image:UIImage) {
   //      let createImage = Collectible(context: managedObjectContext)
   //     createImage.image = NSData(data: UIImageJPEGRepresentation(image, 1.0)!) as Data
   // }


}
