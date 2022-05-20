import React, { useState } from "react";
import { Link, Outlet } from "react-router-dom";
export default function StandardList() {
  let stdlist = [
    {
      Standard: "1",
    },
    {
      Standard: "2",
    },
    {
      Standard: "3",
    },
  ];
  const listItems = stdlist.map((number) => <option>{number.Standard}</option>);
  const[selected,setStandard]=useState();
  


  return (
    <div>
      {JSON.stringify(stdlist)}
      <h1>StandardList</h1>

       <Link to={`./studentlist/${selected}`}>
      <select class="w-25" onChange={(e)=>setStandard(e.target.value)}>
        <option value="">select</option>
        {listItems}
      </select>
      </Link> <br />
      {selected}
      <Outlet></Outlet>
    </div>
  );
}
