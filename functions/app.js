/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const functions = require("firebase-functions");
const logger = require("firebase-functions/logger");
const {ApolloServer} = require("apollo-server-cloud-functions");


let movies = require('./data/movies')
const genres = require('./data/genres')


const typeDefs = `
    type Movie {
        id: ID!
        title: String!
        year: String!
        genre: String!
        poster: String!
    }

    type Genre {
        name: String!
    }

    input MovieInput {
        id: ID
        title: String!
        year: String!
        genre: String!
        poster: String!
    }

    input MovieFilter {
        genre: String
    }

    type Query {
        movies(filter: MovieFilter): [Movie] 
        genres: [Genre]
    }

    type Mutation {
        addMovie(movie: MovieInput): Movie
        deleteMovie(id: ID!): Movie
    }
`;

const getAllMovies = (filter) => {
    let filteredMovies = movies

    if(filter) {
        if(filter.genre) {
            filteredMovies = movies.filter(movie => movie.genre == filter.genre)
        }
    }

    return filteredMovies
}

const addMovie = (movie) => {
    movie.id = Math.max.apply(Math, movies.map(movie => movie.id)) + 1 
    movies.push(movie)
    return movie
}

const deleteMovie = (movieId) => {
    const movieToDelete = movies.find(movie => movie.id == movieId)
    movies = movies.filter(movie =>  movie.id != movieId)
    return movieToDelete
}

const resolvers = {
    Query: {
        movies: (_, { filter }) => getAllMovies(filter),
        genres: () => genres
    },
    Mutation: {
        addMovie: (_, { movie }) => addMovie(movie),
        deleteMovie: (_, {id}) => deleteMovie(id)
    }
};

const server = new ApolloServer({typeDefs, resolvers});

exports.graphql = functions.https.onRequest(server.createHandler());