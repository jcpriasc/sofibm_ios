//
//  ServicioNoAsistencialViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit
import Alamofire

class ServicioNoAsistencialViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    let jsonServicioNoAsistencial: NSArray = OpcionesSecundariasLogViewController.jsonServicioNoAsistencial!;
    let servicioNoAsistencial = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
    
     static var servicioNoAsistencial = ServicioNoAsistencial()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.lstServicioNoAsistencial.delegate = self;
       // self.lstServicioNoAsistencial.dataSource = self;
        
       // let archivo  = UINib(nibName: idCelda, bundle:nil);
       // self.lstServicioNoAsistencial.register(archivo, forCellReuseIdentifier: idCelda)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       // self.obtenerServiciosNoAsistenciales()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonServicioNoAsistencial.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ServicioNoAsistencialViewCellController
        
        
        if let solicitud = self.jsonServicioNoAsistencial[indexPath.row] as? Dictionary<String, Any>{
            cell.txtNumeroSolicitud.text = (solicitud["codSolicitud"] as? String ?? "");
            cell.txtIdentificacion.text = (solicitud["tipoSolicitud"] as? String ?? "");
            cell.txtNombre.text = (solicitud["ciudad"] as? String ?? "");
        }
        
        return (cell)
 
        
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        if let solicitud = self.jsonServicioNoAsistencial[opcionSeleccionada] as? Dictionary<String, Any>{
        
            ServicioNoAsistencialViewController.servicioNoAsistencial.numeroSolicitud = (solicitud["codSolicitud"] as? String ?? "");
            ServicioNoAsistencialViewController.servicioNoAsistencial.tipoSolicitud = (solicitud["tipoSolicitud"] as? String ?? "");
            ServicioNoAsistencialViewController.servicioNoAsistencial.ciudad = (solicitud["ciudad"] as? String ?? "");
            ServicioNoAsistencialViewController.servicioNoAsistencial.estado = (solicitud["estado"] as? String ?? "");
            ServicioNoAsistencialViewController.servicioNoAsistencial.justificacion = (solicitud["justificacionCancelado"] as? String ?? "");
            ServicioNoAsistencialViewController.servicioNoAsistencial.consServicio = (solicitud["consservicio"] as! Double?)!;
            
             //result["artworkUrl60"] as? String ?? ""
        }
        
        return indexPath
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "servicioNoAsistencialController"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }
    
}
