//
//  ViewController.swift
//  Conversores
//
//  Created by Wellington Alves on 30/06/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var unitValue: UILabel!
    @IBOutlet weak var valorTemp: UITextField!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func showNext(_ sender: UIButton) {
        switch unitValue.text! {
            case "Temperatura":
                unitValue.text = "Peso"
                btn1.setTitle("KG", for: .normal)
                btn2.setTitle("Libras", for: .normal)
            case "Peso":
                unitValue.text = "Moeda"
                btn1.setTitle("Real", for: .normal)
                btn2.setTitle("Dolar", for: .normal)
            case "Moeda":
                unitValue.text = "Distância"
                btn1.setTitle("Metro", for: .normal)
                btn2.setTitle("Km", for: .normal)
            default:
                unitValue.text = "Temperatura"
                btn1.setTitle("Celsius", for: .normal)
                btn2.setTitle("Farenheit", for: .normal)
        }
        calculate(nil)
    }
    
    @IBAction func calculate(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btn1 {
                btn2.alpha = 0.5
            } else {
                btn1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch unitValue.text! {
        case "Temperatura":
            calculateTemperature()
        case "Peso":
            calculatePeso()
        case "Moeda":
            calculateMoeda()
        default:
            calculateDistancia()
        }
        
    }
    
    func calculateTemperature() {
        guard let temperature = Double(valorTemp.text!) else {return}
        if btn1.alpha == 1.0 {
            lblUnit.text = "Farenheit"
            lblResult.text = String(format: " %.2f", temperature * 1.8 + 32.0)
        } else {
            lblUnit.text = "Celsius"
            lblResult.text = String(format: " %.2f", (temperature - 32.0) / 1.8)
        }
        
    }
    
    func calculatePeso() {
        guard let peso = Double(valorTemp.text!) else {return}
        if btn1.alpha == 1.0 {
            lblUnit.text = "Libra"
            lblResult.text = String(format: " %.2f", peso / 2.2046)
        } else {
            lblUnit.text = "KG"
            lblResult.text = String(format: " %.2f", peso * 2.2046)
        }
        
    }
    
    func calculateMoeda() {
        guard let modeda = Double(valorTemp.text!) else {return}
        if btn1.alpha == 1.0 {
            lblUnit.text = "Dólar"
            lblResult.text = String(format: " %.2f", modeda * 4.9)
        } else {
            lblUnit.text = "Real"
            lblResult.text = String(format: " %.2f", modeda / 4.9)
        }
    }
    
    func calculateDistancia() {
        guard let distancia = Double(valorTemp.text!) else {return}
        if btn1.alpha == 1.0 {
            lblUnit.text = "KM"
            lblResult.text = String(format: " %.2f", distancia / 1000.0)
        } else {
            lblUnit.text = "Metros"
            lblResult.text = String(format: " %.2f", distancia * 1000.0)
        }
        
    }
    
}

