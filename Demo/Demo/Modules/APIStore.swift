//
//  APIStore.swift
//  Demo
//
//  Created by Sergey Armodin on 28.10.2020.
//  Copyright © 2020 Sergei Armodin. All rights reserved.
//

import Foundation
import Combine
import Uploadcare

final class APIStore: ObservableObject {
	var uploadcare: Uploadcare?
	
	init(uploadcare: Uploadcare? = nil) {
		self.uploadcare = uploadcare
	}
}
