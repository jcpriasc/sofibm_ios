//
//  NotaCreditoGiroViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class NotaCreditoGiroViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {

    let jsonNotaCreditoGiro: NSArray = OpcionesSecundariasLogViewController.jsonNotasCreditosGiros!;
    let lstNotaCreditoGiro = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
    
    static var notaCreditoGiroSeleccionado = NotaCreditoGiro()
    
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
        return (jsonNotaCreditoGiro.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotaCreditoGiroViewCellController
        
        if let solicitud = self.jsonNotaCreditoGiro[indexPath.row] as? Dictionary<String, Any>{
            cell.txtTipoGiro.text = (solicitud["tipoGiro"] as? String ?? "");
            cell.txtNombreBeneficiario.text = (solicitud["beneficiario"] as? String ?? "");
            cell.txtIdGiroAsociado.text = (solicitud["giroAsociado"] as? String ?? "");
            cell.txtConsecutivoNotaCredito.text = (solicitud["notaCredito"] as? String ?? "");
        }

        return (cell)
        
        
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        if let solicitud = self.jsonNotaCreditoGiro[opcionSeleccionada] as? Dictionary<String, Any>{
            
            NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.consecutivoNota = (solicitud["notaCredito"] as? String ?? "");
            NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.idGiroAsociado = (solicitud["giroAsociado"] as? String ?? "");
            NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.nombreBeneficiario = (solicitud["beneficiario"] as? String ?? "");
            NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.tipoGiro = (solicitud["tipoGiro"] as? String ?? "");
            NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.ciudad = (solicitud["ciudad"] as? String ?? "  ");
            NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.tipoBeneficiario = (solicitud["tipoBeneficiario"] as? String ?? "");
            NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.estado = (solicitud["estado"] as? String ?? "");
            NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.valorNota = FormatoDinero.formatearMoneda(texto: (solicitud["valorNota"] as? String ?? ""))!;
            NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.fechaRegistro = (solicitud["fechaRegistro"] as? String ?? "");
            NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.fechaLiquidacion = (solicitud["fechaLiquidacion"] as? String ?? "");
            
        }
        
        return indexPath
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "notasCreditoGirosController"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }
    
    
}
