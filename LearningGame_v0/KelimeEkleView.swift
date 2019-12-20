//
//  KelimeEkleView.swift
//  LearningGame_v0
//
//  Created by Alperen on 12.03.2019.
//  Copyright © 2019 Alperen. All rights reserved.
//

import UIKit
import SQLite

class KelimeEkleView: UIViewController {
    

    @IBOutlet weak var EkleButtonStyle: UIButton!
    @IBOutlet weak var ingKelimeTextField: UITextField!
    @IBOutlet weak var trKelimeEkleTextField: UITextField!
    @IBOutlet weak var kelimeTuruTextField: UITextField!
    
    var db = DataBase()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Butonların görüntüsünü ayarlama
        EkleButtonStyle.layer.cornerRadius = 25

    }
    
    @IBAction func EkleTouch(_ sender: UIButton) {
                
        //Boş olup olmadığını kontrol ediyorum
        if (!ingKelimeTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty && !trKelimeEkleTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty && !kelimeTuruTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty) {
            
            let eklenenTarih = Date()
            
            db.KelimeEkle(ingilizcesi: ingKelimeTextField.text!, turkcesi: trKelimeEkleTextField.text!, turu: kelimeTuruTextField.text!, tarihi: eklenenTarih)
            //Eklendi pop-up uyarıyı veren kod
                let doneAlertController = UIAlertController(title: "Başırılı", message: "Kelime Eklendi!", preferredStyle: .alert)
                doneAlertController.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: {_ in }))
                
                self.present(doneAlertController, animated: true, completion: nil)

                ingKelimeTextField.text = nil
                trKelimeEkleTextField.text = nil
                kelimeTuruTextField.text = nil
                

        } else {
            //Eklenemediyse opo-up uyarı veren kod
            let failAlertController = UIAlertController(title: "Kelime Eklenemedi", message: "Gerekli alanların hepsini doldurduğunuzdan emin olun.", preferredStyle: .alert)
            failAlertController.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: {_ in }))
            
            self.present(failAlertController, animated: true, completion: nil)
            
        }
        
    }
 
    }

