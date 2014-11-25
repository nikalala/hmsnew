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
 * Comparator class is used to sort the FolioBean objects.
 */
public class FolioComparator implements Comparator
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
     * Constructor class for FolioComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new FolioComparator(FolioManager.FOLIOID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>FolioManager.ID_FOLIOID
     *   <li>FolioManager.ID_NUM
     *   <li>FolioManager.ID_GUESTID
     *   <li>FolioManager.ID_CONTRAGENTID
     *   <li>FolioManager.ID_RESERVATIONROOMID
     *   <li>FolioManager.ID_STATUS
     *   <li>FolioManager.ID_REGBYID
     *   <li>FolioManager.ID_REGDATE
     * </ul>
     */
    public FolioComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for FolioComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new FolioComparator(FolioManager.FOLIOID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>FolioManager.ID_FOLIOID
     *   <li>FolioManager.ID_NUM
     *   <li>FolioManager.ID_GUESTID
     *   <li>FolioManager.ID_CONTRAGENTID
     *   <li>FolioManager.ID_RESERVATIONROOMID
     *   <li>FolioManager.ID_STATUS
     *   <li>FolioManager.ID_REGBYID
     *   <li>FolioManager.ID_REGDATE
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public FolioComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        FolioBean b1 = (FolioBean)pObj1;
        FolioBean b2 = (FolioBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case FolioManager.ID_FOLIOID:
                if (b1.getFolioid() == null && b2.getFolioid() != null) {
                    iReturn = -1;
                } else if (b1.getFolioid() == null && b2.getFolioid() == null) {
                    iReturn = 0;
                } else if (b1.getFolioid() != null && b2.getFolioid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getFolioid().compareTo(b2.getFolioid());
                }
                break;
            case FolioManager.ID_NUM:
                if (b1.getNum() == null && b2.getNum() != null) {
                    iReturn = -1;
                } else if (b1.getNum() == null && b2.getNum() == null) {
                    iReturn = 0;
                } else if (b1.getNum() != null && b2.getNum() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getNum().compareTo(b2.getNum());
                }
                break;
            case FolioManager.ID_GUESTID:
                if (b1.getGuestid() == null && b2.getGuestid() != null) {
                    iReturn = -1;
                } else if (b1.getGuestid() == null && b2.getGuestid() == null) {
                    iReturn = 0;
                } else if (b1.getGuestid() != null && b2.getGuestid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getGuestid().compareTo(b2.getGuestid());
                }
                break;
            case FolioManager.ID_CONTRAGENTID:
                if (b1.getContragentid() == null && b2.getContragentid() != null) {
                    iReturn = -1;
                } else if (b1.getContragentid() == null && b2.getContragentid() == null) {
                    iReturn = 0;
                } else if (b1.getContragentid() != null && b2.getContragentid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getContragentid().compareTo(b2.getContragentid());
                }
                break;
            case FolioManager.ID_RESERVATIONROOMID:
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
            case FolioManager.ID_STATUS:
                if (b1.getStatus() == null && b2.getStatus() != null) {
                    iReturn = -1;
                } else if (b1.getStatus() == null && b2.getStatus() == null) {
                    iReturn = 0;
                } else if (b1.getStatus() != null && b2.getStatus() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getStatus().compareTo(b2.getStatus());
                }
                break;
            case FolioManager.ID_REGBYID:
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
            case FolioManager.ID_REGDATE:
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