//
//  MediaModel.swift
//
//  Created by Dhanushka Adrian on 12/6/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class MediaModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let tags = "tags"
  }

  // MARK: Properties
  public var tags: [Tags]?

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
    if let items = json[SerializationKeys.tags].array { tags = items.map { Tags(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = tags { dictionary[SerializationKeys.tags] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.tags = aDecoder.decodeObject(forKey: SerializationKeys.tags) as? [Tags]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(tags, forKey: SerializationKeys.tags)
  }

}
