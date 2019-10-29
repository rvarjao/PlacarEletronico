//
//  PlacarEletronico.swift
//  PlacarEletronico
//
//  Created by Ricardo Varjão on 28/10/19.
//  Copyright © 2019 Ricardo Varjão. All rights reserved.
//

import UIKit

class PlacarTime:UIView{
    var letreiroScore : Letreiro!
    var letreiroNome : Letreiro!
    var cor : UIColor = UIColor.green{
        didSet{
                letreiroScore.cor = cor
                letreiroNome.cor = cor
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        letreiroScore = Letreiro(frame: CGRect(x: 0,y: 0, width: frame.width, height: frame.height/2), resolucao: Resolucao(linhas: 7, colunas:  5 * (Caractere.larguraCaractere + 1) - 1))
        letreiroScore.animado = false
        letreiroScore.cor = UIColor.green
        self.setScore(score: 0)
        self.addSubview(letreiroScore)
        
        
        letreiroNome = Letreiro(frame: CGRect(x: 0,y: frame.height/2, width: frame.width, height: frame.height/2), resolucao: Resolucao(linhas: 7, colunas: 10 * (Caractere.larguraCaractere + 1) - 1))
        letreiroNome.animado = false
        letreiroNome.cor = UIColor.green
        letreiroNome.posicaoCursor = 0
        self.setNome(nome: "Time")
        self.setScore(score: 0)
        self.addSubview(letreiroNome)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNome(nome: String){
        letreiroNome.texto = nome
    }
    
    func setScore(score : Int){
        letreiroScore.posicaoCursor = Caractere.larguraCaractere
        letreiroScore.texto = "\(score)"
    }
    
    override func draw(_ rect: CGRect) {
        letreiroNome.setNeedsDisplay()
        letreiroScore.setNeedsDisplay()
    }
}

class PlacarEletronico: UIView {
    var letreiroTempo : Letreiro!
    var placarTimeA : PlacarTime!
    var placarTimeB : PlacarTime!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        letreiroTempo = Letreiro(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height/2), resolucao: Resolucao(linhas: 7, colunas: 5 * (Caractere.larguraCaractere + 1) - 1))
        letreiroTempo.animado = false
        letreiroTempo.texto = "00:00"
        letreiroTempo.posicaoCursor = 0
        self.addSubview(letreiroTempo)
        
        placarTimeA = PlacarTime(frame: CGRect(x: 0,y: frame.height/2, width: frame.width/2, height: frame.height/2))
        placarTimeA.setNome(nome: "Time A")
        self.addSubview(placarTimeA)

        placarTimeB = PlacarTime(frame: CGRect(x: frame.width/2,y: frame.height/2, width: frame.width/2, height: frame.height/2))
        placarTimeB.cor = UIColor.red
        placarTimeB.setNome(nome: "Time B")
        self.addSubview(placarTimeB)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        placarTimeA.setNeedsDisplay()
        placarTimeB.setNeedsDisplay()
        letreiroTempo.setNeedsDisplay()
    }
    
    func setNomeTimeA(nome: String){
        placarTimeA.setNome(nome: nome)
    }
    
    func setNomeTimeB(nome: String){
        placarTimeB.setNome(nome: nome)
    }
    
    func setScoreTimeA(score: Int){
        placarTimeA.setScore(score: score)
    }
    
    func setScoreTimeB(score: Int){
        placarTimeB.setScore(score: score)
    }
    
    

}
