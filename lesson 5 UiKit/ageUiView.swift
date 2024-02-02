//
//  ageUiView.swift
//  lesson 5 UiKit
//
//  Created by fortune cookie on 2/2/24.
//

import UIKit
import SnapKit
final class ageUiView: UIView {


      
        private lazy var ageInfoLable: UILabel = {
            let label = UILabel()
            label.text = "Age"
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            label.textColor = .white
            label.textAlignment = .center
            return label
            
        }()

        
        var totalResult = 0
        private lazy var ageNumberLabel: UILabel = {
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
            
            addSubview(ageInfoLable)
            ageInfoLable.snp.makeConstraints({make in
                make.top.equalToSuperview().offset(15)
                make.horizontalEdges.equalToSuperview()
                
            })
            addSubview(ageNumberLabel)
            ageNumberLabel.snp.makeConstraints({make in
                make.top.equalTo(ageInfoLable.snp.bottom).offset(10)
                make.horizontalEdges.equalToSuperview()
                
            })
           
            addSubview(plusButton)
            plusButton.snp.makeConstraints({make in
                make.top.equalTo(ageNumberLabel.snp.bottom).offset(15)
                make.left.equalToSuperview().offset(21)
                make.bottom.equalToSuperview().offset(-25)
                
            })
            addSubview(minusButton)
            minusButton.snp.makeConstraints({make in
                make.top.equalTo(ageNumberLabel.snp.bottom).offset(15)
                make.right.equalToSuperview().offset(-21)
                make.bottom.equalToSuperview().offset(-25)
                
            })
        }

        @objc func plusOption(){
            totalResult += 1

            ageNumberLabel.text = "\(totalResult)"
            
        }
        @objc func minusOption(){
            totalResult -= 1
            
            ageNumberLabel.text = "\(totalResult)"
        }
        
    }



