//
//  ViewController.swift
//  lesson 5 UiKit
//
//  Created by fortune cookie on 1/30/24.
//

import UIKit
import SnapKit
final class BMICalculatorViewController: UIViewController {
    private var selectedGender: Genders? = nil
    
    private lazy var navBarLabel: UILabel = {
        let label = UILabel()
        label.text = "BMI Calculator"
        label.textColor = .white
        label.backgroundColor = .blue
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        
        return label
    }()
    
    private var maleButton: genderBMIButtons = {
        genderBMIButtons(type: .male){
            print("male")
        }
        
    }()
    
    private var femaleButton: genderBMIButtons = {
        genderBMIButtons(type: .female) {
            print("Female")
        }
    }()
    
    private lazy var weightButtonView: WeightAndAgeUiView = {
        WeightAndAgeUiView(info: .weight)
    }()
    
    private lazy var ageButtonView: WeightAndAgeUiView = {
        WeightAndAgeUiView(info: .age)
    }()

    private var heightSliderUiView: sliderUiView = {
        sliderUiView()
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .purple
       setupSubViews()
    }

    private func setupSubViews(){
        view.addSubview(navBarLabel)
        navBarLabel.snp.makeConstraints({make in
            make.height.equalTo(view.alpha).offset(65)
            make.horizontalEdges.equalToSuperview()
        
            
        })
        
        view.addSubview(maleButton)
        maleButton.snp.makeConstraints({make in
            make.top.equalTo(navBarLabel.snp.bottom).offset(20)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(45)
            make.width.equalTo(view.alpha).offset(136)
            make.height.equalTo(view.alpha).offset(160)
            maleButton.layer.cornerRadius = 12
            maleButton.backgroundColor = .red
        })
        view.addSubview(femaleButton)
        femaleButton.snp.makeConstraints({make in
            make.top.equalTo(navBarLabel.snp.bottom).offset(20)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-45)
            make.width.equalTo(view.alpha).offset(136)
            make.height.equalTo(view.alpha).offset(160)
            femaleButton.layer.cornerRadius = 12
            femaleButton.backgroundColor = .red
            
        })
        view.addSubview(heightSliderUiView)
        heightSliderUiView.snp.makeConstraints({make in
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(view.alpha).offset(190)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(45)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-45)
            make.top.equalTo(femaleButton.snp.bottom).offset(30)
            heightSliderUiView.backgroundColor = .red
            heightSliderUiView.layer.cornerRadius = 12
            
            
        })
        view.addSubview(weightButtonView)
        weightButtonView.snp.makeConstraints({make in
            make.top.equalTo(heightSliderUiView.snp.bottom).offset(30)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(45)
            weightButtonView.backgroundColor = .red
            make.width.equalTo(view.alpha).offset(136)
            make.height.equalTo(view.alpha).offset(160)
            weightButtonView.layer.cornerRadius = 12
        })
        view.addSubview(ageButtonView)
        ageButtonView.snp.makeConstraints({make in
            make.top.equalTo(heightSliderUiView.snp.bottom).offset(30)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-45)
            ageButtonView.backgroundColor = .red
            make.width.equalTo(view.alpha).offset(136)
            make.height.equalTo(view.alpha).offset(160)
            ageButtonView.layer.cornerRadius = 12
        })
    }
    


}

