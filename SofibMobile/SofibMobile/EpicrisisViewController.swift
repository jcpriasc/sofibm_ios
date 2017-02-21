//
//  EpicrisisViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 11/8/16.
//  Copyright © 2016 vortexbird. All rights reserved.
//

import UIKit

class EpicrisisViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    //let epicrisis = ["epicrisis 1", "epicrisis 2", "epicrisis 3", "epicrisis 4", "epicrisis 5", "epicrisis 6", "epicrisis 7", "epicrisis 9"]
    let jsonEpicrisis: NSArray = OpcionesSecundariasViewController.jsonEpicrisis!
    
    public static var path : URL?  = nil
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (jsonEpicrisis.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EpicrisisViewCell
        
        if let resultadoConsulta = self.jsonEpicrisis[indexPath.row] as? Dictionary<String, Any>{
            cell.txtNombreArchivo.text = resultadoConsulta["nombreDocumento"] as! String?;
        }
        
        return (cell)
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        
        let fileSeleccionada = indexPath[1]
        var opcionSeleccionada = ""
        var file = ""
        
        if let solicitud = self.jsonEpicrisis[fileSeleccionada] as? Dictionary<String, Any>{
            file = (solicitud["nombreDocumento"] as! String?)!;
            opcionSeleccionada = (solicitud["archivo"] as! String?)!;
            
        }
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let convertedData = Data(base64Encoded: opcionSeleccionada)
            
            EpicrisisViewController.path = dir.appendingPathComponent(file)
            let aweds: String = dir.dataRepresentation.base64EncodedString()
            print(aweds)
            //writing
            do {
                try convertedData?.write(to: EpicrisisViewController.path!)
                
            }
            catch {/* error handling here */}
            
            //reading
            do {
                let text2 = try String(contentsOf: EpicrisisViewController.path!, encoding: String.Encoding.utf8)
                print(text2);
            }
                
            catch {
                print("ERROR")
            }
            
            
            
        }
        
        let url = NSURL.fileURL(withPath: (EpicrisisViewController.path?.absoluteString)!)
        print(url)
        //webView.loadRequest(url)
        
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "detalleEpicrisis")
        self.show(vc as! UIViewController, sender: vc)

        
        
        
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
        AjustesViewController.viewBack = "epicrisisView"
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
