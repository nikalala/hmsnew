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
 * Comparator class is used to sort the HouseunitBean objects.
 */
public class HouseunitComparator implements Comparator
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
     * Constructor class for HouseunitComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new HouseunitComparator(HouseunitManager.HOUSEUNITID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>HouseunitManager.ID_HOUSEUNITID
     *   <li>HouseunitManager.ID_NAME
     *   <li>HouseunitManager.ID_REGBYID
     *   <li>HouseunitManager.ID_REGDATE
     * </ul>
     */
    public HouseunitComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for HouseunitComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new HouseunitComparator(HouseunitManager.HOUSEUNITID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>HouseunitManager.ID_HOUSEUNITID
     *   <li>HouseunitManager.ID_NAME
     *   <li>HouseunitManager.ID_REGBYID
     *   <li>HouseunitManager.ID_REGDATE
     *   <li>HouseunitManager.ID_ACTIVE
     *   <li>HouseunitManager.ID_DETETED
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public HouseunitComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        HouseunitBean b1 = (HouseunitBean)pObj1;
        HouseunitBean b2 = (HouseunitBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case HouseunitManager.ID_HOUSEUNITID:
                if (b1.getHouseunitid() == null && b2.getHouseunitid() != null) {
                    iReturn = -1;
                } else if (b1.getHouseunitid() == null && b2.getHouseunitid() == null) {
                    iReturn = 0;
                } else if (b1.getHouseunitid() != null && b2.getHouseunitid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getHouseunitid().compareTo(b2.getHouseunitid());
                }
                break;
            case HouseunitManager.ID_NAME:
                if (b1.getName() == null && b2.getName() != null) {
                    iReturn = -1;
                } else if (b1.getName() == null && b2.getName() == null) {
                    iReturn = 0;
                } else if (b1.getName() != null && b2.getName() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getName().compareTo(b2.getName());
                }
                break;
            case HouseunitManager.ID_REGBYID:
                if (b1.getRegbyid() == null && b2.getRegbyid() != null) {
                    iReturn = -1;
                } else if (b1.getRegbyid() == null && b2.getRegbyid() == null) {
                    iReturn = 0;
                } else if (b1.getRegbyid() != null && b2.getRegbyid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRegbyid().compareTo(b2.getRegbyid());
                }
                break;
            case HouseunitManager.ID_REGDATE:
                if (b1.getRegdate() == null && b2.getRegdate() != null) {
                    iReturn = -1;
                } else if (b1.getRegdate() == null && b2.getRegdate() == null) {
                    iReturn = 0;
                } else if (b1.getRegdate() != null && b2.getRegdate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRegdate().compareTo(b2.getRegdate());
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