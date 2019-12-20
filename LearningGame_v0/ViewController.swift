//
//  ViewController.swift
//  LearningGame_v0
//
//  Created by Alperen on 12.03.2019.
//  Copyright © 2019 Alperen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var KelimeEkleButton: UIButton!
    @IBOutlet weak var TestEtButton: UIButton!
    @IBOutlet weak var IstatistikBtton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Butonların görüntüsünü ayarlama
        KelimeEkleButton.layer.cornerRadius = 25
        TestEtButton.layer.cornerRadius = 25
        IstatistikBtton.layer.cornerRadius = 25
        
    }


}



