var dimCap = true;
var sl = document.getElementById("bar");
sl.addEventListener("click", sc, false);
var ind = document.getElementById("ind");
ind.addEventListener("click", indLights, false);
var sn = document.getElementById("saveName");
sn.addEventListener("click", saveName, false);
var scanbt = document.getElementById("scan");
scanbt.addEventListener("click", scan, false);
var lm = document.getElementById("lightMem");
lm.addEventListener("click", lightMem, false);
var ld = document.getElementById("lightDim");
ld.addEventListener("click", lightDim, false);
var statip = document.getElementById("staticIP");
statip.addEventListener("click", staticIP, false);


var ip = document.getElementById("ip");	
var sn = document.getElementById("sn");	
var gw = document.getElementById("gw");	

var pot = document.getElementById("pot");
var percOn = document.getElementById("percOn");
function sc(e) {
    var parentPosition = getPosition(e.currentTarget);
    var xPosition = e.clientX - parentPosition.x;
    var perc = Math.round(xPosition / e.currentTarget.offsetWidth * 100);
    if (dimCap == true)
        setLight(perc);
}
function setLight(perc) {
    pot.innerHTML = perc;
    percOn.style.width = perc + "%";
    sendWithoutCaring("setLights.lua?val=" + Math.round(perc / 100 * 1023));
    //alert(Math.round(perc / 100 * 1023)); //the value to send to the light
}
function getPosition(element) {
    var xPosition = 0;
    var yPosition = 0;

    while (element) {
        xPosition += (element.offsetLeft - element.scrollLeft + element.clientLeft);
        yPosition += (element.offsetTop - element.scrollTop + element.clientTop);
        element = element.offsetParent;
    }
    return { x: xPosition, y: yPosition };
}
function flipCheck(e) {
    if (e.currentTarget.firstChild.className.indexOf('selected') > -1) {
        e.currentTarget.firstChild.className = 'check';
        return false;
    }
    else {
        e.currentTarget.firstChild.className = 'check selected';
        return true;
    }
}
function indLights(e) {
    if (flipCheck(e) == true)
        sendWithoutCaring("setIndicator.lua?state=on");
    else
        sendWithoutCaring("setIndicator.lua?state=off");
}

function lightDim(e) {
    if (flipCheck(e) == true) {
        dimCap = true;
		pot.parentNode.style.textAlign = "right";
		sl.style.display = "block";
        sendWithoutCaring("setDim.lua?val=1");
    }
    else {
        dimCap = false;
		pot.parentNode.style.textAlign = "center";
		sl.style.display = "none";
        sendWithoutCaring("setDim.lua?val=0");
    }
}

function lightMem(e) {
    if (flipCheck(e) == true)
        //sendWithoutCaring("setIndicator.lua?state=on");
        sendWithoutCaring("setACOn.lua?val=1");
    else
        sendWithoutCaring("setACOn.lua?val=0");
}
function staticIP(e) {
    if (flipCheck(e) == true)
	{
		ip.parentNode.parentNode.style.display = "block";
		gw.parentNode.parentNode.style.display = "block";
		sn.parentNode.parentNode.style.display = "block";
	}
    else
	{
		ip.parentNode.parentNode.style.display = "none";
		gw.parentNode.parentNode.style.display = "none";
		sn.parentNode.parentNode.style.display = "none";
	}
}
function saveName(e) {
    sendWithoutCaring("setName.lua?val=" + document.getElementById("name").value);
	document.getElementById("LightName").innerHTML = document.getElementById("name").value;
    e.currentTarget.style.width = e.currentTarget.offsetWidth;
    e.currentTarget.style.color = "#aaa";
    e.currentTarget.innerHTML = "&nbsp; saved &nbsp;";
    setTimeout(function () { sn.innerHTML = "save name"; sn.style.color = "#fff";}, 3000);
	setTimeout(function () { getState("getState.lua"); }, 1000);
}
function scan(e) {
e.currentTarget.innerHTML = "Scanning ...";
e.currentTarget.style.color = "#aaa";
siteSurvey();
}
function siteSurvey()
{
	alert("Scansssning");
	scanbt.innerHTML = "updated!";
	var nl = document.getElementById("netList");
	nl.length = 1;
		
	var aps = "mekanism\nSoundlink\nTops";
	var apl = aps.split("\n");
	for (i = 0; i < apl.length; i++)
	{
		//nl.options[i+1] = apl[i];
		var option = document.createElement("option");
		option.text = apl[i];
		nl.add(option);
	}
	
    setTimeout(function () { scanbt.innerHTML = "scan"; scanbt.style.color = "#fff";}, 3000);
}
function sendWithoutCaring(url) {
    var xmlhttp;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}
function getState(url) {
    var xmlhttp;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
	xmlhttp.onreadystatechange=function()
	{
	if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	cap=xmlhttp.responseText; 
			parseResp(cap);
	}
	}
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}
	function parseResp(cap)
	{
	cap = "1\n1\nGarssage\n133\n0\n192.168.1.36\n255.255.255.0\n192.168.1.1";
			var vals = cap.split("\n");
			if (vals[0] == "1")
				lm.firstChild.className = "check selected";
			else
				lm.firstChild.className = "check";
			if (vals[1] == "1")
			{
				ld.firstChild.className = "check selected";
				dimCap = true;
				pot.parentNode.style.textAlign = "right";
				sl.style.display = "block";
			}
			else
			{
				ld.firstChild.className = "check";
				dimCap = false;
				pot.parentNode.style.textAlign = "center";
				sl.style.display = "none";
			}
		
			document.getElementById("LightName").innerHTML = vals[2];
			document.getElementById("name").value = vals[2];
			var pc = Math.round(vals[3] / 1023 * 100);
			pot.innerHTML = pc;
			percOn.style.width = pc + "%";
			
			if (vals[4] == "1")
				statip.firstChild.className = "check selected";
			else
			{
				statip.firstChild.className = "check";
				ip.parentNode.parentNode.style.display = "none";
				gw.parentNode.parentNode.style.display = "none";
				sn.parentNode.parentNode.style.display = "none";
			}
			ip.value = vals[5];	
			sn.value = vals[6];	
			gw.value = vals[7];	
			for (i = 0; i < vals.length; i++)
			{
			//alert(vals[i] + i);
			}
			}
			parseResp("");
			getState("getState.lua");