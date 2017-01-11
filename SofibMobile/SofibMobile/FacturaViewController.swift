//
//  FacturaViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FacturaViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {

    let jsonFactura: NSArray = OpcionesSecundariasLogViewController.jsonFacturas!;
    let lstFactura = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
    
    static var facturaSeleccionada = Factura()
    
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
        return (jsonFactura.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FacturaViewCellController

        if let solicitud = self.jsonFactura[indexPath.row] as? Dictionary<String, Any>{
            cell.txtValorTotalFactura.text = FormatoDinero.formatearMoneda(texto: (solicitud["valorTotalFactura"] as? String ?? ""));
            cell.txtEstado.text = (solicitud["estado"] as? String ?? "");
            cell.txtFechaExpedicion.text = (solicitud["fechaExpedicion"] as? String ?? "");
            cell.txtNumeroFactura.text = (solicitud["facturaNro"] as? String ?? "");
        }

        return (cell)
        
        
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        if let solicitud = self.jsonFactura[opcionSeleccionada] as? Dictionary<String, Any>{
            
            FacturaViewController.facturaSeleccionada.numeroFactura = (solicitud["facturaNro"] as? String ?? "");
            FacturaViewController.facturaSeleccionada.fechaExpedicion = (solicitud["fechaExpedicion"] as? String ?? "");
            FacturaViewController.facturaSeleccionada.estado = (solicitud["estado"] as? String ?? "");
            FacturaViewController.facturaSeleccionada.valorTotalFactura = (solicitud["valorTotalFactura"] as? String ?? "");
            FacturaViewController.facturaSeleccionada.ciudad = (solicitud["ciudad"] as? String ?? "");
            FacturaViewController.facturaSeleccionada.fechaRadicacion = (solicitud["fechaRadicacion"] as? String ?? "");
            FacturaViewController.facturaSeleccionada.fechaAprobacionRechazo = (solicitud["fechaAprobacion"] as? String ?? "");
            FacturaViewController.facturaSeleccionada.fechaAnulacion = (solicitud["fechaAnulacion"] as? String ?? "");
            FacturaViewController.facturaSeleccionada.valorIva = (solicitud["valorIva"] as? String ?? "");
            FacturaViewController.facturaSeleccionada.valorTotalPagar = (solicitud["valorTotalPagar"] as? String ?? "");
            FacturaViewController.facturaSeleccionada.prestadorProveedor = (solicitud["proveedor"] as? String ?? "");
            FacturaViewController.facturaSeleccionada.tipoServicio = (solicitud["tipoSolicitud"] as? String ?? "");
            FacturaViewController.facturaSeleccionada.consFactura = (solicitud["consFactura"] as! Double?)!;
            
    
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "detalleFactura")
            self.show(vc as! UIViewController, sender: vc)
        }
        
        return indexPath
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
