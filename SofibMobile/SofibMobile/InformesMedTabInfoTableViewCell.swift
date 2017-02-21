//
//  InformesMedTabInfoTableViewCell.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 2/18/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class InformesMedTabInfoTableViewCell: UITableViewCell {

    @IBOutlet var lblNombre: UILabel!
    @IBOutlet var txtNomnre: UILabel!
    @IBOutlet var lblTipoDocumento: UILabel!
    @IBOutlet var txtTipoDocumento: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblNombre.text = NSLocalizedString("lbl_nombre", comment: "lbl_nombre")
        lblTipoDocumento.text = NSLocalizedString("lbl_tipo_documento", comment: "lbl_tipo_documento")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
