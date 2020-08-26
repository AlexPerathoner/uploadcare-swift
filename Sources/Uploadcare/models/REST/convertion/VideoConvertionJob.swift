//
//  VideoConvertionJob.swift
//  
//
//  Created by Sergei Armodin on 26.08.2020.
//

import Foundation

public struct VideoConvertionJob: Codable {
	/// Source file identifier including a target format, if present.
	public let originalSource: String
	
	/// A UUID of your converted document.
	public let uuid: String
	
	/// A conversion job token that can be used to get a job status.
	public let token: Int
	
	/// UUID of a file group with thumbnails for an output video, based on the thumbs operation parameters.
	public let thumbnailsGroupUUID: String
	
	
	enum CodingKeys: String, CodingKey {
        case originalSource = "original_source"
        case uuid
        case token
		case thumbnailsGroupUUID = "thumbnails_group_uuid"
    }
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		originalSource = try container.decodeIfPresent(String.self, forKey: .originalSource) ?? ""
		uuid = try container.decodeIfPresent(String.self, forKey: .uuid) ?? ""
		token = try container.decodeIfPresent(Int.self, forKey: .token) ?? 0
		thumbnailsGroupUUID = try container.decodeIfPresent(String.self, forKey: .thumbnailsGroupUUID) ?? ""
	}
}
