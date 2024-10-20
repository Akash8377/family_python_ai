import { ProfilesModels, SearchCriteria } from '../models/models';

let url = "http://127.0.0.1:5000"
export async function saveProfiles(profilesModels: ProfilesModels, abortSignal: AbortSignal): Promise<Response> {
  const response = await fetch(url+'/api/saveProfile', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
        profilesModels: profilesModels
    }),
    signal: abortSignal
  })
  const data = await response.json();
  return data;
}
export async function fetchAttributes(AttributeTypeId:string ,abortSignal: AbortSignal): Promise<Response> {
  const response = await fetch(url+'/api/fetchAttributes?AttributeTypeId='+AttributeTypeId, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    },
    signal: abortSignal
  })
  const data = await response.json();
  return data;
}
export async function fetchMedicalCondition(Id:string ,abortSignal: AbortSignal): Promise<Response> {
  const response = await fetch(url+'/api/MedicalCondition?Id='+Id, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    },
    signal: abortSignal
  })
  const data = await response.json();
  return data;
}
export async function fetchHarmonalProfile(Id:string ,abortSignal: AbortSignal): Promise<Response> {
  const response = await fetch(url+'/api/HarmonalProfile?Id='+Id, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    },
    signal: abortSignal
  })
  const data = await response.json();
  return data;
}
export async function fetchEnergyLevel(Id:string ,abortSignal: AbortSignal): Promise<Response> {
  const response = await fetch(url+'/api/EnergyLevel?Id='+Id, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    },
    signal: abortSignal
  })
  const data = await response.json();
  return data;
}
export async function searchDetails(searchCriteria:SearchCriteria ,abortSignal: AbortSignal): Promise<Response> {
  const response = await fetch(url+'/api/searchDetails', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      searchCriteria: searchCriteria
    }),
    signal: abortSignal
  })
  const data = await response.json();
  return data;
}