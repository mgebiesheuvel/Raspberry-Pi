//
//  Response.swift
//  Raspberry Pi
//
//  Created by Pieter Floor on 23/05/2020.
//  Copyright © 2020 Marten Biesheuvel. All rights reserved.
//

import Foundation

struct LCDResponse: Decodable {
  let message: String
  let type: String
}
