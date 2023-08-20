// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import MoviesAPI

public class Movie: MockObject {
  public static let objectType: Object = MoviesAPI.Objects.Movie
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Movie>>

  public struct MockFields {
    @Field<String>("genre") public var genre
    @Field<MoviesAPI.ID>("id") public var id
    @Field<String>("poster") public var poster
    @Field<String>("title") public var title
    @Field<String>("year") public var year
  }
}

public extension Mock where O == Movie {
  convenience init(
    genre: String? = nil,
    id: MoviesAPI.ID? = nil,
    poster: String? = nil,
    title: String? = nil,
    year: String? = nil
  ) {
    self.init()
    _setScalar(genre, for: \.genre)
    _setScalar(id, for: \.id)
    _setScalar(poster, for: \.poster)
    _setScalar(title, for: \.title)
    _setScalar(year, for: \.year)
  }
}
