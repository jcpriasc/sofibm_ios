//
//  UtilizacionesViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class UtilizacionesViewCellController: UITableViewCell {

    
    
    @IBOutlet var lblHasta: UILabel!
    @IBOutlet var lblDesde: UILabel!
    @IBOutlet var lblConvenio: UILabel!
    
    @IBOutlet var txtConvenio: UILabel!
    @IBOutlet var txtDesde: UILabel!
    @IBOutlet var txtHasta: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblHasta.text = NSLocalizedString("lbl_hasta", comment: "lbl_hasta")
        lblDesde.text = NSLocalizedString("lbl_desde", comment: "lbl_desde")
        lblConvenio.text = NSLocalizedString("lbl_convenio", comment: "lbl_convenio")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
