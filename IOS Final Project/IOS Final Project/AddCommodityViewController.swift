//
//  AddCommodityViewController.swift
//  IOS Final Project
//
//  Created by Apple on 17/6/15.
//  Copyright © 2017年 Albert. All rights reserved.
//

import UIKit

class AddCommodityViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate {
    
    var which = 1
    
    @IBOutlet weak var commodityName: UITextField!
    
    @IBOutlet weak var pickCategory: UIPickerView!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var commodityDes: UITextView!
    
    @IBOutlet weak var placeholderLabel: UILabel!
    
    @IBOutlet weak var imageOne: UIButton!
    
    @IBOutlet weak var imageTwo: UIButton!
    
    @IBOutlet weak var price: UITextField!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmButton.layer.masksToBounds = true
        confirmButton.layer.cornerRadius = 8.0
        
 //       pickCategory.dataSource = self
        pickCategory.delegate = self
        pickCategory.selectRow(1,inComponent:0,animated:true)
        pickCategory.showsSelectionIndicator = true
        
        commodityName.delegate = self
        commodityDes.delegate = self
        
        placeholderLabel.font = UIFont.systemFont(ofSize: 13)
        placeholderLabel.text = "请输入商品描述"
 //       commodityDes.addSubview(self.placeholderLabel)
        placeholderLabel.textColor = UIColor.init(colorLiteralRed: 199/256, green: 199/256, blue: 205/256, alpha: 1)

        imagePicker.delegate = self
        
        price.keyboardType = UIKeyboardType.numbersAndPunctuation
        price.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return 6
    }
    
 /*   func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch(row){
        case 0:return "课本"
        case 1:return "英语"
        case 2:return "计算机"
        case 3:return "考研/公务员"
        case 4:return "CFA/ACCA"
        case 5:return "兴趣读物"
        default:return ""
        }
    }*/
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 20
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label = UILabel()
        
        label.sizeToFit()
        label.font = UIFont(name: "Bobz Type", size: 13)
        label.textAlignment = NSTextAlignment.center
        
        switch(row){
        case 0:label.text = "课本"
        case 1:label.text = "英语"
        case 2:label.text = "计算机"
        case 3:label.text = "考研/公务员"
        case 4:label.text = "CFA/ACCA"
        case 5:label.text = "兴趣读物"
        default:break
        }
        
        return label
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print("textViewShouldBeginEditing")
        placeholderLabel.isHidden = true // 隐藏
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        print("textViewShouldEndEditing")
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeholderLabel.isHidden = false  // 显示
        }
        else{
            placeholderLabel.isHidden = true  // 隐藏
        }
        print("textViewDidEndEditing")
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print("textViewDidChange")
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print("shouldChangeTextInRange")
        if text == "\n"{ // 输入换行符时收起键盘
            textView.resignFirstResponder() // 收起键盘
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.contains("\n"){ // 输入换行符时收起键盘
            textField.resignFirstResponder() // 收起键盘
        }
        return true
    }
    
    @IBAction func addImageOne(_ sender: UIButton) {
        which = 1
        openCamera()
    }
    
    @IBAction func addImageTwo(_ sender: UIButton) {
        which = 2
        openCamera()
    }
    
    func openCamera() {
        
        let optionMenu = UIAlertController(title: nil, message: "您想从哪里获得照片呢?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let photoLibraryOption = UIAlertAction(title: "照片⛵️", style: UIAlertActionStyle.default, handler: { (alert: UIAlertAction!) -> Void in
            // 弹出 照片库
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.modalPresentationStyle = .popover
            self.present(self.imagePicker, animated: true, completion: nil)
            
        })
        let cameraOption = UIAlertAction(title: "相机📷", style: UIAlertActionStyle.default, handler: { (alert: UIAlertAction!) -> Void in
            
            //弹出 相机
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .camera
            self.imagePicker.modalPresentationStyle = .popover
            self.present(self.imagePicker, animated: true, completion: nil)
            
        })
        let cancelOption = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            //取消
           // self.dismiss(animated: true, completion: nil)
        })
        
        
        optionMenu.addAction(photoLibraryOption)
        optionMenu.addAction(cancelOption)
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) == true {
            optionMenu.addAction(cameraOption)} else {
            print ("I don't have a camera.")
        }
        
        
        self.present(optionMenu, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        print("finished picking image")
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //handle media here i.e. do stuff with photo
        
        let img = info[UIImagePickerControllerOriginalImage] as! UIImage
        if(which == 1){
            imageOne.setBackgroundImage(img, for: .normal)
        }
        else{
            imageTwo.setBackgroundImage(img, for: .normal)
        }
        
        
        
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //what happens when you cancel
        //which, in our case, is just to get rid of the photo picker which pops up
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addCommodity(_ sender: UIButton) {
        let row = pickCategory.selectedRow(inComponent: 0)
        var label = ""
        
        switch(row){
        case 0:label = "课本"
        case 1:label = "英语"
        case 2:label = "计算机"
        case 3:label = "考研/公务员"
        case 4:label = "CFA/ACCA"
        case 5:label = "兴趣读物"
        default:break
        }
        let alert = UIAlertController(title: "发布失败", message: "暂不支持，程序员小哥正在奋力完善服务器功能", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
       // addNewCommodity(name: commodityName.text!, label: label, intro: commodityDes.text!, photo1: "1", photo2: "2", price: price.text!, seller: currentUser.user_id)
    }
  //  func
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
