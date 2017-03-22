//
//  NotaCreditoGiroViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class NotaCreditoGiroViewCellController: UITableViewCell {

    @IBOutlet var lblIdGiroAsociado: UILabel!
    @IBOutlet var lblConsecutivoNotaCredito: UILabel!
    
    @IBOutlet var txtIdGiroAsociado: UILabel!
    @IBOutlet var txtConsecutivoNotaCredito: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblConsecutivoNotaCredito.text = NSLocalizedString("lbl_consecutivo_nota_credito", comment: "lbl_consecutivo_nota_credito")
        lblIdGiroAsociado.text = NSLocalizedString("lbl_ciudad", comment: "lbl_ciudad")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
