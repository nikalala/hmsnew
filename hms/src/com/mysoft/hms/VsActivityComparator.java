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
 * Comparator class is used to sort the VsActivityBean objects.
 */
public class VsActivityComparator implements Comparator
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
     * Constructor class for VsActivityComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new VsActivityComparator(VsActivityManager.RESERVATIONID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>VsActivityManager.ID_RESERVATIONID
     *   <li>VsActivityManager.ID_REGDATE
     *   <li>VsActivityManager.ID_GUESTNAME
     *   <li>VsActivityManager.ID_ARRAIVALDATE
     *   <li>VsActivityManager.ID_DEPARTUREDATE
     *   <li>VsActivityManager.ID_NIGHTS
     *   <li>VsActivityManager.ID_ROOMNAME
     *   <li>VsActivityManager.ID_BSOURCE
     *   <li>VsActivityManager.ID_TANAME
     *   <li>VsActivityManager.ID_VOUCHER
     *   <li>VsActivityManager.ID_RATETYPE
     *   <li>VsActivityManager.ID_NRML
     *   <li>VsActivityManager.ID_OFFERED
     *   <li>VsActivityManager.ID_PAYMENTMETHOD
     *   <li>VsActivityManager.ID_AUTHOR
     *   <li>VsActivityManager.ID_TAID
     *   <li>VsActivityManager.ID_RATETYPEID
     *   <li>VsActivityManager.ID_PERSONNELID
     *   <li>VsActivityManager.ID_ROOMTYPEID
     *   <li>VsActivityManager.ID_BID
     * </ul>
     */
    public VsActivityComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for VsActivityComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new VsActivityComparator(VsActivityManager.RESERVATIONID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>VsActivityManager.ID_RESERVATIONID
     *   <li>VsActivityManager.ID_REGDATE
     *   <li>VsActivityManager.ID_GUESTNAME
     *   <li>VsActivityManager.ID_ARRAIVALDATE
     *   <li>VsActivityManager.ID_DEPARTUREDATE
     *   <li>VsActivityManager.ID_NIGHTS
     *   <li>VsActivityManager.ID_ROOMNAME
     *   <li>VsActivityManager.ID_BSOURCE
     *   <li>VsActivityManager.ID_TANAME
     *   <li>VsActivityManager.ID_VOUCHER
     *   <li>VsActivityManager.ID_RATETYPE
     *   <li>VsActivityManager.ID_NRML
     *   <li>VsActivityManager.ID_OFFERED
     *   <li>VsActivityManager.ID_PAYMENTMETHOD
     *   <li>VsActivityManager.ID_AUTHOR
     *   <li>VsActivityManager.ID_TAID
     *   <li>VsActivityManager.ID_RATETYPEID
     *   <li>VsActivityManager.ID_PERSONNELID
     *   <li>VsActivityManager.ID_ROOMTYPEID
     *   <li>VsActivityManager.ID_BID
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public VsActivityComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        VsActivityBean b1 = (VsActivityBean)pObj1;
        VsActivityBean b2 = (VsActivityBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case VsActivityManager.ID_RESERVATIONID:
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
            case VsActivityManager.ID_REGDATE:
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
            case VsActivityManager.ID_GUESTNAME:
                if (b1.getGuestname() == null && b2.getGuestname() != null) {
                    iReturn = -1;
                } else if (b1.getGuestname() == null && b2.getGuestname() == null) {
                    iReturn = 0;
                } else if (b1.getGuestname() != null && b2.getGuestname() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getGuestname().compareTo(b2.getGuestname());
                }
                break;
            case VsActivityManager.ID_ARRAIVALDATE:
                if (b1.getArraivaldate() == null && b2.getArraivaldate() != null) {
                    iReturn = -1;
                } else if (b1.getArraivaldate() == null && b2.getArraivaldate() == null) {
                    iReturn = 0;
                } else if (b1.getArraivaldate() != null && b2.getArraivaldate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getArraivaldate().compareTo(b2.getArraivaldate());
                }
                break;
            case VsActivityManager.ID_DEPARTUREDATE:
                if (b1.getDeparturedate() == null && b2.getDeparturedate() != null) {
                    iReturn = -1;
                } else if (b1.getDeparturedate() == null && b2.getDeparturedate() == null) {
                    iReturn = 0;
                } else if (b1.getDeparturedate() != null && b2.getDeparturedate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getDeparturedate().compareTo(b2.getDeparturedate());
                }
                break;
            case VsActivityManager.ID_NIGHTS:
                if (b1.getNights() == null && b2.getNights() != null) {
                    iReturn = -1;
                } else if (b1.getNights() == null && b2.getNights() == null) {
                    iReturn = 0;
                } else if (b1.getNights() != null && b2.getNights() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getNights().compareTo(b2.getNights());
                }
                break;
            case VsActivityManager.ID_ROOMNAME:
                if (b1.getRoomname() == null && b2.getRoomname() != null) {
                    iReturn = -1;
                } else if (b1.getRoomname() == null && b2.getRoomname() == null) {
                    iReturn = 0;
                } else if (b1.getRoomname() != null && b2.getRoomname() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRoomname().compareTo(b2.getRoomname());
                }
                break;
            case VsActivityManager.ID_BSOURCE:
                if (b1.getBsource() == null && b2.getBsource() != null) {
                    iReturn = -1;
                } else if (b1.getBsource() == null && b2.getBsource() == null) {
                    iReturn = 0;
                } else if (b1.getBsource() != null && b2.getBsource() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getBsource().compareTo(b2.getBsource());
                }
                break;
            case VsActivityManager.ID_TANAME:
                if (b1.getTaname() == null && b2.getTaname() != null) {
                    iReturn = -1;
                } else if (b1.getTaname() == null && b2.getTaname() == null) {
                    iReturn = 0;
                } else if (b1.getTaname() != null && b2.getTaname() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getTaname().compareTo(b2.getTaname());
                }
                break;
            case VsActivityManager.ID_VOUCHER:
                if (b1.getVoucher() == null && b2.getVoucher() != null) {
                    iReturn = -1;
                } else if (b1.getVoucher() == null && b2.getVoucher() == null) {
                    iReturn = 0;
                } else if (b1.getVoucher() != null && b2.getVoucher() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getVoucher().compareTo(b2.getVoucher());
                }
                break;
            case VsActivityManager.ID_RATETYPE:
                if (b1.getRatetype() == null && b2.getRatetype() != null) {
                    iReturn = -1;
                } else if (b1.getRatetype() == null && b2.getRatetype() == null) {
                    iReturn = 0;
                } else if (b1.getRatetype() != null && b2.getRatetype() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRatetype().compareTo(b2.getRatetype());
                }
                break;
            case VsActivityManager.ID_NRML:
                if (b1.getNrml() == null && b2.getNrml() != null) {
                    iReturn = -1;
                } else if (b1.getNrml() == null && b2.getNrml() == null) {
                    iReturn = 0;
                } else if (b1.getNrml() != null && b2.getNrml() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getNrml().compareTo(b2.getNrml());
                }
                break;
            case VsActivityManager.ID_OFFERED:
                if (b1.getOffered() == null && b2.getOffered() != null) {
                    iReturn = -1;
                } else if (b1.getOffered() == null && b2.getOffered() == null) {
                    iReturn = 0;
                } else if (b1.getOffered() != null && b2.getOffered() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getOffered().compareTo(b2.getOffered());
                }
                break;
            case VsActivityManager.ID_PAYMENTMETHOD:
                if (b1.getPaymentmethod() == null && b2.getPaymentmethod() != null) {
                    iReturn = -1;
                } else if (b1.getPaymentmethod() == null && b2.getPaymentmethod() == null) {
                    iReturn = 0;
                } else if (b1.getPaymentmethod() != null && b2.getPaymentmethod() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPaymentmethod().compareTo(b2.getPaymentmethod());
                }
                break;
            case VsActivityManager.ID_AUTHOR:
                if (b1.getAuthor() == null && b2.getAuthor() != null) {
                    iReturn = -1;
                } else if (b1.getAuthor() == null && b2.getAuthor() == null) {
                    iReturn = 0;
                } else if (b1.getAuthor() != null && b2.getAuthor() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAuthor().compareTo(b2.getAuthor());
                }
                break;
            case VsActivityManager.ID_TAID:
                if (b1.getTaid() == null && b2.getTaid() != null) {
                    iReturn = -1;
                } else if (b1.getTaid() == null && b2.getTaid() == null) {
                    iReturn = 0;
                } else if (b1.getTaid() != null && b2.getTaid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getTaid().compareTo(b2.getTaid());
                }
                break;
            case VsActivityManager.ID_RATETYPEID:
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
            case VsActivityManager.ID_PERSONNELID:
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
            case VsActivityManager.ID_ROOMTYPEID:
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
            case VsActivityManager.ID_BID:
                if (b1.getBid() == null && b2.getBid() != null) {
                    iReturn = -1;
                } else if (b1.getBid() == null && b2.getBid() == null) {
                    iReturn = 0;
                } else if (b1.getBid() != null && b2.getBid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getBid().compareTo(b2.getBid());
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
