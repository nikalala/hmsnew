(function($){
/**
 * jqGrid English Translation
 * Tony Tomov tony@trirand.com
 * http://trirand.com/blog/ 
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
**/
$.jgrid = $.jgrid || {};
$.extend($.jgrid,{
	defaults : {
		recordtext: "ნახვა {0}-{1} სულ {2}-დან",
		emptyrecords: "ჩანაწერი არ არის",
		loadtext: "ჩატვირთვა...",
		pgtext : "გვერდი {0} {1}-დან"
	},
	search : {
		caption: "ძიება...",
		Find: "მონახვა",
		Reset: "გაუქმება",
		odata : ["ტოლია","არაა ტოლი","ნაკლებია","ნაკლებია ან ტოლია","მეტია","მეტია ან ტოლია","იწყება","არ იწყება","შედის","არ შედის","მთავრდება","არ მთავრდება","შეიცავს","არ შეიცავს"],
		groupOps: [	{ op: "AND", text: "ყველა" },	{ op: "OR",  text: "ნებისმიერი" }	],
		matchText: " ემთხვევა",
		rulesText: " წესები"
	},
	edit : {
		addCaption: "ჩანაწერის დამატება",
		editCaption: "ჩანაწერის რედაქტირება",
		bSubmit: "შენახვა",
		bCancel: "გაუქმება",
		bClose: "დახურვა",
		saveData: "მონაცემები შეიცვალა! შევინახოთ მონაცემები?",
		bYes : "კი",
		bNo : "არა",
		bExit : "გაუქმება",
		msg: {
			required:"ველი არის აუცილებელი",
			number:"შეიყვანეთ რიცხვი",
			minValue:"მნიშვნელობა უნდა იყოს მეტი ან ტოლი ",
			maxValue:"მნიშვნელობა უნდა იყოს ნაკლები ან ტოლი",
			email: "ელფოსტის არასწორი მნიშვნელობა",
			integer: "შეიყვანეთ მთელი რიცხვი",
			date: "შეიყვანეთ სწორი თარიღი",
			url: "არასწორი ბმული. აუცილებელია პრეფიქსი ('http://' ან 'https://')",
			nodefined : " განუსაზღვრელია!",
			novalue : " return value is required!",
			customarray : "Custom function should return array!",
			customfcheck : "Custom function should be present in case of custom checking!"
			
		}
	},
	view : {
		caption: "ჩანაწერების ნახვა",
		bClose: "დახურვა"
	},
	del : {
		caption: "წაშლა",
		msg: "წაიშალოს არჩეული ჩანაწერ(ებ)ი?",
		bSubmit: "წაშლა",
		bCancel: "გაუქმება"
	},
	nav : {
		edittext: "",
		edittitle: "არჩეული ჩანაწერის რედაქტირება",
		addtext:"",
		addtitle: "ახალი ჩანაწერის დამატება",
		deltext: "",
		deltitle: "არჩეული ჩანაწერის წაშლა",
		searchtext: "",
		searchtitle: "ჩანაწერის მონახვა",
		refreshtext: "",
		refreshtitle: "ცხრილის განახლება",
		alertcap: "გაფრთხილება",
		alerttext: "აირჩიეთ ჩანაწერი",
		viewtext: "",
		viewtitle: "არჩეული ჩანაწერის ნახვა"
	},
	col : {
		caption: "სვეტების ჩვენება/დამალვა",
		bSubmit: "შენახვა",
		bCancel: "გაუქმება"
	},
	errors : {
		errcap : "შეცდომა",
		nourl : "მისამარი არ არის გასაზღვრული",
		norecords: "დასამუშავებელი ჩანაწერები არაა",
		model : "Length of colNames <> colModel!"
	},
	formatter : {
		integer : {thousandsSeparator: ",", defaultValue: '0'},
		number : {decimalSeparator:".", thousandsSeparator: ",", decimalPlaces: 2, defaultValue: '0.00'},
		currency : {decimalSeparator:".", thousandsSeparator: ",", decimalPlaces: 2, prefix: "", suffix:"", defaultValue: '0.00'},
		date : {
			dayNames:   [
				"კვ","ორ","სა","ოთ","ხუ","პა","შა","კვირა","ორშაბათი","სამშაბათი","ოთხშაბათი","ხუთშაბათი","პარასკევი","შაბათი"
			],
			monthNames: [
				"იან","თებ","მარ","აპრ","მაი","ივნ","ივლ","აგვ","სექ","ოქტ","ნოე","დეკ","იანვარი","თებერვალი","მარტი","აპრილი","მაისი","ივნისი","ივლისი","აგვისტო","სექტემბერი","ოქტომბერი","ნოემბერი","დეკემბერი"
			],
			AmPm : ["am","pm","AM","PM"],
			S: function (j) {return j < 11 || j > 13 ? ['st', 'nd', 'rd', 'th'][Math.min((j - 1) % 10, 3)] : 'th';},
			srcformat: 'Y-m-d',
			newformat: 'n/j/Y',
			masks : {
				// see http://php.net/manual/en/function.date.php for PHP format used in jqGrid
				// and see http://docs.jquery.com/UI/Datepicker/formatDate
				// and https://github.com/jquery/globalize#dates for alternative formats used frequently
				// one can find on https://github.com/jquery/globalize/tree/master/lib/cultures many
				// information about date, time, numbers and currency formats used in different countries
				// one should just convert the information in PHP format
				ISO8601Long:"Y-m-d H:i:s",
				ISO8601Short:"Y-m-d",
				// short date:
				//    n - Numeric representation of a month, without leading zeros
				//    j - Day of the month without leading zeros
				//    Y - A full numeric representation of a year, 4 digits
				// example: 3/1/2012 which means 1 March 2012
				ShortDate: "n/j/Y", // in jQuery UI Datepicker: "M/d/yyyy"
				// long date:
				//    l - A full textual representation of the day of the week
				//    F - A full textual representation of a month
				//    d - Day of the month, 2 digits with leading zeros
				//    Y - A full numeric representation of a year, 4 digits
				LongDate: "l, F d, Y", // in jQuery UI Datepicker: "dddd, MMMM dd, yyyy"
				// long date with long time:
				//    l - A full textual representation of the day of the week
				//    F - A full textual representation of a month
				//    d - Day of the month, 2 digits with leading zeros
				//    Y - A full numeric representation of a year, 4 digits
				//    g - 12-hour format of an hour without leading zeros
				//    i - Minutes with leading zeros
				//    s - Seconds, with leading zeros
				//    A - Uppercase Ante meridiem and Post meridiem (AM or PM)
				FullDateTime: "l, F d, Y g:i:s A", // in jQuery UI Datepicker: "dddd, MMMM dd, yyyy h:mm:ss tt"
				// month day:
				//    F - A full textual representation of a month
				//    d - Day of the month, 2 digits with leading zeros
				MonthDay: "F d", // in jQuery UI Datepicker: "MMMM dd"
				// short time (without seconds)
				//    g - 12-hour format of an hour without leading zeros
				//    i - Minutes with leading zeros
				//    A - Uppercase Ante meridiem and Post meridiem (AM or PM)
				ShortTime: "g:i A", // in jQuery UI Datepicker: "h:mm tt"
				// long time (with seconds)
				//    g - 12-hour format of an hour without leading zeros
				//    i - Minutes with leading zeros
				//    s - Seconds, with leading zeros
				//    A - Uppercase Ante meridiem and Post meridiem (AM or PM)
				LongTime: "g:i:s A", // in jQuery UI Datepicker: "h:mm:ss tt"
				SortableDateTime: "Y-m-d\\TH:i:s",
				UniversalSortableDateTime: "Y-m-d H:i:sO",
				// month with year
				//    Y - A full numeric representation of a year, 4 digits
				//    F - A full textual representation of a month
				YearMonth: "F, Y" // in jQuery UI Datepicker: "MMMM, yyyy"
			},
			reformatAfterEdit : false
		},
		baseLinkUrl: '',
		showAction: '',
		target: '',
		checkbox : {disabled:true},
		idName : 'id'
	}
});
})(jQuery);
