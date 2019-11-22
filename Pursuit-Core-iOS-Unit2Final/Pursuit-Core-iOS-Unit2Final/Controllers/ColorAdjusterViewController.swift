//
//  ColorAdjusterViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Chelsi Christmas on 11/22/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorAdjusterViewController: UIViewController {

    
    @IBOutlet weak var crayonColorLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
   
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
     @IBOutlet weak var resetButton: UIButton!
    
    var crayon: Crayon?
    var red: Double?
    var green: Double?
    var blue: Double?
    var alpha: Double?
    var redLabelText: String?
    var blueLabelText: String?
    var greenLabelText: String?
    var alphaLabelText: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRedSliderAndLabel()
        configureGreenSliderAndLabel()
        configureBlueSliderAndLabel()
        configureAlphaStepperAndLabel()
        setOriginalSettings()
        updateUI()
        
    }
    
    
    func updateUI() {
        
        guard let crayonElement = crayon else {
            fatalError("unable to access crayonElements")
        }
        self.view.backgroundColor = UIColor(red: CGFloat(crayonElement.red/255) , green: CGFloat(crayonElement.green/255), blue: CGFloat(crayonElement.blue/255), alpha: 1.0)
        
        crayonColorLabel.text = crayon?.name
        
    }
    
    func setOriginalSettings() {
        red = crayon!.red/255
        green = crayon!.green/255
        blue = crayon!.blue/255
        alpha = 1.0
        redLabelText = "\(crayon!.red/255)"
        greenLabelText = "\(crayon!.green/255)"
        blueLabelText = "\(crayon!.blue/255)"
        
    }

    
    func configureRedSliderAndLabel() {
        redSlider.minimumValue = 0.0
        redSlider.maximumValue = 1.0
        redSlider.value = Float(crayon!.red/255)
        redLabel.text = "Red: \(crayon!.red/255)"
    }
    
    func configureGreenSliderAndLabel() {
        greenSlider.minimumValue = 0.0
        greenSlider.maximumValue = 1.0
        greenSlider.value = Float(crayon!.green/255)
        greenLabel.text = "Green: \(crayon!.green/255)"
    }
    
    func configureBlueSliderAndLabel() {
        blueSlider.minimumValue = 0.0
        blueSlider.maximumValue = 1.0
        blueSlider.value = Float(crayon!.blue/255)
        blueLabel.text = "Blue: \(crayon!.blue/255)"
    }
    
    func configureAlphaStepperAndLabel() {
        alphaStepper.stepValue = 0.1
        alphaStepper.minimumValue = 0.0
        alphaStepper.maximumValue = 1.0
        alphaStepper.value = 1.0
        alphaLabel.text = "Alpha: 1.0"
        
    }
    
    
    @IBAction func changeRedValue(_ sender: UISlider) {
        
        crayon?.red = Double(sender.value * 255)
        view.backgroundColor = UIColor(red: CGFloat(sender.value), green: CGFloat(crayon!.green/255), blue: CGFloat(crayon!.blue/255), alpha: CGFloat(alpha!))
        redLabel.text = "Red: \(sender.value)"
        
    }
    
    
    @IBAction func changeGreenValue(_ sender: UISlider) {
        
        crayon?.green = Double(sender.value * 255)
        view.backgroundColor = UIColor(red: CGFloat(crayon!.red/255), green: CGFloat(sender.value), blue: CGFloat(crayon!.blue/255), alpha: CGFloat(alpha!))
        greenLabel.text = "Green: \(sender.value)"
        
    }
    
    
    @IBAction func changeBlueValue(_ sender: UISlider) {
        crayon?.blue = Double(sender.value * 255)
        view.backgroundColor = UIColor(red: CGFloat(crayon!.red/255), green: CGFloat(crayon!.green/255), blue: CGFloat(sender.value), alpha: CGFloat(alpha!))
        blueLabel.text = "Blue: \(sender.value)"
}
    
    
    @IBAction func changeAlphaValue( sender: UIStepper) {
        view.backgroundColor = UIColor(red: CGFloat(crayon!.red/255), green: CGFloat(crayon!.green/255), blue: CGFloat(crayon!.blue/255), alpha: CGFloat(sender.value))
        alphaLabel.text = "Alpha: \(Float(sender.value))"
        
        
        
    }
    @IBAction func resetValues(_ sender: UIButton) {
        // set background back to old settings
        view.backgroundColor = UIColor(red: CGFloat(red!), green: CGFloat(green!), blue: CGFloat(blue!), alpha: 1.0)
        redSlider.value = Float(red!)
        greenSlider.value = Float(green!)
        blueSlider.value = Float(blue!)
        alphaStepper.value = 1.0
        redLabel.text = "Red: \(redLabelText!)"
        greenLabel.text = "Green: \(greenLabelText!)"
        blueLabel.text = "Blue: \(blueLabelText!)"
        alphaLabel.text = "Alpha: 1.0"
    }
    
}
