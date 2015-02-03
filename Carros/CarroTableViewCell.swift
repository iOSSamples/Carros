//
//  CarroTableViewCell.swift
//  Carros
//
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class CarroTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        //cria o botão, com título "comprar" e fundo preto
        let botao = UIButton(frame: CGRect(x: 220, y: 20, width: 80, height: 30))
        botao.setTitle("comprar", forState: .Normal)
        botao.backgroundColor = UIColor.blackColor()

        //adiciona uma ação ao botao
        botao.addTarget(self, action: "botaoSelecionado", forControlEvents: .TouchUpInside)

        //adiciona o botao na célula
        self.contentView.addSubview(botao)
        
        //muda o background do texto da célula pra que todos os elementos fiquem visíveis
        textLabel?.backgroundColor = UIColor.clearColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   func botaoSelecionado () {
        println("botao acionado: \(textLabel?.text)")
        return
    }

    
    
}
