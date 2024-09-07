//
//  ViewController.swift
//  FleavagAndMutt
//
//  Created by 陳曉潼 on 2024/9/6.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var boneImageView: UIImageView!
    @IBOutlet weak var fishImageView: UIImageView!
    
    @IBOutlet weak var boneSlider: UISlider!
    @IBOutlet weak var fishSlider: UISlider!
    
    @IBOutlet weak var hurtCatImageView: UIImageView!
    @IBOutlet weak var hurtDogImageView: UIImageView!
    
    @IBOutlet weak var attackCatImageView: UIImageView!
    @IBOutlet weak var attackDogImageView: UIImageView!
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var dogImageView: UIImageView!
    
    @IBOutlet weak var heartImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 一開始先把魚骨頭變成透明 因為位置在狗狗與貓貓的中心點
        fishImageView.alpha = 0
        // 一開始先把骨頭變成透明 因為位置在狗狗與貓貓的中心點
        boneImageView.alpha = 0
        // 一開始先把受傷的貓與狗變成透明 因為要受傷的時候才出現！
        hurtCatImageView.alpha = 0
        hurtDogImageView.alpha = 0
        // 一開始先把愛心隱藏起來 狗與貓在一起時才出現
        heartImageView.alpha = 0
        catImageView.alpha = 0
        dogImageView.alpha = 0
        
    }
        // 魚骨頭順時針拋出function
        // 雖然一開始算出的中心點是372半徑是372但我拉了以後覺得半徑應該為335比較適合
        func fishLocation(degree:CGFloat){
            fishImageView.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi/180*degree).translatedBy(x: 0 , y: -335)
        }
    
        // 骨頭逆時針拋出function
        func boneLocation(degree:CGFloat){
            boneImageView.transform = CGAffineTransform.identity.rotated(by: -CGFloat.pi/180*degree).translatedBy(x: 0, y: -335)
        }

    

    @IBAction func boneSlider(_ sender: Any) {
        boneLocation(degree: 0)
        // 如果骨頭Slider在0的地方表示還沒有要拋出骨頭 所以不顯示alpha=0
        // 骨頭Slider不在0的地方表示要拋出骨頭 所以顯示骨頭alpha=1
        if boneSlider.value == 0 {
            boneImageView.alpha = 0
        }else{
            boneImageView.alpha = 1
        }
        // 執行拋出骨頭的動作
        boneLocation(degree: CGFloat(boneSlider.value/2+270))
        // 如果骨頭碰到貓 就是拉到最大值360的時候出現受傷貓貓 原本攻擊貓貓透明
        // 否則受傷貓貓都是透明狀態 攻擊貓貓出現
        if boneSlider.value == 360 {
            hurtCatImageView.alpha = 1
            attackCatImageView.alpha = 0
            fishSlider.isHidden = true
        }else{
            hurtCatImageView.alpha = 0
            attackCatImageView.alpha = 1
            fishSlider.isHidden = false
        }


    }
    
    @IBAction func fishSlider(_ sender: Any) {
        fishLocation(degree: 0)
        // 如果魚骨頭Slider在0的地方表示還沒有要拋出魚骨頭 所以不顯示alpha=0
        // 魚骨頭Slider不在0的地方表示要拋出骨頭 所以顯示魚骨頭alpha=1
        if fishSlider.value == 0 {
            fishImageView.alpha = 0
        }else{
            fishImageView.alpha = 1
        }
        // 執行拋出魚骨頭的動作
        fishLocation(degree: CGFloat(fishSlider.value/2+270))
        // 如果魚骨頭碰到狗 就是拉到最大值360的時候出現受傷狗狗 原本攻擊狗狗透明
        // 否則受傷狗狗都是透明狀態 攻擊狗狗出現
        if fishSlider.value == 360 {
            hurtDogImageView.alpha = 1
            attackDogImageView.alpha = 0
            boneSlider.isHidden = true
        }else{
            hurtDogImageView.alpha = 0
            attackDogImageView.alpha = 1
            boneSlider.isHidden = false
        }
    }
    
    
    @IBAction func armistice(_ sender: Any) {
        // 休戰以後讓全部的圖片Slider都消失
        boneImageView.alpha = 0
        fishImageView.alpha = 0
        attackCatImageView.alpha = 0
        attackDogImageView.alpha = 0
        hurtCatImageView.alpha = 0
        hurtDogImageView.alpha = 0
        boneSlider.isHidden = true
        fishSlider.isHidden = true
        catImageView.frame.origin.x = 300
        dogImageView.frame.origin.x = 300
        catImageView.alpha = 1
        dogImageView.alpha = 1
        heartImageView.alpha = 1
    }
    

    @IBAction func fight(_ sender: Any) {
        catImageView.frame.origin.x = 0
        dogImageView.frame.origin.x = 600
        catImageView.alpha = 0
        dogImageView.alpha = 0
        heartImageView.alpha = 0
        attackCatImageView.alpha = 1
        attackDogImageView.alpha = 1
        boneSlider.isHidden = false
        fishSlider.isHidden = false
    }
    
    
    
    
    
}

