//
//  DataT.swift
//  Musipfy
//
//  Created by Felipe Morales Torres on 15/04/21.
//

import UIKit
import Foundation

class DataT: NSObject {
    
    //data to store all data from Json
    var dataMu:DataMu

    override init() {
        dataMu = DataMu()

    }
    func readAllData(tableViewToReload:UITableView){
        self.dataMu.getDataFromJsonUrl(urlString: "https://jsonplaceholder.typicode.com/posts") {(result) in
           switch result {
           case .success(let data):
            self.dataMu.parse(jsonD: data, type: "Post")
           case .failure(let error):
               print(error)
           }
       }
        self.dataMu.getDataFromJsonUrl(urlString: "https://jsonplaceholder.typicode.com/comments") {(result) in
           switch result {
           case .success(let data):
            self.dataMu.parse(jsonD: data, type: "Comment")
           case .failure(let error):
               print(error)
           }
       }

        self.dataMu.getDataFromJsonUrl(urlString: "https://jsonplaceholder.typicode.com/albums") {(result) in
           switch result {
           case .success(let data):
            self.dataMu.parse(jsonD: data, type: "Album")
            
           case .failure(let error):
               print(error)
           }
       }


        self.dataMu.getDataFromJsonUrl(urlString: "https://jsonplaceholder.typicode.com/photos") {(result) in
           switch result {
           case .success(let data):
            self.dataMu.parse(jsonD: data, type: "Photo")
            //reloading data in table when function finishes successfully
            tableViewToReload.reloadData()
           case .failure(let error):
               print(error)
           }
       }

        self.dataMu.getDataFromJsonUrl(urlString: "https://jsonplaceholder.typicode.com/todos") {(result) in
           switch result {
           case .success(let data):
            self.dataMu.parse(jsonD: data, type: "Todo")
           case .failure(let error):
               print(error)
           }
       }
        

        /*self.dataMu.getDataFromJsonUrl(urlString: "https://jsonplaceholder.typicode.com/users") {(result) in
           switch result {
           case .success(let data):
            self.dataMu.parse(jsonD: data, type: "User")
           case .failure(let error):
               print(error)
           }
       }*/

    }
    
}



extension DataT: UITableViewDataSource{
        
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print("Reloaded")
            return dataMu.Albums.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            print("row \(indexPath.row)")
            let item:Album = dataMu.Albums[indexPath.row]
            cell.textLabel?.text = item.title
            return cell
        }
    
        //to edit row
    /*
    func tableView( _ tableView:UITableView, commit editingStyle:UITableViewCell.EditingStyle, forRowAt indexPath:IndexPath){
        dataMu.Albums.remove(at: indexPath.row)
        saveItems()
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
        tableView.endUpdates()
        tableView.reloadData()
        
    }*/
    
}
