//
//  DetalleServicioNoAsistencialViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 28/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleServicioNoAsistencialViewController: UIViewController {

    
    @IBOutlet var lblCiudad: UILabel!
    @IBOutlet var lblTipoSolicitud: UILabel!
    @IBOutlet var lblNumeroSolicitud: UILabel!
    
    @IBOutlet var txtJustificacion: UILabel!
    @IBOutlet var txtEstado: UILabel!
    
    @IBOutlet var lblEstado: UILabel!
    @IBOutlet var lblJustificacionCancelado: UILabel!
    
    static var jsonDetalleServicioNoAsistencial: NSDictionary?
    let params: String = "/SAC/ABCD1234/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblEstado.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")
        lblJustificacionCancelado.text = NSLocalizedString("lbl_justificacion_cancelacion", comment: "lbl_justificacion_cancelacion")
        
        lblCiudad.text = ServicioNoAsistencialViewController.servicioNoAsistencial.ciudad
        lblTipoSolicitud.text = "\(NSLocalizedString("lbl_tipo_solicitud", comment: "lbl_tipo_solicitud")) \(": ")\(ServicioNoAsistencialViewController.servicioNoAsistencial.tipoSolicitud)"
        
        lblNumeroSolicitud.text = "\(NSLocalizedString("lbl_numero_solicitud", comment: "lbl_numero_solicitud"))\(": ") \(ServicioNoAsistencialViewController.servicioNoAsistencial.numeroSolicitud)"
        
        txtJustificacion.text = ServicioNoAsistencialViewController.servicioNoAsistencial.justificacion
        txtEstado.text = ServicioNoAsistencialViewController.servicioNoAsistencial.estado
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action_ver_detalle(_ sender: AnyObject) {
        
        obtenerDetalle()
        
    }

    
    func obtenerDetalle(){
        
        let codigo = Int(ServicioNoAsistencialViewController.servicioNoAsistencial.consServicio)
        let codigoTexto = String(codigo)
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_serviciosNoAsistenciales_detalle+params+codigoTexto)
        
        print(url)
       // let url = URL(string: "http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile/serviciosNoAsistenciales/detalle/SAC/ABCD1234/715")
        
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
                        DetalleServicioNoAsistencialViewController.jsonDetalleServicioNoAsistencial = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        
                        if ((DetalleServicioNoAsistencialViewController.jsonDetalleServicioNoAsistencial) != nil && (DetalleServicioNoAsistencialViewController.jsonDetalleServicioNoAsistencial?.count)!>0){
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "tabServicioNoAsistencial")
                            self.show(vc as! UIViewController, sender: vc)
                        }else{
                            //print(NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"));
                            let alert = UIAlertController(title: NSLocalizedString("lbl_alerta", comment: "lbl_alerta"), message: NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"), preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: NSLocalizedString("lbl_aceptar", comment: "lbl_aceptar"), style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            
                        }
                        
                    }
                    catch
                    {
                        let alert = UIAlertController(title: NSLocalizedString("lbl_alerta", comment: "lbl_alerta"), message: NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"), preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: NSLocalizedString("lbl_aceptar", comment: "lbl_aceptar"), style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
        task.resume()
        
    }

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "detalleServicioNoAsistencialView"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }

}
