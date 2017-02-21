//
//  NotaCreditoDebitoTabServicioViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class NotaCreditoDebitoTabServicioViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var lblNumeroOrdenServicio: UILabel!
    @IBOutlet var lblServicio: UILabel!
   
    static var jsonTabServicios: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let solicitud = DetalleNotaCreditoDebitoViewController.jsonDetalleNotaCreditoDebito  as? Dictionary<String, Any>{
            
            NotaCreditoDebitoTabServicioViewController.jsonTabServicios = solicitud["impuestos"] as? NSArray
            
            lblNumeroOrdenServicio.text = "\(NSLocalizedString("lbl_numero_orden_servicio", comment: "lbl_numero_orden_servicio")) \(": ")\((solicitud["nroNota"] as? String ?? ""))"
            lblServicio.text = "\(NSLocalizedString("lbl_servicio", comment: "lbl_servicio")) \(": ")\((solicitud["servicio"] as? String ?? ""))"
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if NotaCreditoDebitoTabServicioViewController.jsonTabServicios==nil {
            return 0
        }else{
            return (NotaCreditoDebitoTabServicioViewController.jsonTabServicios!.count)
        }
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotaCreditoDebitoTabServicioViewCellController
        
        if let solicitud = NotaCreditoDebitoTabServicioViewController.jsonTabServicios?[indexPath.row] as? Dictionary<String, Any>{
            
            cell.txtNumeroOrdenServicio.text = (solicitud["ordenServicio"] as? String ?? " ");
            cell.txtTipoImpuesto.text = (solicitud["tipoImpuesto"] as? String ?? " ");
            cell.txtServicio.text = (solicitud["servicio"] as? String ?? " ");
            cell.txtPorcentaje.text = (solicitud["porcentaje"] as? String ?? " ");
            cell.txtValorImpuesto.text = FormatoDinero.formatearMoneda(texto:(solicitud["valorImpuesto"] as? String ?? " "));
            cell.txtAplicaSeguroHotelero.text = (solicitud["aplicaSeguro"] as? String ?? " ");
            
            
        }
        
        return (cell)
        
        
    }

    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "notaServicioController"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }

}
