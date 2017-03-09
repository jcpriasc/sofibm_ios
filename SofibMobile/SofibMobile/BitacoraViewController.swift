//
//  BitacoraViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/15/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class BitacoraViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //let bitacoras = ["bitacoras 1", "bitacoras 2", "bitacoras 3", "bitacoras 4", "bitacoras 5", "bitacoras 6", "bitacoras 7", "bitacoras 9"]
    let jsonBitacoras: NSArray = FiltroBitacoraViewController.jsonBitacoras!
    
    static var bitacoraSeleccionada = Bitacora()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonBitacoras.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BitacoraViewCell
        
        if let resultadoConsulta = self.jsonBitacoras[indexPath.row] as? Dictionary<String, Any>{
            
            let consSolicitud = resultadoConsulta["consSolicitudAtencion"] as! Int?
            
          //  cell.txtSolicitud.text = String(describing: consSolicitud);
            cell.txtSolicitud.text = consSolicitud?.description

           
            cell.txtNombre.text = resultadoConsulta["nombre"] as! String?;
            cell.txtTipoRegistro.text = resultadoConsulta["tipoRegistro"] as! String?;
            cell.txtTipoAccion.text = resultadoConsulta["tipoAccion"] as! String?;
            cell.txtEstado.text = resultadoConsulta["estado"] as! String?;

        }
        
        return (cell)
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        if let resultadoConsulta = self.jsonBitacoras[opcionSeleccionada] as? Dictionary<String, Any>{
        
            BitacoraViewController.bitacoraSeleccionada.ciudadInicial = resultadoConsulta["cidudadnombre"] as? String ?? ""
            BitacoraViewController.bitacoraSeleccionada.numeroSolicitud = String(resultadoConsulta["consSolicitudAtencion"] as? Int ?? 0);
            BitacoraViewController.bitacoraSeleccionada.nombrePaciente = resultadoConsulta["nombre"] as? String ?? ""
            BitacoraViewController.bitacoraSeleccionada.tipoRegistro = resultadoConsulta["tipoRegistro"] as? String ?? ""
            BitacoraViewController.bitacoraSeleccionada.tipoServicio = resultadoConsulta["tipoServicio"] as? String ?? ""
            BitacoraViewController.bitacoraSeleccionada.tipoAccion = resultadoConsulta["tipoAccion"] as? String ?? ""
            BitacoraViewController.bitacoraSeleccionada.estado = resultadoConsulta["estado"] as? String ?? ""
            BitacoraViewController.bitacoraSeleccionada.descripcion = resultadoConsulta["descripcion"] as? String ?? ""
            BitacoraViewController.bitacoraSeleccionada.nombreUsuario = resultadoConsulta["usuario"] as? String ?? ""
            BitacoraViewController.bitacoraSeleccionada.fechaCreado = resultadoConsulta["fechaAccion"] as? String ?? ""
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "detalleBitacoraView")
            self.show(vc as! UIViewController, sender: vc)
            
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
        AjustesViewController.viewBack = "bitacorasController"
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
