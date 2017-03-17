//
//  ProcedimientosAdicionalesViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/15/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class ProcedimientosAdicionalesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let jsonProcedimientosAdicionales: NSArray = OpcionesSecundariasViewController.jsonProcedimientosAdicionales!
    
    static var procedimientoAdicionalSeleccionado = ProcedimientoAdicional()
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonProcedimientosAdicionales.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProcedimientosAdicionalesViewCell

        if let resultadoConsulta = self.jsonProcedimientosAdicionales[indexPath.row] as? Dictionary<String, Any>{
            cell.txtNombreProcedimiento.text = resultadoConsulta["procedimientoSolicitado"] as? String ?? "";
            cell.txtCiudad.text = resultadoConsulta["ciudad"] as? String ?? " ";
            cell.txtPrestador.text = resultadoConsulta["prestadorNombre"] as? String ?? "";
        }
        
        
        return (cell)
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        if let solicitud = self.jsonProcedimientosAdicionales[opcionSeleccionada] as? Dictionary<String, Any>{
            
            
            ProcedimientosAdicionalesViewController.procedimientoAdicionalSeleccionado.nombreProcedimiento = (solicitud["procedimientoSolicitado"] as? String ?? "");
            ProcedimientosAdicionalesViewController.procedimientoAdicionalSeleccionado.ciudad = (solicitud["ciudad"] as? String ?? "");
            ProcedimientosAdicionalesViewController.procedimientoAdicionalSeleccionado.proveedor = (solicitud["prestadorNombre"] as? String ?? "")
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func btnAjustes(_ sender: AnyObject) {
        AjustesViewController.viewBack = "procedimientosAdicionalesView"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }

}
