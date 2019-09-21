  // This is a closure function https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-closure-b2f0d2152b36
(   function() {
  var name=document.getElementById("name");
  var email=document.getElementById("email");
  var phnno=document.getElementById("phno");
  var dept1 = document.getElementById("dept1");
  var dept2=document.getElementById("dept2");
  var initialize = function() {
    var button=document.querySelector(".button");
    button.addEventListener("click",onSubmit);
    dept1.addEventListener("change",disableDuplicateSecondaryDepartment);
  };

  var disableDuplicateSecondaryDepartment = function(event) {
      for(var k=0;k<4;k++)
    {
      if(dept2.options[k].value===dept1.value)
      {
        dept2.options[k].disabled=true;
        }
      else
      {
        dept2.options[k].disabled=false;
      }
      dept2.selectedIndex=1;
      if(dept1.selectedIndex===1)
      {
        dept2.selectedIndex=2;
      }
    }
  }

  var constructData = function() {
    var data = {};
    data[name.name]= name.value;
    data[phno.name]= phno.value;
    data[email.name]= email.value;
    data[dept1.name] = dept1.value;
    data[dept2.name] = dept2.value;
    return data;
  }

  var validateResults = function(data) {
    var isValid = true;
    const regexp=/^([a-zA-Z0-9\.]+)(@college.edu)$/;
    if(data[name.name].length>100){
    isValid =false;}
    else if(data[phno.name].length>10){
    isValid=false;}
    else if(!regexp.test(data[email.name])){
    isValid=false;}
    else if(dept1.value===dept2.value){
      isValid=false;
    }
    else{
    isValid=true;
    }
    console.log(regexp.test(data[email.value]));
    return isValid;
  };

  var onSubmit = function(event) {
    
    event.preventDefault();
    var data = constructData();

    if (validateResults(data)) {
      printResults(data);
      console.log(data);
    } else {
      var resultsDiv = document.getElementById("results");
      resultsDiv.innerHTML = '';
      resultsDiv.classList.add("hide");
    }
  };

  var printResults = function(data) {
    
    var constructElement = function([key, value]) {
      return `<p class='result-item'>${key}: ${value}</p>`;
    };

    var resultHtml = (Object.entries(data) || []).reduce(function(innerHtml, keyValuePair) {
    
      debugger
      return innerHtml + constructElement(keyValuePair);
    }, '');
    var resultsDiv = document.getElementById("results");
    resultsDiv.innerHTML = resultHtml;
    resultsDiv.classList.remove("hide");
  };

  /*
    Initialize the javascript functions only after the html DOM content has loaded.
    This is to ensure that the elements are present in the DOM before binding any event listeners to them.
  */
  document.addEventListener('DOMContentLoaded', initialize);
})();
