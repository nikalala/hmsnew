package com.mysoft;

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
}
