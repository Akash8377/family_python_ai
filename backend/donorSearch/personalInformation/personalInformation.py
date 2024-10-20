
from backend.donorSearch.lib import search_with_ratio


def searchRace(dataList:any,filterData:any):
    finalResult = []
    unique_values = dataList["RaceName"].unique()
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
    filtered_df = dataList[dataList['RaceName'].isin(UniquefinalMatched_results)]
    for matched_str in matched_results_with_Percent:
      filtered_df.loc[filtered_df['RaceName']== matched_str["Name"], 'SearchRatio'] = matched_str["Ratio"]
    finalResult = filtered_df.values.tolist()            
    return finalResult


def searchEducation(dataList:any,filterData:any):
    finalResult = []
    unique_values = dataList["EducationName"].unique()
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
    filtered_df = dataList[dataList['EducationName'].isin(UniquefinalMatched_results)]
    for matched_str in matched_results_with_Percent:
      filtered_df.loc[filtered_df['EducationName']== matched_str["Name"], 'SearchRatio'] = matched_str["Ratio"]
    finalResult = filtered_df.values.tolist()            
    return finalResult

def searchHeight(dataList:any,filterData:any):
    finalResult = []
    unique_values = dataList["HeightName"].unique()
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
    filtered_df = dataList[dataList['HeightName'].isin(UniquefinalMatched_results)]
    for matched_str in matched_results_with_Percent:
      filtered_df.loc[filtered_df['HeightName']== matched_str["Name"], 'SearchRatio'] = matched_str["Ratio"]
    finalResult = filtered_df.values.tolist()            
    return finalResult

def searchEyeColor(dataList:any,filterData:any):
    finalResult = []
    unique_values = dataList["EyesName"].unique()
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
    filtered_df = dataList[dataList['EyesName'].isin(UniquefinalMatched_results)]
    for matched_str in matched_results_with_Percent:
      filtered_df.loc[filtered_df['EyesName']== matched_str["Name"], 'SearchRatio'] = matched_str["Ratio"]
    finalResult = filtered_df.values.tolist()            
    return finalResult

def searchHairColor(dataList:any,filterData:any):
    finalResult = []
    unique_values = dataList["HairName"].unique()
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
    filtered_df = dataList[dataList['HairName'].isin(UniquefinalMatched_results)]
    for matched_str in matched_results_with_Percent:
      filtered_df.loc[filtered_df['HairName']== matched_str["Name"], 'SearchRatio'] = matched_str["Ratio"]
    finalResult = filtered_df.values.tolist()            
    return finalResult
