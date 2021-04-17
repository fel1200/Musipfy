//
//  AlbumViewController.swift
//  Musipfy
//
//  Created by Felipe Morales Torres on 16/04/21.
//

import UIKit

class AlbumViewController: UIViewController, UITableViewDelegate {

    var idAlbumSelected:Int = 0
    var dataT:DataT?
    var photoSelected:Photo?
    @IBOutlet weak var tableAlbumViewController: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableAlbumViewController.register(UITableViewCell.self, forCellReuseIdentifier: "CellPhoto")
        tableAlbumViewController.dataSource = self
        tableAlbumViewController.delegate = self

        
    }
    //MARK: TableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        photoSelected = self.dataT?.dataMu.photosFromAlbum[indexPath.row]
        
/*            selectedItem = self.todoList.getItem(index: indexPath.row)*/

        //segue between viewControllers
        self.performSegue(withIdentifier: "showPhotoDetail", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoViewController = segue.destination as? PhotoViewController {
            photoViewController.photoSelected = self.photoSelected
            photoViewController.titlePhotoSelected = self.photoSelected?.title
        }
    }
}


extension AlbumViewController: UITableViewDataSource{
        
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataT?.fillPhotosFromAlbum(idAlbum:idAlbumSelected)
        return self.dataT?.dataMu.photosFromAlbum.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellPhoto", for: indexPath)
            print("row \(indexPath.row)")
            let item:Photo = (self.dataT?.dataMu.photosFromAlbum[indexPath.row])!
            cell.textLabel?.text = item.title
            return cell
        }
    
 
    
}
