//
//  GiroTabManutencionViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class GiroTabManutencionViewCellController: UITableViewCell {

    @IBOutlet var lblEstado: UILabel!
    @IBOutlet var lblEdadDesde: UILabel!
    @IBOutlet var lblEdadHasta: UILabel!
    @IBOutlet var lblMontoDiario: UILabel!
    
    @IBOutlet var txtEstado: UILabel!
    @IBOutlet var txtEdadDesde: UILabel!
    @IBOutlet var txtEdadHasta: UILabel!
    @IBOutlet var txtMontoDiario: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblEstado.text = NSLocalizedString("lbl_estado", comment: "lbl_estado")
        lblEdadDesde.text = NSLocalizedString("lbl_edad_desde", comment: "lbl_edad_desde")
        lblEdadHasta.text = NSLocalizedString("lbl_edad_hasta", comment: "lbl_edad_hasta")
        lblMontoDiario.text = NSLocalizedString("lbl_monto_diario", comment: "lbl_monto_diario")

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
