//
//  DataBase.swift
//  LearningGame_v0
//
//  Created by Alperen on 14.03.2019.
//  Copyright © 2019 Alperen. All rights reserved.
//

import Foundation
import SQLite

class DataBase {
    //Kelimeleri tutacağım table'ı açıyorum
    var dataBase: Connection!
    
    let kelimelerTable = Table("kelimeler")
    let kelimeId = Expression<Int>("id")
    let ingKelime = Expression<String>("İngilizce")
    let trKelime = Expression<String>("Türkçe")
    let kelimeTuru = Expression<String>("Türü")
    let ogrenmeSeviyesi = Expression<Int>("Seviye")
    let eklemeTarihi = Expression<Date>("Tarih")
    
    
    init() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectory.appendingPathComponent("kelimeler3").appendingPathExtension("sqlite3")
            let dataBase = try Connection(fileURL.path)
            self.dataBase = dataBase
            
            
        } catch {
            print(error)
        }
        
        let createTable = self.kelimelerTable.create { (table) in
            table.column(self.kelimeId, primaryKey: true)
            table.column(self.ingKelime, unique: true)
            table.column(self.trKelime)
            table.column(self.kelimeTuru)
            table.column(self.ogrenmeSeviyesi)
            table.column(self.eklemeTarihi)
             }
        do {
            try self.dataBase.run(createTable)
        } catch {
            print(error)
        }
        
        
    }
    //Tabloya kelime ekleme
    func KelimeEkle(ingilizcesi ing: String, turkcesi tr: String, turu tur:String, tarihi tarih: Date) {
        
        let kelimeEkle = self.kelimelerTable.insert(self.ingKelime <- ing, self.trKelime <- tr, self.kelimeTuru <- tur, self.ogrenmeSeviyesi <- 1, self.eklemeTarihi <- tarih)
        do {
            try self.dataBase.run(kelimeEkle)
        } catch  {
            print(error)
        }
    }
 
    //Egzersizde çıkıcak kelimeleri bir sözlük yapısına eklemek için teker teker liste sınıfı içine gönderiyorum sonra dönen değeri burda açtığım bir sözlük yapısana SozlukleriEkleme fonksyonu kullanarak atıyorum. Daha sonra bu fonkyonu egzersiz yapta çağırıp içi sorulucak kelimelerle dolu olan sözlük yapısını döndürücem
    func IngVeTr() -> [String:String] {
        
        var ingToTr = [String:String]()
        
        do {
            let kelimeler = try self.dataBase.prepare(kelimelerTable)
            for kelime in kelimeler {
                let gunSayısı = Liste(eklenenTarih: kelime[self.eklemeTarihi]).aradanGecenZaman
                
                SozlukleriEkleme(left: &ingToTr, right: Liste().bugununLİstesiniCıkar(aradanGecenGunSayısı: gunSayısı, ogrenmeSeviyesi: kelime[self.ogrenmeSeviyesi], ingKelime: kelime[self.ingKelime], trKelime: kelime[self.trKelime]))
            }
            
        } catch  {
            print(error)
        }
        
        return ingToTr
    }
    //Burda kelimelerin öğrenim seviyesi 4 ise öğrenildiği ayı ve o ayda ne kadar kelime öğrenildiğini sözlük yapısı içine atılıp geri döndürülür
    func ogrenilenKelimelerListesi() -> [Int:Int] {
        var ogrenilenKelimeler = [Int:Int]()
        
        do {
            let kelimeler = try self.dataBase.prepare(kelimelerTable)
            for kelime in kelimeler {
                let calendar = Calendar.current
                let ay = calendar.component(.month, from: kelime[self.eklemeTarihi])
                if kelime[self.ogrenmeSeviyesi] == 4 {
                    
                if ogrenilenKelimeler[ay] == nil {
                    ogrenilenKelimeler[ay] = 1
                }
                else {
                    ogrenilenKelimeler[ay]! += 1
                    }
                }
            }
            
        } catch  {
            print(error)
        }
        return ogrenilenKelimeler
    }
    //Sözlükleri eklemek için kullandığım fonksyon
    func SozlukleriEkleme <K, V> (left: inout [K:V], right: [K:V]) {
        for (k, v) in right {
            left[k] = v
        }
    }
    //Egzersiz yapta doğru şıkkı işaretlerse bu fonkyonu çağırır. Öğrenim seviyesi 1 artarken doğru bildiği tarihi de table'a atılır
    func OgrenmeSeviyesiniArttır(ogrenilenIngKelimeId: Int) {
        let degistirilmeTarihi = Date()
        let degisecekKelimeId = self.kelimelerTable.filter(self.kelimeId == ogrenilenIngKelimeId)
        let kelimeGuncelle = degisecekKelimeId.update(self.ogrenmeSeviyesi <- self.ogrenmeSeviyesi+1, self.eklemeTarihi <- degistirilmeTarihi)
        do {
            try self.dataBase.run(kelimeGuncelle)
        } catch  {
            print(error)
        }
    }
    //Aynı şekilde sadece yanlış yaparsa öğrenim seiviyesi 1 de döner
    func OgrenmeSeviyesiSıfırla(sifirlanacakKelimeId: Int) {
        let degistirilmeTarihi = Date()
        let degisecekKelimeId = self.kelimelerTable.filter(self.kelimeId == sifirlanacakKelimeId)
        let kelimeGuncelle = degisecekKelimeId.update(self.ogrenmeSeviyesi <- 1, self.eklemeTarihi <- degistirilmeTarihi)
        do {
            try self.dataBase.run(kelimeGuncelle)
        } catch  {
            print(error)
        }
    }
    //Öğrenim seviyesini artıtıp sıfırlamak için id bulmak için kullandığım fonksyon
    func KelimeIdBulma(idBulunucakKelime: String) -> Int {
        
        var bulunanId = Int()
        do {
            let kelimeler = try self.dataBase.prepare(kelimelerTable)
            for kelime in kelimeler {
                if kelime[self.ingKelime] == idBulunucakKelime {
                    bulunanId = kelime[self.kelimeId]
                }
            }
            
        } catch  {
            print(error)
        }
        return bulunanId
    }
    //Egzersiz Yapta diğer 3 yanlış şıkkı doldurmak için eklenilen tüm türkçe kelimeleri bir diziye atıp döndürdüm
    func TurkceKelimeler() -> [String] {
        var trListe = [String]()
        do {
            let kelimeler = try self.dataBase.prepare(kelimelerTable)
            for kelime in kelimeler {
                trListe.append(kelime[self.trKelime])
            }
        } catch  {
            print(error)
        }
        return trListe
    }
    
}
