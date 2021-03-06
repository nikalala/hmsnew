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
 * Comparator class is used to sort the RoomstlogBean objects.
 */
public class RoomstlogComparator implements Comparator
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
     * Constructor class for RoomstlogComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new RoomstlogComparator(RoomstlogManager.ROOMSTLOGID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>RoomstlogManager.ID_ROOMSTLOGID
     *   <li>RoomstlogManager.ID_ROOMSTID
     *   <li>RoomstlogManager.ID_ROOMID
     *   <li>RoomstlogManager.ID_STATUSDATE
     *   <li>RoomstlogManager.ID_ST
     *   <li>RoomstlogManager.ID_REGBYID
     *   <li>RoomstlogManager.ID_REGDATE
     *   <li>RoomstlogManager.ID_RESERVATIONROOMID
     *   <li>RoomstlogManager.ID_ROOMTYPEID
     *   <li>RoomstlogManager.ID_BLOCKROOMID
     *   <li>RoomstlogManager.ID_LOGDATE
     * </ul>
     */
    public RoomstlogComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for RoomstlogComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new RoomstlogComparator(RoomstlogManager.ROOMSTLOGID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>RoomstlogManager.ID_ROOMSTLOGID
     *   <li>RoomstlogManager.ID_ROOMSTID
     *   <li>RoomstlogManager.ID_ROOMID
     *   <li>RoomstlogManager.ID_STATUSDATE
     *   <li>RoomstlogManager.ID_ST
     *   <li>RoomstlogManager.ID_REGBYID
     *   <li>RoomstlogManager.ID_REGDATE
     *   <li>RoomstlogManager.ID_RESERVATIONROOMID
     *   <li>RoomstlogManager.ID_ROOMTYPEID
     *   <li>RoomstlogManager.ID_BLOCKROOMID
     *   <li>RoomstlogManager.ID_LOGDATE
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public RoomstlogComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        RoomstlogBean b1 = (RoomstlogBean)pObj1;
        RoomstlogBean b2 = (RoomstlogBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case RoomstlogManager.ID_ROOMSTLOGID:
                if (b1.getRoomstlogid() == null && b2.getRoomstlogid() != null) {
                    iReturn = -1;
                } else if (b1.getRoomstlogid() == null && b2.getRoomstlogid() == null) {
                    iReturn = 0;
                } else if (b1.getRoomstlogid() != null && b2.getRoomstlogid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRoomstlogid().compareTo(b2.getRoomstlogid());
                }
                break;
            case RoomstlogManager.ID_ROOMSTID:
                if (b1.getRoomstid() == null && b2.getRoomstid() != null) {
                    iReturn = -1;
                } else if (b1.getRoomstid() == null && b2.getRoomstid() == null) {
                    iReturn = 0;
                } else if (b1.getRoomstid() != null && b2.getRoomstid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRoomstid().compareTo(b2.getRoomstid());
                }
                break;
            case RoomstlogManager.ID_ROOMID:
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
            case RoomstlogManager.ID_STATUSDATE:
                if (b1.getStatusdate() == null && b2.getStatusdate() != null) {
                    iReturn = -1;
                } else if (b1.getStatusdate() == null && b2.getStatusdate() == null) {
                    iReturn = 0;
                } else if (b1.getStatusdate() != null && b2.getStatusdate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getStatusdate().compareTo(b2.getStatusdate());
                }
                break;
            case RoomstlogManager.ID_ST:
                if (b1.getSt() == null && b2.getSt() != null) {
                    iReturn = -1;
                } else if (b1.getSt() == null && b2.getSt() == null) {
                    iReturn = 0;
                } else if (b1.getSt() != null && b2.getSt() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getSt().compareTo(b2.getSt());
                }
                break;
            case RoomstlogManager.ID_REGBYID:
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
            case RoomstlogManager.ID_REGDATE:
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
            case RoomstlogManager.ID_RESERVATIONROOMID:
                if (b1.getReservationroomid() == null && b2.getReservationroomid() != null) {
                    iReturn = -1;
                } else if (b1.getReservationroomid() == null && b2.getReservationroomid() == null) {
                    iReturn = 0;
                } else if (b1.getReservationroomid() != null && b2.getReservationroomid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getReservationroomid().compareTo(b2.getReservationroomid());
                }
                break;
            case RoomstlogManager.ID_ROOMTYPEID:
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
            case RoomstlogManager.ID_BLOCKROOMID:
                if (b1.getBlockroomid() == null && b2.getBlockroomid() != null) {
                    iReturn = -1;
                } else if (b1.getBlockroomid() == null && b2.getBlockroomid() == null) {
                    iReturn = 0;
                } else if (b1.getBlockroomid() != null && b2.getBlockroomid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getBlockroomid().compareTo(b2.getBlockroomid());
                }
                break;
            case RoomstlogManager.ID_LOGDATE:
                if (b1.getLogdate() == null && b2.getLogdate() != null) {
                    iReturn = -1;
                } else if (b1.getLogdate() == null && b2.getLogdate() == null) {
                    iReturn = 0;
                } else if (b1.getLogdate() != null && b2.getLogdate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getLogdate().compareTo(b2.getLogdate());
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
