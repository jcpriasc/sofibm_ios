//
//  SolAprobTabInformacionGeneralViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 1/9/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class SolAprobTabInformacionGeneralViewController: UIViewController {

    @IBOutlet var lblInformacionGeneral: UILabel!
    
    @IBOutlet var lblPais: UILabel!
    @IBOutlet var lblNombre: UILabel!
    @IBOutlet var lblTipoContrato: UILabel!
    
    @IBOutlet var txtTipoContrato: UILabel!
    @IBOutlet var txtNombreContrato: UILabel!
    @IBOutlet var txtPais: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblPais.text = NSLocalizedString("lbl_pais", comment: "lbl_pais")
        lblNombre.text = NSLocalizedString("lbl_nombre_conveio", comment: "lbl_nombre_conveio")
        lblTipoContrato.text = NSLocalizedString("lbl_tipo_convenio", comment: "lbl_tipo_convenio")
        
        if let solicitud = DetalleSolicitudAprobacionViewController.jsonDetalleSolicitudAprobacion as? Dictionary<String, Any>{
            
            txtTipoContrato.text = (solicitud["tipoConvenio"] as? String ?? "tipoConvenio")
            txtNombreContrato.text = (solicitud["convenio"] as? String ?? "convenio")
            txtPais.text = (solicitud["pais"] as? String ?? "pais")
            
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
