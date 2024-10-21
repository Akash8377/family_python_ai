import { useEffect, useState } from 'react';
import '../index.css';
import $ from 'jquery';
import { fetchAttributes, fetchEnergyLevel, fetchHarmonalProfile, fetchMedicalCondition, searchDetails } from '../api/api';
import { Attributes, SearchCriteria } from '../models/models';
import Loader from '../shared/loader';
const DonorsSearch = () => {
  const abortController = new AbortController();
  const [raceData, setRaceData] = useState<Attributes[]>();
  const [eyeColor, setEyeColor] = useState<Attributes[]>();
  const [bloodType, setBloodType] = useState<Attributes[]>();
  const [education, setEducation] = useState<Attributes[]>();
  const [CohortStatus, setCohortStatus] = useState<Attributes[]>();
  const [Height, setHeight] = useState<Attributes[]>();
  const [HairColor, setHairColor] = useState<Attributes[]>();
  const [HarmonalProfiles, setHarmonalProfiles] = useState<Attributes[]>();
  const [MedicalCondition, setMedicalCondition] = useState<Attributes[]>();
  const [EnergyLevel, setEnergyLevel] = useState<Attributes[]>();
  const [Diet, setDiet] = useState<Attributes[]>();


  const [SearchResult, setSearchResult] = useState([]);
  const [evenNumbers] = useState<number[]>([]);
  const [oddNumbers] = useState<number[]>([]);
  const [formData] = useState<SearchCriteria>({
    ChortAlias: [], Race: [], CohortStatus: [],MedicalCondition:[],EnergyLevel:[],Diet:[],
    Height: [], EyeColor: [], HairColor: [], BloodType: [], Education: [],HarmonalProfile:[]
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    const fetchPersonalInformationData = async () => {
      try {
        await fetchAttributes("0", abortController.signal).then((data: any) => {
          let userdata = data;
          if (userdata) {
            const rdata = userdata.filter((race: any) => race.AttributeTypeId === 18);
            const eyeData = userdata.filter((race: any) => race.AttributeTypeId === 9);
            const bloodData = userdata.filter((race: any) => race.AttributeTypeId === 1);
            const educationData = userdata.filter((race: any) => race.AttributeTypeId === 6);
            const cohortStatusData = userdata.filter((race: any) => race.AttributeTypeId === 19);
            const heightData = userdata.filter((race: any) => race.AttributeTypeId === 20);
            const hairColorData = userdata.filter((race: any) => race.AttributeTypeId === 10);
            const DietData = userdata.filter((race: any) => race.AttributeTypeId === 4);
            setRaceData(rdata);
            setEyeColor(eyeData);
            setBloodType(bloodData);
            setEducation(educationData);
            setCohortStatus(cohortStatusData);
            setHeight(heightData);
            setHairColor(hairColorData);
            setDiet(DietData);
          }
        });


      } catch (error: any) {
        setError(error.Tostring());
      } finally {
        setLoading(false);
      }
    };

    const fetchMedicalConditionData = async () => {
      try {
        await fetchMedicalCondition("0", abortController.signal).then((data: any) => {
          let userdata = data;
          if (userdata) {
            setMedicalCondition(userdata);
          }
        });


      } catch (error: any) {
        setError(error.Tostring());
      } finally {
        setLoading(false);
      }
    };
    const fetchHarmonalProfilesData = async () => {
      try {
        await fetchHarmonalProfile("0", abortController.signal).then((data: any) => {
          let userdata = data;
          if (userdata) {
            setHarmonalProfiles(userdata);
          }
        });


      } catch (error: any) {
        setError(error.Tostring());
      } finally {
        setLoading(false);
      }
    };

    const fetchEnergyLevelData = async () => {
      try {
        await fetchEnergyLevel("0", abortController.signal).then((data: any) => {
          let userdata = data;
          if (userdata) {
            setEnergyLevel(userdata);
          }
        });


      } catch (error: any) {
        setError(error.toString());
      } finally {
        setLoading(false);
      }
    };




    fetchPersonalInformationData();
    fetchMedicalConditionData();
    fetchHarmonalProfilesData();
    fetchEnergyLevelData();

  }, []);

  var handleClick = (event: any) => {
    let el = event.target;
    var content = $(el).next('.filter-content');
    var icon = $(el).find('.icon');
    content.slideToggle();
    if (icon.text() === '+') {
      icon.text('-');
    } else {
      icon.text('+');
    }
  }

  var resetApplyCriteria = async () => {
    setSearchResult([])
    evenNumbers.length = 0;
    oddNumbers.length = 0;
    formData.BloodType = []
    formData.ChortAlias = []
    formData.CohortStatus = []
    formData.Education = []
    formData.EyeColor = []
    formData.HairColor = []
    formData.Height = []
    formData.Race = []
  }

  var applyCriteria = async () => {
    console.log(formData);
    setLoading(true);

    try {
      await searchDetails(formData, abortController.signal)
        .then((jsonData: any) => {
          ;
          evenNumbers.length = 0;
          oddNumbers.length = 0;
          if (jsonData && jsonData.length > 0) {
            setSearchResult(jsonData);
            evenNumbers.push(0);
            for (let i = 1; i < jsonData.length; i++) {
              if (i % 2 === 0) {
                evenNumbers.push(i)
              } else {
                oddNumbers.push(i)
              }
            }
          } else {
            setSearchResult([]); // Fallback to empty array if no valid data
          }

          // console.log(evenNumbers)
          // console.log(oddNumbers)
           console.log(SearchResult)
        })

    }
    catch (e) {
      console.log(e)
    }
    finally {
      setLoading(false);
  }

  }

  const toggleValueInArray = (array: string[], value: string): string[] => {
    const valueIndex = array.indexOf(value);

    if (valueIndex > -1) {
      // If the value exists, remove it
      return array.filter((_, index) => index !== valueIndex);
    } else {
      // If the value does not exist, add it
      return [...array, value];
    }
  };

  const handleChange = (e: any) => {
    const { name, value } = e.target;
    if (name == "ChortAlias") {
      formData[name as keyof SearchCriteria] = value;
      return;
    }
    const criteria = formData[name as keyof SearchCriteria];
    const updatedCriteria = toggleValueInArray(criteria, value);
    console.log(updatedCriteria);
    formData[name as keyof SearchCriteria] = updatedCriteria;
  };



  if (loading) return <div><Loader></Loader></div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <>
      <div className="title-wrap">
        <h1 className="title">Find a Donor</h1>
      </div>
      <div className="right-box">
        <div className="row">
          <div className="col-md-3 left-part">
            <div className="search-part">
              <h3 className="title is-5 is-narrow is-bolder">Select your donor criteria</h3>
              <p className="mt-2 mb-1">Refine your donor search with filter options</p>
              <hr></hr>
             
              <div className="accordion" id="donor-accordian">
                <div className="accordion-item">
                  <h2 className="accordion-header" id="headingOne">
                    <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      Personal Information
                    </button>
                  </h2>
                  <div id="collapseOne" className="accordion-collapse collapse " aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div className="accordion-body">
                      <div className="race-part">
                        <div className="filter-section">
                          <button className="collapse-btn" onClick={handleClick}>
                            Race <span className="icon">+</span>
                          </button>

                          <div className="filter-content">
                            {
                              raceData?.map(item => (
                                <>
                                  <input type="checkbox" onChange={handleChange} id={item.Id.toString()} name="Race" value={item.Name}></input>
                                  <label htmlFor={item.Id.toString()}>{item.Name}</label><br></br>
                                </>
                              ))}
                          </div>
                        </div>
                      </div>

                      <div className="race-part">
                        <div className="filter-section">
                          <button className="collapse-btn" onClick={handleClick}>
                            Cohort Status <span className="icon">+</span>
                          </button>
                          <div className="filter-content">
                            {
                              CohortStatus?.map(item => (
                                <>
                                  <input type="checkbox" onChange={handleChange} id={item.Id.toString()} name="CohortStatus" value={item.Name}></input>
                                  <label htmlFor={item.Id.toString()}>{item.Name}</label><br></br>
                                </>
                              ))}
                            <br></br>
                          </div>
                        </div>
                      </div>
                      <div className="race-part">
                        <div className="filter-section">
                          <button className="collapse-btn" onClick={handleClick}>
                            Height <span className="icon">+</span>
                          </button>
                          <div className="filter-content">

                            {
                              Height?.map(item => (
                                <>
                                  <input type="checkbox" onChange={handleChange} id={item.Id.toString()} name="Height" value={item.Name}></input>
                                  <label htmlFor={item.Id.toString()}>{item.Name}</label><br></br>
                                </>
                              ))}

                            <br></br>
                          </div>
                        </div>
                      </div>
                      <div className="race-part">
                        <div className="filter-section">
                          <button className="collapse-btn" onClick={handleClick}>
                            Eye Color <span className="icon">+</span>
                          </button>
                          <div className="filter-content">

                            {
                              eyeColor?.map(item => (
                                <>
                                  <input type="checkbox" onChange={handleChange} id={item.Id.toString()} name="EyeColor" value={item.Name}></input>
                                  <label htmlFor={item.Id.toString()}>{item.Name}</label><br></br>
                                </>
                              ))}

                          </div>
                        </div>
                      </div>
                      <div className="race-part">
                        <div className="filter-section">
                          <button className="collapse-btn" onClick={handleClick}>
                            Hair Color<span className="icon">+</span>
                          </button>
                          <div className="filter-content">

                            {
                              HairColor?.map(item => (
                                <>
                                  <input type="checkbox" onChange={handleChange} id={item.Id.toString()} name="HairColor" value={item.Name}></input>
                                  <label htmlFor={item.Id.toString()}>{item.Name}</label><br></br>
                                </>
                              ))}
                            <br></br>

                          </div>
                        </div>
                      </div>
                      
                      <div className="race-part">
                        <div className="filter-section">
                          <button className="collapse-btn" onClick={handleClick}>
                            Education<span className="icon">+</span>
                          </button>
                          <div className="filter-content">

                            {
                              education?.map(item => (
                                <>
                                  <input type="checkbox" onChange={handleChange} id={item.Id.toString()} name="Education" value={item.Name}></input>
                                  <label htmlFor={item.Id.toString()}>{item.Name}</label><br></br>
                                </>
                              ))}

                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>


                <div className="accordion-item">
                  <h2 className="accordion-header" id="headingTwo">
                    <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      Genetic and Health Information
                    </button>
                  </h2>
                  <div id="collapseTwo" className="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div className="accordion-body">
                    <div className="race-part">
                        <div className="filter-section">
                          <button className="collapse-btn" onClick={handleClick}>
                            Blood Type<span className="icon">+</span>
                          </button>
                          <div className="filter-content">

                            {
                              bloodType?.map(item => (
                                <>
                                  <input type="checkbox" onChange={handleChange} id={item.Id.toString()} name="BloodType" value={item.Name}></input>
                                  <label htmlFor={item.Id.toString()}>{item.Name}</label><br></br>
                                </>
                              ))}


                          </div>
                        </div>
                      </div>
                      <div className="race-part">
                        <div className="filter-section">
                          <button className="collapse-btn" onClick={handleClick}>
                            Medical Condition <span className="icon">+</span>
                          </button>
                          <div className="filter-content">
                            
                            
                          {
                              MedicalCondition?.map(item => (
                                <>
                                  <input type="checkbox" onChange={handleChange} id={'MedicalCondition'+item.Id.toString()} name="MedicalCondition" value={item.Name}></input>
                                  <label htmlFor={'MedicalCondition'+item.Id.toString()}>{item.Name}</label><br></br>
                                </>
                              ))}


                          </div>
                        </div>
                      </div>
                      <div className="race-part">
                        <div className="filter-section">
                          <button className="collapse-btn" onClick={handleClick}>
                            Harmonal Profile <span className="icon">+</span>
                          </button>
                          <div className="filter-content">
                          
                          {
                              HarmonalProfiles?.map(item => (
                                <>
                                  <input type="checkbox" onChange={handleChange} id={'HarmonalProfiles'+item.Id.toString()} name="HarmonalProfile" value={item.Name}></input>
                                  <label htmlFor={'HarmonalProfiles'+item.Id.toString()}>{item.Name}</label><br></br>
                                </>
                              ))}


                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div className="accordion-item">
                  <h2 className="accordion-header" id="headingThree">
                    <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      Biochemical and Physiological Factors
                    </button>
                  </h2>
                  <div id="collapseThree" className="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                    <div className="accordion-body">
                      <div className="race-part">
                        <div className="filter-section">
                          <button className="collapse-btn" onClick={handleClick}>
                            Diet <span className="icon">+</span>
                          </button>
                          <div className="filter-content">
                            
                          {
                              Diet?.map(item => (
                                <>
                                  <input type="checkbox" onChange={handleChange} id={'Diet'+item.Id.toString()} name="Diet" value={item.Name}></input>
                                  <label htmlFor={'Diet'+item.Id.toString()}>{item.Name}</label><br></br>
                                </>
                              ))}
                            
                          </div>
                        </div>
                      </div>

                      <div className="race-part">
                        <div className="filter-section">
                          <button className="collapse-btn" onClick={handleClick}>
                            Physical Activity Level <span className="icon">+</span>
                          </button>
                          <div className="filter-content">
                            
                          {
                              EnergyLevel?.map(item => (
                                <>
                                  <input type="checkbox" onChange={handleChange} id={'EnergyLevel'+item.Id.toString()} name="EnergyLevel" value={item.Name}></input>
                                  <label htmlFor={'EnergyLevel'+item.Id.toString()}>{item.Name}</label><br></br>
                                </>
                              ))}

                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>


              <div className="buttons pt-2">
                <button className="button h-button is-primary is-fullwidth is-bold is-raised" onClick={applyCriteria} id="btn-filter-donor">Apply Criteria</button>
                <button className="button h-button is-fullwidth is-bold is-raised" id="btn-reset-donor-filter" onClick={resetApplyCriteria}>Reset Search</button>
              </div>


            </div>
          </div>

          <div className="col-md-9">
            <div className="search-job">
              <div className="searched-bar">
                <div className="searched-count">Showing <span className="total-result">{SearchResult.length}</span> Cohorts</div>
              </div>

              {evenNumbers.length > 0 ? (evenNumbers.map((index) => (

                <>

                  <div className="donor-lady">
                    <div className="row">
                      <div className="col-md-6">
                        <div className="articles-feed">
                          <div className="articles-feed-list-inner donor-item" id="">
                            <a href="#" className="articles-feed-item hint--top hint--primary hint--rounded" data-hint="Click to view profile">
                              <div className="featured-image" style={{
                                backgroundImage: `url(images/${SearchResult[oddNumbers[index]]["PictureName1"]})`,
                                backgroundPosition: "center",
                                backgroundSize: "cover"
                              }}></div></a>
                            <div className="featured-content">
                              <a href="#" className="articles-feed-item hint--top hint--primary hint--rounded" data-hint="Click to view profile">
                                <div className='match-per'>
                                  <div className='matched-name'>
                                    <h4 className="dark-inverted mb-0">IEGD-001{SearchResult[oddNumbers[index]]["Id"]}</h4>
                                  </div>
                                  <div className='matched-perchntage'>
                                    <p className="is-size-7 eggs"><span>Match%: {SearchResult[oddNumbers[index]]["SearchRatio"]}</span></p>
                                  </div>
                                </div>
                                <div className="detail-part">
                                  <div className="row">
                                    <div className="col-md-6">
                                      <div className="detail1">
                                        <div className="detail-left"><img src="images/skintone.png" alt="skintone"></img></div>
                                        <div className="detail-right">
                                          <h5>{SearchResult[oddNumbers[index]]["RaceName"]}</h5>
                                          <p>Race</p>
                                        </div>
                                      </div>
                                      <div className="detail1">
                                        <div className="detail-left"><img src="images/age.png" alt="age"></img></div>
                                        <div className="detail-right">
                                          <h5>{SearchResult[oddNumbers[index]]["Age"]}</h5>
                                          <p>Age</p>
                                        </div>
                                      </div>
                                      <div className="detail1">
                                        <div className="detail-left"><img src="images/eye.png" alt="eye"></img></div>
                                        <div className="detail-right">
                                          <h5>{SearchResult[oddNumbers[index]]["EyesName"]}</h5>
                                          <p>Eye Color</p>
                                        </div>
                                      </div>
                                      <div className="detail1">
                                        <div className="detail-left"><img src="images/hair.png" alt="hair"></img></div>
                                        <div className="detail-right">
                                          <h5>{SearchResult[oddNumbers[index]]["HairName"]}</h5>
                                          <p>Hair Color</p>
                                        </div>
                                      </div>
                                    </div>
                                    <div className="col-md-6">
                                      <div className="detail1">
                                        <div className="detail-left"><img src="images/blood.png" alt="blood"></img></div>
                                        <div className="detail-right">
                                          <h5>{SearchResult[oddNumbers[index]]["BloodTypeName"]}</h5>
                                          <p>Blood</p>
                                        </div>
                                      </div>
                                      <div className="detail1">
                                        <div className="detail-left"><img src="images/height.png" alt="height"></img></div>
                                        <div className="detail-right">
                                          <h5>{SearchResult[oddNumbers[index]]["HeightName"]}</h5>
                                          <p>Height</p>
                                        </div>
                                      </div>
                                      <div className="detail1">
                                        <div className="detail-left"><img src="images/gradution.png" alt="gradution"></img></div>
                                        <div className="detail-right">
                                          <h5>{SearchResult[oddNumbers[index]]["EducationName"]}</h5>
                                          <p>Education</p>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div></a>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div className="col-md-6">
                        <div className="articles-feed">
                          <div className="articles-feed-list-inner donor-item" id="">
                            <a href="#" className="articles-feed-item hint--top hint--primary hint--rounded" data-hint="Click to view profile"></a>
                            <div className="featured-image"
                              style={{
                                backgroundImage: `url(images/${SearchResult[evenNumbers[index]]["PictureName1"]})`,
                                backgroundPosition: "center",
                                backgroundSize: "cover"
                              }}
                            ></div>
                            <div className="featured-content">
                              <div className='match-per'>
                                <div className='matched-name'>
                                  <h4 className="dark-inverted mb-0">IEGD-001{SearchResult[evenNumbers[index]]["Id"]}</h4>
                                </div>
                                <div className='matched-perchntage'>
                                  <p className="is-size-7 eggs"><span>Match%: {SearchResult[evenNumbers[index]]["SearchRatio"]}</span></p>
                                </div>
                              </div>
                              <div className="detail-part">
                                <div className="row">
                                  <div className="col-md-6">
                                    <div className="detail1">
                                      <div className="detail-left"><img src="images/skintone.png" alt="skintone"></img></div>
                                      <div className="detail-right">
                                        <h5>{SearchResult[evenNumbers[index]]["RaceName"]}</h5>
                                        <p>Race</p>
                                      </div>
                                    </div>
                                    <div className="detail1">
                                      <div className="detail-left"><img src="images/age.png" alt="age"></img></div>
                                      <div className="detail-right">
                                        <h5>{SearchResult[evenNumbers[index]]["Age"]}</h5>
                                        <p>Age</p>
                                      </div>
                                    </div>
                                    <div className="detail1">
                                      <div className="detail-left"><img src="images/eye.png" alt="eye"></img></div>
                                      <div className="detail-right">
                                        <h5>{SearchResult[evenNumbers[index]]["EyesName"]}</h5>
                                        <p>Eye Color</p>
                                      </div>
                                    </div>
                                    <div className="detail1">
                                      <div className="detail-left"><img src="images/hair.png" alt="hair"></img></div>
                                      <div className="detail-right">
                                        <h5>{SearchResult[evenNumbers[index]]["HairName"]}</h5>
                                        <p>Hair Color</p>
                                      </div>
                                    </div>
                                  </div>
                                  <div className="col-md-6">
                                    <div className="detail1">
                                      <div className="detail-left"><img src="images/blood.png" alt="blood"></img></div>
                                      <div className="detail-right">
                                        <h5>{SearchResult[evenNumbers[index]]["BloodTypeName"]}</h5>
                                        <p>Blood</p>
                                      </div>
                                    </div>
                                    <div className="detail1">
                                      <div className="detail-left"><img src="images/height.png" alt="height"></img></div>
                                      <div className="detail-right">
                                        <h5>{SearchResult[evenNumbers[index]]["HeightName"]}</h5>
                                        <p>Height</p>
                                      </div>
                                    </div>
                                    <div className="detail1">
                                      <div className="detail-left"><img src="images/gradution.png" alt="gradution"></img></div>
                                      <div className="detail-right">
                                        <h5>{SearchResult[evenNumbers[index]]["EducationName"]}</h5>
                                        <p>Education</p>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>

                    </div>
                  </div>

                </>
              ))
              ) : (
                <p>No records found within selected criteria.</p>
              )}


            </div>
          </div>

        </div>
      </div>


    </>
  )
};

export default DonorsSearch;


