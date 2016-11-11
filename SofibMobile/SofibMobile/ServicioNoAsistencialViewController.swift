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
 
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  

    
}