//
//  DetalleFacturaViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 28/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleFacturaViewController: UIViewController {

    
    @IBOutlet var lblNumeroFactura: UILabel!
    @IBOutlet var lblFechaExpedicion: UILabel!
    @IBOutlet var lblEstado: UILabel!
    @IBOutlet var lblValorTotalFactura: UILabel!
    
    @IBOutlet var lblCiudad: UILabel!
    @IBOutlet var lblFechaRadicacion: UILabel!
    @IBOutlet var lblFechaAprobacionRechazo: UILabel!
    @IBOutlet var lblFechaAnulacion: UILabel!
    @IBOutlet var lblValorIva: UILabel!
    @IBOutlet var lblValorTotalPagar: UILabel!
    @IBOutlet var lblPrestadorProveedor: UILabel!
    @IBOutlet var lblTipoServicio: UILabel!
    
    @IBOutlet var txtCiudad: UILabel!
    @IBOutlet var txtFechaRadicacion: UILabel!
    @IBOutlet var txtFechaAprobacionRechazo: UILabel!
    @IBOutlet var txtFechaAnulacion: UILabel!
    @IBOutlet var txtValorIva: UILabel!
    @IBOutlet var txtValorTotalPagar: UILabel!
    @IBOutlet var txtPrestadorProveedor: UILabel!
    @IBOutlet var txtTipoServicio: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblNumeroFactura.text = "\(NSLocalizedString("lbl_numero_factura", comment: "lbl_numero_factura")) \(FacturaViewController.facturaSeleccionada.numeroFactura)"
        lblFechaExpedicion.text = "\(NSLocalizedString("lbl_fecha_expedicion", comment: "lbl_fecha_expedicion")) \(FacturaViewController.facturaSeleccionada.fechaExpedicion)"
        lblEstado.text = "\(NSLocalizedString("lbl_estado", comment: "lbl_estado")) \(FacturaViewController.facturaSeleccionada.estado)"
        lblValorTotalFactura.text = "\(NSLocalizedString("lbl_valor_total_factura", comment: "lbl_valor_total_factura")) \(FacturaViewController.facturaSeleccionada.valorTotalFactura)"
        
        lblCiudad.text = NSLocalizedString("lbl_ciudad", comment: "lbl_ciudad")
        lblFechaRadicacion.text = NSLocalizedString("lbl_fecha_radicacion", comment: "lbl_fecha_radicacion")
        lblFechaAprobacionRechazo.text = NSLocalizedString("lbl_fecha_aprobacion_o_rechazo", comment: "lbl_fecha_aprobacion_o_rechazo")
        lblFechaAnulacion.text = NSLocalizedString("lbl_fecha_anulacion", comment: "lbl_fecha_anulacion")
        lblValorIva.text = NSLocalizedString("lbl_valor_iva", comment: "lbl_valor_iva")
        lblValorTotalPagar.text = NSLocalizedString("lbl_valor_total_pagar", comment: "lbl_valor_total_pagar")
        lblPrestadorProveedor.text = NSLocalizedString("lbl_prestador_proveedor", comment: "lbl_prestador_proveedor")
        lblTipoServicio.text = NSLocalizedString("lbl_tipo_servicio", comment: "lbl_tipo_servicio")

        txtCiudad.text = FacturaViewController.facturaSeleccionada.ciudad
        txtFechaRadicacion.text = FacturaViewController.facturaSeleccionada.fechaRadicacion
        txtFechaAprobacionRechazo.text = FacturaViewController.facturaSeleccionada.fechaAprobacionRechazo
        txtFechaAnulacion.text = FacturaViewController.facturaSeleccionada.fechaAnulacion
        txtValorIva.text = FacturaViewController.facturaSeleccionada.valorIva
        txtValorTotalPagar.text = FacturaViewController.facturaSeleccionada.valorTotalPagar
        txtPrestadorProveedor.text = FacturaViewController.facturaSeleccionada.prestadorProveedor
        txtTipoServicio.text = FacturaViewController.facturaSeleccionada.tipoServicio
        
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
