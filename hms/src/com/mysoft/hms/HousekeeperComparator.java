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
 * Comparator class is used to sort the HousekeeperBean objects.
 */
public class HousekeeperComparator implements Comparator
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
     * Constructor class for HousekeeperComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new HousekeeperComparator(HousekeeperManager.HOUSEKEEPERID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>HousekeeperManager.ID_HOUSEKEEPERID
     *   <li>HousekeeperManager.ID_PERSONNELID
     *   <li>HousekeeperManager.ID_ROOMID
     *   <li>HousekeeperManager.ID_HOUSEUNITID
     *   <li>HousekeeperManager.ID_RECDATE
     * </ul>
     */
    public HousekeeperComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for HousekeeperComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new HousekeeperComparator(HousekeeperManager.HOUSEKEEPERID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>HousekeeperManager.ID_HOUSEKEEPERID
     *   <li>HousekeeperManager.ID_PERSONNELID
     *   <li>HousekeeperManager.ID_ROOMID
     *   <li>HousekeeperManager.ID_HOUSEUNITID
     *   <li>HousekeeperManager.ID_RECDATE
     *   <li>HousekeeperManager.ID_DELETED
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public HousekeeperComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        HousekeeperBean b1 = (HousekeeperBean)pObj1;
        HousekeeperBean b2 = (HousekeeperBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case HousekeeperManager.ID_HOUSEKEEPERID:
                if (b1.getHousekeeperid() == null && b2.getHousekeeperid() != null) {
                    iReturn = -1;
                } else if (b1.getHousekeeperid() == null && b2.getHousekeeperid() == null) {
                    iReturn = 0;
                } else if (b1.getHousekeeperid() != null && b2.getHousekeeperid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getHousekeeperid().compareTo(b2.getHousekeeperid());
                }
                break;
            case HousekeeperManager.ID_PERSONNELID:
                if (b1.getPersonnelid() == null && b2.getPersonnelid() != null) {
                    iReturn = -1;
                } else if (b1.getPersonnelid() == null && b2.getPersonnelid() == null) {
                    iReturn = 0;
                } else if (b1.getPersonnelid() != null && b2.getPersonnelid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPersonnelid().compareTo(b2.getPersonnelid());
                }
                break;
            case HousekeeperManager.ID_ROOMID:
                if (b1.getRoomid() == null && b2.getRoomid() != null) {
                    iReturn = -1;
                } else if (b1.getRoomid() == null && b2.getRoomid() == null) {
                    iReturn = 0;
                } else if (b1.getRoomid() != null && b2.getRoomid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRoomid().compareTo(b2.getRoomid());
                }
                break;
            case HousekeeperManager.ID_HOUSEUNITID:
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
            case HousekeeperManager.ID_RECDATE:
                if (b1.getRecdate() == null && b2.getRecdate() != null) {
                    iReturn = -1;
                } else if (b1.getRecdate() == null && b2.getRecdate() == null) {
                    iReturn = 0;
                } else if (b1.getRecdate() != null && b2.getRecdate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRecdate().compareTo(b2.getRecdate());
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
