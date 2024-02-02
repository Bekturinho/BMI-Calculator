//
//  ViewController.swift
//  lesson 5 UiKit
//
//  Created by fortune cookie on 1/30/24.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    private var BMiBarViewController: BMiBarView{
        BMiBarView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setubSubViews()
        
        
    }

    private func setubSubViews(){
        view.addSubview(BMiBarViewController)
        BMiBarViewController.snp.makeConstraints({make in
            make.horizontalEdges.equalTo(view)
        })
        
    }
    

}

