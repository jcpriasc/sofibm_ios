//
//  LoginViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/30/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    //var listParams = "/UP/" + usuario + "/" + password + "/50/PROFILE_MANAGER/sofib";
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var segTipoUsuario: UISegmentedControl!
    
    static var nombreCompleto = "";
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var usuriosJson : NSDictionary?
    
    @IBAction func action_ingresar(_ sender: AnyObject) {
        
        var valido = true;
        
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
                            
                            DispatchQueue.main.async {
                                if let error = self.usuriosJson?["errorBean"] as? Dictionary<String, Any>{
                                    
                                    let resultado = error["codigo"] as! String
                                    
                                    if resultado == "0"{
                                        
                                        if let usuarioDTO = self.usuriosJson?["usuarioDTO"] as? Dictionary<String, Any>{
                                            
                                            LoginViewController.nombreCompleto = usuarioDTO["nombre"] as! String;
                                            LoginViewController.nombreCompleto += " "
                                            LoginViewController.nombreCompleto += usuarioDTO["primerApellido"] as! String;
                                            LoginViewController.nombreCompleto += " "
                                            LoginViewController.nombreCompleto += usuarioDTO["segundoApellido"] as! String;
                                            
                                        }
                                        
                                        if #available(iOS 10.0, *) {
                                            let context = self.appDelegate.persistentContainer.viewContext
                                            
                                            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
                                            
                                            newUser.setValue(self.txtUsuario.text, forKey: "user")
                                            newUser.setValue(self.txtPassword.text, forKey: "pass")
                                            
                                            do
                                            {
                                                try context.save()
                                                print("saved")
                                            }
                                            catch
                                            {
                                                
                                            }
                                            
                                        } else {
                                            // Fallback on earlier versions
                                        }
                                        
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
        
        txtUsuario.delegate = self
        txtPassword.delegate = self
        
        DispatchQueue.main.async {
            CargarPickers.cargar_pickers();
        }
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard)))
        
        if #available(iOS 10.0, *) {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            request.returnsObjectsAsFaults = false
            
            do
            {
                let context = appDelegate.persistentContainer.viewContext
                let results = try context.fetch(request)
                
                if results.count > 0 {
                    
                    print("ENTRO")
                    
                    /*
                    for result in results as! [NSManagedObject]{
                        if let user = result.value(forKey: "user") as? String{
                            print(user)
                        }
                    }
 
                    
                     let secondViewController:FiltrosSolicitudAtencionController = FiltrosSolicitudAtencionController()
                     self.present(secondViewController, animated: true, completion: nil)
                     
                     let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "filtroSolicitudesView")
                     self.show(vc as! UIViewController, sender: vc)
                     
                     let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "filtroSolicitudesView")
                     self.present(vc as! UIViewController, animated: true)
*/
                    
                    
                }
            
            }
            catch
            {
                print("ERROR")
            }
        }
        
        // Do any additional setup after loading the view.
 
    }
    
    
    func dismissKeyboard() {
        view.endEditing(true)
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
