// --------------------------------------------------------
// Generated by sql2java - http://sql2java.sourceforge.net/
// jdbc driver used at code generation time: org.postgresql.Driver
// 
// Please help us improve this tool by reporting:
//    problems,
//    suggestions,
//    feedbacks,
//    ideas,
//  to http://sourceforge.net/projects/sql2java/
// --------------------------------------------------------

package com.mysoft.hms;

import java.util.Comparator;
// imports+ 

// imports- 


/**
 * Comparator class is used to sort the RatetyperoomtypeBean objects.
 */
public class RatetyperoomtypeComparator implements Comparator
// extends+ 

// extends- 

{
    /**
     * Holds the field on which the comparison is performed.
     */
    private int iType;
    /**
     * Value that will contain the information about the order of the sort: normal or reversal.
     */
    private boolean bReverse;

    /**
     * Constructor class for RatetyperoomtypeComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new RatetyperoomtypeComparator(RatetyperoomtypeManager.RATETYPEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>RatetyperoomtypeManager.ID_RATETYPEID
     *   <li>RatetyperoomtypeManager.ID_ROOMTYPEID
     * </ul>
     */
    public RatetyperoomtypeComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for RatetyperoomtypeComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new RatetyperoomtypeComparator(RatetyperoomtypeManager.RATETYPEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>RatetyperoomtypeManager.ID_RATETYPEID
     *   <li>RatetyperoomtypeManager.ID_ROOMTYPEID
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public RatetyperoomtypeComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        RatetyperoomtypeBean b1 = (RatetyperoomtypeBean)pObj1;
        RatetyperoomtypeBean b2 = (RatetyperoomtypeBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case RatetyperoomtypeManager.ID_RATETYPEID:
                if (b1.getRatetypeid() == null && b2.getRatetypeid() != null) {
                    iReturn = -1;
                } else if (b1.getRatetypeid() == null && b2.getRatetypeid() == null) {
                    iReturn = 0;
                } else if (b1.getRatetypeid() != null && b2.getRatetypeid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRatetypeid().compareTo(b2.getRatetypeid());
                }
                break;
            case RatetyperoomtypeManager.ID_ROOMTYPEID:
                if (b1.getRoomtypeid() == null && b2.getRoomtypeid() != null) {
                    iReturn = -1;
                } else if (b1.getRoomtypeid() == null && b2.getRoomtypeid() == null) {
                    iReturn = 0;
                } else if (b1.getRoomtypeid() != null && b2.getRoomtypeid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRoomtypeid().compareTo(b2.getRoomtypeid());
                }
                break;
            default: 
                throw new IllegalArgumentException("Type passed for the field is not supported");
        }

        return bReverse ? (-1 * iReturn) : iReturn;
    }
// class+ 

// class- 

}
