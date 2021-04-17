//
//  LoadingViewController.swift
//  Musipfy
//
//  Created by Felipe Morales Torres on 16/04/21.
//

import UIKit

class LoadingViewController: UIViewController {

    var loadingView = UIActivityIndicatorView(style: .whiteLarge)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = UIView()
                view.backgroundColor = UIColor(white: 0, alpha: 0.7)

                loadingView.translatesAutoresizingMaskIntoConstraints = false
                loadingView.startAnimating()
                view.addSubview(loadingView)

                loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
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
