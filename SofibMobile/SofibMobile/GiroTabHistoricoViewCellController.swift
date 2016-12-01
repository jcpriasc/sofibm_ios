//
//  GiroTabHistoricoViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class GiroTabHistoricoViewCellController: UITableViewCell {

    
    @IBOutlet var lblIdentificacion: UILabel!
    @IBOutlet var lblCiudad: UILabel!
    @IBOutlet var lblConvenio: UILabel!
    @IBOutlet var lblEstado: UILabel!
    @IBOutlet var lblTipoGiro: UILabel!
    
    @IBOutlet var txtIdentificacion: UILabel!
    @IBOutlet var txtCiudad: UILabel!
    @IBOutlet var txtConvenio: UILabel!
    @IBOutlet var txtEstado: UILabel!
    @IBOutlet var txtTipoGiro: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblIdentificacion.text = NSLocalizedString("identificacion", comment: "identificacion")
        lblCiudad.text = NSLocalizedString("lbl_ciudad", comment: "lbl_ciudad")
        lblConvenio.text = NSLocalizedString("lbl_convenio", comment: "lbl_convenio")
        lblEstado.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")
        lblTipoGiro.text = NSLocalizedString("lbl_tipo_giro", comment: "lbl_tipo_giro")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
