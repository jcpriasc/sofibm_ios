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

    static var viewBack = "";

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
        
        let alert = UIAlertController(title: NSLocalizedString("lbl_alerta", comment: "lbl_alerta"), message: NSLocalizedString("lbl_aviso_cerrar_sesion", comment: "lbl_aviso_cerrar_sesion"), preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: NSLocalizedString("lbl_aceptar", comment: "lbl_aceptar"), style: UIAlertActionStyle.default) {
            UIAlertAction in
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            if #available(iOS 10.0, *) {
                let context = appDelegate.persistentContainer.viewContext
                context.deletedObjects
                exit(0);
            };
        }
        
        alert.addAction(okAction)
        alert.addAction(UIAlertAction(title: NSLocalizedString("lbl_cancelar", comment: "lbl_cancelar"), style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)

    }
    
    func handleTapCambiarIdioma(_ sender: UITapGestureRecognizer) {
        print("Cambiar Idioma")
    }
    
    @IBAction func back(_ sender: AnyObject) {
        
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: AjustesViewController.viewBack)
        self.show(vc as! UIViewController, sender: vc)
        
        
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
