//
//  FuncionariosViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/15/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class FuncionariosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let jsonFuncionariosExternos: NSArray = OpcionesSecundariasViewController.jsonFuncionariosExternos!
    
    static var funcionarioExternoSeleccionado = FuncionarioExterno()
    
    
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
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        if let solicitud = self.jsonFuncionariosExternos[opcionSeleccionada] as? Dictionary<String, Any>{
            
            
            FuncionariosViewController.funcionarioExternoSeleccionado.funcionarioExterno = (solicitud["prestadorSolicitud"] as? String ?? "");
            FuncionariosViewController.funcionarioExternoSeleccionado.fechaHoraCita = (solicitud["fechaCita"] as? String ?? "");
            FuncionariosViewController.funcionarioExternoSeleccionado.medico = (solicitud["nombreMedico"] as? String ?? "");
            FuncionariosViewController.funcionarioExternoSeleccionado.especialidad = (solicitud["especialidad"] as? String ?? "");
            
        }
        
        return indexPath
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "funcionariosExternosView"
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
