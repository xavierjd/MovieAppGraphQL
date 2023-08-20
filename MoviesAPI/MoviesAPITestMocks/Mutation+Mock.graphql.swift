// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import MoviesAPI

public class Mutation: MockObject {
  public static let objectType: Object = MoviesAPI.Objects.Mutation
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Mutation>>

  public struct MockFields {
    @Field<Movie>("addMovie") public var addMovie
    @Field<Movie>("deleteMovie") public var deleteMovie
  }
}

public extension Mock where O == Mutation {
  convenience init(
    addMovie: Mock<Movie>? = nil,
    deleteMovie: Mock<Movie>? = nil
  ) {
    self.init()
    _setEntity(addMovie, for: \.addMovie)
    _setEntity(deleteMovie, for: \.deleteMovie)
  }
}
