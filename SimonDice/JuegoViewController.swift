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
        
        if sender.tag == secuencia[indice]{
            indice += 1
            
            if indice >= secuencia.count{
                vel -= 0.05
                if vel < 0.05{
                    vel = 0.05
                }
                habilitarTablero(false)
                generarAleatorio()
            }
        }else{
            //aqui ya perdio el usuario
            let msj = UIAlertController(title: "PERDISTE", message: "Has logrado llegar hasta la ronda \(secuencia.count)", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Aceptar", style: .default)
            msj.addAction(ok)
            present(msj, animated: true)
            btnJugar.isEnabled = true
            habilitarTablero(false)
        }
    }
    
    @IBAction func EncenderBoton(_ sender: UIButton) {
        sender.alpha = 1.0
    }
    
    @IBAction func empezarJuego() {
        btnJugar.isEnabled = false
        secuencia.removeAll()
        vel = 0.5
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
            Timer.scheduledTimer(withTimeInterval: vel, repeats: false) { timer in
                self.apagar()
            }
        }else{
            indice = 0
            habilitarTablero(true)
        }
    }
    
    func apagar(){
        btnsTablero[secuencia[indice]].alpha = 0.6
        indice += 1
        Timer.scheduledTimer(withTimeInterval: vel, repeats: false) { timer in
            self.encender()
        }
    }
}
