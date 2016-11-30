//
//  SercioNoAsistecialTabServicioProveedorViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 29/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class SercioNoAsistecialTabServicioProveedorViewController: UIViewController {

    @IBOutlet var lblInformacionServicioProveedor: UILabel!
    
    @IBOutlet var lblProveedor: UILabel!
    @IBOutlet var lblServicio: UILabel!
    @IBOutlet var lblFecha: UILabel!
    
    @IBOutlet var txtProveedor: UILabel!
    @IBOutlet var txtServicio: UILabel!
    @IBOutlet var txtFecha: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         lblInformacionServicioProveedor.text = NSLocalizedString("lbl_titulo_servicio_proveedor", comment: "lbl_titulo_servicio_proveedor")
         lblProveedor.text = NSLocalizedString("lbl_proveedor", comment: "lbl_proveedor")
         lblServicio.text = NSLocalizedString("lbl_servicio", comment: "lbl_servicio")
         lblFecha.text = NSLocalizedString("lbl_fecha", comment: "lbl_fecha")
        
        if let solicitud = DetalleServicioNoAsistencialViewController.jsonDetalleServicioNoAsistencial as? Dictionary<String, Any>{
            txtProveedor.text = (solicitud["proveedor"] as? String ?? "")
            txtServicio.text = (solicitud["servicio"] as? String ?? "")
            txtFecha.text = (solicitud["fecha"] as? String ?? "")
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
