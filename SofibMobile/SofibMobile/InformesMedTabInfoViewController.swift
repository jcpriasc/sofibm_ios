//
//  InformesMedTabInfoViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 2/18/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class InformesMedTabInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    static var jsonTabDocumentos: NSArray?
    
    @IBOutlet var lblEntidad: UILabel!
    @IBOutlet var lblEvolucionPaciente: UILabel!
    @IBOutlet var lblTipoPaciente: UILabel!
    @IBOutlet var lblDadoAlta: UILabel!
    @IBOutlet var lblFallecido: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for det in InformesMedicosViewController.jsonDetalleInformeMedico! {
            if let solicitud = det  as? Dictionary<String, Any>{
                
                InformesMedTabInfoViewController.jsonTabDocumentos = solicitud["archivo"] as? NSArray
                lblEntidad.text = "\(NSLocalizedString("lbl_entidad_prestadora", comment: "lbl_entidad_prestadora")) \(": ")\((solicitud["prestador"] as? String ?? ""))"
                lblEvolucionPaciente.text = "\(NSLocalizedString("lbl_evolucion", comment: "lbl_evolucion")) \(": ")\((solicitud["evoluciondelpaciente"] as? String ?? ""))"
                lblTipoPaciente.text = "\(NSLocalizedString("lbl_tipo_paciente", comment: "lbl_tipo_paciente")) \(": ")\((solicitud["pacienteEstado"] as? String ?? ""))"
                lblDadoAlta.text = "\(NSLocalizedString("lbl_dado_alta", comment: "lbl_dado_alta")) \(": ")\((solicitud["dadoAlta"] as? String ?? ""))"
                lblFallecido.text = "\(NSLocalizedString("lbl_fallecio", comment: "lbl_fallecio")) \(": ")\((solicitud["fallecido"] as? String ?? ""))"
                
                
            }
        }
        
        
        
        /*if let solicitud = InformesMedicosViewController.jsonDetalleInformeMedico  as? Dictionary<String, Any>{
            
            InformesMedTabInfoViewController.jsonTabDocumentos = solicitud["archivo"] as? NSArray
            lblEntidad.text = "\(NSLocalizedString("lbl_entidad_prestadora", comment: "lbl_entidad_prestadora")) \(": ")\((solicitud["prestador"] as? String ?? ""))"
            lblEvolucionPaciente.text = "\(NSLocalizedString("lbl_evolucion", comment: "lbl_evolucion")) \(": ")\((solicitud["evoluciondelpaciente"] as? String ?? ""))"
            lblTipoPaciente.text = "\(NSLocalizedString("lbl_tipo_paciente", comment: "lbl_tipo_paciente")) \(": ")\((solicitud["pacienteEstado"] as? String ?? ""))"
            lblDadoAlta.text = "\(NSLocalizedString("lbl_dado_alta", comment: "lbl_dado_alta")) \(": ")\((solicitud["dadoAlta"] as? String ?? ""))"
            lblFallecido.text = "\(NSLocalizedString("lbl_fallecio", comment: "lbl_fallecio")) \(": ")\((solicitud["fallecido"] as? String ?? ""))"
            
            
        }*/

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (InformesMedTabInfoViewController.jsonTabDocumentos!.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InformesMedTabInfoTableViewCell
        
        if let solicitud = InformesMedTabInfoViewController.jsonTabDocumentos?[indexPath.row] as? Dictionary<String, Any>{
            cell.txtNomnre.text = (solicitud["nombreDocumento"] as? String ?? " ");
            cell.txtTipoDocumento.text = (solicitud["tipoDocumento"] as? String ?? " ");
        }

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
