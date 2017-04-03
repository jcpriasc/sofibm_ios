//
//  AutorizacionesViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/5/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class AutorizacionesViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    //let params: String = "/SAC/ABCD1234/"
    let params: String = "/SAC/"+PropertiesProject.TOKEN+"/"
    static var autorizacionSeleccionada = Autorizacion()
    
    let jsonAutorizaciones: NSArray = OpcionesSecundariasViewController.jsonAutorizaciones!
    //let autorizaciones = ["Solicitud de ampliación de estadía generada por un informe médico",
      //                    "Procedimiento:MEDICAMENTOS COADYUVANTES PARA CANCER (SOLO OROPLUS)        Procedimiento en Idioma Extranjero:sdas asd<br/> Costo Total: $0.00<br/> Moneda Extranjera: $0.00<br/>"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonAutorizaciones.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AutorizacionesViewCell
        
        if let resultadoConsulta = self.jsonAutorizaciones[indexPath.row] as? Dictionary<String, Any>{
           
            cell.textDescripcion.text = resultadoConsulta["solicitudDescripcion"] as? String ?? ""
            cell.textCiudad.text = resultadoConsulta["ciudad"] as? String ?? ""
            cell.textTipoSolicitud.text = resultadoConsulta["solicitudTipo"] as? String ?? ""
            cell.textFechaSolicitud.text = resultadoConsulta["solicitaCreadoFecha"] as? String ?? ""
            cell.textEstado.text = resultadoConsulta["estado"] as? String ?? ""
            cell.textFechaAprobacion.text = resultadoConsulta["autorizaCreadoFecha"] as? String ?? ""
            cell.textFechaRechazo.text = resultadoConsulta["fechaRechazo"] as? String ?? ""
            
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        if let resultadoConsulta = self.jsonAutorizaciones[opcionSeleccionada] as? Dictionary<String, Any>{
            AutorizacionesViewController.autorizacionSeleccionada.consDetAutorizacion = String(resultadoConsulta["consDetAutorizacion"] as? Int ?? 0);
            AutorizacionesViewController.autorizacionSeleccionada.descripcion = resultadoConsulta["solicitudDescripcion"] as? String ?? ""
            AutorizacionesViewController.autorizacionSeleccionada.ciudad = resultadoConsulta["ciudad"] as? String ?? ""
            AutorizacionesViewController.autorizacionSeleccionada.tipoSolicitud = resultadoConsulta["solicitudTipo"] as? String ?? ""
            AutorizacionesViewController.autorizacionSeleccionada.fechaSolicitud = resultadoConsulta["solicitaCreadoFecha"] as? String ?? ""
            AutorizacionesViewController.autorizacionSeleccionada.estado = resultadoConsulta["estado"] as? String ?? ""
            AutorizacionesViewController.autorizacionSeleccionada.fechaAprobacion = resultadoConsulta["autorizaCreadoFecha"] as? String ?? ""
            AutorizacionesViewController.autorizacionSeleccionada.fechaRechazo = resultadoConsulta["fechaRechazo"] as? String ?? ""
            
            consultarDetalle(codigo: String(resultadoConsulta["consDetAutorizacion"] as? Int ?? 0))
            
        }
        
        return indexPath
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    func consultarDetalle(codigo: String){
        
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_detalle_autorizaciones+params+codigo)
        print(PropertiesProject.URL+PropertiesProject.complement_detalle_autorizaciones+params+codigo)
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
                        let jsonSolicitudDetalleAutorizacion: NSArray? = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if ((jsonSolicitudDetalleAutorizacion?.count)!>0){
                            AutorizacionesViewController.autorizacionSeleccionada.detalleAutorizacion = jsonSolicitudDetalleAutorizacion
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "detalleAutorizacionController")
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
                        
                    }
                }
            }
        }
        task.resume()
        
    }
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "autorizacionesView"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }
    

}
