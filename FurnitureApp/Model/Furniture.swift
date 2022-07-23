//
//  Furniture.swift
//  FurnitureApp
//
//  Created by devsaar on 28/06/2022.
//

import SwiftUI
//Model
struct Furniture: Identifiable
{
    var id = UUID().uuidString
    var name: String
    var description:String
    var price: String
    var image:String
    
}

