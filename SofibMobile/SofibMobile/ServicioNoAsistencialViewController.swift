//
//  ServicioNoAsistencialViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit
import Alamofire

class ServicioNoAsistencialViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let servicioNoAsistencial = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
    
    let idCelda = "cell"
    @IBOutlet var lstServicioNoAsistencial: UITableView!
    var servicios = NSArray();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.lstServicioNoAsistencial.delegate = self;
       // self.lstServicioNoAsistencial.dataSource = self;
        
       // let archivo  = UINib(nibName: idCelda, bundle:nil);
       // self.lstServicioNoAsistencial.register(archivo, forCellReuseIdentifier: idCelda)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       // self.obtenerServiciosNoAsistenciales()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (servicioNoAsistencial.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ServicioNoAsistencialViewCellController
        
        cell.txtNumeroSolicitud.text = servicioNoAsistencial[indexPath.row]
        cell.txtIdentificacion.text = servicioNoAsistencial[indexPath.row]
        cell.txtNombre.text = servicioNoAsistencial[indexPath.row]
        
        return (cell)
 
        
        //Opcional biding o validacion de opcionales para crear la celda
        
        /*if let factura = self.servicios[indexPath.row] as? Dictionary<String, Any>{
            
            let cell = self.lstServicioNoAsistencial.dequeueReusableCell(withIdentifier: self.idCelda) as! ServicioNoAsistencialViewCellController
            
            cell.setdata(servicioNoAsistencial: factura)
            //print("objeto diccionario \(factura)")
            return cell
        }
        
        return UITableViewCell();
         */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func obtenerServiciosNoAsistenciales(){
        Alamofire.request("http://pruebas-sectorsalud.coomeva.com.co/saludmp-ws/jax-rs/saludmp-sofibmobile/serviciosNoAsistenciales/SAC/ABCD1234/852").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value as? NSArray{
                
                self.servicios = JSON
                self.lstServicioNoAsistencial.reloadData()
                
                //for objecty in JSON{
                //    print("objeto \(objecty)")
                //}
                //print("JSON: \(JSON)")
            }
        }
    }

    
}
