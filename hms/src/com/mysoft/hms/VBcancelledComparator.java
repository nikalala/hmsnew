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
 * Comparator class is used to sort the VBcancelledBean objects.
 */
public class VBcancelledComparator implements Comparator
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
     * Constructor class for VBcancelledComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new VBcancelledComparator(VBcancelledManager.RESERVATIONID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>VBcancelledManager.ID_RESERVATIONID
     *   <li>VBcancelledManager.ID_GUEST
     *   <li>VBcancelledManager.ID_ARRAIVALDATE
     *   <li>VBcancelledManager.ID_DEPARTUREDATE
     *   <li>VBcancelledManager.ID_NUM
     *   <li>VBcancelledManager.ID_CHARGES
     *   <li>VBcancelledManager.ID_PAID
     *   <li>VBcancelledManager.ID_BALANCE
     *   <li>VBcancelledManager.ID_SOURCE
     *   <li>VBcancelledManager.ID_PUSER
     *   <li>VBcancelledManager.ID_REGDATE
     *   <li>VBcancelledManager.ID_REMARK
     *   <li>VBcancelledManager.ID_REGBYID
     *   <li>VBcancelledManager.ID_BSOURCEID
     *   <li>VBcancelledManager.ID_ROOMTYPEID
     *   <li>VBcancelledManager.ID_RATETYPEID
     * </ul>
     */
    public VBcancelledComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for VBcancelledComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new VBcancelledComparator(VBcancelledManager.RESERVATIONID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>VBcancelledManager.ID_RESERVATIONID
     *   <li>VBcancelledManager.ID_GUEST
     *   <li>VBcancelledManager.ID_ARRAIVALDATE
     *   <li>VBcancelledManager.ID_DEPARTUREDATE
     *   <li>VBcancelledManager.ID_NUM
     *   <li>VBcancelledManager.ID_CHARGES
     *   <li>VBcancelledManager.ID_PAID
     *   <li>VBcancelledManager.ID_BALANCE
     *   <li>VBcancelledManager.ID_SOURCE
     *   <li>VBcancelledManager.ID_PUSER
     *   <li>VBcancelledManager.ID_REGDATE
     *   <li>VBcancelledManager.ID_REMARK
     *   <li>VBcancelledManager.ID_REGBYID
     *   <li>VBcancelledManager.ID_BSOURCEID
     *   <li>VBcancelledManager.ID_ROOMTYPEID
     *   <li>VBcancelledManager.ID_RATETYPEID
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public VBcancelledComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        VBcancelledBean b1 = (VBcancelledBean)pObj1;
        VBcancelledBean b2 = (VBcancelledBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case VBcancelledManager.ID_RESERVATIONID:
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
            case VBcancelledManager.ID_GUEST:
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
            case VBcancelledManager.ID_ARRAIVALDATE:
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
            case VBcancelledManager.ID_DEPARTUREDATE:
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
            case VBcancelledManager.ID_NUM:
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
            case VBcancelledManager.ID_CHARGES:
                if (b1.getCharges() == null && b2.getCharges() != null) {
                    iReturn = -1;
                } else if (b1.getCharges() == null && b2.getCharges() == null) {
                    iReturn = 0;
                } else if (b1.getCharges() != null && b2.getCharges() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCharges().compareTo(b2.getCharges());
                }
                break;
            case VBcancelledManager.ID_PAID:
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
            case VBcancelledManager.ID_BALANCE:
                if (b1.getBalance() == null && b2.getBalance() != null) {
                    iReturn = -1;
                } else if (b1.getBalance() == null && b2.getBalance() == null) {
                    iReturn = 0;
                } else if (b1.getBalance() != null && b2.getBalance() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getBalance().compareTo(b2.getBalance());
                }
                break;
            case VBcancelledManager.ID_SOURCE:
                if (b1.getSource() == null && b2.getSource() != null) {
                    iReturn = -1;
                } else if (b1.getSource() == null && b2.getSource() == null) {
                    iReturn = 0;
                } else if (b1.getSource() != null && b2.getSource() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getSource().compareTo(b2.getSource());
                }
                break;
            case VBcancelledManager.ID_PUSER:
                if (b1.getPuser() == null && b2.getPuser() != null) {
                    iReturn = -1;
                } else if (b1.getPuser() == null && b2.getPuser() == null) {
                    iReturn = 0;
                } else if (b1.getPuser() != null && b2.getPuser() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPuser().compareTo(b2.getPuser());
                }
                break;
            case VBcancelledManager.ID_REGDATE:
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
            case VBcancelledManager.ID_REMARK:
                if (b1.getRemark() == null && b2.getRemark() != null) {
                    iReturn = -1;
                } else if (b1.getRemark() == null && b2.getRemark() == null) {
                    iReturn = 0;
                } else if (b1.getRemark() != null && b2.getRemark() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRemark().compareTo(b2.getRemark());
                }
                break;
            case VBcancelledManager.ID_REGBYID:
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
            case VBcancelledManager.ID_BSOURCEID:
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
            case VBcancelledManager.ID_ROOMTYPEID:
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
            case VBcancelledManager.ID_RATETYPEID:
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
            default: 
                throw new IllegalArgumentException("Type passed for the field is not supported");
        }

        return bReverse ? (-1 * iReturn) : iReturn;
    }
// class+ 

// class- 

}
