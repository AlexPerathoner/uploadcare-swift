//
//  FileInfo.swift
//  
//
//  Created by Sergey Armodin on 13.01.2020.
//

import Foundation


public struct FileInfo: Codable {
	
	/// File size in bytes.
	public var size: Int
	
	/// File size in bytes. Same as size.
	public var total: Int
	
	/// File UUID
	public var uuid: String
	
	/// Same as uuid
	public var fileId: String
	
	/// Original file name taken from uploaded file.
	public var originalFilename: String
	
	/// sanitized originalFilename.
	public var filename: String
	
	/// File MIME-type.
	public var mimeType: String
	
	/// Is file an image.
	public var isImage: Bool
	
	/// Is file stored.
	public var isStored: Bool
	
	/// Is file ready to be used after upload.
	public var isReady: Bool
	
	/// Image metadata.
	public var imageInfo: ImageInfo?
	
	/// Video metadata.
	public var videoInfo: VideoInfo?
	
	/// Your custom user bucket on which file are stored. Only available of you setup foreign storage bucket for your project.
	public var s3Bucket: String?
	
	
	enum CodingKeys: String, CodingKey {
		case size
		case total
		case uuid
		case fileId = "file_id"
		case originalFilename = "original_filename"
		case filename
		case mimeType = "mime_type"
		case isImage = "is_image"
		case isStored = "is_stored"
		case isReady = "is_ready"
		case imageInfo = "image_info"
		case videoInfo = "video_info"
		case s3Bucket = "s3_bucket"
	}
	
	
	init(
		size: Int,
		total: Int,
		uuid: String,
		fileId: String,
		originalFilename: String,
		filename: String,
		mimeType: String,
		isImage: Bool,
		isStored: Bool,
		isReady: Bool,
		imageInfo: ImageInfo?,
		videoInfo: VideoInfo?,
		s3Bucket: String?
	) {
		self.size = size
		self.total = total
		self.uuid = uuid
		self.fileId = fileId
		self.originalFilename = originalFilename
		self.filename = filename
		self.mimeType = mimeType
		self.isImage = isImage
		self.isStored = isStored
		self.isReady = isReady
		self.imageInfo = imageInfo
		self.videoInfo = videoInfo
		self.s3Bucket = s3Bucket
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		let size = try container.decodeIfPresent(Int.self, forKey: .size) ?? 0
		let total = try container.decodeIfPresent(Int.self, forKey: .total) ?? 0
		let uuid = try container.decodeIfPresent(String.self, forKey: .uuid) ?? ""
		let fileId = try container.decodeIfPresent(String.self, forKey: .fileId) ?? ""
		let originalFilename = try container.decodeIfPresent(String.self, forKey: .originalFilename) ?? ""
		let filename = try container.decodeIfPresent(String.self, forKey: .filename) ?? ""
		let mimeType = try container.decodeIfPresent(String.self, forKey: .mimeType) ?? ""
		let isImage = try container.decodeIfPresent(Bool.self, forKey: .isImage) ?? false
		let isStored = try container.decodeIfPresent(Bool.self, forKey: .isStored) ?? false
		let isReady = try container.decodeIfPresent(Bool.self, forKey: .isReady) ?? false
		let imageInfo = try container.decodeIfPresent(ImageInfo.self, forKey: .imageInfo)
		let videoInfo = try container.decodeIfPresent(VideoInfo.self, forKey: .videoInfo)
		let s3Bucket = try container.decodeIfPresent(String.self, forKey: .s3Bucket)
		
		self.init(
			size: size,
			total: total,
			uuid: uuid,
			fileId: fileId,
			originalFilename: originalFilename,
			filename: filename,
			mimeType: mimeType,
			isImage: isImage,
			isStored: isStored,
			isReady: isReady,
			imageInfo: imageInfo,
			videoInfo: videoInfo,
			s3Bucket: s3Bucket
		)
	}
}
