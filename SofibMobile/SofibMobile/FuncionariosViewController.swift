//
//  FuncionariosViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/15/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FuncionariosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //let funcionarios = ["funcionarios 1", "funcionarios 2", "funcionarios 3", "funcionarios 4", "funcionarios 5", "funcionarios 6", "funcionarios 7", "funcionarios 9"]
    let jsonFuncionariosExternos: NSArray = OpcionesSecundariasViewController.jsonFuncionariosExternos!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonFuncionariosExternos.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FuncionariosTableViewCell
        if let resultadoConsulta = self.jsonFuncionariosExternos[indexPath.row] as? Dictionary<String, Any>{
            cell.txtFuncionario.text = resultadoConsulta["prestadorSolicitud"] as! String?;
            cell.txtFecha.text = resultadoConsulta["fechaCita"] as! String?;
            cell.txtMedico.text = resultadoConsulta["nombreMedico"] as! String?;
            cell.txtEspecialidad.text = resultadoConsulta["especialidad"] as! String?;
        }
        /*cell.lblNombreProcedimiento.text = procedimientosAdicionales[indexPath.row]
         cell.lblCiudad.text = procedimientosAdicionales[indexPath.row]
         cell.lblPrestador.text = procedimientosAdicionales[indexPath.row]*/
        
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
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
