@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity Z11_C_MOVIE
  provider contract transactional_query
  
  as projection on Z11_R_MOVIE
{
  key MovieUuid,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,
      @Consumption.valueHelpDefinition: [{ entity: { element: 'Genre', name: 'Z11_I_GenreVH'}}]
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,

      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      //Transient Data
      _AverageRating.AverageRating,
      AverageRatingCriticality,
      
      _Ratings : redirected to composition child Z11_C_Rating
}
