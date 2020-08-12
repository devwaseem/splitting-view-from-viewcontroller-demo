//
//  ViewController.swift
//  splitting-view-from-viewcontroller-demo
//
//  Created by Waseem Akram on 12/08/20.
//  Copyright © 2020 Waseem Akram. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TrafficViewDelegate {

    let trafficView = TrafficView()
    
    override func viewDidLoad() {
        view = trafficView
        trafficView.delegate = self
    }
    
    func showAlert(title:String){
        let alertVC = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alertVC.addAction(okButton)
        present(alertVC, animated: true)
    }
    
    func redButtonTapped() {
        showAlert(title: "Stop!")
    }
    
    func yellowButtonTapped() {
        showAlert(title: "Get Ready!")
    }
    
    func greenButtonTapped() {
         showAlert(title: "Go Go Go!")
    }
}

