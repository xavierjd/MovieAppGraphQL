// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import MoviesAPI

public class Query: MockObject {
  public static let objectType: Object = MoviesAPI.Objects.Query
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Query>>

  public struct MockFields {
    @Field<[Genre?]>("genres") public var genres
    @Field<[Movie?]>("movies") public var movies
  }
}

public extension Mock where O == Query {
  convenience init(
    genres: [Mock<Genre>?]? = nil,
    movies: [Mock<Movie>?]? = nil
  ) {
    self.init()
    _setList(genres, for: \.genres)
    _setList(movies, for: \.movies)
  }
}
