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
 * Comparator class is used to sort the ContragentBean objects.
 */
public class ContragentComparator implements Comparator
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
     * Constructor class for ContragentComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ContragentComparator(ContragentManager.CONTRAGENTID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ContragentManager.ID_CONTRAGENTID
     *   <li>ContragentManager.ID_TYPE
     *   <li>ContragentManager.ID_SALUTATIONID
     *   <li>ContragentManager.ID_FNAME
     *   <li>ContragentManager.ID_LNAME
     *   <li>ContragentManager.ID_NAME
     *   <li>ContragentManager.ID_ADDRESS
     *   <li>ContragentManager.ID_COUNTRYID
     *   <li>ContragentManager.ID_CITY
     *   <li>ContragentManager.ID_ZIP
     *   <li>ContragentManager.ID_PHONE
     *   <li>ContragentManager.ID_FAX
     *   <li>ContragentManager.ID_MOBILE
     *   <li>ContragentManager.ID_EMAIL
     *   <li>ContragentManager.ID_COMMISSIONPLAN
     *   <li>ContragentManager.ID_VAL
     *   <li>ContragentManager.ID_RATE
     *   <li>ContragentManager.ID_OPENBALANCE
     *   <li>ContragentManager.ID_ROOMINVENTORY
     *   <li>ContragentManager.ID_IDN
     *   <li>ContragentManager.ID_CREDITTERM
     *   <li>ContragentManager.ID_CREDITLIMIT
     *   <li>ContragentManager.ID_REGBYID
     *   <li>ContragentManager.ID_REGDATE
     * </ul>
     */
    public ContragentComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for ContragentComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ContragentComparator(ContragentManager.CONTRAGENTID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ContragentManager.ID_CONTRAGENTID
     *   <li>ContragentManager.ID_TYPE
     *   <li>ContragentManager.ID_SALUTATIONID
     *   <li>ContragentManager.ID_FNAME
     *   <li>ContragentManager.ID_LNAME
     *   <li>ContragentManager.ID_NAME
     *   <li>ContragentManager.ID_ADDRESS
     *   <li>ContragentManager.ID_COUNTRYID
     *   <li>ContragentManager.ID_CITY
     *   <li>ContragentManager.ID_ZIP
     *   <li>ContragentManager.ID_PHONE
     *   <li>ContragentManager.ID_FAX
     *   <li>ContragentManager.ID_MOBILE
     *   <li>ContragentManager.ID_EMAIL
     *   <li>ContragentManager.ID_COMMISSIONPLAN
     *   <li>ContragentManager.ID_VAL
     *   <li>ContragentManager.ID_RATE
     *   <li>ContragentManager.ID_OPENBALANCE
     *   <li>ContragentManager.ID_ROOMINVENTORY
     *   <li>ContragentManager.ID_CREATEUSER
     *   <li>ContragentManager.ID_BSOURCE
     *   <li>ContragentManager.ID_CCBLOCK
     *   <li>ContragentManager.ID_IDN
     *   <li>ContragentManager.ID_CREDITTERM
     *   <li>ContragentManager.ID_CREDITLIMIT
     *   <li>ContragentManager.ID_REGBYID
     *   <li>ContragentManager.ID_REGDATE
     *   <li>ContragentManager.ID_DELETED
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public ContragentComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        ContragentBean b1 = (ContragentBean)pObj1;
        ContragentBean b2 = (ContragentBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case ContragentManager.ID_CONTRAGENTID:
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
            case ContragentManager.ID_TYPE:
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
            case ContragentManager.ID_SALUTATIONID:
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
            case ContragentManager.ID_FNAME:
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
            case ContragentManager.ID_LNAME:
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
            case ContragentManager.ID_NAME:
                if (b1.getName() == null && b2.getName() != null) {
                    iReturn = -1;
                } else if (b1.getName() == null && b2.getName() == null) {
                    iReturn = 0;
                } else if (b1.getName() != null && b2.getName() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getName().compareTo(b2.getName());
                }
                break;
            case ContragentManager.ID_ADDRESS:
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
            case ContragentManager.ID_COUNTRYID:
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
            case ContragentManager.ID_CITY:
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
            case ContragentManager.ID_ZIP:
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
            case ContragentManager.ID_PHONE:
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
            case ContragentManager.ID_FAX:
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
            case ContragentManager.ID_MOBILE:
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
            case ContragentManager.ID_EMAIL:
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
            case ContragentManager.ID_COMMISSIONPLAN:
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
            case ContragentManager.ID_VAL:
                if (b1.getVal() == null && b2.getVal() != null) {
                    iReturn = -1;
                } else if (b1.getVal() == null && b2.getVal() == null) {
                    iReturn = 0;
                } else if (b1.getVal() != null && b2.getVal() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getVal().compareTo(b2.getVal());
                }
                break;
            case ContragentManager.ID_RATE:
                if (b1.getRate() == null && b2.getRate() != null) {
                    iReturn = -1;
                } else if (b1.getRate() == null && b2.getRate() == null) {
                    iReturn = 0;
                } else if (b1.getRate() != null && b2.getRate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRate().compareTo(b2.getRate());
                }
                break;
            case ContragentManager.ID_OPENBALANCE:
                if (b1.getOpenbalance() == null && b2.getOpenbalance() != null) {
                    iReturn = -1;
                } else if (b1.getOpenbalance() == null && b2.getOpenbalance() == null) {
                    iReturn = 0;
                } else if (b1.getOpenbalance() != null && b2.getOpenbalance() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getOpenbalance().compareTo(b2.getOpenbalance());
                }
                break;
            case ContragentManager.ID_ROOMINVENTORY:
                if (b1.getRoominventory() == null && b2.getRoominventory() != null) {
                    iReturn = -1;
                } else if (b1.getRoominventory() == null && b2.getRoominventory() == null) {
                    iReturn = 0;
                } else if (b1.getRoominventory() != null && b2.getRoominventory() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRoominventory().compareTo(b2.getRoominventory());
                }
                break;
            case ContragentManager.ID_IDN:
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
            case ContragentManager.ID_CREDITTERM:
                if (b1.getCreditterm() == null && b2.getCreditterm() != null) {
                    iReturn = -1;
                } else if (b1.getCreditterm() == null && b2.getCreditterm() == null) {
                    iReturn = 0;
                } else if (b1.getCreditterm() != null && b2.getCreditterm() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCreditterm().compareTo(b2.getCreditterm());
                }
                break;
            case ContragentManager.ID_CREDITLIMIT:
                if (b1.getCreditlimit() == null && b2.getCreditlimit() != null) {
                    iReturn = -1;
                } else if (b1.getCreditlimit() == null && b2.getCreditlimit() == null) {
                    iReturn = 0;
                } else if (b1.getCreditlimit() != null && b2.getCreditlimit() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCreditlimit().compareTo(b2.getCreditlimit());
                }
                break;
            case ContragentManager.ID_REGBYID:
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
            case ContragentManager.ID_REGDATE:
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
