//
//  main.swift
//  coreML_Test
//
//  Created by feifeiwei on 2021/12/16.
//
import CoreML
import Foundation

print("Hello, World!")
//MARK: ------ MLMultiArray pointer test -------------//
// --- make a MLMultiArray
let shape = [1, 2, 4, 6] as [NSNumber] //asume a tensor type N,C,H,W
let multiArray = try! MLMultiArray(shape: shape, dataType: .float32)

// --- make a pointer
let pointer = UnsafeMutablePointer<Float32>(OpaquePointer(multiArray.dataPointer))

// --- make a candidate
let value = 7.0 as NSNumber
let idx = [0, 1, 2, 4] as [NSNumber]
multiArray[idx] = value

//// --- search the candidate
let strides = multiArray.strides //[48, 24, 6, 1]
let offset = 0*48 + 1*24 + 2*6 + 4*1

//
let pVal = pointer[offset]
print("index: ", multiArray[idx].debugDescription)
print("pointer val: ", pVal)



