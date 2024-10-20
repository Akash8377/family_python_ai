

from backend.donorSearch.lib import search_with_ratio

def searchBloodType(dataList:any,filterData:any):
    finalResult = []
    unique_values = dataList["BloodTypeName"].unique()
    unique_list = unique_values.tolist()
    matched_results_with_Percent = []
    finalMatched_results = []
    UniquefinalMatched_results = []
    for row in filterData:
      matched_results = search_with_ratio(row, unique_list)
      for matched_row in matched_results:        
        finalMatched_results.append(matched_row[0])
        exists = any(record['Name'] == matched_row[0] and record['Ratio'] >= matched_row[1] for record in matched_results_with_Percent)
        if(not exists):
          exists = any(record['Name'] == matched_row[0] for record in matched_results_with_Percent)
          if(exists):  
            matched_results_with_Percent=[record for record in matched_results_with_Percent if record['Name'] != matched_row[0]]
          matched_results_with_Percent.extend([{'Name':matched_row[0],'Ratio':matched_row[1]}])
    UniquefinalMatched_results = list(set(finalMatched_results))    
    filtered_df = dataList[dataList['BloodTypeName'].isin(UniquefinalMatched_results)]
    for matched_str in matched_results_with_Percent:
      filtered_df.loc[filtered_df['BloodTypeName']== matched_str["Name"], 'SearchRatio'] = matched_str["Ratio"]
    finalResult = filtered_df.values.tolist()            
    return finalResult

def searchMedicalCondition(dataList:any,filterData:any):
    finalResult = []
    unique_values = dataList["MedicalConditionName"].unique()
    unique_list = unique_values.tolist()
    matched_results_with_Percent = []
    finalMatched_results = []
    UniquefinalMatched_results = []
    for row in filterData:
      matched_results = search_with_ratio(row, unique_list)
      for matched_row in matched_results:        
        finalMatched_results.append(matched_row[0])
        exists = any(record['Name'] == matched_row[0] and record['Ratio'] >= matched_row[1] for record in matched_results_with_Percent)
        if(not exists):
          exists = any(record['Name'] == matched_row[0] for record in matched_results_with_Percent)
          if(exists):  
            matched_results_with_Percent=[record for record in matched_results_with_Percent if record['Name'] != matched_row[0]]
          matched_results_with_Percent.extend([{'Name':matched_row[0],'Ratio':matched_row[1]}])
    UniquefinalMatched_results = list(set(finalMatched_results))    
    filtered_df = dataList[dataList['MedicalConditionName'].isin(UniquefinalMatched_results)]
    for matched_str in matched_results_with_Percent:
      filtered_df.loc[filtered_df['MedicalConditionName']== matched_str["Name"], 'SearchRatio'] = matched_str["Ratio"]
    finalResult = filtered_df.values.tolist()            
    return finalResult

def searchHarmonalProfile(dataList:any,filterData:any):
    finalResult = []
    unique_values = dataList["HarmonalProfileName"].unique()
    unique_list = unique_values.tolist()
    matched_results_with_Percent = []
    finalMatched_results = []
    UniquefinalMatched_results = []
    for row in filterData:
      matched_results = search_with_ratio(row, unique_list)
      for matched_row in matched_results:        
        finalMatched_results.append(matched_row[0])
        exists = any(record['Name'] == matched_row[0] and record['Ratio'] >= matched_row[1] for record in matched_results_with_Percent)
        if(not exists):
          exists = any(record['Name'] == matched_row[0] for record in matched_results_with_Percent)
          if(exists):  
            matched_results_with_Percent=[record for record in matched_results_with_Percent if record['Name'] != matched_row[0]]
          matched_results_with_Percent.extend([{'Name':matched_row[0],'Ratio':matched_row[1]}])
    UniquefinalMatched_results = list(set(finalMatched_results))    
    filtered_df = dataList[dataList['HarmonalProfileName'].isin(UniquefinalMatched_results)]
    for matched_str in matched_results_with_Percent:
      filtered_df.loc[filtered_df['HarmonalProfileName']== matched_str["Name"], 'SearchRatio'] = matched_str["Ratio"]
    finalResult = filtered_df.values.tolist()            
    return finalResult