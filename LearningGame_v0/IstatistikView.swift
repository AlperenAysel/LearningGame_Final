//
//  IstatistikView.swift
//  LearningGame_v0
//
//  Created by Alperen on 9.05.2019.
//  Copyright © 2019 Alperen. All rights reserved.
//

import UIKit
import Charts

class IstatistikView: UIViewController {

    @IBOutlet weak var MyPieChartView: PieChartView!
    
    var db = DataBase()
    var tarihSayi = [Int:Int]()
    var tarih = [Int]()
    var sayi = [Int]()
    
    
    var ocakEntry = PieChartDataEntry()
    var subatEntry = PieChartDataEntry()
    var martEntry = PieChartDataEntry()
    var nisanEntry = PieChartDataEntry()
    var mayisEntry = PieChartDataEntry()
    var haziranEntry = PieChartDataEntry()
    var temmuzEntry = PieChartDataEntry()
    var agustosEntry = PieChartDataEntry()
    var eylulEntry = PieChartDataEntry()
    var ekimEntry = PieChartDataEntry()
    var kasimEntry = PieChartDataEntry()
    var aralikEntry = PieChartDataEntry()
    
    var numberOfDateEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tarihSayi = db.ogrenilenKelimelerListesi()
        // tarihSayi içindeki her anahtar yani ay için değeri yani ne kadar kelime olduğunu grafikte göstericeğim değerlere attım
        for (key, value) in tarihSayi {
            
            if key == 1 {
                ocakEntry.value = Double(value)
                
            }
            else if key == 2 {
                subatEntry.value = Double(value)
                
            }
            else if key == 3 {
                martEntry.value = Double(value)
                
            }
            else if key == 4 {
                nisanEntry.value = Double(value)
                
            }
            else if key == 5 {
                mayisEntry.value = Double(value)
                print("a")
            }
            else if key == 6 {
                haziranEntry.value = Double(value)
                
            }
            else if key == 7 {
                temmuzEntry.value = Double(value)
                
            }
            else if key == 8 {
                agustosEntry.value = Double(value)
                
            }
            else if key == 9 {
                eylulEntry.value = Double(value)
                
            }
            else if key == 10 {
                ekimEntry.value = Double(value)
                
            }
            else if key == 11 {
                kasimEntry.value = Double(value)
                
            }
            else if key == 12 {
                aralikEntry.value = Double(value)
                
            }
        }
        
        //Ayların Adının yazmasını sağlayan kod
        ocakEntry.label = "Ocak"
        subatEntry.label = "Şubat"
        martEntry.label = "Mart"
        nisanEntry.label = "Nisan"
        mayisEntry.label = "Mayıs"
        haziranEntry.label = "Haziran"
        temmuzEntry.label = "Temmuz"
        agustosEntry.label = "Ağustos"
        eylulEntry.label = "Eylül"
        ekimEntry.label = "Ekim"
        kasimEntry.label = "Kasım"
        aralikEntry.label = "Aralık"
        
        numberOfDateEntries = [ocakEntry, subatEntry, martEntry, nisanEntry, mayisEntry, haziranEntry, temmuzEntry, agustosEntry, eylulEntry, ekimEntry, kasimEntry, aralikEntry]
        
        updateChartDate()
    }
    

    func updateChartDate() {
        let dataCharSet = PieChartDataSet(entries: numberOfDateEntries, label: "")
        let charData = PieChartData(dataSet: dataCharSet)
        
        let colors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) , #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)]
        dataCharSet.colors = colors
        MyPieChartView.data = charData
    }

}
