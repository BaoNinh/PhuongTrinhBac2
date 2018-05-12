//
//  ViewController.swift
//  PhuongTrinhBac2
//
//  Created by ninh on 5/11/18.
//  Copyright © 2018 ninh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var txta: UITextField!
    @IBOutlet weak var txtb: UITextField!
    @IBOutlet weak var txtc: UITextField!
    @IBOutlet weak var btnketqua: UIButton!
    @IBOutlet weak var lblketqua: UILabel!
    @IBOutlet weak var btnnhaplai: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblketqua.isHidden = true
        self.txta.delegate = self
        self.txtb.delegate = self
        self.txtc.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*hàm kiểm tra dư liệu đầu vào aa chỉ cho phép nhập các số từ 0->9 , dấu - , dấu chầm và kiểm tra số âm nhập vào chỉ có 1 dấu trùe.*/
    func textField(_ tetField:UITextField, shouldChangeCharactersin range:NSRange, repleacementString string:String)->Bool{
        let inverseSet = NSCharacterSet(charactersIn: "0123456789-").inverted
        let components  = string.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")
        if filtered ==  string{
            return  true
        }
        else {
            if   string == "."{
                let countdog = tetField.text!.components(separatedBy:".").count - 1
                if(countdog == 0){
                    return true
                }
                else {
                    if (countdog > 0 && string == "."){
                        return false
                    }
                    else{
                        return true
                    }
                }
            }
            else{
                return false
            }
        }
        
        
    }
    //ham check so âm
    func checkCharacter(character:String)->Bool{
        let charIndex = character[character.index(character.startIndex, offsetBy: 0)]
        if(charIndex == "-"){
            var count:Int = 0
            for charac in character.characters{
                if(charac == "-" || (charac != "0" && charac != "1" && charac != "2" && charac != "3" && charac != "4" && charac != "5" && charac != "6" && charac != "7" && charac != "8" && charac != "9" && charac != ".")){
                    count = count + 1
                }
            }
            if count > 1 {
                return false
            }
            else{
                return true
            }
        }
        else{
            var count:Int = 0
            for charac in character.characters{
                if (charac != "0" && charac != "1" && charac != "2" && charac != "3" && charac != "4" && charac != "5" && charac != "6" && charac != "7" && charac != "8" && charac != "9"){
                    count = count + 1
                }
            }
            if count > 0 {
                return false
            }
            else{
                return true
            }
            
        }
    }
    //lam tron so
    func roundNumber(num:Double)->Double{
        let mu = pow(10.0,2.0)
        let r=round(num*mu)/mu
        return r
    }
    @IBAction func btnketqua(_ sender: Any) {
        lblketqua.isHidden = false
        if(    txta.text! == "" || txtb.text! == "" || txtc.text! == ""){
            lblketqua.text = "Bạn vui lòng nhập đủ a, b, c!!!"
        }
        else if(txta.text! == "." || txtb.text! == "." || txtc.text! == "."){
            lblketqua.text = "Bạn nhập sai định dạng"
        }
        else if(!checkCharacter(character: txta.text!) || !checkCharacter(character: txtb.text!) || !checkCharacter(character: txtc.text!)){
            lblketqua.text = "Bạn nhập sai định dạng"
        }
        else{
            let a:Double = Double(txta.text!)!
            let b:Double = Double(txtb.text!)!
            let c:Double = Double(txtc.text!)!
            
            if(a == 0 ){
                if(b == 0){
                    if(c == 0){
                        lblketqua.text = " Vô số nghiệm"
                    }
                    else{
                        lblketqua.text = " Vô nghiệm"
                    }
                }
                else if(c == 0){
                    lblketqua.text = " x = 0"
                }
                else{
                    let x = (-c/b)
                    lblketqua.text = " x =\(roundNumber(num: x))"
                }
            }
            else{
                let delta = (b*b) - (4*a*c)
                if(delta<0){
                    lblketqua.text = " Vô nghiệm"
                }
                else if(delta == 0){
                    lblketqua.text = " x1 = x2 = \(roundNumber(num: -b/(2*a)))"
                }
                else{
                    let x1 = (-b - sqrt(delta))/(2*a)
                    let x2 = (-b + sqrt(delta))/(2*a)
                    lblketqua.text = "x1 = \(roundNumber(num: x1))     x2 = \(roundNumber(num: x2))    "
                    
                }
            }
        }
        
    }
    @IBAction func btnnhaplai(_ sender: Any) {
        txta.text = ""
        txtb.text = ""
        txtc.text = ""
        lblketqua.isHidden = true
        
    }
    
    
}

