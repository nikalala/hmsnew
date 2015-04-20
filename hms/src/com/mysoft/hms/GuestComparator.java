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
 * Comparator class is used to sort the GuestBean objects.
 */
public class GuestComparator implements Comparator
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
     * Constructor class for GuestComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new GuestComparator(GuestManager.GUESTID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>GuestManager.ID_GUESTID
     *   <li>GuestManager.ID_SALUTATIONID
     *   <li>GuestManager.ID_FNAME
     *   <li>GuestManager.ID_LNAME
     *   <li>GuestManager.ID_TYPE
     *   <li>GuestManager.ID_GENDER
     *   <li>GuestManager.ID_ADDRESS
     *   <li>GuestManager.ID_COUNTRYID
     *   <li>GuestManager.ID_CITY
     *   <li>GuestManager.ID_ZIP
     *   <li>GuestManager.ID_IDTYPEID
     *   <li>GuestManager.ID_IDN
     *   <li>GuestManager.ID_VIPSTATUSID
     *   <li>GuestManager.ID_PHONE
     *   <li>GuestManager.ID_MOBILE
     *   <li>GuestManager.ID_FAX
     *   <li>GuestManager.ID_EMAIL
     *   <li>GuestManager.ID_DOB
     *   <li>GuestManager.ID_SDOB
     *   <li>GuestManager.ID_WEDDINGDATE
     *   <li>GuestManager.ID_NATIONALITYID
     *   <li>GuestManager.ID_CONTRAGENTID
     *   <li>GuestManager.ID_PAYMENTMETHODID
     *   <li>GuestManager.ID_CARDNUM
     *   <li>GuestManager.ID_REGBYID
     *   <li>GuestManager.ID_REGDATE
     *   <li>GuestManager.ID_COMPANY
     *   <li>GuestManager.ID_DOCNUM
     * </ul>
     */
    public GuestComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for GuestComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new GuestComparator(GuestManager.GUESTID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>GuestManager.ID_GUESTID
     *   <li>GuestManager.ID_SALUTATIONID
     *   <li>GuestManager.ID_FNAME
     *   <li>GuestManager.ID_LNAME
     *   <li>GuestManager.ID_TYPE
     *   <li>GuestManager.ID_GENDER
     *   <li>GuestManager.ID_ADDRESS
     *   <li>GuestManager.ID_COUNTRYID
     *   <li>GuestManager.ID_CITY
     *   <li>GuestManager.ID_ZIP
     *   <li>GuestManager.ID_IDTYPEID
     *   <li>GuestManager.ID_IDN
     *   <li>GuestManager.ID_VIPSTATUSID
     *   <li>GuestManager.ID_PHONE
     *   <li>GuestManager.ID_MOBILE
     *   <li>GuestManager.ID_FAX
     *   <li>GuestManager.ID_EMAIL
     *   <li>GuestManager.ID_DOB
     *   <li>GuestManager.ID_SDOB
     *   <li>GuestManager.ID_WEDDINGDATE
     *   <li>GuestManager.ID_NATIONALITYID
     *   <li>GuestManager.ID_CONTRAGENTID
     *   <li>GuestManager.ID_PAYMENTMETHODID
     *   <li>GuestManager.ID_CARDNUM
     *   <li>GuestManager.ID_REGBYID
     *   <li>GuestManager.ID_REGDATE
     *   <li>GuestManager.ID_DELETED
     *   <li>GuestManager.ID_COMPANY
     *   <li>GuestManager.ID_DOCNUM
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public GuestComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        GuestBean b1 = (GuestBean)pObj1;
        GuestBean b2 = (GuestBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case GuestManager.ID_GUESTID:
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
            case GuestManager.ID_SALUTATIONID:
                if (b1.getSalutationid() == null && b2.getSalutationid() != null) {
                    iReturn = -1;
                } else if (b1.getSalutationid() == null && b2.getSalutationid() == null) {
                    iReturn = 0;
                } else if (b1.getSalutationid() != null && b2.getSalutationid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getSalutationid().compareTo(b2.getSalutationid());
                }
                break;
            case GuestManager.ID_FNAME:
                if (b1.getFname() == null && b2.getFname() != null) {
                    iReturn = -1;
                } else if (b1.getFname() == null && b2.getFname() == null) {
                    iReturn = 0;
                } else if (b1.getFname() != null && b2.getFname() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getFname().compareTo(b2.getFname());
                }
                break;
            case GuestManager.ID_LNAME:
                if (b1.getLname() == null && b2.getLname() != null) {
                    iReturn = -1;
                } else if (b1.getLname() == null && b2.getLname() == null) {
                    iReturn = 0;
                } else if (b1.getLname() != null && b2.getLname() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getLname().compareTo(b2.getLname());
                }
                break;
            case GuestManager.ID_TYPE:
                if (b1.getType() == null && b2.getType() != null) {
                    iReturn = -1;
                } else if (b1.getType() == null && b2.getType() == null) {
                    iReturn = 0;
                } else if (b1.getType() != null && b2.getType() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getType().compareTo(b2.getType());
                }
                break;
            case GuestManager.ID_GENDER:
                if (b1.getGender() == null && b2.getGender() != null) {
                    iReturn = -1;
                } else if (b1.getGender() == null && b2.getGender() == null) {
                    iReturn = 0;
                } else if (b1.getGender() != null && b2.getGender() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getGender().compareTo(b2.getGender());
                }
                break;
            case GuestManager.ID_ADDRESS:
                if (b1.getAddress() == null && b2.getAddress() != null) {
                    iReturn = -1;
                } else if (b1.getAddress() == null && b2.getAddress() == null) {
                    iReturn = 0;
                } else if (b1.getAddress() != null && b2.getAddress() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAddress().compareTo(b2.getAddress());
                }
                break;
            case GuestManager.ID_COUNTRYID:
                if (b1.getCountryid() == null && b2.getCountryid() != null) {
                    iReturn = -1;
                } else if (b1.getCountryid() == null && b2.getCountryid() == null) {
                    iReturn = 0;
                } else if (b1.getCountryid() != null && b2.getCountryid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCountryid().compareTo(b2.getCountryid());
                }
                break;
            case GuestManager.ID_CITY:
                if (b1.getCity() == null && b2.getCity() != null) {
                    iReturn = -1;
                } else if (b1.getCity() == null && b2.getCity() == null) {
                    iReturn = 0;
                } else if (b1.getCity() != null && b2.getCity() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCity().compareTo(b2.getCity());
                }
                break;
            case GuestManager.ID_ZIP:
                if (b1.getZip() == null && b2.getZip() != null) {
                    iReturn = -1;
                } else if (b1.getZip() == null && b2.getZip() == null) {
                    iReturn = 0;
                } else if (b1.getZip() != null && b2.getZip() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getZip().compareTo(b2.getZip());
                }
                break;
            case GuestManager.ID_IDTYPEID:
                if (b1.getIdtypeid() == null && b2.getIdtypeid() != null) {
                    iReturn = -1;
                } else if (b1.getIdtypeid() == null && b2.getIdtypeid() == null) {
                    iReturn = 0;
                } else if (b1.getIdtypeid() != null && b2.getIdtypeid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getIdtypeid().compareTo(b2.getIdtypeid());
                }
                break;
            case GuestManager.ID_IDN:
                if (b1.getIdn() == null && b2.getIdn() != null) {
                    iReturn = -1;
                } else if (b1.getIdn() == null && b2.getIdn() == null) {
                    iReturn = 0;
                } else if (b1.getIdn() != null && b2.getIdn() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getIdn().compareTo(b2.getIdn());
                }
                break;
            case GuestManager.ID_VIPSTATUSID:
                if (b1.getVipstatusid() == null && b2.getVipstatusid() != null) {
                    iReturn = -1;
                } else if (b1.getVipstatusid() == null && b2.getVipstatusid() == null) {
                    iReturn = 0;
                } else if (b1.getVipstatusid() != null && b2.getVipstatusid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getVipstatusid().compareTo(b2.getVipstatusid());
                }
                break;
            case GuestManager.ID_PHONE:
                if (b1.getPhone() == null && b2.getPhone() != null) {
                    iReturn = -1;
                } else if (b1.getPhone() == null && b2.getPhone() == null) {
                    iReturn = 0;
                } else if (b1.getPhone() != null && b2.getPhone() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPhone().compareTo(b2.getPhone());
                }
                break;
            case GuestManager.ID_MOBILE:
                if (b1.getMobile() == null && b2.getMobile() != null) {
                    iReturn = -1;
                } else if (b1.getMobile() == null && b2.getMobile() == null) {
                    iReturn = 0;
                } else if (b1.getMobile() != null && b2.getMobile() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getMobile().compareTo(b2.getMobile());
                }
                break;
            case GuestManager.ID_FAX:
                if (b1.getFax() == null && b2.getFax() != null) {
                    iReturn = -1;
                } else if (b1.getFax() == null && b2.getFax() == null) {
                    iReturn = 0;
                } else if (b1.getFax() != null && b2.getFax() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getFax().compareTo(b2.getFax());
                }
                break;
            case GuestManager.ID_EMAIL:
                if (b1.getEmail() == null && b2.getEmail() != null) {
                    iReturn = -1;
                } else if (b1.getEmail() == null && b2.getEmail() == null) {
                    iReturn = 0;
                } else if (b1.getEmail() != null && b2.getEmail() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getEmail().compareTo(b2.getEmail());
                }
                break;
            case GuestManager.ID_DOB:
                if (b1.getDob() == null && b2.getDob() != null) {
                    iReturn = -1;
                } else if (b1.getDob() == null && b2.getDob() == null) {
                    iReturn = 0;
                } else if (b1.getDob() != null && b2.getDob() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getDob().compareTo(b2.getDob());
                }
                break;
            case GuestManager.ID_SDOB:
                if (b1.getSdob() == null && b2.getSdob() != null) {
                    iReturn = -1;
                } else if (b1.getSdob() == null && b2.getSdob() == null) {
                    iReturn = 0;
                } else if (b1.getSdob() != null && b2.getSdob() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getSdob().compareTo(b2.getSdob());
                }
                break;
            case GuestManager.ID_WEDDINGDATE:
                if (b1.getWeddingdate() == null && b2.getWeddingdate() != null) {
                    iReturn = -1;
                } else if (b1.getWeddingdate() == null && b2.getWeddingdate() == null) {
                    iReturn = 0;
                } else if (b1.getWeddingdate() != null && b2.getWeddingdate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getWeddingdate().compareTo(b2.getWeddingdate());
                }
                break;
            case GuestManager.ID_NATIONALITYID:
                if (b1.getNationalityid() == null && b2.getNationalityid() != null) {
                    iReturn = -1;
                } else if (b1.getNationalityid() == null && b2.getNationalityid() == null) {
                    iReturn = 0;
                } else if (b1.getNationalityid() != null && b2.getNationalityid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getNationalityid().compareTo(b2.getNationalityid());
                }
                break;
            case GuestManager.ID_CONTRAGENTID:
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
            case GuestManager.ID_PAYMENTMETHODID:
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
            case GuestManager.ID_CARDNUM:
                if (b1.getCardnum() == null && b2.getCardnum() != null) {
                    iReturn = -1;
                } else if (b1.getCardnum() == null && b2.getCardnum() == null) {
                    iReturn = 0;
                } else if (b1.getCardnum() != null && b2.getCardnum() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCardnum().compareTo(b2.getCardnum());
                }
                break;
            case GuestManager.ID_REGBYID:
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
            case GuestManager.ID_REGDATE:
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
            case GuestManager.ID_COMPANY:
                if (b1.getCompany() == null && b2.getCompany() != null) {
                    iReturn = -1;
                } else if (b1.getCompany() == null && b2.getCompany() == null) {
                    iReturn = 0;
                } else if (b1.getCompany() != null && b2.getCompany() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCompany().compareTo(b2.getCompany());
                }
                break;
            case GuestManager.ID_DOCNUM:
                if (b1.getDocnum() == null && b2.getDocnum() != null) {
                    iReturn = -1;
                } else if (b1.getDocnum() == null && b2.getDocnum() == null) {
                    iReturn = 0;
                } else if (b1.getDocnum() != null && b2.getDocnum() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getDocnum().compareTo(b2.getDocnum());
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
