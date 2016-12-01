//
//  LoginViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/30/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    //var listParams = "/UP/" + usuario + "/" + password + "/50/PROFILE_MANAGER/sofib";
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var segTipoUsuario: UISegmentedControl!
    
    @IBAction func action_ingresar(_ sender: AnyObject) {
        
        
        var valido = true;
        
        if txtUsuario.text == "" {
            valido = false;
        }
        
        if txtPassword.text == "" {
            valido = false;
        }
        
        if valido  {
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "filtroSolicitudesView")
            self.show(vc as! UIViewController, sender: vc)
        }else{
            let alert = UIAlertController(title: NSLocalizedString("lbl_alerta", comment: "lbl_alerta"), message: NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"), preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("lbl_aceptar", comment: "lbl_aceptar"), style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            CargarPickers.cargar_pickers();
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
