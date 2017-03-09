//
//  ServiciosAsistencialesViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 3/9/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class ServiciosAsistencialesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    let jsonServicioAsistencial: NSArray = OpcionesSecundariasViewController.jsonServiciosAsistenciales!;
    let params: String = "/SAC/ABCD1234/"
    static var servicioAsistencial = ServicioAsistencial()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonServicioAsistencial.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ServicioAsistencialViewCell
        
        
        if let solicitud = self.jsonServicioAsistencial[indexPath.row] as? Dictionary<String, Any>{
            
            cell.txtNumeroOrden.text = (solicitud["numerioSias"] as? String ?? "");

            let idPrestador = solicitud["idPrestador"] as! Int?            
            cell.txtIdPrestador.text = idPrestador?.description;
            cell.txtNombrePrestador.text = (solicitud["nombrePrestador"] as? String ?? "");
            cell.txtTipoPrestador.text = (solicitud["nombreServicio"] as? String ?? "");
            
        }
        
        return (cell)
        
        
    }
    
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        let opcionSeleccionada = indexPath[1]
        
        if let solicitud = self.jsonServicioAsistencial[opcionSeleccionada] as? Dictionary<String, Any>{

            //ServiciosAsistencialesViewController.servicioAsistencial.id = (solicitud["id"] as! Int?)!
            ServiciosAsistencialesViewController.servicioAsistencial.numerioSias = (solicitud["numerioSias"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.ciudad = (solicitud["ciudad"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.idPrestador = (solicitud["idPrestador"] as! Int?)!
            ServiciosAsistencialesViewController.servicioAsistencial.nombrePrestador = (solicitud["nombrePrestador"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.nombreServicio = (solicitud["nombreServicio"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.codigoProcedimiento = (solicitud["codigoProcedimiento"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.cantidad = (solicitud["cantidad"] as! Int?)!
            ServiciosAsistencialesViewController.servicioAsistencial.nombreEspanol = (solicitud["nombreEspanol"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.nombreIngles = (solicitud["nombreIngles"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.fecha = (solicitud["fecha"] as? String ?? "");
            ServiciosAsistencialesViewController.servicioAsistencial.estado = (solicitud["estado"] as? String ?? "");
            
            
            consultarDetalle(codigo: solicitud["id"] as? String ?? "")
            
            //result["artworkUrl60"] as? String ?? ""
        }
        
        return indexPath
    }
    
    
    
    func consultarDetalle(codigo: String){
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_ServiciosAsistenciales_detalle+params+codigo)
        print(url)
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
