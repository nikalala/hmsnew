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
 * Comparator class is used to sort the VSharer2Bean objects.
 */
public class VSharer2Comparator implements Comparator
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
     * Constructor class for VSharer2Comparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new VSharer2Comparator(VSharer2Manager.GUEST, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>VSharer2Manager.ID_GUEST
     *   <li>VSharer2Manager.ID_GUESTID
     *   <li>VSharer2Manager.ID_RESERVATIONROOMID
     * </ul>
     */
    public VSharer2Comparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for VSharer2Comparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new VSharer2Comparator(VSharer2Manager.GUEST, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>VSharer2Manager.ID_GUEST
     *   <li>VSharer2Manager.ID_GUESTID
     *   <li>VSharer2Manager.ID_RESERVATIONROOMID
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public VSharer2Comparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        VSharer2Bean b1 = (VSharer2Bean)pObj1;
        VSharer2Bean b2 = (VSharer2Bean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case VSharer2Manager.ID_GUEST:
                if (b1.getGuest() == null && b2.getGuest() != null) {
                    iReturn = -1;
                } else if (b1.getGuest() == null && b2.getGuest() == null) {
                    iReturn = 0;
                } else if (b1.getGuest() != null && b2.getGuest() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getGuest().compareTo(b2.getGuest());
                }
                break;
            case VSharer2Manager.ID_GUESTID:
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
            case VSharer2Manager.ID_RESERVATIONROOMID:
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
            default: 
                throw new IllegalArgumentException("Type passed for the field is not supported");
        }

        return bReverse ? (-1 * iReturn) : iReturn;
    }
// class+ 

// class- 

}
