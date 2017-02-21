//
//  FacturaTabGlosaViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FacturaTabGlosaViewController: UIViewController {

    
    @IBOutlet var lblInformacionFactura: UILabel!
    @IBOutlet var lblNumeroFactura: UILabel!
    @IBOutlet var lblFechaEmision: UILabel!
    @IBOutlet var lblFechaVencimientoPago: UILabel!
    @IBOutlet var lblFechaRecibidoCoomeva: UILabel!
    @IBOutlet var lblProveedor: UILabel!
    @IBOutlet var lblValorTotalFactura: UILabel!
    
    @IBOutlet var lblGlosa: UILabel!
    @IBOutlet var lblAplicaGlosa: UILabel!
    @IBOutlet var lblDescripcion: UILabel!
    @IBOutlet var lblMotivo: UILabel!
    @IBOutlet var lblValorGlosa: UILabel!
    
    @IBOutlet var txtNumeroFactura: UILabel!
    @IBOutlet var txtFechaEmision: UILabel!
    @IBOutlet var txtFechaVencimientoPago: UILabel!
    @IBOutlet var txtFechaRecibidoCoomeva: UILabel!
    @IBOutlet var txtProveedor: UILabel!
    @IBOutlet var txtValorTotalFactura: UILabel!
    
    @IBOutlet var txtAplicaGlosa: UILabel!
    @IBOutlet var txtDescripcion: UILabel!
    @IBOutlet var txtMotivo: UILabel!
    @IBOutlet var txtValorGlosa: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblInformacionFactura.text = NSLocalizedString("lbl_informacion_factura", comment: "lbl_informacion_factura")
        lblNumeroFactura.text = NSLocalizedString("lbl_numero_factura", comment: "lbl_numero_factura")
        lblFechaEmision.text = NSLocalizedString("lbl_fecha_emision", comment: "lbl_fecha_emision")
        lblFechaVencimientoPago.text = NSLocalizedString("lbl_fecha_vencimiento_pago", comment: "lbl_fecha_vencimiento_pago")
        lblFechaRecibidoCoomeva.text = NSLocalizedString("lbl_fecha_recibido_coomeva", comment: "lbl_fecha_recibido_coomeva")
        lblProveedor.text = NSLocalizedString("lbl_proveedor", comment: "lbl_proveedor")
        lblValorTotalFactura.text = NSLocalizedString("lbl_valor_total_factura", comment: "lbl_valor_total_factura")
        lblGlosa.text = NSLocalizedString("lbl_glosa", comment: "lbl_glosa")
        lblAplicaGlosa.text = NSLocalizedString("lbl_aplica_glosa", comment: "lbl_aplica_glosa")
        lblDescripcion.text = NSLocalizedString("lbl_descripcion", comment: "lbl_descripcion")
        lblMotivo.text = NSLocalizedString("lbl_motivo", comment: "lbl_motivo")
        lblValorGlosa.text = NSLocalizedString("lbl_valor_glosa", comment: "lbl_valor_glosa")
        
        if let solicitud = DetalleFacturaViewController.jsonDetalleFactura as? Dictionary<String, Any>{
            
            txtNumeroFactura.text = (solicitud["facturaNro"] as? String ?? "")
            txtFechaEmision.text = (solicitud["fechaEmision"] as? String ?? "")
            txtFechaVencimientoPago.text = (solicitud["fechaVencimientoPago"] as? String ?? "")
            txtFechaRecibidoCoomeva.text = (solicitud["fechaRecibidoCoomeva"] as? String ?? "")
            txtProveedor.text = (solicitud["proveedor"] as? String ?? "")
            txtValorTotalFactura.text = FormatoDinero.formatearMoneda(texto:(solicitud["valorTotalFactura"] as? String ?? ""))
            txtDescripcion.text = (solicitud["descripcion"] as? String ?? "")
            txtMotivo.text = (solicitud["motivo"] as? String ?? "")
            txtValorGlosa.text = FormatoDinero.formatearMoneda(texto:(solicitud["valorGlosa"] as? String ?? ""))
            
            if txtDescripcion.text == nil || txtDescripcion.text == "" {
                txtAplicaGlosa.text = ("NO")
            }else{
                txtAplicaGlosa.text = ("SI")
            }
            
            
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
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "facturaTabGlosa"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }

}
