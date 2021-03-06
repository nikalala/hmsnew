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
 * Comparator class is used to sort the VReservationlistBean objects.
 */
public class VReservationlistComparator implements Comparator
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
     * Constructor class for VReservationlistComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new VReservationlistComparator(VReservationlistManager.RESERVATIONID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>VReservationlistManager.ID_RESERVATIONID
     *   <li>VReservationlistManager.ID_RESERVATIONROOMID
     *   <li>VReservationlistManager.ID_ROOMID
     *   <li>VReservationlistManager.ID_ROOMTYPEID
     *   <li>VReservationlistManager.ID_ARRAIVALDATE
     *   <li>VReservationlistManager.ID_DEPARTUREDATE
     *   <li>VReservationlistManager.ID_REGDATE
     *   <li>VReservationlistManager.ID_REGBYID
     *   <li>VReservationlistManager.ID_RESERVATIONTYPEID
     *   <li>VReservationlistManager.ID_STATUS
     *   <li>VReservationlistManager.ID_GUESTID
     *   <li>VReservationlistManager.ID_GUEST
     *   <li>VReservationlistManager.ID_ROOMCODE
     *   <li>VReservationlistManager.ID_ROOMTYPECODE
     *   <li>VReservationlistManager.ID_BSOURCENAME
     *   <li>VReservationlistManager.ID_BSOURCEID
     *   <li>VReservationlistManager.ID_COMPANYNAME
     *   <li>VReservationlistManager.ID_PRICE
     *   <li>VReservationlistManager.ID_PAID
     *   <li>VReservationlistManager.ID_VOUCHERNUM
     *   <li>VReservationlistManager.ID_USER
     *   <li>VReservationlistManager.ID_RESERVATIONTYPE
     * </ul>
     */
    public VReservationlistComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for VReservationlistComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new VReservationlistComparator(VReservationlistManager.RESERVATIONID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>VReservationlistManager.ID_RESERVATIONID
     *   <li>VReservationlistManager.ID_RESERVATIONROOMID
     *   <li>VReservationlistManager.ID_ROOMID
     *   <li>VReservationlistManager.ID_ROOMTYPEID
     *   <li>VReservationlistManager.ID_ARRAIVALDATE
     *   <li>VReservationlistManager.ID_DEPARTUREDATE
     *   <li>VReservationlistManager.ID_REGDATE
     *   <li>VReservationlistManager.ID_REGBYID
     *   <li>VReservationlistManager.ID_RESERVATIONTYPEID
     *   <li>VReservationlistManager.ID_STATUS
     *   <li>VReservationlistManager.ID_GUESTID
     *   <li>VReservationlistManager.ID_GUEST
     *   <li>VReservationlistManager.ID_ROOMCODE
     *   <li>VReservationlistManager.ID_ROOMTYPECODE
     *   <li>VReservationlistManager.ID_BSOURCENAME
     *   <li>VReservationlistManager.ID_BSOURCEID
     *   <li>VReservationlistManager.ID_COMPANYNAME
     *   <li>VReservationlistManager.ID_PRICE
     *   <li>VReservationlistManager.ID_PAID
     *   <li>VReservationlistManager.ID_VOUCHERNUM
     *   <li>VReservationlistManager.ID_USER
     *   <li>VReservationlistManager.ID_RESERVATIONTYPE
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public VReservationlistComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        VReservationlistBean b1 = (VReservationlistBean)pObj1;
        VReservationlistBean b2 = (VReservationlistBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case VReservationlistManager.ID_RESERVATIONID:
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
            case VReservationlistManager.ID_RESERVATIONROOMID:
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
            case VReservationlistManager.ID_ROOMID:
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
            case VReservationlistManager.ID_ROOMTYPEID:
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
            case VReservationlistManager.ID_ARRAIVALDATE:
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
            case VReservationlistManager.ID_DEPARTUREDATE:
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
            case VReservationlistManager.ID_REGDATE:
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
            case VReservationlistManager.ID_REGBYID:
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
            case VReservationlistManager.ID_RESERVATIONTYPEID:
                if (b1.getReservationtypeid() == null && b2.getReservationtypeid() != null) {
                    iReturn = -1;
                } else if (b1.getReservationtypeid() == null && b2.getReservationtypeid() == null) {
                    iReturn = 0;
                } else if (b1.getReservationtypeid() != null && b2.getReservationtypeid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getReservationtypeid().compareTo(b2.getReservationtypeid());
                }
                break;
            case VReservationlistManager.ID_STATUS:
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
            case VReservationlistManager.ID_GUESTID:
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
            case VReservationlistManager.ID_GUEST:
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
            case VReservationlistManager.ID_ROOMCODE:
                if (b1.getRoomcode() == null && b2.getRoomcode() != null) {
                    iReturn = -1;
                } else if (b1.getRoomcode() == null && b2.getRoomcode() == null) {
                    iReturn = 0;
                } else if (b1.getRoomcode() != null && b2.getRoomcode() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRoomcode().compareTo(b2.getRoomcode());
                }
                break;
            case VReservationlistManager.ID_ROOMTYPECODE:
                if (b1.getRoomtypecode() == null && b2.getRoomtypecode() != null) {
                    iReturn = -1;
                } else if (b1.getRoomtypecode() == null && b2.getRoomtypecode() == null) {
                    iReturn = 0;
                } else if (b1.getRoomtypecode() != null && b2.getRoomtypecode() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRoomtypecode().compareTo(b2.getRoomtypecode());
                }
                break;
            case VReservationlistManager.ID_BSOURCENAME:
                if (b1.getBsourcename() == null && b2.getBsourcename() != null) {
                    iReturn = -1;
                } else if (b1.getBsourcename() == null && b2.getBsourcename() == null) {
                    iReturn = 0;
                } else if (b1.getBsourcename() != null && b2.getBsourcename() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getBsourcename().compareTo(b2.getBsourcename());
                }
                break;
            case VReservationlistManager.ID_BSOURCEID:
                if (b1.getBsourceid() == null && b2.getBsourceid() != null) {
                    iReturn = -1;
                } else if (b1.getBsourceid() == null && b2.getBsourceid() == null) {
                    iReturn = 0;
                } else if (b1.getBsourceid() != null && b2.getBsourceid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getBsourceid().compareTo(b2.getBsourceid());
                }
                break;
            case VReservationlistManager.ID_COMPANYNAME:
                if (b1.getCompanyname() == null && b2.getCompanyname() != null) {
                    iReturn = -1;
                } else if (b1.getCompanyname() == null && b2.getCompanyname() == null) {
                    iReturn = 0;
                } else if (b1.getCompanyname() != null && b2.getCompanyname() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCompanyname().compareTo(b2.getCompanyname());
                }
                break;
            case VReservationlistManager.ID_PRICE:
                if (b1.getPrice() == null && b2.getPrice() != null) {
                    iReturn = -1;
                } else if (b1.getPrice() == null && b2.getPrice() == null) {
                    iReturn = 0;
                } else if (b1.getPrice() != null && b2.getPrice() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPrice().compareTo(b2.getPrice());
                }
                break;
            case VReservationlistManager.ID_PAID:
                if (b1.getPaid() == null && b2.getPaid() != null) {
                    iReturn = -1;
                } else if (b1.getPaid() == null && b2.getPaid() == null) {
                    iReturn = 0;
                } else if (b1.getPaid() != null && b2.getPaid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPaid().compareTo(b2.getPaid());
                }
                break;
            case VReservationlistManager.ID_VOUCHERNUM:
                if (b1.getVouchernum() == null && b2.getVouchernum() != null) {
                    iReturn = -1;
                } else if (b1.getVouchernum() == null && b2.getVouchernum() == null) {
                    iReturn = 0;
                } else if (b1.getVouchernum() != null && b2.getVouchernum() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getVouchernum().compareTo(b2.getVouchernum());
                }
                break;
            case VReservationlistManager.ID_USER:
                if (b1.getUser() == null && b2.getUser() != null) {
                    iReturn = -1;
                } else if (b1.getUser() == null && b2.getUser() == null) {
                    iReturn = 0;
                } else if (b1.getUser() != null && b2.getUser() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getUser().compareTo(b2.getUser());
                }
                break;
            case VReservationlistManager.ID_RESERVATIONTYPE:
                if (b1.getReservationtype() == null && b2.getReservationtype() != null) {
                    iReturn = -1;
                } else if (b1.getReservationtype() == null && b2.getReservationtype() == null) {
                    iReturn = 0;
                } else if (b1.getReservationtype() != null && b2.getReservationtype() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getReservationtype().compareTo(b2.getReservationtype());
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
