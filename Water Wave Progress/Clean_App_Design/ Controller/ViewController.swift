//
//  ViewController.swift
//  Clean_App_Design
//
//  Created by Md Murad Hossain on 31/10/22.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var view3: UIView!
    
    
    let waterWaveView = WaterWaveView()
    
    let dr: TimeInterval = 10.0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(waterWaveView)
        
        waterWaveView.setupProgress(waterWaveView.progress)
       
        view1.layer.cornerRadius = 15
        view2.layer.cornerRadius = 15
        view3.layer.cornerRadius = 15
        
        
        NSLayoutConstraint.activate([
            waterWaveView.widthAnchor.constraint(equalToConstant: screenWidth*0.5),
            waterWaveView.heightAnchor.constraint(equalToConstant: screenWidth*0.5),
            //waterWaveView.topAnchor.constraint(equalTo: view.centerYAnchor)
            waterWaveView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 170),
            waterWaveView.centerXAnchor.constraint(greaterThanOrEqualTo: view.centerXAnchor, constant: -10)
            //waterWaveView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //waterWaveView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { _ in
            
            let dr = CGFloat(1.0 / (self.dr/0.01))
            
            self.waterWaveView.progress += dr
            self.waterWaveView.setupProgress(self.waterWaveView.progress)
            
            print(self.waterWaveView.progress)
            
            if self.waterWaveView.progress >= 0.88 {
                self.timer?.invalidate()
                self.timer = nil
                
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                    self.waterWaveView.percentAnim()
                }
                
                
            }
        })
    }


}

