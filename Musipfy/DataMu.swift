//
//  DataMu.swift
//  Musipfy
//
//  Created by Felipe Morales Torres on 15/04/21.
//
//class to get data from Json files


import UIKit

class DataMu: NSObject {
    
    var Posts : [Post]
    var Comments : [Comment]
    var Albums : [Album]
    var Photos : [Photo]
    var Todos : [Todo]
    //var Users : [User]

    var photosFromAlbum :[Photo]
    override init() {
        //creating empty arrays to use it
        Posts = [Post]()
        Comments = [Comment]()
        Albums = [Album]()
        Photos = [Photo]()
        Todos = [Todo]()
        //Users = [User]()
        
        photosFromAlbum = [Photo]()
    }
    
    func getDataFromJsonUrl(urlString:String, complete: @escaping (Result<Data,Error>)->Void){
        if let urlS = URL(string:urlString){
            let URLSes = URLSession(configuration:.default).dataTask(with: urlS){ (data,response,error) in
                if let error = error{
                    complete(.failure(error))
                }
                if let data = data{
                    complete(.success(data))
                }
            }
            URLSes.resume()
        }
    }
    
    //function to parse data from jsonFile
    
    func parse(jsonD:Data, type:String){
        do{
            switch type {
            case "Post":
                Posts = try JSONDecoder().decode([Post].self, from: jsonD)
                print("Posts \(Posts.count)")
            case "Comment":
                Comments = try JSONDecoder().decode([Comment].self, from: jsonD)
                print("Comments \(Comments.count)")
            case "Album":
                Albums = try JSONDecoder().decode([Album].self, from: jsonD)
                print("Albums \(Albums.count)")
            case "Photo":
                Photos = try JSONDecoder().decode([Photo].self, from: jsonD)
                print("Photos \(Photos.count)")
            case "Todo":
                Todos = try JSONDecoder().decode([Todo].self, from: jsonD)
                print("Todos \(Todos.count)")
            default:
                print("Incorrect type")
            }
        }catch{
            print("decode error")
        }
    }
}

struct Post:Codable{
    var userId:Int
    var id:Int
    var title:String
    var body:String
}

struct Comment:Codable{
    var postId:Int
    var id:Int
    var name:String
    var email:String
    var body:String
}


struct Album:Codable{
    var userId:Int
    var id:Int
    var title:String
}

struct Photo:Codable{
    var albumId:Int
    var id:Int
    var title:String
    var url:String
    var thumbnailUrl:String
}


struct Todo:Codable{
    var userId:Int
    var id:Int
    var title:String
    var completed:Bool
}

/*struct User:Codable{
    var userId:Int
    var id:Int
    var title:String
    var completed:Bool
}*/
