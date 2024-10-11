@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
define root view entity Z11_R_MOVIE
  as select from zabap_movie_a
  composition [0..*]of Z11_R_Rating as _Ratings
association [0..1] to Z11_I_AverageMovieRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
{
  key movie_uuid      as MovieUuid,
      title           as Title,
      genre           as Genre,
      publishing_year as PublishingYear,
      runtime_in_min  as RuntimeInMin,
      @Semantics.imageUrl: true
      image_url       as ImageUrl,

      created_at      as CreatedAt,
      created_by      as CreatedBy,
      last_changed_at as LastChangedAt,
      last_changed_by as LastChangedBy,
      
//      Transient Data
      case when _AverageRating.AverageRating > 6.7 then 3
           when _AverageRating.AverageRating > 3.4 then 2
           when _AverageRating.AverageRating > 0 then 1
           else 0
      end             as AverageRatingCriticality,
      
      _Ratings,
      _AverageRating
}
