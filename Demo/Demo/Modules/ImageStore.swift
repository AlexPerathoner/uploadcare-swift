//
//  ImageStore.swift
//  Demo
//
//  Created by Sergey Armodin on 28.10.2020.
//  Copyright © 2020 Sergei Armodin. All rights reserved.
//

import UIKit
import Combine

class ImageStore: ObservableObject {
	@Published var image: UIImage?
	
	init(image: UIImage? = nil) {
		self.image = image
	}
}
