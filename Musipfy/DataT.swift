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
    
    func fillPhotosFromAlbum(idAlbum:Int){
        self.dataMu.photosFromAlbum = self.dataMu.Photos.filter{$0.albumId == idAlbum}
        
    }
    
    func readAllData(tableViewToReload:UITableView, spinner:LoadingViewController){
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
            spinner.willMove(toParent: nil)
                    spinner.view.removeFromSuperview()
                    spinner.removeFromParent()
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



