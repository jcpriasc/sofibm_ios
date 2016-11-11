//
//  EncuestaViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class EncuestaViewCellController: UITableViewCell {

    @IBOutlet var lblObservacion: UILabel!
    @IBOutlet var lblRespuesta: UILabel!
    @IBOutlet var lblPregunta: UILabel!
    
    @IBOutlet var txtPregunta: UILabel!
    @IBOutlet var txtRespuesta: UILabel!
    @IBOutlet var txtObservacion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        lblObservacion.text = NSLocalizedString("lbl_observacion", comment: "lbl_observacion")
        lblRespuesta.text = NSLocalizedString("lbl_respuesta", comment: "lbl_respuesta")
        lblPregunta.text = NSLocalizedString("lbl_pregunta", comment: "lbl_pregunta")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
