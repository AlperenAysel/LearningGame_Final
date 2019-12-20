//
//  TestYapStartView.swift
//  LearningGame_v0
//
//  Created by Alperen on 12.03.2019.
//  Copyright © 2019 Alperen. All rights reserved.
//

import UIKit

class TestYapStartView: UIViewController {

    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var VazgecButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Butonların görüntüsünü ayarlama
        StartButton.layer.cornerRadius = 0.5 * StartButton.bounds.size.width
        VazgecButton.layer.cornerRadius = 0.5 * VazgecButton.bounds.size.width

       
    }

}
