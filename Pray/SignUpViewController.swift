//
//  SignUpViewController.swift
//  PrayerApp
//
//  Created by Jatin K on 9/16/17.
//  Copyright © 2017 Jatin K. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var ref: DatabaseReference!
    
    @IBOutlet var submitButton: UIButton!
    
    @IBOutlet var nameTextField: UITextField!
    
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet weak var profilePic: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 8
        self.hideKeyboardWhenTappedAround()
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        if emailTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    self.successfulSignIn()
                    
                   
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    @IBAction func PickPhoto(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Select Photo", message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {
            action in
            self.showCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: {
            action in
            self.showAlbum()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    // Opens Camera
    func showCamera(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .camera
        cameraPicker.allowsEditing = true
        self.present(cameraPicker, animated: true, completion: nil)
        
    }
    
    
    
    //Opens Album
    func showAlbum(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .photoLibrary
        cameraPicker.allowsEditing = true
        self.present(cameraPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true, completion: nil)
        if var image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            //var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
            //imageView.image = image
            // profilePic = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50));
            //image = image.scaleImage(toSize: .init(width: 50.0, height: 50.0))!
            self.profilePic.image = image
            self.profilePic.layer.cornerRadius = (self.profilePic.frame.size.width/2);
            profilePic.contentMode = .scaleAspectFill
            self.profilePic.clipsToBounds = true;
        }
        
        
        
    }
    
    //Dismisses Camera and Album
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func successfulSignIn(){
        if Auth.auth().currentUser?.uid as? String != nil{
            self.SaveUser();
            self.performSegue(withIdentifier: "Home", sender: self)
        } else {}
    }
    
    // Takes in the Username, Name, & Email and stores into database
    func SaveUser(){
        //ref = Database.database().reference()
        let user = Auth.auth().currentUser;
        let userID = (user?.uid)!
        print(userID)
        //ref?.child("Usernames/" + a).setValue(userID)
        ref?.child("Users").child((user?.uid)!)
        ref?.child("Users/" + userID + "/name").setValue(nameTextField.text)
        ref?.child("Users/" + userID + "/email").setValue(emailTextField.text)
        ref?.child("Users/\(userID)").child("/Groups/personal").setValue("Personal") //ref?.child("Users/" + userID + "/username").setValue()
        //ref?.child("Users/" + userID + "/points").setValue(0)
        //print("code: \(codePassed)")
        //ref?.child("Users/" + userID + "/companyID").setValue(codePassed)
        let storageRef = Storage.storage().reference().child(userID + "/profilePic.png")
        print("beforeIf")
        if let uploadData = UIImagePNGRepresentation(self.profilePic.image!){
            storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    print(error as Any)
                    print("sucks to suck")
                    return
                }
                if let profileImageUrl = metadata?.downloadURL()?.absoluteString{
                    self.ref.child("Users/" + userID + "/profileUrl").setValue(profileImageUrl)
                    print("hmmmm")
                }
                
            })
        }
        
    }

}



extension UIImage {
    
    func scaleImage(toSize newSize: CGSize) -> UIImage? {
        let newRect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height).integral
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        if let context = UIGraphicsGetCurrentContext() {
            context.interpolationQuality = .high
            let flipVertical = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: newSize.height)
            context.concatenate(flipVertical)
            context.draw(self.cgImage!, in: newRect)
            let newImage = UIImage(cgImage: context.makeImage()!)
            UIGraphicsEndImageContext()
            return newImage
        }
        return nil
    }
}


