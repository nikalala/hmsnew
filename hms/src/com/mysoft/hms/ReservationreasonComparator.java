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
 * Comparator class is used to sort the ReservationreasonBean objects.
 */
public class ReservationreasonComparator implements Comparator
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
     * Constructor class for ReservationreasonComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ReservationreasonComparator(ReservationreasonManager.RESERVATIONID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ReservationreasonManager.ID_RESERVATIONID
     *   <li>ReservationreasonManager.ID_REASONID
     *   <li>ReservationreasonManager.ID_REGBYID
     *   <li>ReservationreasonManager.ID_REGDATE
     * </ul>
     */
    public ReservationreasonComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for ReservationreasonComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ReservationreasonComparator(ReservationreasonManager.RESERVATIONID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ReservationreasonManager.ID_RESERVATIONID
     *   <li>ReservationreasonManager.ID_REASONID
     *   <li>ReservationreasonManager.ID_REGBYID
     *   <li>ReservationreasonManager.ID_REGDATE
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public ReservationreasonComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        ReservationreasonBean b1 = (ReservationreasonBean)pObj1;
        ReservationreasonBean b2 = (ReservationreasonBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case ReservationreasonManager.ID_RESERVATIONID:
                if (b1.getReservationid() == null && b2.getReservationid() != null) {
                    iReturn = -1;
                } else if (b1.getReservationid() == null && b2.getReservationid() == null) {
                    iReturn = 0;
                } else if (b1.getReservationid() != null && b2.getReservationid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getReservationid().compareTo(b2.getReservationid());
                }
                break;
            case ReservationreasonManager.ID_REASONID:
                if (b1.getReasonid() == null && b2.getReasonid() != null) {
                    iReturn = -1;
                } else if (b1.getReasonid() == null && b2.getReasonid() == null) {
                    iReturn = 0;
                } else if (b1.getReasonid() != null && b2.getReasonid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getReasonid().compareTo(b2.getReasonid());
                }
                break;
            case ReservationreasonManager.ID_REGBYID:
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
            case ReservationreasonManager.ID_REGDATE:
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
