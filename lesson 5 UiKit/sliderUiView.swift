//
//  sliderUiView.swift
//  lesson 5 UiKit
//
//  Created by fortune cookie on 2/1/24.
//

import UIKit
import SnapKit
class sliderUiView: UIView {

    
    private lazy var heightSlider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 270, height: 60))
        slider.minimumValue = 0
        slider.maximumValue = 300
        slider.center = center
        slider.value = 0
        slider.addTarget(self, action: #selector(sliderValueChange(sender:)), for: .valueChanged)
        return slider
    }()
    
    private lazy var heightLAbel:UILabel = {
        let label = UILabel()
        label.text = "Height"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
        
    }()
    var heightResult = 0
    private lazy var resultLAbel:UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        
        return label
        
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(heightLAbel)
        heightLAbel.snp.makeConstraints({make in
            make.top.equalToSuperview().offset(20)
            make.horizontalEdges.equalToSuperview()
        })
        addSubview(heightSlider)
        heightSlider.snp.makeConstraints({make in
            make.center.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        })
        addSubview(resultLAbel)
        resultLAbel.snp.makeConstraints({make in
            make.top.equalTo(heightSlider.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview()
        })
        
    }
    
    @objc func sliderValueChange(sender: UISlider){
        resultLAbel.text = String(sender.value)
        print(sender.value)
    }

}
