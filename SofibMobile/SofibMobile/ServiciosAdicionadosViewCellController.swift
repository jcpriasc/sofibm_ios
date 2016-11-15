
//
//  ServiciosAdicionadosViewCellController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 15/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class ServiciosAdicionadosViewCellController: UITableViewCell {

    
    @IBOutlet var txtProveedor: UILabel!
    @IBOutlet var txtNombre: UILabel!
    @IBOutlet var txtDescripcion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        //lblNumeroSolicitud.text = NSLocalizedString("lbl_numero_solicitud", comment: "lbl_numero_solicitud")
        //lblIdentificacion.text = NSLocalizedString("identificacion", comment: "identificacion")
        //lblNombre.text = NSLocalizedString("nombre", comment: "nombre")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
