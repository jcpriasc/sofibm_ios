//
//  GiroViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class GiroViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {

    let jsonGiro: NSArray = OpcionesSecundariasLogViewController.jsonGiros!;
    let lstGiros = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
    
    static var giroSeleccionado = Giro()
    
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
        return (jsonGiro.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GiroViewCellController
        
        if let solicitud = self.jsonGiro[indexPath.row] as? Dictionary<String, Any>{
            cell.txtEstado.text = solicitud["estado"] as! String?;
            cell.txtBeneficiario.text = solicitud["beneficiario"] as! String?;
            cell.txtIdentificacionBeneficiario.text = solicitud["identificacionBeneficiario"] as! String?;
            cell.txtTipoGiro.text = solicitud["tipoGiro"] as! String?;
            cell.txtIdentificacion.text = solicitud["id"] as! String?;
        }
        
        return (cell)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
