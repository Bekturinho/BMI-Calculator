//
//  ResultViewController.swift
//  lesson 5 UiKit
//
//  Created by fortune cookie on 2/4/24.
//

import UIKit
import SnapKit

public var rateLAbelResult = ""
public var commentLabelResult = ""
class ResultViewController: UIViewController {

    private var resultUiViewType: ResultUiView = {
        ResultUiView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.039, green: 0.055, blue: 0.129, alpha: 1)
        setupSubViews()
        
    }

    private func setupSubViews() {
        view.addSubview(resultUiViewType)
        resultUiViewType.snp.makeConstraints({make in
            make.center.equalTo(view.safeAreaLayoutGuide)
            resultUiViewType.backgroundColor = UIColor(red: 0.102, green: 0.122, blue: 0.22, alpha: 1)
            make.height.equalTo(view.alpha).offset(435)
            make.width.equalTo(view.alpha).offset(320)
            resultUiViewType.layer.cornerRadius = 12
        })
    }

}
