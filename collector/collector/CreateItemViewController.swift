//
//  CreateItemViewController.swift
//  collector
//
//  Created by Jonathan Cochran on 9/5/18.
//  Copyright © 2018 Jonathan Cochran. All rights reserved.
//

import UIKit

class CreateItemViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var cameraBtn: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cameraBtn.isEnabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
