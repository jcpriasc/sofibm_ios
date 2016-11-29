//
//  InformesMedicosViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/8/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class InformesMedicosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    //let informesMedicos = ["informesMedicos 1", "informesMedicos 2", "informesMedicos 3", "informesMedicos 4", "informesMedicos 5", "informesMedicos 6", "informesMedicos 7", "informesMedicos 9"]
    let jsonInformesMedicos: NSArray = OpcionesSecundariasViewController.jsonInformesMedicos!
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonInformesMedicos.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InformesMedicosViewCell
        
        if let resultadoConsulta = self.jsonInformesMedicos[indexPath.row] as? Dictionary<String, Any>{
            
            let dadoAlta = resultadoConsulta["dadoAlta"] as! Bool?;
            let fallecido = resultadoConsulta["fallecido"] as! Bool?;
            
            if dadoAlta! {
                cell.txtDadoAlta.text = NSLocalizedString("lbl_si", comment: "lbl_si")
            }else{
                cell.txtDadoAlta.text = NSLocalizedString("lbl_no", comment: "lbl_no")
            }
            
            if fallecido! {
                cell.txtFallecido.text = NSLocalizedString("lbl_si", comment: "lbl_si")
            }else{
                cell.txtFallecido.text = NSLocalizedString("lbl_no", comment: "lbl_no")
            }
            
            cell.txtFechaRegistro.text = resultadoConsulta["creadoFecha"] as! String?;
            cell.txtCiudad.text = resultadoConsulta["ciudad"] as! String?;
            cell.txtEstado.text = resultadoConsulta["pacienteEstado"] as! String?;
        }
        
        return (cell)
    }

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
