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
public var totalResultInAllViews = 0.0
final class BMICalculatorViewController: UIViewController {
    private var selectedGender: Genders? = nil
   
    private lazy var navBarLabel: UILabel = {
        let label = UILabel()
        label.text = "BMI Calculator"
        label.textColor = .white
        label.backgroundColor = UIColor(red: 0.102, green: 0.122, blue: 0.22, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        
        return label
    }()
    
    private lazy var maleButton: genderBMIButtons = {
        genderBMIButtons(type: .male){
            print("male")
            self.selectedGender = .male
            self.femaleButton.resetBorders()
        }
        
    }()
    
    private lazy var femaleButton: genderBMIButtons = {
        genderBMIButtons(type: .female) {
            print("Female")
            self.selectedGender = .female
            self.maleButton.resetBorders()
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
        view.layer.backgroundColor = UIColor(red: 0.039, green: 0.055, blue: 0.129, alpha: 1).cgColor
       
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
            make.left.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.width.equalTo(view.alpha).offset(135)
            make.height.equalTo(view.alpha).offset(160)
            maleButton.layer.cornerRadius = 12
            maleButton.backgroundColor = UIColor(red: 0.102, green: 0.122, blue: 0.22, alpha: 1)

        })
        view.addSubview(femaleButton)
        femaleButton.snp.makeConstraints({make in
            make.top.equalTo(navBarLabel.snp.bottom).offset(20)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.width.equalTo(view.alpha).offset(135)
            make.height.equalTo(view.alpha).offset(160)
            femaleButton.layer.cornerRadius = 12
            femaleButton.backgroundColor = UIColor(red: 0.102, green: 0.122, blue: 0.22, alpha: 1)

            
        })
        view.addSubview(heightSliderUiView)
        heightSliderUiView.snp.makeConstraints({make in
            make.center.equalTo(view.snp.center)
            make.height.equalTo(view.alpha).offset(150)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(45)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-45)
            heightSliderUiView.backgroundColor = UIColor(red: 0.102, green: 0.122, blue: 0.22, alpha: 1)

            heightSliderUiView.layer.cornerRadius = 12
            
            
        })
        view.addSubview(weightButtonView)
        weightButtonView.snp.makeConstraints({make in
            make.top.equalTo(heightSliderUiView.snp.bottom).offset(70)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.width.equalTo(view.alpha).offset(135)
            make.height.equalTo(view.alpha).offset(160)
            weightButtonView.layer.cornerRadius = 12
            weightButtonView.backgroundColor = UIColor(red: 0.102, green: 0.122, blue: 0.22, alpha: 1)
        })
        
        view.addSubview(ageButtomView)
        ageButtomView.snp.makeConstraints({make in
            make.top.equalTo(heightSliderUiView.snp.bottom).offset(70)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.width.equalTo(view.alpha).offset(135)
            make.height.equalTo(view.alpha).offset(160)
            ageButtomView.layer.cornerRadius = 12
            ageButtomView.backgroundColor = UIColor(red: 0.102, green: 0.122, blue: 0.22, alpha: 1)
        })
        view.addSubview(calculateButton)
        calculateButton.snp.makeConstraints({make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            
            make.width.equalTo(view.alpha)
            make.height.equalTo(view.alpha).offset(55)
            make.horizontalEdges.equalToSuperview()
        })
    }
    

    @objc func calculateBMI(){
        let total = ((weightTotal / (heightTotal * heightTotal)) * 10000)
        totalResultInAllViews = Double(Int(total * 10) ) / 10
        if totalResultInAllViews < 18{
            rateLAbelResult = "BAD"
            commentLabelResult = "Eat Food"
        }
        if totalResultInAllViews < 25{
            rateLAbelResult = "NORMAL"
            commentLabelResult = "GOOD BOY"
        }
        if totalResultInAllViews > 25{
            rateLAbelResult = "BAD"
            commentLabelResult = "You a Bit WaterMelon"
        }
        print(total)
        
        
        let teleport = ResultViewController()
        navigationController?.pushViewController(teleport, animated: true)
        
    }
}

