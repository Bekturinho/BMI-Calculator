//
//  WeightAndAgeUiView.swift
//  lesson 5 UiKit
//
//  Created by fortune cookie on 2/1/24.
//

import UIKit
import SnapKit


enum Info{
    case weight
    case age
    
    var tittle: String{
        switch self{
        case .weight:
            return "weight"
        case .age:
            return "age"
        }
        
    }
    
    var result: String{
        switch self{
        case .weight:
            return "0"
        case .age:
            return "0"
        }
        
    }


    
    
    
}

final class WeightAndAgeUiView: UIView {
  
    private lazy var infoLable: UILabel = {
        let label = UILabel()
        label.text = info.tittle
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

    
    
    
    
    
    
    
    let info: Info
    
    init(info: Info) {
      
        self.info = info
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(infoLable)
        infoLable.snp.makeConstraints({make in
            make.top.equalToSuperview().offset(15)
            make.horizontalEdges.equalToSuperview()
            
        })
        addSubview(ageNumberLabel)
        ageNumberLabel.snp.makeConstraints({make in
            make.top.equalTo(infoLable.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            
        })
        addSubview(weightNumberLabel)
        weightNumberLabel.snp.makeConstraints({make in
            make.top.equalTo(infoLable.snp.bottom).offset(10)
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
        weightTotal += 1
        ageNumberLabel.text = "\(totalResult)"
        
    }
    @objc func minusOption(){
        totalResult -= 1
        weightTotal -= 1
        ageNumberLabel.text = "\(totalResult)"
    }
    
}
