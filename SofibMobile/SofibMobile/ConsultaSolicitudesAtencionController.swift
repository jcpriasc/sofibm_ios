//
//  ConsultaSolicitudesAtencionController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/1/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class ConsultaSolicitudesAtencionController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let solicitudesAtencion: NSArray = FiltrosSolicitudAtencionController.solicitudesAtencionJson!;
   
    static var solicitudAtencionSeleccionada = SolicitudesAtencion()
    
    override func viewWillAppear(_ animated: Bool) {
      

    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (solicitudesAtencion.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SolicitudAtencionTableViewCell
        
        print(solicitudesAtencion[indexPath.row])
        
        if let solicitud = self.solicitudesAtencion[indexPath.row] as? Dictionary<String, Any>{
            cell.solicitudAtencionTxt.text = solicitud["consSolicitud"] as! String?;
            cell.identificacionTxt.text = solicitud["identificacion"] as! String?;
            cell.nombreTxt.text = solicitud["nombre"] as! String?;
            cell.convenioTxt.text = solicitud["convenio"] as! String?;
        }
        
        /*
        cell.solicitudAtencionTxt.text = solicitudesAtencion[indexPath.row]
        */
        
        return (cell)
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        
        let opcionSeleccionada = indexPath[1]
        
        if let solicitud = self.solicitudesAtencion[opcionSeleccionada] as? Dictionary<String, Any>{
            
            ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.consSolicitud = (solicitud["consSolicitud"] as! String?)!;
            ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.identificacion = (solicitud["identificacion"] as! String?)!;
            ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.nombre = (solicitud["nombre"] as! String?)!;
            ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.credencial = (solicitud["credencial"] as! String?)!;
            ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.convenio = (solicitud["convenio"] as! String?)!;
            ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.ciudadInicial = (solicitud["ciudadInicial"] as! String?)!;
            ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.ciudadActual = (solicitud["ciudadActual"] as! String?)!;
            ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.traslado = (solicitud["traslado"] as! String?)!;
            ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.fechaProg = (solicitud["fechaProg"] as! String?)!;
            ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.estado = (solicitud["estado"] as! String?)!;
            ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.fechaCreado = (solicitud["fechaCreado"] as! String?)!;
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "detalleSolicitudAtencionView")
            self.show(vc as! UIViewController, sender: vc)
            
            
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

}
