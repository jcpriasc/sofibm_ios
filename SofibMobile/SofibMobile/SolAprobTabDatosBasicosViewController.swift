//
//  SolAprobTabDatosBasicosViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 1/9/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class SolAprobTabDatosBasicosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    static var jsonTabDatosBasicos: NSArray?
    
    @IBOutlet var txtIdentificacion: UILabel!
    @IBOutlet var txtNombrePaciente: UILabel!
    @IBOutlet var txtDiagnostico: UILabel!
    @IBOutlet var txtEstadoPaciente: UILabel!
    @IBOutlet var txtFechaEstimada: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let solicitud = DetalleSolicitudAprobacionViewController.jsonDetalleSolicitudAprobacion as? Dictionary<String, Any>{
            SolAprobTabDatosBasicosViewController.jsonTabDatosBasicos = solicitud["lstProcedimiento"] as? NSArray
            txtIdentificacion.text = "\(NSLocalizedString("lbl_id", comment: "lbl_id")) \(": ")\((solicitud["identificacion"] as? String ?? ""))"
            txtNombrePaciente.text = "\(NSLocalizedString("nombre", comment: "nombre")) \(": ")\((solicitud["nombre"] as? String ?? ""))"
            txtDiagnostico.text = "\(NSLocalizedString("lbl_diagnostico", comment: "lbl_diagnostico")) \(": ")\((solicitud["diagnostico"] as? String ?? ""))"
            txtEstadoPaciente.text = "\(NSLocalizedString("lbl_estado_paciente", comment: "lbl_estado_paciente")) \(": ")\((solicitud["estadoPaciente"] as? String ?? ""))"
            txtFechaEstimada.text = "\(NSLocalizedString("lbl_fecha_estimada_regreso", comment: "lbl_fecha_estimada_regreso")) \(": ")\((solicitud["fechaRegreso"] as? String ?? ""))"
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (SolAprobTabDatosBasicosViewController.jsonTabDatosBasicos!.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SolAprobTabDatosBasicosViewCellController
        
        return (cell)
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
