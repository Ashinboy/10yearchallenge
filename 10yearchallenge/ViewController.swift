//
//  ViewController.swift
//  10yearchallenge
//
//  Created by Ashin Wang on 2021/12/25.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var pikachuImage: UIImageView!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var sliderYear: UISlider!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //自動博放需要的時間變數
    var timer: Timer?
    
    //年份控制變數
    var year = 1996
//    let pikachu = ["1996","1998","2000","2002","2004","2006","2008","2010","2013","2014","2016","2018"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //slider設定
    
    @IBAction func yearSlider(_ sender: UISlider) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        //slider的動作設定
        sliderYear.setValue(sliderYear.value.rounded(), animated: true)
        
        //slider每次移動以一年為單位
        let year = sliderYear.value.rounded()
        //日期設定為整數一年
        let date = dateFormatter.date(from: "\(Int(year))")
        pikachuChange(date: date!)
    }
    //datePicker 透過pikachuChange func操控對應時間
    
    @IBAction func yearPicker(_ sender: UIDatePicker) {
        pikachuChange(date: datePicker.date)
    }
   
    //自動播放設定
    
    @IBAction func autoPlay(_ sender: UISwitch) {
        if sender.isOn{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(yearControl), userInfo: nil, repeats: true)
        }else{
            timer?.invalidate() //關閉自動播放功能
            timer = nil
            year = 1996
        }
    }
    
    //使用switch時讓計時自動+1年
    
    @objc func yearControl() {
        self.year += 1
        if year > 2018{
            year = 1996
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        pikachuChange(date: dateFormatter.date(from: "\(year)")!)
    }
    
    //年份func設定
    
    func timechange(){
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy"
        
        pikachuImage.image = UIImage(named: "1996")
        datePicker.setDate(dateformatter.date(from: "1996")!, animated: true)
        sliderYear.setValue(1996, animated: true)
    }
    
    
    //圖片func設定
    
    func pikachuChange(date: Date){
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy"
        
        //將年份轉為字串
        let year = dateformatter.string(from: date)
        dateText.text = "\(year)的皮卡丘"
        pikachuImage.image = UIImage(named: "\(year)")
        //讓datePicker / slider跟著跑動
        datePicker.setDate(date, animated: true)
        sliderYear.value = Float(year)!
        
    }
    
    
    
}

