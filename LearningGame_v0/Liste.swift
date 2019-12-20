//
//  Zaman.swift
//  LearningGame_v0
//
//  Created by Alperen on 14.03.2019.
//  Copyright © 2019 Alperen. All rights reserved.
//

import Foundation

class Liste {
    
    var aradanGecenZaman = -1
    var bugununKelimeri = ["":""]
    //İnit ile tarih gönderildiğinde aradan geçen günü hesaplar
    init(eklenenTarih: Date) {
        let calender = Calendar.current
        let simdikiTarih = Date()
        
        let veryLongTime = calender.dateComponents([.day], from: eklenenTarih, to: simdikiTarih).day
        if veryLongTime != nil {
            self.aradanGecenZaman = veryLongTime!
        }
        }
    //Aynı kelimeleri tutmasın diye sözlük yapısını boşaltır
    init() {
        bugununKelimeri.removeAll()
       
        
    }
    //Aradan geçen gün ve öğrenim seviyesi uygunsa o kelime sözlük yapısa ekliyip onu geri döndürür
    func bugununLİstesiniCıkar(aradanGecenGunSayısı: Int, ogrenmeSeviyesi: Int, ingKelime: String, trKelime: String) -> [String:String] {
        if aradanGecenGunSayısı >= 1, ogrenmeSeviyesi == 1 {
            bugununKelimeri[ingKelime] = trKelime
        }
        else if aradanGecenGunSayısı >= 7, ogrenmeSeviyesi == 2 {
            bugununKelimeri[ingKelime] = trKelime
        }
        else if aradanGecenGunSayısı >= 30, ogrenmeSeviyesi == 3 {
            bugununKelimeri[ingKelime] = trKelime
        }
        else if aradanGecenGunSayısı >= 180, ogrenmeSeviyesi == 4 {
            bugununKelimeri[ingKelime] = trKelime
        }
        return bugununKelimeri
    }
    
    
    }
