//
//  ViewController.swift
//  IIQM
//
//  Created by Ryan Arana on 6/15/18.
//  Copyright © 2018 Dexcom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        calculateIIQM()
    }
    
    private func calculateIIQM(){
        let iiqm = IIQM()
        let startTime = Date()
        iiqm.calculate(path: Bundle.main.path(forResource: "data", ofType: "txt")!)
        let endTime = Date()
        print(DateInterval(start: startTime, end: endTime).duration)
    }
}

