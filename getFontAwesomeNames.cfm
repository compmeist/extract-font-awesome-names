 <!---  
 extracts font awesome symbol names from font-awesome.css
 --->
 <cfscript>
  function extractLastB4D(s) { 
    var aArray = listToArray(s,'.fa-',false,true);
    var rStr = ''; 
    var l = arrayLen(aArray);
    if (l > 0) rStr = 'fa-' & aArray[l];
    if (len(rStr) > 40) rStr = '';  // shouldn't be longer than 40 chars
    return rStr;
  }
</cfscript>

<cfset names = arrayNew(1)>  

<cfset fromName = expandPath(".\" ) & 'font-awesome.css'>

<cfif fileExists(fromName)>
  <cffile action="read" file="#fromName#" variable="nl">
  <cfset nwk = listToarray(nl,':before',false,true)>
  <cfloop from="1" to="#arrayLen(nwk)#" index="i">
     <cfset curStr = extractLastB4D(nwk[i])>
     <cfif len(curStr) gt 3>
        <cfset result = arrayAppend(names,curStr)>
     </cfif>
  </cfloop>
</cfif>
<cfcontent reset="yes" type="application/json"><cfoutput>#serializeJSON(names)#</cfoutput>
