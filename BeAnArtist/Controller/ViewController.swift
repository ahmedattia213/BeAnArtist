//
//  ViewController.swift
//  BeAnArtist
//
//  Created by Ahmed Amr on 1/7/19.
//  Copyright © 2019 Ahmed Amr. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector (handleUndo), for: .touchUpInside)
        
        return button
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system )
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector (handleClear), for: .touchUpInside)
        return button
    }()
    
    let yellowButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector (handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let redButton : UIButton = {
        let button = UIButton(type: .system )
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector (handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let blueButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector (handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let slider : UISlider = {
       let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector (handleSliderChange), for: .valueChanged)
        return slider
    }()
    
    @objc fileprivate func handleSliderChange(){
        canvas.setStrokeWidth(width: slider.value)
    }
    @objc fileprivate func handleUndo(){
        canvas.undo()
    }
    @objc fileprivate func handleClear(){
        canvas.clear()
    }
    override func loadView() {
        self.view = canvas
    }
    @objc fileprivate func handleColorChange(button : UIButton){
        canvas.setStrokeColor(color: button.backgroundColor ?? .black)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.backgroundColor = .white
        
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        
        let coloursStackView = UIStackView(arrangedSubviews: [yellowButton,redButton,blueButton])
        let stackView = UIStackView(arrangedSubviews: [undoButton,clearButton,coloursStackView,slider])

        view.addSubview(stackView)
        
        coloursStackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -10).isActive = true
        
        
        
    }
    
    
}

