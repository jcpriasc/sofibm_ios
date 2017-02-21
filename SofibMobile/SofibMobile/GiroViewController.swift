//
//  GiroViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class GiroViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {

    let jsonGiro: NSArray = OpcionesSecundariasLogViewController.jsonGiros!;
    let lstGiros = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
    
    static var giroSeleccionado = Giro()
    
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
        return (jsonGiro.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GiroViewCellController
        
        if let solicitud = self.jsonGiro[indexPath.row] as? Dictionary<String, Any>{
            cell.txtEstado.text = (solicitud["estado"] as? String ?? "");
            cell.txtBeneficiario.text = (solicitud["beneficiario"] as? String ?? "");
            cell.txtIdentificacionBeneficiario.text = (solicitud["identificacionBeneficiario"] as? String ?? "");
            cell.txtTipoGiro.text = (solicitud["tipoGiro"] as? String ?? "");
            cell.txtIdentificacion.text = (solicitud["id"] as? String ?? "");
        }
        
        return (cell)
        
        
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        if let solicitud = self.jsonGiro[opcionSeleccionada] as? Dictionary<String, Any>{
            
            GiroViewController.giroSeleccionado.consecutivo = (solicitud["cons"] as! Double?)!;
            GiroViewController.giroSeleccionado.numeroSolicitud = (solicitud["id"] as? String ?? "");
            GiroViewController.giroSeleccionado.tipoGiro = (solicitud["tipoGiro"] as! String?)!;
            GiroViewController.giroSeleccionado.identificacionBeneficiario = (solicitud["identificacionBeneficiario"] as? String ?? "");
            GiroViewController.giroSeleccionado.beneficiario = (solicitud["beneficiario"] as? String ?? "");
            GiroViewController.giroSeleccionado.estado = (solicitud["estado"] as? String ?? "");
            GiroViewController.giroSeleccionado.ciudad = (solicitud["ciudad"] as? String ?? "");
            GiroViewController.giroSeleccionado.tipoBeneficiario = (solicitud["tipoBeneficiario"] as? String ?? "");
            GiroViewController.giroSeleccionado.tipoIdentificacionBeneficiario = (solicitud["tipoIdentificacionBeneficiario"] as? String ?? "");
            GiroViewController.giroSeleccionado.fechaInicio = (solicitud["fechaInicio"] as? String ?? "");
            GiroViewController.giroSeleccionado.fechaFin = (solicitud["fechaFin"] as? String ?? "");
            GiroViewController.giroSeleccionado.valorMonedaExtranjero = (solicitud["valorMonedaExtranjera"] as? String ?? "");
            GiroViewController.giroSeleccionado.valorMonedaLocal = (solicitud["valorMonedaLocal"] as? String ?? "");
            GiroViewController.giroSeleccionado.registraDevolucion = (solicitud["registraDevolucion"] as? String ?? "");
            GiroViewController.giroSeleccionado.valorDevolucion = (solicitud["valorDevolucion"] as? String ?? "");
            GiroViewController.giroSeleccionado.legalizado = (solicitud["legalizado"] as? String ?? "");
            GiroViewController.giroSeleccionado.valorLegalizado = (solicitud["valorLegalizado"] as? String ?? "");
            GiroViewController.giroSeleccionado.justificacionAnulacion = (solicitud["justificacionAnulacion"] as? String ?? "");
            GiroViewController.giroSeleccionado.aprobadoGiro = (solicitud["aprobadorGiro"] as? String ?? "");
            
        }
        
        return indexPath
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "girosController"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }
}
