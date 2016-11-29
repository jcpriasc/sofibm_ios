//
//  UtilizacionesViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class UtilizacionesViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {

    let jsonUtilizaciones: NSArray = OpcionesSecundariasLogViewController.jsonUtilizaciones!;
    let lstUtilizaciones = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
    
    static var utilizacionesSeleccionado = Utilizaciones()

    
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
        return (jsonUtilizaciones.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UtilizacionesViewCellController
        
        if let solicitud = self.jsonUtilizaciones[indexPath.row] as? Dictionary<String, Any>{
            cell.txtConvenio.text = solicitud["convenio"] as! String?;
            cell.txtDesde.text = solicitud["desde"] as! String?;
            cell.txtHasta.text = solicitud["hasta"] as! String?;
        }
        
        return (cell)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
