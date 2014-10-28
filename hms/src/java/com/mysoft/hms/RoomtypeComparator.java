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
 * Comparator class is used to sort the RoomtypeBean objects.
 */
public class RoomtypeComparator implements Comparator
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
     * Constructor class for RoomtypeComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new RoomtypeComparator(RoomtypeManager.ROOMTYPEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>RoomtypeManager.ID_ROOMTYPEID
     *   <li>RoomtypeManager.ID_CODE
     *   <li>RoomtypeManager.ID_NAME
     *   <li>RoomtypeManager.ID_BADULT
     *   <li>RoomtypeManager.ID_BCHILD
     *   <li>RoomtypeManager.ID_MADULT
     *   <li>RoomtypeManager.ID_MCHILD
     *   <li>RoomtypeManager.ID_COLOR
     *   <li>RoomtypeManager.ID_WEBINVENTORY
     *   <li>RoomtypeManager.ID_REGBYID
     *   <li>RoomtypeManager.ID_REGDATE
     *   <li>RoomtypeManager.ID_ORD
     * </ul>
     */
    public RoomtypeComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for RoomtypeComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new RoomtypeComparator(RoomtypeManager.ROOMTYPEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>RoomtypeManager.ID_ROOMTYPEID
     *   <li>RoomtypeManager.ID_CODE
     *   <li>RoomtypeManager.ID_NAME
     *   <li>RoomtypeManager.ID_BADULT
     *   <li>RoomtypeManager.ID_BCHILD
     *   <li>RoomtypeManager.ID_MADULT
     *   <li>RoomtypeManager.ID_MCHILD
     *   <li>RoomtypeManager.ID_WEB
     *   <li>RoomtypeManager.ID_COLOR
     *   <li>RoomtypeManager.ID_WEBINVENTORY
     *   <li>RoomtypeManager.ID_REGBYID
     *   <li>RoomtypeManager.ID_REGDATE
     *   <li>RoomtypeManager.ID_ACTIVE
     *   <li>RoomtypeManager.ID_ORD
     *   <li>RoomtypeManager.ID_DELETED
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public RoomtypeComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        RoomtypeBean b1 = (RoomtypeBean)pObj1;
        RoomtypeBean b2 = (RoomtypeBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case RoomtypeManager.ID_ROOMTYPEID:
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
            case RoomtypeManager.ID_CODE:
                if (b1.getCode() == null && b2.getCode() != null) {
                    iReturn = -1;
                } else if (b1.getCode() == null && b2.getCode() == null) {
                    iReturn = 0;
                } else if (b1.getCode() != null && b2.getCode() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCode().compareTo(b2.getCode());
                }
                break;
            case RoomtypeManager.ID_NAME:
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
            case RoomtypeManager.ID_BADULT:
                if (b1.getBadult() == null && b2.getBadult() != null) {
                    iReturn = -1;
                } else if (b1.getBadult() == null && b2.getBadult() == null) {
                    iReturn = 0;
                } else if (b1.getBadult() != null && b2.getBadult() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getBadult().compareTo(b2.getBadult());
                }
                break;
            case RoomtypeManager.ID_BCHILD:
                if (b1.getBchild() == null && b2.getBchild() != null) {
                    iReturn = -1;
                } else if (b1.getBchild() == null && b2.getBchild() == null) {
                    iReturn = 0;
                } else if (b1.getBchild() != null && b2.getBchild() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getBchild().compareTo(b2.getBchild());
                }
                break;
            case RoomtypeManager.ID_MADULT:
                if (b1.getMadult() == null && b2.getMadult() != null) {
                    iReturn = -1;
                } else if (b1.getMadult() == null && b2.getMadult() == null) {
                    iReturn = 0;
                } else if (b1.getMadult() != null && b2.getMadult() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getMadult().compareTo(b2.getMadult());
                }
                break;
            case RoomtypeManager.ID_MCHILD:
                if (b1.getMchild() == null && b2.getMchild() != null) {
                    iReturn = -1;
                } else if (b1.getMchild() == null && b2.getMchild() == null) {
                    iReturn = 0;
                } else if (b1.getMchild() != null && b2.getMchild() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getMchild().compareTo(b2.getMchild());
                }
                break;
            case RoomtypeManager.ID_COLOR:
                if (b1.getColor() == null && b2.getColor() != null) {
                    iReturn = -1;
                } else if (b1.getColor() == null && b2.getColor() == null) {
                    iReturn = 0;
                } else if (b1.getColor() != null && b2.getColor() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getColor().compareTo(b2.getColor());
                }
                break;
            case RoomtypeManager.ID_WEBINVENTORY:
                if (b1.getWebinventory() == null && b2.getWebinventory() != null) {
                    iReturn = -1;
                } else if (b1.getWebinventory() == null && b2.getWebinventory() == null) {
                    iReturn = 0;
                } else if (b1.getWebinventory() != null && b2.getWebinventory() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getWebinventory().compareTo(b2.getWebinventory());
                }
                break;
            case RoomtypeManager.ID_REGBYID:
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
            case RoomtypeManager.ID_REGDATE:
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
            case RoomtypeManager.ID_ORD:
                if (b1.getOrd() == null && b2.getOrd() != null) {
                    iReturn = -1;
                } else if (b1.getOrd() == null && b2.getOrd() == null) {
                    iReturn = 0;
                } else if (b1.getOrd() != null && b2.getOrd() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getOrd().compareTo(b2.getOrd());
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
