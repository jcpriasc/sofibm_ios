//
//  DocumentosMedicosViewCell.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/8/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DocumentosMedicosViewCell: UITableViewCell {

    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblTipoDocumento: UILabel!
    
    @IBOutlet weak var txtTipoDocumento: UILabel!
    @IBOutlet weak var txtNombre: UILabel!
    
    override func awakeFromNib() {
        lblNombre.text = NSLocalizedString("nombre", comment: "nombre")
        lblTipoDocumento.text = NSLocalizedString("lbl_tipo_documento", comment: "lbl_tipo_documento")
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
