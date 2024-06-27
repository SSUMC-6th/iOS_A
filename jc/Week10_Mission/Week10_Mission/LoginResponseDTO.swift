//
//  TokenResponseDTO.swift
//  Week10_Mission
//
//  Created by Jiwoong CHOI on 6/26/24.
//

import Foundation

struct LoginResponseDTO : Codable {
  let access_token : String
  let refresh_token : String
}
