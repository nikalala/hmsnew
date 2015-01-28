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

    public static String ifIsNullOrEmptyReturnEmptryString(String object) {
        return object == null || object.length() == 0 ? "" : object;
    }

    public static String getColorByRoomStatus(int roomStatus, HousekeepingstatusBean[] arr) {

        for (HousekeepingstatusBean item : arr) {
            if (item.getHousekeepingstatusid().equals(roomStatus)) {
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

    public static String getCurrentHouseKeepingStatus(int hsid,HousekeepingstatusBean[] arr){
        for (HousekeepingstatusBean item : arr) {
            if (item.getHousekeepingstatusid().equals(hsid)) {
                return item.getName();
            }
        }
        return "";
    }

    /**
     * Return a substring of the source string up until the first
     * occurrence of the specified character
     *
     * @param source - The source string to operate on
     * @param c      - Character to search for
     * @return - Substring of the original string up until the first occurance of c
     */
    public static String substringUpToFirstOccurance(String source, char c) {
        return !isNullOrEmpty(source) && !Character.isWhitespace(c) ?
                source.substring(0, source.indexOf(c)) : null;
    }

    /**
     * Return a substring of the source string after the first
     * occurrence of the specified character
     *
     * @param source - The source string to operate on
     * @param c      - Character to search for
     * @return - Substring of the original string after the first occurrence of c
     */
    public static String substringFromFirstOccurance(String source, char c) {
        return !isNullOrEmpty(source) && !Character.isWhitespace(c) ?
                source.substring(source.indexOf(c), source.length() - 1) : null;
    }

    /**
     * Return a substring of the source string up until the last
     * occurrence of the specified character
     *
     * @param source - The source string to operate on
     * @param c      - Character to search for
     * @return - Substring of the original string up until the last occurrence of c
     */
    public static String substringUpToLastOccurance(String source, char c) {
        return !isNullOrEmpty(source) && !Character.isWhitespace(c) ?
                source.substring(0, source.lastIndexOf(c)) : null;
    }

    /**
     * Return a substring of the source string after the last
     * occurrence of the specified character
     *
     * @param source - The source string to operate on
     * @param c      - Character to search for
     * @return - Substring of the original string after the last occurrence of c
     */
    public static String substringFromLastOccurance(String source, char c) {
        return !isNullOrEmpty(source) && !Character.isWhitespace(c) ?
                source.substring(source.lastIndexOf(c), source.length() - 1) : null;
    }

    /**
     * Return a substring of the source string after the first occurrence
     * of the search String
     *
     * @param source       - The source string to operate on
     * @param searchString - String to search for
     * @return - Substring of the original string after the first occurrence of searchString
     */
    public static String substringAfterSearchString(String source, String searchString) {
        if (!isNullOrEmpty(source) && !isNullOrEmpty(searchString)) {
            int index = source.indexOf(searchString);
            return index > -1 ? source.substring(index + searchString.length()) : null;
        } else {
            return null;
        }
    }

    /**
     * @param param - The source string to operate on
     * @return - Returns True If param is null or param characters length == 0
     */
    public static boolean isNullOrEmpty(String param) {
        if (param != null && !param.isEmpty()) {
            return false;
        }
        return true;
    }



}



