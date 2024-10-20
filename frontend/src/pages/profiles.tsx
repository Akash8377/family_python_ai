import { useState } from "react";
import { ProfilesModels } from '../models/models';
import {saveProfiles} from '../api/api';


export default function Profiles() {
    const profiledata : ProfilesModels = {FirstName:'',LastName:'',Email:'',Phone:'',ApplicationType:''};       
    const [userProfile,setuserProfile] = useState(profiledata);
    const abortController = new AbortController();
    const handleChange = (event:any) => {
        const name = event.target.name;
        const value = event.target.value;
        setuserProfile(values => ({...values, [name]: value}))
      }
    
    async function addProfileData() { 
        try {
            await saveProfiles(userProfile, abortController.signal).then((data) => {
                let userdata = data;
                console.log(userdata);
                if(userdata)
                {
                    alert("data saved successfully.")
                }
            });
        }
        catch (e) {
            console.log(e)
        }



        // alert(userProfile.name+' ,'+userProfile.email+', '+userProfile.phoneNumber);
    }
    return (
        <>
        <h1>Profile</h1>
        </>
    );
}