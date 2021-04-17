//
//  PhotoViewController.swift
//  Musipfy
//
//  Created by Felipe Morales Torres on 16/04/21.
//

import UIKit

class PhotoViewController: UIViewController {

    
    var photoSelected:Photo?
    var titlePhotoSelected:String?
    
    @IBOutlet weak var imagePhoto: UIImageView!
    @IBOutlet weak var labelTitlePhoto: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        labelTitlePhoto.text = titlePhotoSelected
        
        let url = URL(string: photoSelected!.thumbnailUrl)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        imagePhoto.image = UIImage(data: data!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
