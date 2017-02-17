//
//  AjustesViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 1/9/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit
import CoreData
class AjustesViewController: UIViewController {

    @IBOutlet var lblUsuarioSesion: UILabel!

    @IBOutlet var lblCambiarIdioma: UILabel!
    @IBOutlet var lblCerrarSesion: UILabel!
    @IBOutlet var cerrarSesionView: UIView!
    @IBOutlet var cambiarIdiomaView: UIView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        lblUsuarioSesion.text = LoginViewController.nombreCompleto;
        lblCerrarSesion.text = NSLocalizedString("lbl_cerrar_sesion", comment: "lbl_cerrar_sesion")
        lblCambiarIdioma.text = NSLocalizedString("lbl_cambiar_idioma", comment: "lbl_cambiar_idioma")
        
    }
    
    
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
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if #available(iOS 10.0, *) {
            let context = appDelegate.persistentContainer.viewContext
            context.deletedObjects
            print("delete")
            exit(0);
            
        }
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
