function Set_Short_Time()
{
	if(!document.getElementById('time_Id'))	return;

	var Hours;
	var Mins;
	var Time;

	Stamp = new Date();

	Hours = Stamp.getHours();

	if (Hours >= 12)
		Time = " PM";
	else
		Time = " AM";

	if (Hours > 12)
		Hours -= 12;
	
	if (Hours == 0)
		Hours = 12;
	
	Mins = Stamp.getMinutes();

	if (Mins < 10)
		Mins = "0" + Mins;

	document.getElementById('time_Id').innerHTML = ("&nbsp;" + Hours + ":" + Mins);
	
	//document.getElementById('time_Id').innerHTML = ("&nbsp;" + Hours + ":" + Mins + Time);
}

setInterval('Set_Short_Time()',1000);

function Set_Todays_Date()
{
	var d_names = new Array("Sunday", "Monday", "Tuesday","Wednesday", "Thursday", "Friday", "Saturday");
								
	var m_names = new Array("January", "February", "March", 
	"April", "May", "June", "July", "August", "September", 
	"October", "November", "December");
	
	var d = new Date();
	var curr_day = d.getDay();
	var curr_date = d.getDate();
	var sup = "";
	if (curr_date == 1 || curr_date == 21 || curr_date ==31)
	   {
	   sup = "st";
	   }
	else if (curr_date == 2 || curr_date == 22)
	   {
	   sup = "nd";
	   }
	else if (curr_date == 3 || curr_date == 23)
	   {
	   sup = "rd";
	   }
	else
	   {
	   sup = "th";
	   }
	var curr_month = d.getMonth();
	var curr_year = d.getFullYear();
	
	//document.write(d_names[curr_day] + ", " + curr_date +  "<sup>"+ sup +"</sup>"+ " " + m_names[curr_month] + " " + curr_year);  //Eg. Saturday, 31st July 2010
	
	document.write( m_names[curr_month] + " "+ curr_date + "<sup>"+ sup +"</sup>"+ " " + curr_year + ",<br> " +d_names[curr_day]);
}