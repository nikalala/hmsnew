package com.mysoft;


import com.mysoft.hms.HousekeepingstatusBean;

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
}
