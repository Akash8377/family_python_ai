import copy
import json
import os
import logging
import uuid
import httpx
import asyncio
import pyodbc
from quart import (
    Blueprint,
    Quart,
    jsonify,
    make_response,
    request,
    send_from_directory,
    render_template,
    current_app,
)

from quart import (
    Blueprint,
    Quart,
    jsonify,
    make_response,
    request,
    send_from_directory,
    render_template,
    current_app,
)
from quart_cors import cors

from backend.donorSearch.searchDoner import searchFromList
from backend.sqldb import executeSQLQuery, executeStoredProcForSave, executeStoredProcForSelectWithParams, executeStoredProcForSelectWithoutParam


bp = Blueprint("routes", __name__, static_folder="static", template_folder="static")

def create_app():
    app = Quart(__name__)
    app.register_blueprint(bp)
    app.config["TEMPLATES_AUTO_RELOAD"] = True
    app = cors(app, allow_origin="*")
    return app

@bp.route("/")
async def test():
    return "RUN API"

@bp.route("/index")
async def index():
    return await render_template(
        "index.html",
        title="",
        favicon=""
    )

@bp.route("/logo192.png")
async def favicon():
    return await bp.send_static_file("logo192.png")

@bp.route("/manifest.json")
async def manifest():
    return await bp.send_static_file("manifest.json")


@bp.route("/static/js/<path:path>")
async def assets(path):
    return await send_from_directory("/static/static/js", path)

DEBUG = os.environ.get("DEBUG", "true")
if DEBUG.lower() == "true":
    logging.basicConfig(level=logging.DEBUG)

MS_DEFENDER_ENABLED = os.environ.get("MS_DEFENDER_ENABLED", "true").lower() == "true"


@bp.route("/api/getdata")
async def getData():
    data = {"language":"Python","framework":"Flask","website":"Scotch","version_info":{"python":"3.9.0","flask":"1.1.2"},"examples":["query","form","json"],"boolean_test":"true"}
    return (data)


@bp.route("/api/saveProfile",methods=["POST"])
async def saveProfile():
    if not request.is_json:
        return jsonify({"error": "request must be json"}), 415
    request_json = await request.get_json()
    userid = str(uuid.uuid1()) 
    applicationType='1'
    FirstName = request_json['profilesModels']['FirstName']
    LastName= request_json['profilesModels']['LastName']
    Email= request_json['profilesModels']['Email']   
    Phone = request_json['profilesModels']['Phone']
    data =  executeStoredProcForSave("exec InsertPersonData ?,?,?,?,?,? ",[0,userid,applicationType,FirstName,LastName,Email])
    response = any
    for row in data:
        response =row[0]  
    return json.dumps(response)


@bp.route("/api/fetchAttributes",methods=["GET"])
async def fetchAttributes(): 
    AttributeTypeId = request.args.get('AttributeTypeId')
    data =  executeStoredProcForSelectWithoutParam(f"exec FetchAttributes {AttributeTypeId}");  
    # Convert to a list of dictionaries
    result = [{"Id": row[0], "AttributeTypeId": row[1], "Name": row[2]} for row in data]
    return json.dumps(result)


@bp.route("/api/MedicalCondition",methods=["GET"])
async def fetchMedicalCondition(): 
    Id = request.args.get('Id')
    data =  executeStoredProcForSelectWithoutParam(f"exec USP_getMedicalCondition {Id}");  
    # Convert to a list of dictionaries
    result = [{"Id": row[0], "Name": row[1]} for row in data]
    return json.dumps(result)



@bp.route("/api/HarmonalProfile",methods=["GET"])
async def fetchHarmonalProfile(): 
    Id = request.args.get('Id')
    data =  executeStoredProcForSelectWithoutParam(f"exec USP_getHarmonalProfile {Id}");  
    # Convert to a list of dictionaries
    result = [{"Id": row[0], "Name": row[1]} for row in data]
    return json.dumps(result)

@bp.route("/api/EnergyLevel",methods=["GET"])
async def fetchEnergyLevel(): 
    Id = request.args.get('Id')
    data =  executeStoredProcForSelectWithoutParam(f"exec USP_getEnergyLevel {Id}");  
    # Convert to a list of dictionaries
    result = [{"Id": row[0], "Name": row[1]} for row in data]
    return json.dumps(result)



@bp.route("/api/searchDetails",methods=["POST"])
async def searchDetails():
    if not request.is_json:
        return jsonify({"error": "request must be json"}), 415
    request_json = await request.get_json()    
    rows =  executeSQLQuery(f"exec Usp_searchDetails") 
    records =  searchFromList(rows,request_json)
    return records.to_json(orient='records')

app = create_app()  
app.run(host='0.0.0.0', port=5000)
# app.run()