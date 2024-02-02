//
//  genderBMIButtons.swift
//  lesson 5 UiKit
//
//  Created by fortune cookie on 1/31/24.
//

import UIKit
import SnapKit


enum Genders{
    case male
    case female
    
    var title: String{
        switch self{
        case .male:
            return "Male"
        case .female:
            return "Female"
        }
        
        
    }
    var icon: UIImage?{
        switch self{
        case .male:
            let image = UIImage(named: "male")
            return image
        case .female:
            let image = UIImage(named: "female")
            return image
        }
        
        
    }
}
final class genderBMIButtons: UIView {
    
    private lazy var genderaImageView: UIImageView = {
        let image = UIImageView()
        image.image = genders.icon
        return image
    }()
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.text = genders.title
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let genders: Genders
    let onGenderSelection: () -> Void
    
    init(type: Genders, onGenderSelection: @escaping () -> Void) {
        self.genders = type
        self.onGenderSelection = onGenderSelection
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(genderaImageView)
        genderaImageView.snp.makeConstraints({make in
            make.top.equalToSuperview().offset(35)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-34)
            make.width.equalTo(68)
            make.height.equalTo(47)
        })
        
        addSubview(genderLabel)
        genderLabel.snp.makeConstraints({make in
            make.top.equalTo(genderaImageView.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
            make.bottom.equalToSuperview().offset(-20)
        })
        addTapGesture()
    }
    
    private func addTapGesture(){
       
        let tapGesturerecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        self.addGestureRecognizer(tapGesturerecognizer)
    }
    
    @objc func didTapView(){
        onGenderSelection()
        layer.borderColor = UIColor.green.cgColor
        layer.borderWidth = 2
            }
    
    
    public func resetBorders(){
        layer.borderWidth = 0
    }

}
