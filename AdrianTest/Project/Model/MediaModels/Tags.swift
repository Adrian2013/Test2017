//
//  Tags.swift
//
//  Created by Dhanushka Adrian on 12/6/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Tags: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let path = "path"
    static let image = "image"
    static let searchterm = "searchterm"
  }

  // MARK: Properties
  public var name: String?
  public var path: String?
  public var image: String?
  public var searchterm: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    name = json[SerializationKeys.name].string
    path = json[SerializationKeys.path].string
    image = json[SerializationKeys.image].string
    searchterm = json[SerializationKeys.searchterm].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = path { dictionary[SerializationKeys.path] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = searchterm { dictionary[SerializationKeys.searchterm] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.path = aDecoder.decodeObject(forKey: SerializationKeys.path) as? String
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    self.searchterm = aDecoder.decodeObject(forKey: SerializationKeys.searchterm) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(path, forKey: SerializationKeys.path)
    aCoder.encode(image, forKey: SerializationKeys.image)
    aCoder.encode(searchterm, forKey: SerializationKeys.searchterm)
  }

}
