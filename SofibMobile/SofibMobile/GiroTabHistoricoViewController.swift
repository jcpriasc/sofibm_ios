//
//  GiroTabHistoricoViewController.swift
//  SofibMobile
//
//  Created by Cesar Lopez on 30/11/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class GiroTabHistoricoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var lblHistoricoGiro: UILabel!
    
    static var jsonTabHistorico: NSDictionary?
    
    static var detalleHistoricoGiro = DetalleGiroHistorico()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let solicitud = DetalleGiroViewController.jsonDetalleGiro  as? Dictionary<String, Any>{
            
            GiroTabHistoricoViewController.jsonTabHistorico = solicitud["historico"] as? NSDictionary
            
            lblHistoricoGiro.text = NSLocalizedString("lbl_historico_giro", comment: "lbl_historico_giro")
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if GiroTabHistoricoViewController.jsonTabHistorico == nil || GiroTabHistoricoViewController.jsonTabHistorico?.count == 0 {
            return (0)
        }else{
            return (1)
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GiroTabHistoricoViewCellController
        
        cell.txtIdentificacion.text = (GiroTabHistoricoViewController.jsonTabHistorico?["id"] as? String ?? " ");
        cell.txtCiudad.text = (GiroTabHistoricoViewController.jsonTabHistorico?["ciudad"] as? String ?? " ");
        cell.txtConvenio.text = (GiroTabHistoricoViewController.jsonTabHistorico?["convenio"] as? String ?? " ");
        cell.txtEstado.text = (GiroTabHistoricoViewController.jsonTabHistorico?["estado"] as? String ?? " ");
        cell.txtTipoGiro.text = (GiroTabHistoricoViewController.jsonTabHistorico?["tipoGiro"] as? String ?? " ");
        
        return (cell)
        
        
    }

    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        //if let solicitud = GiroTabHistoricoViewController.jsonTabHistorico?[opcionSeleccionada] as? Dictionary<String, Any>{
            
            GiroTabHistoricoViewController.detalleHistoricoGiro.identificaion = (GiroTabHistoricoViewController.jsonTabHistorico?["id"] as? String ?? " ");
            GiroTabHistoricoViewController.detalleHistoricoGiro.ciudad = (GiroTabHistoricoViewController.jsonTabHistorico?["ciudad"] as? String ?? " ");
            GiroTabHistoricoViewController.detalleHistoricoGiro.convenio = (GiroTabHistoricoViewController.jsonTabHistorico?["convenio"] as? String ?? " ");
            GiroTabHistoricoViewController.detalleHistoricoGiro.estado = (GiroTabHistoricoViewController.jsonTabHistorico?["estado"] as? String ?? " ");
            GiroTabHistoricoViewController.detalleHistoricoGiro.tipoGiro = (GiroTabHistoricoViewController.jsonTabHistorico?["tipoGiro"] as? String ?? " ");
            GiroTabHistoricoViewController.detalleHistoricoGiro.tipoBeneficiario = (GiroTabHistoricoViewController.jsonTabHistorico?["tipoBeneficiario"] as? String ?? " ");
            GiroTabHistoricoViewController.detalleHistoricoGiro.beneficiario = (GiroTabHistoricoViewController.jsonTabHistorico?["beneficiario"] as? String ?? " ");
            GiroTabHistoricoViewController.detalleHistoricoGiro.fechaInicio = (GiroTabHistoricoViewController.jsonTabHistorico?["fechaInicio"] as? String ?? " ");
            GiroTabHistoricoViewController.detalleHistoricoGiro.fechaFin = (GiroTabHistoricoViewController.jsonTabHistorico?["fechaFin"] as? String ?? " ");
            GiroTabHistoricoViewController.detalleHistoricoGiro.valorMonedaExtranjero = (GiroTabHistoricoViewController.jsonTabHistorico?["valorMonedaExtranjera"] as? String ?? " ");
            GiroTabHistoricoViewController.detalleHistoricoGiro.valorMonedaLocal = (GiroTabHistoricoViewController.jsonTabHistorico?["valorMonedaLocal"] as? String ?? " ");
            GiroTabHistoricoViewController.detalleHistoricoGiro.registraDevolucion = (GiroTabHistoricoViewController.jsonTabHistorico?["registraDevolucion"] as? String ?? " ");
            GiroTabHistoricoViewController.detalleHistoricoGiro.valorDevolucion = (GiroTabHistoricoViewController.jsonTabHistorico?["valorDevolucion"] as? String ?? " ");
            GiroTabHistoricoViewController.detalleHistoricoGiro.legalizado = (GiroTabHistoricoViewController.jsonTabHistorico?["legalizado"] as? String ?? " ");
            GiroTabHistoricoViewController.detalleHistoricoGiro.valorLegalizado = (GiroTabHistoricoViewController.jsonTabHistorico?["valorLegalizado"] as? String ?? " ");
            
            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "detalleGiroHistorico")
            self.show(vc as! UIViewController, sender: vc)
            
            
            //result["artworkUrl60"] as? String ?? ""
       // }
        
        return indexPath
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
        AjustesViewController.viewBack = "giroHistoricoController"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }

}
