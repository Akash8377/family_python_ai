import pandas as pd
from backend.donorSearch.energyLevels.energyLevels import searchDiet, searchEnergyLevel
from backend.donorSearch.geneticAndHealthInformation.geneticAndHealthInformation import searchBloodType, searchHarmonalProfile, searchMedicalCondition

from backend.donorSearch.personalInformation.personalInformation import searchEducation, searchEyeColor, searchHairColor, searchHeight, searchRace

def get_record_by_KeyIndex(records, target_id):
    return [record for record in records if record[0] == target_id]
def get_record_by_id(records, target_id):
    return records.loc[records['Id'] == target_id]

def searchFromList(dataList:any,filterData:any):
    finalResult = pd.DataFrame(columns=dataList.columns)
    aiResult = []
   # {"searchCriteria":{"ChortAlias":[],"Race":["Bengali","Asian"],"CohortStatus":[],"Height":[],"EyeColor":[],"HairColor":[],"BloodType":[],"Education":[]}}
    filterCount = 0
    if filterData:
      if filterData["searchCriteria"]["Race"]:
        aiResult.extend(searchRace(dataList,filterData["searchCriteria"]["Race"]))
        filterCount=filterCount+1
      if filterData["searchCriteria"]["BloodType"]:
        aiResult.extend(searchBloodType(dataList,filterData["searchCriteria"]["BloodType"]))
        filterCount=filterCount+1
      if filterData["searchCriteria"]["Education"]:
        aiResult.extend(searchEducation(dataList,filterData["searchCriteria"]["Education"]))
        filterCount=filterCount+1
      if filterData["searchCriteria"]["Height"]:
        aiResult.extend(searchHeight(dataList,filterData["searchCriteria"]["Height"]))
        filterCount=filterCount+1
      if filterData["searchCriteria"]["EyeColor"]:
        aiResult.extend(searchEyeColor(dataList,filterData["searchCriteria"]["EyeColor"]))
        filterCount=filterCount+1
      if filterData["searchCriteria"]["HairColor"]:
        aiResult.extend(searchHairColor(dataList,filterData["searchCriteria"]["HairColor"]))
        filterCount=filterCount+1

      if filterData["searchCriteria"]["EnergyLevel"]:
              aiResult.extend(searchEnergyLevel(dataList,filterData["searchCriteria"]["EnergyLevel"]))
              filterCount=filterCount+1

      if filterData["searchCriteria"]["HarmonalProfile"]:
              aiResult.extend(searchHarmonalProfile(dataList,filterData["searchCriteria"]["HarmonalProfile"]))
              filterCount=filterCount+1

      if filterData["searchCriteria"]["MedicalCondition"]:
              aiResult.extend(searchMedicalCondition(dataList,filterData["searchCriteria"]["MedicalCondition"]))
              filterCount=filterCount+1
      if filterData["searchCriteria"]["Diet"]:
                    aiResult.extend(searchDiet(dataList,filterData["searchCriteria"]["Diet"]))
                    filterCount=filterCount+1
            
            #originalData = dataList.to_dict(orient='records')

      unique_id = set()  
      for entry in aiResult:
        if entry[0] not in unique_id:
            unique_id.add(entry[0])  
           

      finalRatio=0
      for row in unique_id:
        duplicateaiResult = get_record_by_KeyIndex(aiResult,row)
        ratio = 0
        for ratiorow in duplicateaiResult:
           ratio = ratio+ratiorow[23]
        finalRatio= (ratio/filterCount)
        
        finalduplicateaiResult = get_record_by_id(dataList,row)
        updatedData =pd.DataFrame(finalduplicateaiResult)
        updatedData.loc[updatedData['Id']== row, 'SearchRatio'] = round(finalRatio, 0)
        finalResult = pd.concat([finalResult,updatedData],ignore_index=True)
     
      sorted_df = finalResult.sort_values(by='SearchRatio', ascending=False).head(50)
     
    return sorted_df



