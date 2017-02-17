//
//  DetalleNotaCreditoGiroViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 25/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleNotaCreditoGiroViewController: UIViewController {

    
    @IBOutlet var lblConsecutivoNota: UILabel!
    @IBOutlet var lblIdGiroAsociado: UILabel!
    @IBOutlet var lblNombreBeneficiario: UILabel!
    @IBOutlet var lblTipoGiro: UILabel!
    @IBOutlet var txtCiudad: UILabel!
    @IBOutlet var txtTipoBeneficiario: UILabel!
    @IBOutlet var txtEstado: UILabel!
    @IBOutlet var txtValorNota: UILabel!
    @IBOutlet var txtFechaLiquidacion: UILabel!
    @IBOutlet var txtFechaRegistro: UILabel!
    @IBOutlet var lblNotaCredito: UILabel!
    
    
    @IBOutlet var lblCiudad: UILabel!
    @IBOutlet var lblTipoBeneficiario: UILabel!
    @IBOutlet var lblEstado: UILabel!
    @IBOutlet var lblValorNota: UILabel!
    @IBOutlet var lblFechaRegistro: UILabel!
    @IBOutlet var lblFechaLiquidacion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblConsecutivoNota.text = NSLocalizedString("lbl_consecutivo_nota_credito", comment: "lbl_consecutivo_nota_credito")        
        lblNotaCredito.text = NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.consecutivoNota
        
        
        lblIdGiroAsociado.text = "\(NSLocalizedString("lbl_id_giro_asociado", comment: "lbl_id_giro_asociado"))\(": ") \(NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.idGiroAsociado)"
        lblNombreBeneficiario.text = "\(NSLocalizedString("lbl_nombre_beneficiario", comment: "lbl_nombre_beneficiario"))\(": ") \(NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.nombreBeneficiario)"
        lblTipoGiro.text = "\(NSLocalizedString("lbl_tipo_giro", comment: "lbl_tipo_giro"))\(": ") \(NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.tipoGiro)"
        
        txtCiudad.text = (NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.ciudad)

        txtTipoBeneficiario.text = NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.tipoBeneficiario
        txtEstado.text = NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.estado
        txtValorNota.text = NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.valorNota
        txtFechaLiquidacion.text = NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.fechaLiquidacion
        txtFechaRegistro.text = NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.fechaRegistro
        
        lblCiudad.text = NSLocalizedString("lbl_ciudad", comment: "lbl_ciudad")
        lblTipoBeneficiario.text = NSLocalizedString("lbl_tipo_beneficiario", comment: "lbl_tipo_beneficiario")
        lblEstado.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")
        lblValorNota.text = NSLocalizedString("lbl_valor_nota", comment: "lbl_valor_nota")
        lblFechaRegistro.text = NSLocalizedString("lbl_fecha_registro", comment: "lbl_fecha_registro")
        lblFechaLiquidacion.text = NSLocalizedString("lbl_fecha_liquidacion", comment: "lbl_fecha_liquidacion")
        
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
