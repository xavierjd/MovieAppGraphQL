// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import MoviesAPI

public class Genre: MockObject {
  public static let objectType: Object = MoviesAPI.Objects.Genre
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Genre>>

  public struct MockFields {
    @Field<String>("name") public var name
  }
}

public extension Mock where O == Genre {
  convenience init(
    name: String? = nil
  ) {
    self.init()
    _setScalar(name, for: \.name)
  }
}
