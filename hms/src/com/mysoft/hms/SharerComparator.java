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
 * Comparator class is used to sort the SharerBean objects.
 */
public class SharerComparator implements Comparator
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
     * Constructor class for SharerComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new SharerComparator(SharerManager.SHARERID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>SharerManager.ID_SHARERID
     *   <li>SharerManager.ID_RESERVATIONROOMID
     *   <li>SharerManager.ID_GUESTID
     * </ul>
     */
    public SharerComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for SharerComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new SharerComparator(SharerManager.SHARERID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>SharerManager.ID_SHARERID
     *   <li>SharerManager.ID_RESERVATIONROOMID
     *   <li>SharerManager.ID_GUESTID
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public SharerComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        SharerBean b1 = (SharerBean)pObj1;
        SharerBean b2 = (SharerBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case SharerManager.ID_SHARERID:
                if (b1.getSharerid() == null && b2.getSharerid() != null) {
                    iReturn = -1;
                } else if (b1.getSharerid() == null && b2.getSharerid() == null) {
                    iReturn = 0;
                } else if (b1.getSharerid() != null && b2.getSharerid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getSharerid().compareTo(b2.getSharerid());
                }
                break;
            case SharerManager.ID_RESERVATIONROOMID:
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
            case SharerManager.ID_GUESTID:
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
            default: 
                throw new IllegalArgumentException("Type passed for the field is not supported");
        }

        return bReverse ? (-1 * iReturn) : iReturn;
    }
// class+ 

// class- 

}
