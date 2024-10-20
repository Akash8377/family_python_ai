from typing import Any
import pandas as pd
import pyodbc
import logging
SERVER = 'Ashish\SQLEXPRESS'
DATABASE = 'GenAI'
# USERNAME = '<username>'
# PASSWORD = '<password>'
# connectionString = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={SERVER};DATABASE={DATABASE};UID={USERNAME};PWD={PASSWORD}'
connectionString = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={SERVER};DATABASE={DATABASE};Trusted_Connection=yes;'
def executeSQLQuery(query: str):
   try :
        cnxn = pyodbc.connect(connectionString)
        data = pd.read_sql(query, cnxn)       
        #jsondata = data.to_dict(orient='records')
        # for row in rows:
        #     print(row)
    
   except Exception as e:
        logging.exception(e)
   finally:       
       cnxn.close()
       return data
   
def executeStoredProcForSave(query: str, queryparams: Any):
   try :
        cnxn = pyodbc.connect(connectionString)
        cursor = cnxn.cursor()
        cursor.execute(query,queryparams)
        rows= cursor.fetchall()
        cnxn.commit()
   except Exception as e:
        logging.exception(e)
   finally:
       cursor.close()
       cnxn.close()
       return rows
   

def executeStoredProcForSelectWithoutParam(query: str):
   try :
        cnxn = pyodbc.connect(connectionString)
        cursor = cnxn.cursor()
        cursor.execute(query)
        rows= cursor.fetchall()       
   except Exception as e:
        logging.exception(e)
   finally:
       cursor.close()
       cnxn.close()
       return rows
   
def executeStoredProcForSelectWithParams(query: str,queryparams: Any):
     try :
          cnxn = pyodbc.connect(connectionString)
          cursor = cnxn.cursor()
          cursor.execute(query,queryparams)
          rows= cursor.fetchall()       
     except Exception as e:
          logging.exception(e)
     finally:
          cursor.close()
          cnxn.close()
          return rows