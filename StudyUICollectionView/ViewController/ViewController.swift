//
//  ViewController.swift
//  StudyUICollectionView
//
//  Created by ls on 2018/5/21.
//  Copyright © 2018年 ls. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func uiViewType1Action(_ sender: Any) {
        self.present(UICollectionViewTypeOneController(), animated: true, completion: nil)
    }
}

