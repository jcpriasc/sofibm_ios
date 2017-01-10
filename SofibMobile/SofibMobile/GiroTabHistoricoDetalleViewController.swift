//
//  GiroTabHistoricoDetalleViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class GiroTabHistoricoDetalleViewController: UIViewController {

    @IBOutlet var lblHistoricoGiro: UILabel!
    @IBOutlet var lblIdentificacion: UILabel!
    @IBOutlet var lblCiudad: UILabel!
    @IBOutlet var lblConvenio: UILabel!
    @IBOutlet var lblEstado: UILabel!
    @IBOutlet var lblTipoGiro: UILabel!
    @IBOutlet var lblTipoBeneficiario: UILabel!
    @IBOutlet var lblBeneficiario: UILabel!
    @IBOutlet var lblFechaInio: UILabel!
    @IBOutlet var lblFechaFin: UILabel!
    @IBOutlet var lblMonedaExtranjera: UILabel!
    @IBOutlet var lblMonedaLocal: UILabel!
    @IBOutlet var lblRegistraDevolucion: UILabel!
    @IBOutlet var lblValorDevolucion: UILabel!
    @IBOutlet var lblLegalizado: UILabel!
    @IBOutlet var lblValorLegalizado: UILabel!
    
    @IBOutlet var txtIdentificacion: UILabel!
    @IBOutlet var txtCiudad: UILabel!
    @IBOutlet var txtConvenio: UILabel!
    @IBOutlet var txtEstado: UILabel!
    @IBOutlet var txtTipoGiro: UILabel!
    @IBOutlet var txtTipoBeneficiario: UILabel!
    @IBOutlet var txtBeneficiario: UILabel!
    @IBOutlet var txtFechaInicio: UILabel!
    @IBOutlet var txtFechaFin: UILabel!
    @IBOutlet var txtMonedaExtranjera: UILabel!
    @IBOutlet var txtMonedaLocal: UILabel!
    @IBOutlet var txtRegistraDevolucion: UILabel!
    @IBOutlet var txtValorDevolucion: UILabel!
    @IBOutlet var txtLegalizado: UILabel!
    @IBOutlet var txtValorLegalizado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblHistoricoGiro.text = NSLocalizedString("lbl_historico_giro", comment: "lbl_historico_giro")
        lblIdentificacion.text = NSLocalizedString("identificacion", comment: "identificacion")
        lblCiudad.text = NSLocalizedString("lbl_ciudad", comment: "lbl_ciudad")
        lblConvenio.text = NSLocalizedString("lbl_convenio", comment: "lbl_convenio")
        lblEstado.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")
        lblTipoGiro.text = NSLocalizedString("lbl_tipo_giro", comment: "lbl_tipo_giro")
        lblTipoBeneficiario.text = NSLocalizedString("lbl_tipo_beneficiario", comment: "lbl_tipo_beneficiario")
        lblBeneficiario.text = NSLocalizedString("lbl_beneficiario", comment: "lbl_beneficiario")
        lblFechaInio.text = NSLocalizedString("lbl_fecha_inicio", comment: "lbl_fecha_inicio")
        lblFechaFin.text = NSLocalizedString("lbl_fecha_fin", comment: "lbl_fecha_fin")
        lblMonedaExtranjera.text = NSLocalizedString("lbl_valor_moneda_extranjero", comment: "lbl_valor_moneda_extranjero")
        lblMonedaLocal.text = NSLocalizedString("lbl_valor_moneda_local", comment: "lbl_valor_moneda_local")
        lblRegistraDevolucion.text = NSLocalizedString("lbl_registra_devolucion", comment: "lbl_registra_devolucion")
        lblValorDevolucion.text = NSLocalizedString("lbl_valor_devolucion", comment: "lbl_valor_devolucion")
        lblLegalizado.text = NSLocalizedString("lbl_legalizado", comment: "lbl_legalizado")
        lblValorLegalizado.text = NSLocalizedString("lbl_valor_legalizado", comment: "lbl_valor_legalizado")
        
        txtIdentificacion.text = GiroTabHistoricoViewController.detalleHistoricoGiro.identificaion
        txtCiudad.text = GiroTabHistoricoViewController.detalleHistoricoGiro.ciudad
        txtConvenio.text = GiroTabHistoricoViewController.detalleHistoricoGiro.convenio
        txtEstado.text = GiroTabHistoricoViewController.detalleHistoricoGiro.estado
        txtTipoGiro.text = GiroTabHistoricoViewController.detalleHistoricoGiro.tipoGiro
        txtTipoBeneficiario.text = GiroTabHistoricoViewController.detalleHistoricoGiro.tipoBeneficiario
        txtBeneficiario.text = GiroTabHistoricoViewController.detalleHistoricoGiro.beneficiario
        txtFechaInicio.text = GiroTabHistoricoViewController.detalleHistoricoGiro.fechaInicio
        txtFechaFin.text = GiroTabHistoricoViewController.detalleHistoricoGiro.fechaFin
        txtMonedaExtranjera.text = FormatoDinero.formatearMoneda(texto: GiroTabHistoricoViewController.detalleHistoricoGiro.valorMonedaExtranjero)
        txtMonedaLocal.text = FormatoDinero.formatearMoneda(texto: GiroTabHistoricoViewController.detalleHistoricoGiro.valorMonedaLocal)
        txtRegistraDevolucion.text = GiroTabHistoricoViewController.detalleHistoricoGiro.registraDevolucion
        txtValorDevolucion.text = FormatoDinero.formatearMoneda(texto: GiroTabHistoricoViewController.detalleHistoricoGiro.valorDevolucion)
        txtLegalizado.text = GiroTabHistoricoViewController.detalleHistoricoGiro.legalizado
        txtValorLegalizado.text = FormatoDinero.formatearMoneda(texto: GiroTabHistoricoViewController.detalleHistoricoGiro.valorLegalizado)
        
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
