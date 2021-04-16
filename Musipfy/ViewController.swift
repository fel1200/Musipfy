//
//  ViewController.swift
//  Musipfy
//
//  Created by Felipe Morales Torres on 15/04/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dataT = DataT()
        dataT.readAllData()
        
    }


}

