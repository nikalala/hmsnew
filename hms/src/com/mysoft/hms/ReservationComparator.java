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
 * Comparator class is used to sort the ReservationBean objects.
 */
public class ReservationComparator implements Comparator
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
     * Constructor class for ReservationComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ReservationComparator(ReservationManager.RESERVATIONID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ReservationManager.ID_RESERVATIONID
     *   <li>ReservationManager.ID_ARRAIVALDATE
     *   <li>ReservationManager.ID_DEPARTUREDATE
     *   <li>ReservationManager.ID_RESERVATIONTYPEID
     *   <li>ReservationManager.ID_RATETYPE
     *   <li>ReservationManager.ID_MANUALRATE
     *   <li>ReservationManager.ID_CONTRACTCONTRAGENTID
     *   <li>ReservationManager.ID_BILLTO
     *   <li>ReservationManager.ID_TAXEXEMPTIONREASON
     *   <li>ReservationManager.ID_PAYMENTMODE
     *   <li>ReservationManager.ID_PAYMENTMETHODID
     *   <li>ReservationManager.ID_PAYMENTCONTRAGENTID
     *   <li>ReservationManager.ID_ADVANCEPAYMENTDATE
     *   <li>ReservationManager.ID_ADVANCEPAYMENTAMOUNT
     *   <li>ReservationManager.ID_COMPANYID
     *   <li>ReservationManager.ID_MARKETID
     *   <li>ReservationManager.ID_BSOURCEID
     *   <li>ReservationManager.ID_TAID
     *   <li>ReservationManager.ID_COMMISSIONPLAN
     *   <li>ReservationManager.ID_COMMISSIONVALUE
     *   <li>ReservationManager.ID_VOUCHER
     *   <li>ReservationManager.ID_DISCOUNTID
     *   <li>ReservationManager.ID_POSTINGTYPE
     *   <li>ReservationManager.ID_REGBYID
     *   <li>ReservationManager.ID_REGDATE
     *   <li>ReservationManager.ID_POSTINGVALUEEVERY
     *   <li>ReservationManager.ID_NUM
     *   <li>ReservationManager.ID_DISCOUNTNIGHTS
     *   <li>ReservationManager.ID_STATUS
     * </ul>
     */
    public ReservationComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for ReservationComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ReservationComparator(ReservationManager.RESERVATIONID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ReservationManager.ID_RESERVATIONID
     *   <li>ReservationManager.ID_ARRAIVALDATE
     *   <li>ReservationManager.ID_DEPARTUREDATE
     *   <li>ReservationManager.ID_RESERVATIONTYPEID
     *   <li>ReservationManager.ID_RATETYPE
     *   <li>ReservationManager.ID_MANUALRATE
     *   <li>ReservationManager.ID_CONTRACTCONTRAGENTID
     *   <li>ReservationManager.ID_BILLTO
     *   <li>ReservationManager.ID_TAXEXEMPTIONREASON
     *   <li>ReservationManager.ID_PAYMENTMODE
     *   <li>ReservationManager.ID_PAYMENTMETHODID
     *   <li>ReservationManager.ID_PAYMENTCONTRAGENTID
     *   <li>ReservationManager.ID_ADVANCEPAYMENTDATE
     *   <li>ReservationManager.ID_ADVANCEPAYMENTAMOUNT
     *   <li>ReservationManager.ID_COMPANYID
     *   <li>ReservationManager.ID_MARKETID
     *   <li>ReservationManager.ID_BSOURCEID
     *   <li>ReservationManager.ID_TAID
     *   <li>ReservationManager.ID_COMMISSIONPLAN
     *   <li>ReservationManager.ID_COMMISSIONVALUE
     *   <li>ReservationManager.ID_VOUCHER
     *   <li>ReservationManager.ID_DISCOUNTID
     *   <li>ReservationManager.ID_POSTINGTYPE
     *   <li>ReservationManager.ID_REGBYID
     *   <li>ReservationManager.ID_REGDATE
     *   <li>ReservationManager.ID_POSTINGVALUEEVERY
     *   <li>ReservationManager.ID_NUM
     *   <li>ReservationManager.ID_NOMANUALTAX
     *   <li>ReservationManager.ID_NOTAX
     *   <li>ReservationManager.ID_DISCOUNTNIGHTS
     *   <li>ReservationManager.ID_STATUS
     *   <li>ReservationManager.ID_WALKIN
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public ReservationComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        ReservationBean b1 = (ReservationBean)pObj1;
        ReservationBean b2 = (ReservationBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case ReservationManager.ID_RESERVATIONID:
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
            case ReservationManager.ID_ARRAIVALDATE:
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
            case ReservationManager.ID_DEPARTUREDATE:
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
            case ReservationManager.ID_RESERVATIONTYPEID:
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
            case ReservationManager.ID_RATETYPE:
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
            case ReservationManager.ID_MANUALRATE:
                if (b1.getManualrate() == null && b2.getManualrate() != null) {
                    iReturn = -1;
                } else if (b1.getManualrate() == null && b2.getManualrate() == null) {
                    iReturn = 0;
                } else if (b1.getManualrate() != null && b2.getManualrate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getManualrate().compareTo(b2.getManualrate());
                }
                break;
            case ReservationManager.ID_CONTRACTCONTRAGENTID:
                if (b1.getContractcontragentid() == null && b2.getContractcontragentid() != null) {
                    iReturn = -1;
                } else if (b1.getContractcontragentid() == null && b2.getContractcontragentid() == null) {
                    iReturn = 0;
                } else if (b1.getContractcontragentid() != null && b2.getContractcontragentid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getContractcontragentid().compareTo(b2.getContractcontragentid());
                }
                break;
            case ReservationManager.ID_BILLTO:
                if (b1.getBillto() == null && b2.getBillto() != null) {
                    iReturn = -1;
                } else if (b1.getBillto() == null && b2.getBillto() == null) {
                    iReturn = 0;
                } else if (b1.getBillto() != null && b2.getBillto() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getBillto().compareTo(b2.getBillto());
                }
                break;
            case ReservationManager.ID_TAXEXEMPTIONREASON:
                if (b1.getTaxexemptionreason() == null && b2.getTaxexemptionreason() != null) {
                    iReturn = -1;
                } else if (b1.getTaxexemptionreason() == null && b2.getTaxexemptionreason() == null) {
                    iReturn = 0;
                } else if (b1.getTaxexemptionreason() != null && b2.getTaxexemptionreason() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getTaxexemptionreason().compareTo(b2.getTaxexemptionreason());
                }
                break;
            case ReservationManager.ID_PAYMENTMODE:
                if (b1.getPaymentmode() == null && b2.getPaymentmode() != null) {
                    iReturn = -1;
                } else if (b1.getPaymentmode() == null && b2.getPaymentmode() == null) {
                    iReturn = 0;
                } else if (b1.getPaymentmode() != null && b2.getPaymentmode() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPaymentmode().compareTo(b2.getPaymentmode());
                }
                break;
            case ReservationManager.ID_PAYMENTMETHODID:
                if (b1.getPaymentmethodid() == null && b2.getPaymentmethodid() != null) {
                    iReturn = -1;
                } else if (b1.getPaymentmethodid() == null && b2.getPaymentmethodid() == null) {
                    iReturn = 0;
                } else if (b1.getPaymentmethodid() != null && b2.getPaymentmethodid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPaymentmethodid().compareTo(b2.getPaymentmethodid());
                }
                break;
            case ReservationManager.ID_PAYMENTCONTRAGENTID:
                if (b1.getPaymentcontragentid() == null && b2.getPaymentcontragentid() != null) {
                    iReturn = -1;
                } else if (b1.getPaymentcontragentid() == null && b2.getPaymentcontragentid() == null) {
                    iReturn = 0;
                } else if (b1.getPaymentcontragentid() != null && b2.getPaymentcontragentid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPaymentcontragentid().compareTo(b2.getPaymentcontragentid());
                }
                break;
            case ReservationManager.ID_ADVANCEPAYMENTDATE:
                if (b1.getAdvancepaymentdate() == null && b2.getAdvancepaymentdate() != null) {
                    iReturn = -1;
                } else if (b1.getAdvancepaymentdate() == null && b2.getAdvancepaymentdate() == null) {
                    iReturn = 0;
                } else if (b1.getAdvancepaymentdate() != null && b2.getAdvancepaymentdate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAdvancepaymentdate().compareTo(b2.getAdvancepaymentdate());
                }
                break;
            case ReservationManager.ID_ADVANCEPAYMENTAMOUNT:
                if (b1.getAdvancepaymentamount() == null && b2.getAdvancepaymentamount() != null) {
                    iReturn = -1;
                } else if (b1.getAdvancepaymentamount() == null && b2.getAdvancepaymentamount() == null) {
                    iReturn = 0;
                } else if (b1.getAdvancepaymentamount() != null && b2.getAdvancepaymentamount() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAdvancepaymentamount().compareTo(b2.getAdvancepaymentamount());
                }
                break;
            case ReservationManager.ID_COMPANYID:
                if (b1.getCompanyid() == null && b2.getCompanyid() != null) {
                    iReturn = -1;
                } else if (b1.getCompanyid() == null && b2.getCompanyid() == null) {
                    iReturn = 0;
                } else if (b1.getCompanyid() != null && b2.getCompanyid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCompanyid().compareTo(b2.getCompanyid());
                }
                break;
            case ReservationManager.ID_MARKETID:
                if (b1.getMarketid() == null && b2.getMarketid() != null) {
                    iReturn = -1;
                } else if (b1.getMarketid() == null && b2.getMarketid() == null) {
                    iReturn = 0;
                } else if (b1.getMarketid() != null && b2.getMarketid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getMarketid().compareTo(b2.getMarketid());
                }
                break;
            case ReservationManager.ID_BSOURCEID:
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
            case ReservationManager.ID_TAID:
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
            case ReservationManager.ID_COMMISSIONPLAN:
                if (b1.getCommissionplan() == null && b2.getCommissionplan() != null) {
                    iReturn = -1;
                } else if (b1.getCommissionplan() == null && b2.getCommissionplan() == null) {
                    iReturn = 0;
                } else if (b1.getCommissionplan() != null && b2.getCommissionplan() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCommissionplan().compareTo(b2.getCommissionplan());
                }
                break;
            case ReservationManager.ID_COMMISSIONVALUE:
                if (b1.getCommissionvalue() == null && b2.getCommissionvalue() != null) {
                    iReturn = -1;
                } else if (b1.getCommissionvalue() == null && b2.getCommissionvalue() == null) {
                    iReturn = 0;
                } else if (b1.getCommissionvalue() != null && b2.getCommissionvalue() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCommissionvalue().compareTo(b2.getCommissionvalue());
                }
                break;
            case ReservationManager.ID_VOUCHER:
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
            case ReservationManager.ID_DISCOUNTID:
                if (b1.getDiscountid() == null && b2.getDiscountid() != null) {
                    iReturn = -1;
                } else if (b1.getDiscountid() == null && b2.getDiscountid() == null) {
                    iReturn = 0;
                } else if (b1.getDiscountid() != null && b2.getDiscountid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getDiscountid().compareTo(b2.getDiscountid());
                }
                break;
            case ReservationManager.ID_POSTINGTYPE:
                if (b1.getPostingtype() == null && b2.getPostingtype() != null) {
                    iReturn = -1;
                } else if (b1.getPostingtype() == null && b2.getPostingtype() == null) {
                    iReturn = 0;
                } else if (b1.getPostingtype() != null && b2.getPostingtype() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPostingtype().compareTo(b2.getPostingtype());
                }
                break;
            case ReservationManager.ID_REGBYID:
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
            case ReservationManager.ID_REGDATE:
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
            case ReservationManager.ID_POSTINGVALUEEVERY:
                if (b1.getPostingvalueevery() == null && b2.getPostingvalueevery() != null) {
                    iReturn = -1;
                } else if (b1.getPostingvalueevery() == null && b2.getPostingvalueevery() == null) {
                    iReturn = 0;
                } else if (b1.getPostingvalueevery() != null && b2.getPostingvalueevery() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPostingvalueevery().compareTo(b2.getPostingvalueevery());
                }
                break;
            case ReservationManager.ID_NUM:
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
            case ReservationManager.ID_DISCOUNTNIGHTS:
                if (b1.getDiscountnights() == null && b2.getDiscountnights() != null) {
                    iReturn = -1;
                } else if (b1.getDiscountnights() == null && b2.getDiscountnights() == null) {
                    iReturn = 0;
                } else if (b1.getDiscountnights() != null && b2.getDiscountnights() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getDiscountnights().compareTo(b2.getDiscountnights());
                }
                break;
            case ReservationManager.ID_STATUS:
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
            default: 
                throw new IllegalArgumentException("Type passed for the field is not supported");
        }

        return bReverse ? (-1 * iReturn) : iReturn;
    }
// class+ 

// class- 

}
