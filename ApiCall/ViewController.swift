//
//  ViewController.swift
//  ApiCall
//
//  Created by Md Maruf Prodhan on 1/13/20.
//  Copyright © 2020 Md Maruf Prodhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    private let networkingClient = NetworkingClient()
    
    @IBAction func callButton(_ sender: Any) {
        guard let urlToExecute = URL(string: "https://api.darksky.net/forecast/352824027cc68ebcdf82edd59df645fd/37.8267,-122.4233") else {
            return
        }
        
        networkingClient.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            }
            else if let json = json {
                self.textView.text = json.description
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}


