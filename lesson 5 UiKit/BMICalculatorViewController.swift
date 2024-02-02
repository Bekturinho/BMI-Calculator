//
//  ViewController.swift
//  lesson 5 UiKit
//
//  Created by fortune cookie on 1/30/24.
//

import UIKit
import SnapKit
public var weightTotal = 0.0
public var heightTotal = 0.0
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
    
    private var weightButtonView: WeightAndAgeUiView = {
      WeightAndAgeUiView()
    }()
    private var ageButtomView: ageUiView = {
        ageUiView()
    }()

    private var heightSliderUiView: sliderUiView = {
        sliderUiView()
        
    }()
    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("CALCULATE", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.tintColor = .white
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(calculateBMI), for: .touchUpInside)
        return button
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
            make.height.equalTo(view.alpha).offset(150)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(45)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-45)
            make.top.equalTo(femaleButton.snp.bottom).offset(15)
            heightSliderUiView.backgroundColor = .red
            heightSliderUiView.layer.cornerRadius = 12
            
            
        })
        view.addSubview(weightButtonView)
        weightButtonView.snp.makeConstraints({make in
            make.top.equalTo(heightSliderUiView.snp.bottom).offset(15)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(45)
            weightButtonView.backgroundColor = .red
            make.width.equalTo(view.alpha).offset(136)
            make.height.equalTo(view.alpha).offset(160)
            weightButtonView.layer.cornerRadius = 12
        })
        
        view.addSubview(ageButtomView)
        ageButtomView.snp.makeConstraints({make in
            make.top.equalTo(heightSliderUiView.snp.bottom).offset(15)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-45)
            ageButtomView.backgroundColor = .red
            make.width.equalTo(view.alpha).offset(136)
            make.height.equalTo(view.alpha).offset(160)
            ageButtomView.layer.cornerRadius = 12
        })
        view.addSubview(calculateButton)
        calculateButton.snp.makeConstraints({make in
            make.bottom.equalToSuperview()
            make.width.equalTo(view.alpha)
            make.height.equalTo(view.alpha).offset(55)
            make.horizontalEdges.equalToSuperview()
        })
    }
    

    @objc func calculateBMI(){
        print("\(weightTotal / (heightTotal * heightTotal))")
        
    }
}

