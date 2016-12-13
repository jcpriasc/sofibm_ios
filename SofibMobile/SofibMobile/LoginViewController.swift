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
    
    
    var usuriosJson : NSDictionary?
    
    @IBAction func action_ingresar(_ sender: AnyObject) {
        
        
        
        var valido = true;
        var exitoso = false;
        
        if self.txtUsuario.text == "" {
            valido = false;
        }
        
        if self.txtPassword.text == "" {
            valido = false;
        }
        
        if valido  {
            
            
            //String listParams = "/UP/" + usuario + "/" + password + "/50/PROFILE_MANAGER/sofib";
            
            //var listParams = "/UP/" + txtUsuario.text + "/" + txtPassword.text + "/50/PROFILE_MANAGER/sofib";
            
            let listParams: String = "/UP/"+self.txtUsuario.text!+"/"+self.txtPassword.text!+"/50/PROFILE_MANAGER/sofib"
            
            print(PropertiesProject.URL_PROFILE+listParams);
            let url = URL(string: PropertiesProject.URL_PROFILE+listParams)
            
            //let url = URL(string: "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-autOficinaVirtual/UP/dnsepr07/ap5wDICx/50/PROFILE_MANAGER/sofib")
            
            let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error != nil
                {
                    print ("ERROR")
                }
                else
                {
                    if let content = data
                    {
                        do
                        {
                            
                            //Array
                            self.usuriosJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                            print(self.usuriosJson)
                            
                            DispatchQueue.main.async {
                                if let error = self.usuriosJson?["errorBean"] as? Dictionary<String, Any>{
                                    
                                    let resultado = error["codigo"] as! String
                                    
                                    if resultado == "0"{
                                        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "filtroSolicitudesView")
                                        self.show(vc as! UIViewController, sender: vc)
                                    }else{
                                        let alert = UIAlertController(title: NSLocalizedString("lbl_alerta", comment: "lbl_alerta"), message: NSLocalizedString("lbl_usuario_incorrecto", comment: "lbl_usuario_incorrecto"), preferredStyle: UIAlertControllerStyle.alert)
                                        alert.addAction(UIAlertAction(title: NSLocalizedString("lbl_aceptar", comment: "lbl_aceptar"), style: UIAlertActionStyle.default, handler: nil))
                                        self.present(alert, animated: true, completion: nil)
                                    }
                                    
                                }
                            }
                            
                        }
                        catch
                        {
                            
                        }
                    }
                }
            }
            task.resume()
            
        }else{
            let alert = UIAlertController(title: NSLocalizedString("lbl_alerta", comment: "lbl_alerta"), message: NSLocalizedString("lbl_validacion_usuario", comment: "lbl_validacion_usuario"), preferredStyle: UIAlertControllerStyle.alert)
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
