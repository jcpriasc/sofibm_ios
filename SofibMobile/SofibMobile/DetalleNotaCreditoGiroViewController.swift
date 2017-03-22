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
    @IBOutlet var lblNotaCredito: UILabel!
    
    @IBOutlet var lblCiudad: UILabel!
    @IBOutlet var lblIdGiroAsociado: UILabel!
    
    @IBOutlet var lblTipoBeneficiario: UILabel!
    @IBOutlet var txtTipoBeneficiario: UILabel!
    
    @IBOutlet var lblNombreBeneficiario: UILabel!
    @IBOutlet var txtNombreBeneficiario: UILabel!
    
    @IBOutlet var lblEstado: UILabel!
    @IBOutlet var txtEstado: UILabel!
    
    @IBOutlet var lblTipoGiro: UILabel!
    @IBOutlet var txtTipoGiro: UILabel!
    @IBOutlet var lblValorNota: UILabel!
    @IBOutlet var txtValorNota: UILabel!
    @IBOutlet var lblFechaRegistro: UILabel!
    @IBOutlet var txtFechaRegistro: UILabel!
    
    @IBOutlet var lblFechaLiquidacion: UILabel!
    @IBOutlet var txtFechaLiquidacion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblConsecutivoNota.text = NSLocalizedString("lbl_consecutivo_nota_credito", comment: "lbl_consecutivo_nota_credito")        
        lblNotaCredito.text = NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.consecutivoNota
        lblCiudad.text = "\(NSLocalizedString("lbl_ciudad", comment: "lbl_ciudad"))\(": ") \(NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.ciudad)"
        lblIdGiroAsociado.text = "\(NSLocalizedString("lbl_id_giro_asociado", comment: "lbl_id_giro_asociado"))\(": ") \(NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.idGiroAsociado)"
        
        lblTipoBeneficiario.text = NSLocalizedString("lbl_tipo_beneficiario", comment: "lbl_tipo_beneficiario")
        txtTipoBeneficiario.text = NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.tipoBeneficiario

        
        lblNombreBeneficiario.text = NSLocalizedString("lbl_nombre_beneficiario", comment: "lbl_nombre_beneficiario")
        txtNombreBeneficiario.text = NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.nombreBeneficiario
        
        lblEstado.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")
        txtEstado.text = NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.estado

        lblTipoGiro.text = NSLocalizedString("lbl_tipo_giro", comment: "lbl_tipo_giro")
        txtTipoGiro.text = NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.tipoGiro
        
        lblValorNota.text = NSLocalizedString("lbl_valor_nota", comment: "lbl_valor_nota")
        txtValorNota.text = NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.valorNota

        lblFechaRegistro.text = NSLocalizedString("lbl_fecha_registro", comment: "lbl_fecha_registro")
        txtFechaRegistro.text = NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.fechaRegistro

        txtFechaLiquidacion.text = NotaCreditoGiroViewController.notaCreditoGiroSeleccionado.fechaLiquidacion
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
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "detalleNotaCreditoGiro"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }

}
