//
//  CarrosTableViewController.swift
//  Carros
//
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class CarrosTableViewController: UITableViewController {

    //Array das montadoras
    var carrosArray : [[String:AnyObject]] = [
        //Dicionario com carros da Honda
        ["Montadora" : "Honda",
            "Carros":["Civic", "City", "Fit"]],
        
        //Dicionario com carros da Volks
        ["Montadora" : "Volkswagen",
            "Carros": ["Gol", "Fox", "Fusca" ] ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return carrosArray.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.

        //pega o dicionário da montadora, usando a seção como índice
        let montadoraDict = carrosArray[section]
        
        //pega os carros da montadora, fazendo um cast para Array de strings
        if let carrosPorMontadora = montadoraDict["Carros"] as? [String]{
            return carrosPorMontadora.count
        }
        
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        let montadoraDict = carrosArray[indexPath.section]
        
        if let carros = montadoraDict["Carros"] as? [String]{
            cell.textLabel?.text = carros[indexPath.row]
            cell.imageView?.image = UIImage(named: "carro")
            cell.detailTextLabel?.text = "Texto secundário"
            cell.accessoryType = .DetailButton
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        if let nomeMontadora = carrosArray[section]["Montadora"] as? String{
            
            return nomeMontadora
        }
        
        return nil
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        var alert = UIAlertController (
            title: "Carro selecionado:",
            message:cell?.textLabel?.text,
            preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .Default,
            handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)

    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIImageView(image: UIImage(named: "footer"))
        return footer

    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("paraDetalheCarroSegue", sender: indexPath)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    //Edição dos itens da tabela
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

        if editingStyle == .Delete {
            
            //Cria uma cópia do array de carros
            if var array = carrosArray[indexPath.section]["Carros"]? as? [String] {
               
                //remove o item
                array.removeAtIndex(indexPath.row)

                //atribui o novo array no dicionário da montadora
                carrosArray[indexPath.section]["Carros"] = array
            }

            //Apaga linha da tabela
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

        } else if editingStyle == .Insert {
            // adiciona um item no array e uma nova linha na tabela
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let index = sender as? NSIndexPath{
            
            if let cell = tableView.cellForRowAtIndexPath(index){

                let vc = segue.destinationViewController as DetalheCarroViewController
                
                vc.nomeCarro = cell.textLabel?.text
            }
        }
    }


}
