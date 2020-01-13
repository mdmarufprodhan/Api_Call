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
    @IBAction func call(_ sender: Any) {
        guard let url = URL(string: "https://api.darksky.net/forecast/352824027cc68ebcdf82edd59df645fd/37.8267,-122.4233")else{return
            
        }
        let session = URLSession.shared
        session.dataTask(with: url){( data,response,error)in
            if let response = response{
                print(response)
            }
            if let data = data{
                print(data)
                self.textView.text = String(bytes: data, encoding: .utf8)
            }
        }.resume()
    
    
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

