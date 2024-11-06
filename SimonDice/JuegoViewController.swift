//
//  JuegoViewController.swift
//  SimonDice
//
//  Created by imac on 29/10/24.
//

import UIKit

class JuegoViewController: UIViewController {

    @IBOutlet var btnsTablero: [UIButton]!
    @IBOutlet weak var btnJugar: UIButton!
    var secuencia:[Int] = []
    var indice = 0
    var vel = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        habilitarTablero(false)
        
        for boton in btnsTablero {
            boton.layer.cornerRadius = 20.0
        }
    }
    

    @IBAction func ApagarBoton(_ sender: UIButton) {
        sender.alpha = 0.6
    }
    
    @IBAction func EncenderBoton(_ sender: UIButton) {
        sender.alpha = 1.0
    }
    
    @IBAction func empezarJuego() {
        //btnJugar.isEnabled = false
        generarAleatorio()
    }
    
    func habilitarTablero(_ edo: Bool){
        for boton in btnsTablero {
            boton.isEnabled = edo
        }
    }
    
    func generarAleatorio(){
        secuencia += [Int.random(in: 0..<btnsTablero.count)]
        indice = 0
        Timer.scheduledTimer(withTimeInterval: vel, repeats: false) { timer in
            self.encender()
        }
            
    }
    
    func encender(){
        if indice < secuencia.count{
            btnsTablero[secuencia[indice]].alpha = 1.0
        }
    }
    
    func apagar(){
        
    }
}
