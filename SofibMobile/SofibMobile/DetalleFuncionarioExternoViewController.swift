//
//  DetalleFuncionarioExternoViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 16/02/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class DetalleFuncionarioExternoViewController: UIViewController {
    
    
    @IBOutlet var lblFuncionarioExternoAreaMedica: UILabel!
    @IBOutlet var lblFechaHoraCita: UILabel!
    @IBOutlet var lblMedico: UILabel!
    @IBOutlet var lblEspecialidad: UILabel!
    
    
    @IBOutlet var txtFuncionarioExterno: UILabel!
    @IBOutlet var txtFechaHoraCita: UILabel!
    @IBOutlet var txtMedico: UILabel!
    @IBOutlet var txtEspecialidad: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblFuncionarioExternoAreaMedica.text = NSLocalizedString("lbl_area_medica", comment: "lbl_area_medica")
        lblFechaHoraCita.text = NSLocalizedString("lbl_fecha_cita", comment: "lbl_fecha_cita")
        lblMedico.text = NSLocalizedString("lbl_medico", comment: "lbl_medico")
        lblEspecialidad.text = NSLocalizedString("lbl_especialidad", comment: "lbl_especialidad")
        
        txtFuncionarioExterno.text = FuncionariosViewController.funcionarioExternoSeleccionado.funcionarioExterno
        txtFechaHoraCita.text = FuncionariosViewController.funcionarioExternoSeleccionado.fechaHoraCita
        txtMedico.text = FuncionariosViewController.funcionarioExternoSeleccionado.medico
        txtEspecialidad.text = FuncionariosViewController.funcionarioExternoSeleccionado.especialidad
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        
        AjustesViewController.viewBack = "detalleFuncionariosExternos"
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
