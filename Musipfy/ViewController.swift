//
//  ViewController.swift
//  Musipfy
//
//  Created by Felipe Morales Torres on 15/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

   
    
    @IBOutlet weak var tableView: UITableView!

    let dataT = DataT()
    var idAlbumSelected:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //reading data from json files
        dataT.readAllData(tableViewToReload:tableView)


        //setting tableViewDataSource
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = dataT
        tableView.delegate = self


    }
    //MARK: TableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var albumSelected:Album = self.dataT.dataMu.Albums[indexPath.row]
        idAlbumSelected = albumSelected.id
        
/*            selectedItem = self.todoList.getItem(index: indexPath.row)*/

        //segue between viewControllers
        self.performSegue(withIdentifier: "showAlbumDetail", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let albumViewController = segue.destination as? AlbumViewController {
            albumViewController.idAlbumSelected = idAlbumSelected
            albumViewController.dataT = self.dataT
        }
    }

}



