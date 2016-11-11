//
//  NotaCreditoGiroViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class NotaCreditoGiroViewCellController: UITableViewCell {

    @IBOutlet var lblTipoGiro: UILabel!
    @IBOutlet var lblNombreBeneficiario: UILabel!
    @IBOutlet var lblIdGiroAsociado: UILabel!
    @IBOutlet var lblConsecutivoNotaCredito: UILabel!
    
    
    @IBOutlet var txtTipoGiro: UILabel!
    @IBOutlet var txtNombreBeneficiario: UILabel!
    @IBOutlet var txtIdGiroAsociado: UILabel!
    @IBOutlet var txtConsecutivoNotaCredito: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblConsecutivoNotaCredito.text = NSLocalizedString("lbl_consecutivo_nota_credito", comment: "lbl_consecutivo_nota_credito")
        lblIdGiroAsociado.text = NSLocalizedString("lbl_id_giro_asociado", comment: "lbl_id_giro_asociado")
        lblNombreBeneficiario.text = NSLocalizedString("lbl_nombre_beneficiario", comment: "lbl_nombre_beneficiario")
        lblTipoGiro.text = NSLocalizedString("lbl_tipo_giro", comment: "lbl_tipo_giro")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
