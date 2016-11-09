//
//  SolicitudAprobacionViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class SolicitudAprobacionViewCellController: UITableViewCell {

    
    @IBOutlet var lblFechaSolicitud: UILabel!
    @IBOutlet var lblEstado: UILabel!
    @IBOutlet var lblNombrePaciente: UILabel!
    
    @IBOutlet var txtNombrePaciente: UILabel!
    @IBOutlet var txtFechaSolicitud: UILabel!
    @IBOutlet var txtEstado: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
