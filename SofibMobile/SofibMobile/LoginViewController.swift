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
    
    static var jsonRolesPrestador: NSArray?
    
    static var arrayRoles = [String]()
    
    static let rolesMedico = ["SOFIB_COORDINADOR_MEDICO_NI","SOFIB_AUX_SERV_AMB","SOFIB_AUDITOR_MEDICO", "SOFIB_ANA_MEDICO","SOFIB_AUX_CRAUH", "SOFIB_FUN_EXT_MED", "SOFIB_MED_ESP_ISLA", "SOFIB_COL_MED_ASEG"]
    static let rolesLogistico = ["SOFIB_FUN_GIRO","SOFIB_ANALISTA_FINANCIERO", "SOFIB_ANA_CUE_MED", "SOFIB_ANALISTA_CARTERA", "SOFIB_COL_ASEG", "SOFIB_ANA_LOGISTICA"]
    static let rolesAdministrador = ["SOFIB_SOPORTE","SOFIB_DIRECTOR_NACIONAL","SOFIB_COORDINADOR_NACIONAL","SOFIB_SOP_TEC","SOFIB_ADMIN"]
    
    public static var usuarioSesion = UsuarioSesion()
    
    //var listParams = "/UP/" + usuario + "/" + password + "/50/PROFILE_MANAGER/sofib";
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var segTipoUsuario: UISegmentedControl!
    @IBOutlet weak var lblTipoUsuario: UILabel!
    
    let items = [NSLocalizedString("lbl_interno", comment: "lbl_interno"), NSLocalizedString("lbl_externo", comment: "lbl_externo")]
    
    static var nombreCompleto = "";
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var usuriosJson : NSDictionary?
    
    override func viewWillAppear(_ animated: Bool) {
        
        lblTipoUsuario.text = NSLocalizedString("lbl_tipo_usuario", comment: "lbl_tipo_usuario")
        txtUsuario.placeholder = NSLocalizedString("lbl_usuario", comment: "lbl_usuario")
        txtPassword.placeholder = NSLocalizedString("lbl_cotrasena", comment: "lbl_cotrasena")
        self.segTipoUsuario.setTitle(NSLocalizedString("lbl_interno", comment: "lbl_interno"), forSegmentAt: 0)
        self.segTipoUsuario.setTitle(NSLocalizedString("lbl_externo", comment: "lbl_externo"), forSegmentAt: 1)
    }
    
    
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
                                            
                                            LoginViewController.jsonRolesPrestador = usuarioDTO["roles"] as! NSArray
                                            
                                            LoginViewController.usuarioSesion.nombreUsuario = LoginViewController.nombreCompleto

                                            LoginViewController.arrayRoles = [String]()
                                            let cont = LoginViewController.jsonRolesPrestador!.count
                                            
                                            for i in 0 ..< cont {
                                                if let solicitud = LoginViewController.jsonRolesPrestador?[i] as? Dictionary<String, Any>{
                                                    LoginViewController.arrayRoles.append(solicitud["claveRol"] as? String ?? "");
                                                }
                                            }
                                            
                                            //Se crean las variables para saber si son logisitca, medica o admin
                                            var esMedico: Bool = false
                                            var esLogistico: Bool = false
                                            var esAdmin: Bool = false

                                            //Se recorre el array administrado
                                            for i in 0 ..< LoginViewController.rolesAdministrador.count {
                                                
                                                for j in 0 ..< LoginViewController.arrayRoles.count{
                                                    
                                                    if(LoginViewController.rolesAdministrador[i] == LoginViewController.arrayRoles[j]){
                                                        esAdmin = true
                                                        break
                                                    }
                                                    
                                                }
                                                
                                                if(esAdmin == true){
                                                    break
                                                }
                                                
                                            }

                                            //Se recorre el array medico
                                            for i in 0 ..< LoginViewController.rolesMedico.count {
                                                
                                                for j in 0 ..< LoginViewController.arrayRoles.count{
                                                    
                                                    if(LoginViewController.rolesMedico[i] == LoginViewController.arrayRoles[j]){
                                                        esMedico = true
                                                        break
                                                    }
                                                    
                                                }
                                                
                                                if(esMedico == true){
                                                    break
                                                }
                                                
                                            }

                                            
                                            //Se recorre el array logistio
                                            for i in 0 ..< LoginViewController.rolesLogistico.count {
                                                
                                                for j in 0 ..< LoginViewController.arrayRoles.count{
                                                    
                                                    if(LoginViewController.rolesLogistico[i] == LoginViewController.arrayRoles[j]){
                                                        esLogistico = true
                                                        break
                                                    }
                                                    
                                                }
                                                
                                                if(esLogistico == true){
                                                    break
                                                }
                                                
                                            }
                                            
                                            
                                            if(esAdmin == true || (esLogistico == true && esMedico == true)){
                                                LoginViewController.usuarioSesion.rol = Constantes.usuarioAdmin
                                            }else if(esLogistico == true && esMedico == false){
                                                LoginViewController.usuarioSesion.rol = Constantes.usuarioLogistico
                                            }else if(esLogistico == false && esMedico == true){
                                                LoginViewController.usuarioSesion.rol = Constantes.usuarioMedico
                                            }
                                            
                                            print(LoginViewController.usuarioSesion.rol)

                                        }
                                        
                                        if #available(iOS 10.0, *) {
                                            let context = self.appDelegate.persistentContainer.viewContext
                                            
                                            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
                                            
                                            newUser.setValue(self.txtUsuario.text, forKey: "user")
                                            newUser.setValue(self.txtPassword.text, forKey: "pass")
                                            newUser.setValue(LoginViewController.usuarioSesion.rol, forKey: "rol")
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
        
        //segTipoUsuario = UISegmentedControl(items: items)
        
        
        
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
