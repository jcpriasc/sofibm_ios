//
//  NotaCreditoGiroViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 8/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class NotaCreditoGiroViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {

    let jsonNotaCreditoGiro: NSArray = OpcionesSecundariasLogViewController.jsonNotasCreditosGiros!;
    let lstNotaCreditoGiro = ["Solicitud 1", "Solicitud 2", "Solicitud 3", "Solicitud 4", "Solicitud 5", "Solicitud 6", "Solicitud 7", "Solicitud 9"]
    
    
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
        return (jsonNotaCreditoGiro.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotaCreditoGiroViewCellController
        
        if let solicitud = self.jsonNotaCreditoGiro[indexPath.row] as? Dictionary<String, Any>{
            cell.txtTipoGiro.text = solicitud["tipoGiro"] as! String?;
            cell.txtNombreBeneficiario.text = solicitud["beneficiario"] as! String?;
            cell.txtIdGiroAsociado.text = solicitud["giroAsociado"] as! String?;
            cell.txtConsecutivoNotaCredito.text = solicitud["notaCredito"] as! String?;
        }

        return (cell)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
