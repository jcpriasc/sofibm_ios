//
//  NotaCreditoDebitoViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class NotaCreditoDebitoViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {

    let jsonNotaCreditoDebito: NSArray = OpcionesSecundariasLogViewController.jsonNotasCreditoDebito!;
    let lstNotaCreditoDebito = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
    
    static var notaCreditoDebitoSeleccionado = NotaCreditoDebito()

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
        return (jsonNotaCreditoDebito.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotaCreditoDebitoViewCellController
        
        if let solicitud = self.jsonNotaCreditoDebito[indexPath.row] as? Dictionary<String, Any>{
            cell.txtNumeroNota.text = (solicitud["numeroNota"] as? String ?? "");
            cell.txtNumeroFactura.text = (solicitud["numeroFactura"] as? String ?? "");
            cell.txtFechaExpedicion.text = (solicitud["fechaExpedicion"] as? String ?? "");
            cell.txtFechaAprobacion.text = (solicitud["fechaAprobacion"] as? String ?? "");
        }
        
        return (cell)
        
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        if let solicitud = self.jsonNotaCreditoDebito[opcionSeleccionada] as? Dictionary<String, Any>{
            
            NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.consNota = (solicitud["consNota"] as! Double?)!;
            NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.numeroNota = (solicitud["numeroNota"] as? String ?? "");
            NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.numeroFactura = (solicitud["numeroFactura"] as? String ?? "");
            NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.fechaExpedicion = (solicitud["fechaExpedicion"] as? String ?? "");
            NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.fechaAprobacion = (solicitud["fechaAprobacion"] as? String ?? "");
            NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.ciudad = (solicitud["ciudad"] as? String ?? "");
            NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.proveedor = (solicitud["proveedor"] as? String ?? "");
            NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.motivo = (solicitud["motivo"] as? String ?? "");
            NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.estado = (solicitud["estado"] as? String ?? "");
            NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.tipoNota = (solicitud["tipoNota"] as? String ?? "");
            NotaCreditoDebitoViewController.notaCreditoDebitoSeleccionado.valorTotalNotaCredito = (solicitud["valorTotalNotaCredito"] as? String ?? "");
            
        }
        
        return indexPath
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
