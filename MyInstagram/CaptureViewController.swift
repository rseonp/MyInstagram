//
//  CaptureViewController.swift
//  Instagram2.0
//
//  Created by Victor Li Wang on 3/1/16.
//  Copyright © 2016 Victor Li Wang. All rights reserved.
//

import UIKit
import Parse

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!
    
    var editedImage: UIImage?
    var caption: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onImagePress(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        //        vc.sourceType = UIImagePickerControllerSourceType.Camera
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func onPostPress(sender: AnyObject) {
        print("onpostpress")
        caption = captionTextView.text
        print(caption)
        UserMedia.postUserImage(editedImage, withCaption: caption, withCompletion: nil)
        photoImageView.image = nil
        captionTextView.text = nil
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            print("didfinishpickingmediawithinfo")
//            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            editedImage = info[UIImagePickerControllerEditedImage] as? UIImage
            photoImageView.image = editedImage
            self.dismissViewControllerAnimated(false, completion: nil)
            
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
