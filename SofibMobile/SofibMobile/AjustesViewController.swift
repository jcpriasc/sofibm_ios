//
//  AjustesViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 1/9/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class AjustesViewController: UIViewController {


    @IBOutlet var cerrarSesionView: UIView!
    @IBOutlet var cambiarIdiomaView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapCerrarSesion = UITapGestureRecognizer(target: self, action: #selector(self.handleTapCerrarSesion(_:)))
        
        let tapCambiarIdioma = UITapGestureRecognizer(target: self, action: #selector(self.handleTapCambiarIdioma(_:)))
        
        
        cerrarSesionView.addGestureRecognizer(tapCerrarSesion)
        cerrarSesionView.isUserInteractionEnabled = true
        
        cambiarIdiomaView.addGestureRecognizer(tapCambiarIdioma)
        cambiarIdiomaView.isUserInteractionEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func handleTapCerrarSesion(_ sender: UITapGestureRecognizer) {
        print("Cerrar Sesion")
    }
    
    func handleTapCambiarIdioma(_ sender: UITapGestureRecognizer) {
        print("Cambiar Idioma")
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
