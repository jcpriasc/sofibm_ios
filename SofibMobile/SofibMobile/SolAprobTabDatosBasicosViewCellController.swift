//
//  SolAprobTabDatosBasicosViewCellController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 1/10/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class SolAprobTabDatosBasicosViewCellController: UITableViewCell {

    @IBOutlet var lblNombre: UILabel!
    @IBOutlet var lblPrestador: UILabel!
    
    @IBOutlet var txtNombre: UILabel!
    @IBOutlet var txtPrestador: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblNombre.text = NSLocalizedString("lbl_nombre", comment: "lbl_nombre")
        lblPrestador.text = NSLocalizedString("lbl_prestador", comment: "lbl_prestador")
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
