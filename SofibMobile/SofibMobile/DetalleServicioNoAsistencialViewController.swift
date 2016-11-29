//
//  DetalleServicioNoAsistencialViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 28/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class DetalleServicioNoAsistencialViewController: UIViewController {

    
    @IBOutlet var lblCiudad: UILabel!
    @IBOutlet var lblTipoSolicitud: UILabel!
    @IBOutlet var lblNumeroSolicitud: UILabel!
    
    @IBOutlet var txtJustificacion: UILabel!
    @IBOutlet var txtEstado: UILabel!
    
    @IBOutlet var lblEstado: UILabel!
    @IBOutlet var lblJustificacionCancelado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
