export interface ProfilesModels {
  ApplicationType: string;
  FirstName: string;
  LastName: string;
  Email: string;
  // Address1: string ;
  // Address2: string ;
  // City: string ;
  // State: string ;
  // StateId: string ;
  // PostalCode: string ;
  // CountryId: string ;
  Phone: string;
  // PhoneTypeId: string ;
  // BirthDate: string ;
  // GenderId: string ;
  // HariId: string ;
  // EyesId: string ;
  // Height: string ;
  // Weight: string ;
  // EducationId: string ;
  // FatherEthnicityId: string ;
  // FathersBirthPlace: string ;
  // MotherEthnicityId: string ;
  // MothersBirthPlace: string ;
  // MaritalStatusId: string ;
  // DietId: string ;
  // BodyId: string ;
  // ReligionId: string ;
  // SmokingId: string ;
  // DrinkerId: string ;
  // BloodTypeId: string ;
  // Hidden: string ;
  // Deleted: string ;
  // ForeignId: string ;
  // HistoryId: string ;
  // ComplexionId: string ;
  // Status: string ;
  // PictureName1: string ;
  // PictureName2: string ;
  // Personality: string ;
  // MedicalHistory: string ;
  // Occupation: string ;
  // TitleId: string ;
  // RaceId: string ;
  // Priority: string ;
  // RequestFromWeb: string ;
  // admin_notes: string ;
  // admin_comments: string ;

}

export interface Attributes {
   Id: number
  , AttributeTypeId: number
  , Name: string
}
export interface SearchCriteria {
  ChortAlias: string[]
 , Race: string[]
 , CohortStatus: string[]
 , Height: string[]
 , EyeColor: string[]
 , HairColor: string[]
 , BloodType: string[]
 , Education: string[]
,HarmonalProfile: string[]
,MedicalCondition: string[]
,Diet: string[]
,EnergyLevel: string[]
}