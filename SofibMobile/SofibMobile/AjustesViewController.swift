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

        
        //let message = "Change language of this app including its content."
        let message = NSLocalizedString("lbl_cambiar_lenguaje", comment: "lbl_cambiar_lenguaje")
        
        
        //let sheetCtrl = UIAlertController(title: "Choose language", message: message, preferredStyle: .actionSheet)
        let sheetCtrl = UIAlertController(title: NSLocalizedString("lbl_seleccionar_lenguaje", comment: "lbl_seleccionar_lenguaje"), message: message, preferredStyle: .actionSheet)

        
        for languageCode in Bundle.main.localizations.filter({ $0 != "Base" }) {
            let langName = Locale.current.localizedString(forLanguageCode: languageCode)
            let action = UIAlertAction(title: langName, style: .default) { _ in
                self.changeToLanguage(languageCode) // see step #2
            }
            sheetCtrl.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("lbl_cancelar", comment: "lbl_cancelar"), style: .cancel, handler: nil)
        sheetCtrl.addAction(cancelAction)
        
        sheetCtrl.popoverPresentationController?.sourceView = self.view
        sheetCtrl.popoverPresentationController?.sourceRect = self.cambiarIdiomaView.frame
        present(sheetCtrl, animated: true, completion: nil)
    
    }
    
    
    private func changeToLanguage(_ langCode: String) {
        if Bundle.main.preferredLocalizations.first != langCode {
           // let message = "In order to change the language, the App must be closed and reopened by you."
            
            let message = NSLocalizedString("lbl_mensaje_reinicio_aplicacion", comment: "lbl_mensaje_reinicio_aplicacion")
            
            
            let confirmAlertCtrl = UIAlertController(title: NSLocalizedString("lbl_reinicio_requerido", comment: "lbl_reinicio_requerido"), message: message, preferredStyle: .alert)
            
            let confirmAction = UIAlertAction(title: NSLocalizedString("lbl_cerrar_ahora", comment: "lbl_cerrar_ahora"), style: .destructive) { _ in
                UserDefaults.standard.set([langCode], forKey: "AppleLanguages")
                UserDefaults.standard.synchronize()
                exit(EXIT_SUCCESS)
            }
            confirmAlertCtrl.addAction(confirmAction)
            
            let cancelAction = UIAlertAction(title: NSLocalizedString("lbl_cancelar", comment: "lbl_cancelar"), style: .cancel, handler: nil)
            confirmAlertCtrl.addAction(cancelAction)
            
            present(confirmAlertCtrl, animated: true, completion: nil)
        }
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
