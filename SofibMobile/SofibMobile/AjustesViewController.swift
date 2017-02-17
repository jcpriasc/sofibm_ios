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

    static var viewBack = "";

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
