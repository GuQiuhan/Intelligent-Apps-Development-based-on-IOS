//
//  myCalculator.swift
//  Calculator
//
//  Created by pro on 2022/10/11.
//

import UIKit

class myCalculator: NSObject {
    enum Operation{
        case UnaryOp((Double)->Double)
        case BinaryOp((Double,Double)->Double)
        case EqualOp
        case Constant(Double)
    }
    
    //字典类型，存储运算符对应的方法
    var operations = [
        "+":Operation.BinaryOp{       //这里是一个什么函数类型？
            (op1,op2) in
            return op1+op2
        },
        
        "-":Operation.BinaryOp{
            (op1,op2) in
            return op1-op2
        },
        
        "*":Operation.BinaryOp{
            (op1,op2) in
            return op1*op2
        },
        
        "/":Operation.BinaryOp{
            (op1,op2) in
            return op1/op2
        },
        
        "=":Operation.EqualOp,
        
        "%":Operation.UnaryOp{
            op in
            return op/100.0  //这里为什么是100.0?
        },
        
        "+/-": Operation.UnaryOp{
            op in
            return -op
        },
        
        "Clear": Operation.UnaryOp{
            _ in
            return 0
        },
        
        "PI":Operation.Constant(3.14)
    ]

    //存储双目运算符的中间结果
    struct Intermediate{
        var firstOp:Double
        var waitingOperation: (Double,Double)->Double
    }
    
    var pendingOp: Intermediate? = nil
    
    //处理操作符的操作
    func performOperation(operation: String, operand: Double)->Double?{
        if let op=operations[operation]{
            switch op {
            case .BinaryOp(let function):
                pendingOp = Intermediate(firstOp: operand, waitingOperation: function)
                return nil
            case .Constant(let value):
                return value
            case .EqualOp:
                return pendingOp?.waitingOperation(pendingOp!.firstOp,operand)
            case .UnaryOp(let function):
                return function(operand)
            }
        }
        return nil
    }
    
}
