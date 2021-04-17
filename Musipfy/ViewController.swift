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
        tableView.dataSource = self
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

//MARK: TableViewD DataSource Methods

extension ViewController: UITableViewDataSource{
        
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print("Reloaded")
        return self.dataT.dataMu.Albums.count
        
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            print("row \(indexPath.row)")
            let item:Album = self.dataT.dataMu.Albums[indexPath.row]
            cell.textLabel?.text = item.title
            return cell
        }
    
 
    
}


