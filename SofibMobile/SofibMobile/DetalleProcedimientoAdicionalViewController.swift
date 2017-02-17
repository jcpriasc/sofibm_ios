//
//  DetalleProcedimientoAdicionalViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 16/02/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class DetalleProcedimientoAdicionalViewController: UIViewController {
    
    
    @IBOutlet var lblNombreProcedimiento: UILabel!
    @IBOutlet var lblCiudad: UILabel!
    @IBOutlet var lblProveedor: UILabel!
    
    @IBOutlet var txtNombreProcedimiento: UILabel!
    @IBOutlet var txtCiudad: UILabel!
    @IBOutlet var txtProveedor: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNombreProcedimiento.text = NSLocalizedString("lbl_nombre_procedimiento", comment: "lbl_nombre_procedimiento")
        lblCiudad.text = NSLocalizedString("lbl_ciudad", comment: "lbl_ciudad")
        lblProveedor.text = NSLocalizedString("lbl_prestador_proveedor", comment: "lbl_prestador_proveedor")
        
        txtNombreProcedimiento.text = ProcedimientosAdicionalesViewController.procedimientoAdicionalSeleccionado.nombreProcedimiento
        txtCiudad.text = ProcedimientosAdicionalesViewController.procedimientoAdicionalSeleccionado.ciudad
        txtProveedor.text = ProcedimientosAdicionalesViewController.procedimientoAdicionalSeleccionado.proveedor
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        
        AjustesViewController.viewBack = "detalleProcedimientoAdicional"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
        
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
