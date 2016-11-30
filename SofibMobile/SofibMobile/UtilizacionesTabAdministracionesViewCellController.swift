//
//  UtilizacionesTabAdministracionesViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 29/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class UtilizacionesTabAdministracionesViewCellController: UITableViewCell {

    
    
    @IBOutlet var lblTotal: UILabel!
    @IBOutlet var lblTrm: UILabel!
    @IBOutlet var lblSubTotal: UILabel!
    @IBOutlet var lblPorcentajeIva: UILabel!
    @IBOutlet var lblValorIva: UILabel!
    @IBOutlet var lblFechaCreado: UILabel!
    
    @IBOutlet var txtTotal: UILabel!
    @IBOutlet var txtTrm: UILabel!
    @IBOutlet var txtSubTotal: UILabel!
    @IBOutlet var txtPorcentajeIva: UILabel!
    @IBOutlet var txtValorIva: UILabel!
    @IBOutlet var txtFechaCreado: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblTotal.text = NSLocalizedString("lbl_tipo_seguro", comment: "lbl_tipo_seguro")
        lblTrm.text = NSLocalizedString("lbl_tipo_seguro", comment: "lbl_tipo_seguro")
        lblSubTotal.text = NSLocalizedString("lbl_tipo_seguro", comment: "lbl_tipo_seguro")
        lblPorcentajeIva.text = NSLocalizedString("lbl_tipo_seguro", comment: "lbl_tipo_seguro")
        lblValorIva.text = NSLocalizedString("lbl_tipo_seguro", comment: "lbl_tipo_seguro")
        lblFechaCreado.text = NSLocalizedString("lbl_tipo_seguro", comment: "lbl_tipo_seguro")

       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

}
