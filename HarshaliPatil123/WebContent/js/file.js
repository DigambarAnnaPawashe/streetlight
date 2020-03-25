 
/*registration.jsp and regdpsuperadmin.jsp for admin and superadmin adddp*/
function checkExist(){
                var xmlhttp = new XMLHttpRequest();
                var dpid = document.forms["form1"]["dpid"].value;
               
                var url = "exist.jsp?dpid=" + dpid;
                xmlhttp.onreadystatechange = function(){
                    if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
                        if(xmlhttp.responseText == "\n\n\n\n\nDP Id already exists...")
                            document.getElementById("isE").style.color = "red";
                        else
                            document.getElementById("isE").style.color = "green";
                        document.getElementById("isE").innerHTML = xmlhttp.responseText;
                    }
                    
                };
                try{
                xmlhttp.open("GET",url,true);
                xmlhttp.send();
            }
                catch(e){alert("unable to connect to server");
            }
            }

function checkExist1(){
    var xmlhttp = new XMLHttpRequest();
    
    var phone = document.forms["form1"]["phone"].value;
    var url = "exist.jsp?phone="+ phone;
    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            if(xmlhttp.responseText == "\n\n\n\n\nPhone Number already exists...")
                document.getElementById("isEF").style.color = "red";
            else
                document.getElementById("isEF").style.color = "green";
            document.getElementById("isEF").innerHTML = xmlhttp.responseText;
        }
        
    };
    try{
    xmlhttp.open("GET",url,true);
    xmlhttp.send();
}
    catch(e){alert("unable to connect to server");
}
}
/*admin_registration phone-checkExist2() email-checkExist3() ADMIN*/
function checkExist2(){
    var xmlhttp = new XMLHttpRequest();
    
    var admin_phone = document.forms["form1"]["admin_phone"].value;
    var url = "exist.jsp?admin_phone="+ admin_phone;
    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            if(xmlhttp.responseText == "\n\n\n\n\nPhone Number already exists...")
                document.getElementById("isE1").style.color = "red";
            else
                document.getElementById("isE1").style.color = "green";
            document.getElementById("isE1").innerHTML = xmlhttp.responseText;
        }
        
    };
    try{
    xmlhttp.open("GET",url,true);
    xmlhttp.send();
}
    catch(e){alert("unable to connect to server");
}
}

function checkExist3(){
    var xmlhttp = new XMLHttpRequest();
    
    var admin_email = document.forms["form1"]["admin_email"].value;
    var url = "exist.jsp?admin_email="+ admin_email;
    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            if(xmlhttp.responseText == "\n\n\n\n\nEmail Id already exists...")
                document.getElementById("isE2").style.color = "red";
            else
                document.getElementById("isE2").style.color = "green";
            document.getElementById("isE2").innerHTML = xmlhttp.responseText;
        }
        
    };
    try{
    xmlhttp.open("GET",url,true);
    xmlhttp.send();
}
    catch(e){alert("unable to connect to server");
}
}

/*user_registration.jsp and user_registration_admin.jsp phone-checkExist4() email-checkExist5() ADMIN & SUPERADMIN*/
function checkExist4(){
    var xmlhttp = new XMLHttpRequest();
    
    var user_phone = document.forms["form1"]["user_phone"].value;
    var url = "exist.jsp?user_phone="+ user_phone;
    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            if(xmlhttp.responseText == "\n\n\n\n\nPhone Number already exists...")
                document.getElementById("isE3").style.color = "red";
            else
                document.getElementById("isE3").style.color = "green";
            document.getElementById("isE3").innerHTML = xmlhttp.responseText;
        }
        
    };
    try{
    xmlhttp.open("GET",url,true);
    xmlhttp.send();
}
    catch(e){alert("unable to connect to server");
}
}

function checkExist5(){
    var xmlhttp = new XMLHttpRequest();
    
    var user_email = document.forms["form1"]["user_email"].value;
    var url = "exist.jsp?user_email="+ user_email;
    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            if(xmlhttp.responseText == "\n\n\n\n\nEmaidID already exists...")
                document.getElementById("isE4").style.color = "red";
            else
                document.getElementById("isE4").style.color = "green";
            document.getElementById("isE4").innerHTML = xmlhttp.responseText;
        }
        
    };
    try{
    xmlhttp.open("GET",url,true);
    xmlhttp.send();
}
    catch(e){alert("unable to connect to server");
}
}


