//
//  DetalheCarroViewController.swift
//  Carros
//
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class DetalheCarroViewController: UIViewController {

    @IBOutlet weak var nomeCarroLabel: UILabel!
    
    var nomeCarro: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nomeCarroLabel.text = nomeCarro!
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
