//
//  WeightAndAgeUiView.swift
//  lesson 5 UiKit
//
//  Created by fortune cookie on 2/1/24.
//

import UIKit
import SnapKit




final class WeightAndAgeUiView: UIView {
  
    private lazy var weightInfoLable: UILabel = {
        let label = UILabel()
        label.text = "Weight"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
        
    }()

    
    var totalResult = 0
    private lazy var weightNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "\(totalResult)"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        return label

    }()
    

    private lazy var plusButton: UIButton = {
        let button = UIButton()
          button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(plusOption), for: .touchUpInside)
          return button
    }()
    
    
    private lazy var minusButton: UIButton = {
        let button = UIButton()
          button.setImage(UIImage(named: "minus"), for: .normal)
        button.addTarget(self, action: #selector(minusOption), for: .touchUpInside)
          return button
    }()

    
    
    
    
    
    
 
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(weightInfoLable)
        weightInfoLable.snp.makeConstraints({make in
            make.top.equalToSuperview().offset(15)
            make.horizontalEdges.equalToSuperview()
            
        })
        addSubview(weightNumberLabel)
        weightNumberLabel.snp.makeConstraints({make in
            make.top.equalTo(weightInfoLable.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            
        })
       
        addSubview(plusButton)
        plusButton.snp.makeConstraints({make in
            make.top.equalTo(weightNumberLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(21)

            
        })
        addSubview(minusButton)
        minusButton.snp.makeConstraints({make in
            make.top.equalTo(weightNumberLabel.snp.bottom).offset(15)
            make.right.equalToSuperview().offset(-21)
            
        })
    }

    @objc func plusOption(){
        totalResult += 1
        weightTotal += 1
        weightNumberLabel.text = "\(totalResult)"
        
    }
    @objc func minusOption(){
        totalResult -= 1
        weightTotal -= 1
        if totalResult < 0{
            totalResult = 0
            weightNumberLabel.text = "0"
        }else{
            weightNumberLabel.text = "\(totalResult)"
        }
    }
    
}
