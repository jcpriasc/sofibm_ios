//
//  FiltroSolAprobViewController.swift
//  SofibMobile
//
//  Created by JUAN CAMILO PUENTE RIASCOS on 2/14/17.
//  Copyright © 2017 vortexbird. All rights reserved.
//

import UIKit

class FiltroSolAprobViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet var pickerTipoServicio: UITextField!
    @IBOutlet var pickerConvenio: UITextField!
    @IBOutlet var lblBusqueda: UILabel!

    
    static var jsonSolicitudesAprobacion: NSArray?
    
    static var viewBack = "";
    static var variableServicio = "";
    
    let convenioPickerView = UIPickerView()
    let tipoServicioPickerView = UIPickerView()
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        lblBusqueda.text = NSLocalizedString("lbl_titulo_bitacora", comment: "lbl_titulo_bitacora")
        
        pickerConvenio.placeholder = NSLocalizedString("seleccionar_convenio", comment: "seleccionar_convenio")
        pickerTipoServicio.placeholder = NSLocalizedString("seleccionar_tipo_servicio", comment: "seleccionar_tipo_servicio")
        
    }

    @IBAction func back(_ sender: Any) {
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: FiltroSolAprobViewController.viewBack)
        self.show(vc as! UIViewController, sender: vc)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func action_consultar_sol_aprobacion(_ sender: AnyObject) {
        
        var convenio: String = "0"
        var tipoServicio: String = "0"
        
        if((pickerConvenio.text) != nil && (pickerConvenio.text) != ""){
            let rowSelected = convenioPickerView.selectedRow(inComponent: 0);
            if let data = CargarPickers.conveniosJson![rowSelected-1] as? Dictionary<String, Any>{
                convenio = (data["codigo"] as! String?)!;
            }
        }
        
        
        if((pickerTipoServicio.text) != nil && (pickerTipoServicio.text) != ""){
            let rowSelected = tipoServicioPickerView.selectedRow(inComponent: 0);
            if let data = CargarPickers.serviciosJson![rowSelected-1] as? Dictionary<String, Any>{
                tipoServicio = (data["codigo"] as! String?)!;
            }
        }
        
        
        var listParams: String = "/SAC/ABCD1234";
        listParams+="/0";
        listParams+="/"+convenio;
        listParams+="/"+tipoServicio;
        listParams+="/"+ConsultaSolicitudesAtencionController.solicitudAtencionSeleccionada.consSolicitud;
        listParams+="/"+FiltroSolAprobViewController.variableServicio;
        //print(PropertiesProject.URL+PropertiesProject.complement_aprobacion+listParams)
        let url = URL(string: PropertiesProject.URL+PropertiesProject.complement_aprobacion+listParams)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        //Array
                        FiltroSolAprobViewController.jsonSolicitudesAprobacion = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if ((FiltroSolAprobViewController.jsonSolicitudesAprobacion?.count)!>0){
                            
                            let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "solicitudesAprobacionController")
                            self.show(vc as! UIViewController, sender: vc)
                        }else{
                            //print(NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"));
                            let alert = UIAlertController(title: NSLocalizedString("lbl_alerta", comment: "lbl_alerta"), message: NSLocalizedString("lbl_sin_resultados", comment: "lbl_sin_resultados"), preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: NSLocalizedString("lbl_aceptar", comment: "lbl_aceptar"), style: UIAlertActionStyle.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Se crea el picker para tipo registro
        
        convenioPickerView.delegate = self
        convenioPickerView.tag = 1
        pickerConvenio.inputView = convenioPickerView
        //Se crea el picker para tipo servicio
        
        tipoServicioPickerView.delegate = self
        tipoServicioPickerView.tag = 2
        pickerTipoServicio.inputView = tipoServicioPickerView
        
        
        //Se crea el toolBar para el picker
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = UIBarStyle.default
        toolBar.tintColor = UIColor.white
        toolBar.barTintColor = UIColor.init(colorLiteralRed: 0.0, green: 0.40000000000000002, blue: 0.70196078429999997, alpha: 1)
        toolBar.isOpaque = true
        toolBar.backgroundColor = UIColor.init(colorLiteralRed: 0.0, green: 0.40000000000000002, blue: 0.70196078429999997, alpha: 1)
        toolBar.isTranslucent = true
        toolBar.alpha = 1
        let defaultButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FiltrosSolicitudAtencionController.tappedToolBarBtn))
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(FiltrosSolicitudAtencionController.donePressed))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))
        
        label.font = UIFont(name: "Helvetica", size: 12)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        // label.text = ""
        label.textAlignment = NSTextAlignment.center
        
        let textBtn = UIBarButtonItem(customView: label)
        toolBar.setItems([defaultButton,flexSpace,textBtn,flexSpace,doneButton], animated: true)
        
        pickerConvenio.inputAccessoryView = toolBar
        pickerTipoServicio.inputAccessoryView = toolBar
    }
    
    
    func donePressed(_ sender: UIBarButtonItem) {
        print(sender)
        pickerConvenio.resignFirstResponder()
        pickerTipoServicio.resignFirstResponder()
        
    }
    
    func tappedToolBarBtn(_ sender: UIBarButtonItem) {
        
        pickerConvenio.text = ""
        pickerTipoServicio.text = ""
        
        pickerConvenio.resignFirstResponder()
        pickerTipoServicio.resignFirstResponder()
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            return (CargarPickers.conveniosJson!.count)+1
        }
        
        if pickerView.tag == 2 {
            return (CargarPickers.serviciosJson!.count)+1
        }
        
        return 0
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            var convenioSeleccionado = "";
            if row == 0 {
                convenioSeleccionado = NSLocalizedString("seleccionar_convenio", comment: "seleccionar_convenio")
            }else if let data = CargarPickers.conveniosJson![row-1] as? Dictionary<String, Any>{
                convenioSeleccionado = (data["nombre"] as! String?)!;
            }
            return convenioSeleccionado
        }
        
        
        if pickerView.tag == 2 {
            var tipoServicioSeleccionado = "";
            if row == 0 {
                tipoServicioSeleccionado = NSLocalizedString("seleccionar_tipo_servicio", comment: "seleccionar_tipo_servicio")
            }else if let data = CargarPickers.serviciosJson![row-1] as? Dictionary<String, Any>{
                tipoServicioSeleccionado = (data["nombre"] as! String?)!;
            }
            return tipoServicioSeleccionado
        }
        
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            if row == 0 {
                pickerConvenio.text = "";
            }else if let data = CargarPickers.conveniosJson![row-1] as? Dictionary<String, Any>{
                pickerConvenio.text = (data["nombre"] as! String?)!;
            }
        }
        
        if pickerView.tag == 2 {
            if row == 0 {
                pickerTipoServicio.text = "";
            }else if let data = CargarPickers.serviciosJson![row-1] as? Dictionary<String, Any>{
                pickerTipoServicio.text = (data["nombre"] as! String?)!;
            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
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
        AjustesViewController.viewBack = "filtroSolAprobView"
        let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "ajustesController")
        self.show(vc as! UIViewController, sender: vc)
    }

}
