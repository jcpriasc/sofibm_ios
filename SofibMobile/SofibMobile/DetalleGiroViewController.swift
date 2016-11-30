//
//  DetalleGiroViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 28/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleGiroViewController: UIViewController {

    @IBOutlet var lblNumeroSolicitud: UILabel!
    @IBOutlet var lblTipoGiro: UILabel!
    @IBOutlet var lblIdentificacionBeneficiario: UILabel!
    @IBOutlet var lblBeneficiario: UILabel!
    @IBOutlet var lblEstado: UILabel!
    
    @IBOutlet var lblTipoIdentificacionBeneficiario: UILabel!
    @IBOutlet var lblFechaInicio: UILabel!
    @IBOutlet var lblFechaFin: UILabel!
    @IBOutlet var lblValorMonedaExtranjero: UILabel!
    @IBOutlet var lblValorMonedaLocal: UILabel!
    @IBOutlet var lblRegistraDevolucion: UILabel!
    @IBOutlet var lblValorDevolucion: UILabel!
    @IBOutlet var lblLegalizado: UILabel!
    @IBOutlet var lblValorLegalizado: UILabel!
    @IBOutlet var lblAprobadoGiro: UILabel!
    @IBOutlet var lblJustificacionAnulacion: UILabel!
    
    @IBOutlet var txtTipoIdentificacionBeneficiario: UILabel!
    @IBOutlet var txtFechaInicio: UILabel!
    @IBOutlet var txtFechaFin: UILabel!
    @IBOutlet var txtValorMonedaExtranjero: UILabel!
    @IBOutlet var txtValorMonedaLocal: UILabel!
    @IBOutlet var txtRegistraDevolucion: UILabel!
    @IBOutlet var txtValorDevolucion: UILabel!
    @IBOutlet var txtLegalizado: UILabel!
    @IBOutlet var txtValorLegalizado: UILabel!
    @IBOutlet var txtAprobadoGiro: UILabel!
    @IBOutlet var txtJustificacionAnulacion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTipoIdentificacionBeneficiario.text = NSLocalizedString("lbl_tipo_identificacion_beneficiario", comment: "lbl_tipo_identificacion_beneficiario")
        lblFechaInicio.text = NSLocalizedString("lbl_fecha_inicio", comment: "lbl_fecha_inicio")
        lblFechaFin.text = NSLocalizedString("lbl_fecha_fin", comment: "lbl_fecha_fin")
        lblValorMonedaExtranjero.text = NSLocalizedString("lbl_valor_moneda_extranjero", comment: "lbl_valor_moneda_extranjero")
        lblValorMonedaLocal.text = NSLocalizedString("lbl_valor_moneda_local", comment: "lbl_valor_moneda_local")
        lblRegistraDevolucion.text = NSLocalizedString("lbl_registra_devolucion", comment: "lbl_registra_devolucion")
        lblValorDevolucion.text = NSLocalizedString("lbl_valor_devolucion", comment: "lbl_valor_devolucion")
        lblLegalizado.text = NSLocalizedString("lbl_legalizado", comment: "lbl_legalizado")
        lblValorLegalizado.text = NSLocalizedString("lbl_valor_legalizado", comment: "lbl_valor_legalizado")
        lblAprobadoGiro.text = NSLocalizedString("lbl_aprobado_giro", comment: "lbl_aprobado_giro")
        lblJustificacionAnulacion.text = NSLocalizedString("lbl_justificacion_anulacion", comment: "lbl_justificacion_anulacion")
        
        lblNumeroSolicitud.text = "\(NSLocalizedString("lbl_numero_solicitud", comment: "lbl_numero_solicitud")) \(GiroViewController.giroSeleccionado.numeroSolicitud)"
        lblTipoGiro.text = "\(NSLocalizedString("lbl_tipo_giro", comment: "lbl_tipo_giro")) \(GiroViewController.giroSeleccionado.tipoGiro)"
        lblIdentificacionBeneficiario.text = "\(NSLocalizedString("lbl_identificacion_beneficiario", comment: "lbl_identificacion_beneficiario")) \(GiroViewController.giroSeleccionado.identificacionBeneficiario)"
        lblBeneficiario.text = "\(NSLocalizedString("lbl_beneficiario", comment: "lbl_beneficiario")) \(GiroViewController.giroSeleccionado.beneficiario)"
        lblEstado.text = "\(NSLocalizedString("lbl_estado", comment: "lbl_estado")) \(GiroViewController.giroSeleccionado.estado)"
        
        txtTipoIdentificacionBeneficiario.text = GiroViewController.giroSeleccionado.tipoIdentificacionBeneficiario
        txtFechaInicio.text = GiroViewController.giroSeleccionado.fechaInicio
        txtFechaFin.text = GiroViewController.giroSeleccionado.fechaFin
        txtValorMonedaExtranjero.text = GiroViewController.giroSeleccionado.valorMonedaExtranjero
        txtValorMonedaLocal.text = GiroViewController.giroSeleccionado.valorMonedaLocal
        txtRegistraDevolucion.text = GiroViewController.giroSeleccionado.registraDevolucion
        txtValorDevolucion.text = GiroViewController.giroSeleccionado.valorDevolucion
        txtLegalizado.text = GiroViewController.giroSeleccionado.legalizado
        txtValorLegalizado.text = GiroViewController.giroSeleccionado.valorLegalizado
        txtAprobadoGiro.text = GiroViewController.giroSeleccionado.aprobadoGiro
        txtJustificacionAnulacion.text = GiroViewController.giroSeleccionado.justificacionAnulacion
        
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