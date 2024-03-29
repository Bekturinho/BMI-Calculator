//
//  ResultUiView.swift
//  lesson 5 UiKit
//
//  Created by fortune cookie on 2/4/24.
//

import UIKit
import SnapKit
class ResultUiView: UIView {

    private lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.text = rateLAbelResult
        switch rateLAbelResult {
        case "NORMAL": label.textColor = .systemGreen
        case "BAD": label.textColor = .systemRed
        case "NOT GOOD": label.textColor = .systemYellow
        default:
            label.text = "ERROR"
        }
       
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        return label
    }()
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "\(totalResultInAllViews)"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        return label
    }()
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = commentLabelResult
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(rateLabel)
        rateLabel.snp.makeConstraints({make in
            make.top.equalToSuperview().offset(45)
            make.horizontalEdges.equalToSuperview()
            
        })
        addSubview(resultLabel)
        resultLabel.snp.makeConstraints({make in
            make.center.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            
        })
        addSubview(commentLabel)
        commentLabel.snp.makeConstraints({make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-86)
            
        })
        
        
    }
    

}
