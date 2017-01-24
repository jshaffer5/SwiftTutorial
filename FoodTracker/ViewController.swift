//
//  ViewController.swift
//  FoodTracker
//
//  Created by js on 1/20/17.
//  Copyright © 2017 js. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle text field's user input through delegate callbacks
        nameTextField.delegate = self //self refers to ViewController
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // dismiss picker if canceled
        dismiss(animated: true, completion: nil )
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        //info dictionary may contain multiple representations of the image. we want the original
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage else { //access original image from info dictionary, safely unwrapping the optional returned by the dictionary and casting it as a UIImage object
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
            }
        
        photoImageView.image = selectedImage //display selected image
        dismiss(animated: true, completion: nil) //dismiss picker
    }

    //MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide keyboard
        nameTextField.resignFirstResponder()
        
        // call photo picker controller
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        // tells ViewController to present imagePickerController
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
}

