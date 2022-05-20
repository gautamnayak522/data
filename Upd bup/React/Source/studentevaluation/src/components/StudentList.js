import React, { useState } from "react";
import { useParams } from "react-router-dom";

export default function StudentList() {
  let params = useParams();
  let studentlist = [
    {
      id: "1",
      Name: "ABC",
    },
    {
      id: "2",
      Name: "XYZ",
    },
    {
      id: "3",
      Name: "PQR",
    },
  ];
  let standardlist = [
    {
      Standard: "1",
      Name: "",
      units: [
        {
          Unit: "",
        },
        { Unit: "" },
      ],
    },
    {
      Standard: "2",
      Name: "",
      units: [
        {
          Unit: "",
        },
        { Unit: "" },
        { Unit: "" },
        { Unit: "" },
      ],
    },
    {
      Standard: "3",
      Name: "",
      units: [
        {
          Unit: "",
        },
        { Unit: "" },
        { Unit: "" },
        { Unit: "" },
        { Unit: "" },
        { Unit: "" },
      ],
    },
  ];

  
  let finallist = standardlist.filter((p) => p.Standard == params.std);
  const[Name,setName]=useState('');
  function submitdata(){
      alert("ok");
      
  }
  return (
    <div>
      <h1>StudentList</h1>
      <h3>Standard : {params.std}</h3>
      {JSON.stringify(standardlist)}

      <hr />
      {JSON.stringify(studentlist)}
      <hr />
      {JSON.stringify(finallist)}
      <hr />
     
      <div>
        <label for="select">Select Student : </label>
        <select onChange={(e)=>setName(e.target.value)}>
          <option value="">Select</option>
          {studentlist.map((listitem) => (
            <option value={listitem.Name}>{listitem.Name}</option>
          ))}
        </select>
        {Name}

            <button onClick={submitdata}>
                Submit
            </button>
      </div>
    </div>
  );
}
