//
//  NotaCreditoDebitoTabImpuestoDetalleViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class NotaCreditoDebitoTabImpuestoDetalleViewController: UIViewController {

    @IBOutlet var lblImpuesto: UILabel!
    @IBOutlet var lblProveedor: UILabel!
    @IBOutlet var lblNumeroOrdenServicio: UILabel!
    @IBOutlet var lblServicio: UILabel!
    @IBOutlet var lblFechaInicio: UILabel!
    @IBOutlet var lblFechaFinalizacion: UILabel!
    @IBOutlet var lblValorServicio: UILabel!
    @IBOutlet var lblSeguroHotelero: UILabel!
    @IBOutlet var lblValorNota: UILabel!
    
    @IBOutlet var txtProveedor: UILabel!
    @IBOutlet var txtNumeroOrdenServicio: UILabel!
    @IBOutlet var txtServicio: UILabel!
    @IBOutlet var txtFechaInicio: UILabel!
    @IBOutlet var txtFechaFinalizacion: UILabel!
    @IBOutlet var txtValorServicio: UILabel!
    @IBOutlet var txtSeguroHotelero: UILabel!
    @IBOutlet var txtValorNota: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblImpuesto.text = NSLocalizedString("lbl_impuesto", comment: "lbl_impuesto")
        lblProveedor.text = NSLocalizedString("lbl_proveedor", comment: "lbl_proveedor")
        lblNumeroOrdenServicio.text = NSLocalizedString("lbl_numero_orden_servicio", comment: "lbl_numero_orden_servicio")
        lblServicio.text = NSLocalizedString("lbl_servicio", comment: "lbl_servicio")
        lblFechaInicio.text = NSLocalizedString("lbl_fecha_inicio", comment: "lbl_fecha_inicio")
        lblFechaFinalizacion.text = NSLocalizedString("lbl_fecha_fin", comment: "lbl_fecha_fin")
        lblValorServicio.text = NSLocalizedString("lbl_valor_servicio", comment: "lbl_valor_servicio")
        lblSeguroHotelero.text = NSLocalizedString("lbl_seguro_hotelero", comment: "lbl_seguro_hotelero")
        lblValorNota.text = NSLocalizedString("lbl_valor_nota", comment: "lbl_valor_nota")
        
        txtProveedor.text = NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.proveedor
        txtNumeroOrdenServicio.text = NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.numeroOrdenServicio
        txtServicio.text = NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.servicio
        txtFechaInicio.text = NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.fechaInicio
        txtFechaFinalizacion.text = NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.fechaFinalizacion
        txtValorServicio.text = NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.valorServicio
        txtSeguroHotelero.text = NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.seguroHotelero
        txtValorNota.text = NotaCreditoDebitoTabImpuestoViewController.detalleImpuestoSeleccionado.valorNota
        

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
