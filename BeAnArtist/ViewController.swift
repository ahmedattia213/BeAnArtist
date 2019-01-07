//
//  ViewController.swift
//  BeAnArtist
//
//  Created by Ahmed Amr on 1/7/19.
//  Copyright © 2019 Ahmed Amr. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let canvas = Canvas()
    override func loadView() {
        self.view = canvas
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.backgroundColor = UIColor.white
    }
    
    
}

