//
//  NotaCreditoDebitoTabInformacionViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class NotaCreditoDebitoTabInformacionViewController: UIViewController {
    
    
    @IBOutlet var lblInformacionFactura: UILabel!
    @IBOutlet var lblNumeroFactura: UILabel!
    @IBOutlet var lblFechaEmision: UILabel!
    @IBOutlet var lblFechaVencimientoPago: UILabel!
    @IBOutlet var lblFechaRecibidoCoomeva: UILabel!
    @IBOutlet var lblProveedor: UILabel!
    @IBOutlet var lblValorTotalFactura: UILabel!
    
    @IBOutlet var lblValorTotalPagar: UILabel!
    @IBOutlet var lblNotaCredito: UILabel!
    @IBOutlet var lblNumeroNota: UILabel!
    @IBOutlet var lblFechaExpedicion: UILabel!
    @IBOutlet var lblMotivo: UILabel!
    @IBOutlet var lblValorTotalNotaCredito: UILabel!
    @IBOutlet var lblFechaRecibidoCoomevaNota: UILabel!
    
    @IBOutlet var txtFechaRecibidoCoomeva: UILabel!
    @IBOutlet var txtNumeroFactura: UILabel!
    @IBOutlet var txtFechaEmision: UILabel!
    @IBOutlet var txtFechaVencimientoPago: UILabel!
    @IBOutlet var txtProveedor: UILabel!
    @IBOutlet var txtValorTotalFactura: UILabel!
    @IBOutlet var txtValorTotalPagar: UILabel!
   @IBOutlet var txtNumeroNota: UILabel!
    @IBOutlet var txtFechaExpedicion: UILabel!
    @IBOutlet var txtmotivo: UILabel!
    @IBOutlet var txtFechaRecibidoCoomevaNota: UILabel!
    @IBOutlet var txtValorTotalNotaCredito: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblInformacionFactura.text = NSLocalizedString("lbl_informacion_factura", comment: "lbl_informacion_factura")
        lblNumeroFactura.text = NSLocalizedString("lbl_numero_factura", comment: "lbl_numero_factura")
        lblFechaEmision.text = NSLocalizedString("lbl_fecha_emision", comment: "lbl_fecha_emision")
        lblFechaVencimientoPago.text = NSLocalizedString("lbl_fecha_vencimiento_pago", comment: "lbl_fecha_vencimiento_pago")
        lblFechaRecibidoCoomeva.text = NSLocalizedString("lbl_fecha_recibido_coomeva", comment: "lbl_fecha_recibido_coomeva")
        lblProveedor.text = NSLocalizedString("lbl_proveedor", comment: "lbl_proveedor")
        lblValorTotalFactura.text = NSLocalizedString("lbl_valor_total_factura", comment: "lbl_valor_total_factura")
        lblValorTotalPagar.text = NSLocalizedString("lbl_valor_total_pagar", comment: "lbl_valor_total_pagar")
         lblNotaCredito.text = NSLocalizedString("lbl_nota_credito", comment: "lbl_nota_credito")
         lblNumeroNota.text = NSLocalizedString("lbl_nota_credito_debito", comment: "lbl_nota_credito_debito")
         lblFechaExpedicion.text = NSLocalizedString("lbl_fecha_expedicion", comment: "lbl_fecha_expedicion")
         lblMotivo.text = NSLocalizedString("lbl_motivo", comment: "lbl_motivo")
         lblValorTotalNotaCredito.text = NSLocalizedString("lbl_valor_total_nota_credito", comment: "lbl_valor_total_nota_credito")
         lblFechaRecibidoCoomevaNota.text = NSLocalizedString("lbl_fecha_recibido_coomeva", comment: "lbl_fecha_recibido_coomeva")
        
        if let solicitud = DetalleNotaCreditoDebitoViewController.jsonDetalleNotaCreditoDebito as? Dictionary<String, Any>{
            
             txtFechaRecibidoCoomeva.text = (solicitud["fechaRecibido"] as? String ?? "")
             txtNumeroFactura.text = (solicitud["facturaNro"] as? String ?? "")
             txtFechaEmision.text = (solicitud["fechaEmision"] as? String ?? "")
             txtFechaVencimientoPago.text = (solicitud["fechaVencimiento"] as? String ?? "")
             txtProveedor.text = (solicitud["proveedor"] as? String ?? "")
             txtValorTotalFactura.text = (solicitud["valorTotalFactura"] as? String ?? "")
             txtValorTotalPagar.text = (solicitud["valorTotalPagar"] as? String ?? "")
             txtNumeroNota.text = (solicitud["nroNota"] as? String ?? "")
             txtFechaExpedicion.text = (solicitud["fechaExpedicionNota"] as? String ?? "")
             txtmotivo.text = (solicitud["notaMotivo"] as? String ?? "")
             txtFechaRecibidoCoomevaNota.text = (solicitud["fechaRecibidoCoomevaNota"] as? String ?? "")
             txtValorTotalNotaCredito.text = (solicitud["valorTotalNotaCredito"] as? String ?? "")
            
            
        }

       
        
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
