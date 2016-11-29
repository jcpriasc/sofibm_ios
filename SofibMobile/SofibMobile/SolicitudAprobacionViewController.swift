//
//  SolicitudAprobacionViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class SolicitudAprobacionViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {

    let jsonSolicitudAprobacion: NSArray = OpcionesSecundariasLogViewController.jsonSolicitudAprobacion!;
    let lstSolicitudAprobacion = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
    
    static var solicitudAprobacionSeleccionado = SolicitudAprobacion()

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
        return (jsonSolicitudAprobacion.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SolicitudAprobacionViewCellController
        
        if let solicitud = self.jsonSolicitudAprobacion[indexPath.row] as? Dictionary<String, Any>{
            cell.txtNombrePaciente.text = (solicitud["nombrePaciente"] as? String ?? "");
            cell.txtFechaSolicitud.text = (solicitud["fechaSolicitud"] as? String ?? "");
            cell.txtEstado.text = (solicitud["estado"] as? String ?? "");
        }
        
        return (cell)
        
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        if let solicitud = self.jsonSolicitudAprobacion[opcionSeleccionada] as? Dictionary<String, Any>{
            
            SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.nombrePaciente = (solicitud["nombrePaciente"] as? String ?? "");
            SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.estado = (solicitud["estado"] as? String ?? "");
            SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.fechaSolicitud = (solicitud["fechaSolicitud"] as? String ?? "");
            SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.descripcion = (solicitud["solicitudDescripcion"] as? String ?? "");
            SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.tipoAutorizacion = (solicitud["tipoAutorizacion"] as? String ?? "");
            SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.tipoEntidad = (solicitud["tipoEntidad"] as? String ?? "");
            SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.solicitante = (solicitud["solicitante"] as? String ?? "");
            SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.autoriza = (solicitud["autoriza"] as? String ?? "");
            SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.fechaAutorizacion = (solicitud["fechaAutorizacion"] as? String ?? "");
            SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.servicio = (solicitud["servicio"] as? String ?? "");
            SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.proveedor = (solicitud["proveedor"] as? String ?? "");
            SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.prestador = (solicitud["prestador"] as? String ?? "");
            SolicitudAprobacionViewController.solicitudAprobacionSeleccionado.justificacion = (solicitud["justificacion"] as? String ?? "");
            
        }
        
        return indexPath
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
