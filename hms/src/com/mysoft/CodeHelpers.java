package com.mysoft;


import com.mysoft.hms.HousekeepingstatusBean;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by TuraMan on 12/4/2014.
 */

public class CodeHelpers {

    public static boolean isNullOrEmpty(String object) {
        return object == null || object.length() == 0 ? true : false;
    }

    public static String ifIsNullOrEmptyReturnEmptryString(String object) {
        return object == null || object.length() == 0 ? "" : object;
    }

    public static String getColorByRoomStatus(int roomStatus, HousekeepingstatusBean[] arr){

        for(HousekeepingstatusBean item : arr)
        {
            if(item.getHousekeepingstatusid().equals(roomStatus))
            {
                return item.getColor();
            }
        }
        return "";
    }

    public static Date getNextDay(Date date) {

        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        cal.add(Calendar.DATE, 1);

        return cal.getTime();

    }

    public static String getNextDay(String curDate, String dtFormat) {
        String nextDate = "";
        try {
            Calendar today = Calendar.getInstance();
            DateFormat format = new SimpleDateFormat(dtFormat);
            Date date = format.parse(curDate);
            today.setTime(date);
            today.add(Calendar.DAY_OF_YEAR, 1);
            nextDate = format.format(today.getTime());
        } catch (Exception e) {
            return nextDate;
        }
        return nextDate;
    }
}
