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
 * Comparator class is used to sort the HotelBean objects.
 */
public class HotelComparator implements Comparator
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
     * Constructor class for HotelComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new HotelComparator(HotelManager.HOTELID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>HotelManager.ID_HOTELID
     *   <li>HotelManager.ID_NAME
     *   <li>HotelManager.ID_ADDRESS1
     *   <li>HotelManager.ID_ADDRESS2
     *   <li>HotelManager.ID_COUNTRYID
     *   <li>HotelManager.ID_CITY
     *   <li>HotelManager.ID_ZIP
     *   <li>HotelManager.ID_PHONE
     *   <li>HotelManager.ID_RPHONE
     *   <li>HotelManager.ID_FAX
     *   <li>HotelManager.ID_EMAIL
     *   <li>HotelManager.ID_PROPERTYTYPE
     *   <li>HotelManager.ID_LOGO
     *   <li>HotelManager.ID_URL
     *   <li>HotelManager.ID_GRADE
     *   <li>HotelManager.ID_IDN
     *   <li>HotelManager.ID_REGNO1
     *   <li>HotelManager.ID_REGNO2
     *   <li>HotelManager.ID_REGNO3
     * </ul>
     */
    public HotelComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for HotelComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new HotelComparator(HotelManager.HOTELID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>HotelManager.ID_HOTELID
     *   <li>HotelManager.ID_NAME
     *   <li>HotelManager.ID_ADDRESS1
     *   <li>HotelManager.ID_ADDRESS2
     *   <li>HotelManager.ID_COUNTRYID
     *   <li>HotelManager.ID_CITY
     *   <li>HotelManager.ID_ZIP
     *   <li>HotelManager.ID_PHONE
     *   <li>HotelManager.ID_RPHONE
     *   <li>HotelManager.ID_FAX
     *   <li>HotelManager.ID_EMAIL
     *   <li>HotelManager.ID_PROPERTYTYPE
     *   <li>HotelManager.ID_LOGO
     *   <li>HotelManager.ID_URL
     *   <li>HotelManager.ID_GRADE
     *   <li>HotelManager.ID_IDN
     *   <li>HotelManager.ID_REGNO1
     *   <li>HotelManager.ID_REGNO2
     *   <li>HotelManager.ID_REGNO3
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public HotelComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        HotelBean b1 = (HotelBean)pObj1;
        HotelBean b2 = (HotelBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case HotelManager.ID_HOTELID:
                if (b1.getHotelid() == null && b2.getHotelid() != null) {
                    iReturn = -1;
                } else if (b1.getHotelid() == null && b2.getHotelid() == null) {
                    iReturn = 0;
                } else if (b1.getHotelid() != null && b2.getHotelid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getHotelid().compareTo(b2.getHotelid());
                }
                break;
            case HotelManager.ID_NAME:
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
            case HotelManager.ID_ADDRESS1:
                if (b1.getAddress1() == null && b2.getAddress1() != null) {
                    iReturn = -1;
                } else if (b1.getAddress1() == null && b2.getAddress1() == null) {
                    iReturn = 0;
                } else if (b1.getAddress1() != null && b2.getAddress1() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAddress1().compareTo(b2.getAddress1());
                }
                break;
            case HotelManager.ID_ADDRESS2:
                if (b1.getAddress2() == null && b2.getAddress2() != null) {
                    iReturn = -1;
                } else if (b1.getAddress2() == null && b2.getAddress2() == null) {
                    iReturn = 0;
                } else if (b1.getAddress2() != null && b2.getAddress2() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAddress2().compareTo(b2.getAddress2());
                }
                break;
            case HotelManager.ID_COUNTRYID:
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
            case HotelManager.ID_CITY:
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
            case HotelManager.ID_ZIP:
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
            case HotelManager.ID_PHONE:
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
            case HotelManager.ID_RPHONE:
                if (b1.getRphone() == null && b2.getRphone() != null) {
                    iReturn = -1;
                } else if (b1.getRphone() == null && b2.getRphone() == null) {
                    iReturn = 0;
                } else if (b1.getRphone() != null && b2.getRphone() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRphone().compareTo(b2.getRphone());
                }
                break;
            case HotelManager.ID_FAX:
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
            case HotelManager.ID_EMAIL:
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
            case HotelManager.ID_PROPERTYTYPE:
                if (b1.getPropertytype() == null && b2.getPropertytype() != null) {
                    iReturn = -1;
                } else if (b1.getPropertytype() == null && b2.getPropertytype() == null) {
                    iReturn = 0;
                } else if (b1.getPropertytype() != null && b2.getPropertytype() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPropertytype().compareTo(b2.getPropertytype());
                }
                break;
            case HotelManager.ID_LOGO:
                if (b1.getLogo() == null && b2.getLogo() != null) {
                    iReturn = -1;
                } else if (b1.getLogo() == null && b2.getLogo() == null) {
                    iReturn = 0;
                } else if (b1.getLogo() != null && b2.getLogo() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getLogo().compareTo(b2.getLogo());
                }
                break;
            case HotelManager.ID_URL:
                if (b1.getUrl() == null && b2.getUrl() != null) {
                    iReturn = -1;
                } else if (b1.getUrl() == null && b2.getUrl() == null) {
                    iReturn = 0;
                } else if (b1.getUrl() != null && b2.getUrl() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getUrl().compareTo(b2.getUrl());
                }
                break;
            case HotelManager.ID_GRADE:
                if (b1.getGrade() == null && b2.getGrade() != null) {
                    iReturn = -1;
                } else if (b1.getGrade() == null && b2.getGrade() == null) {
                    iReturn = 0;
                } else if (b1.getGrade() != null && b2.getGrade() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getGrade().compareTo(b2.getGrade());
                }
                break;
            case HotelManager.ID_IDN:
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
            case HotelManager.ID_REGNO1:
                if (b1.getRegno1() == null && b2.getRegno1() != null) {
                    iReturn = -1;
                } else if (b1.getRegno1() == null && b2.getRegno1() == null) {
                    iReturn = 0;
                } else if (b1.getRegno1() != null && b2.getRegno1() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRegno1().compareTo(b2.getRegno1());
                }
                break;
            case HotelManager.ID_REGNO2:
                if (b1.getRegno2() == null && b2.getRegno2() != null) {
                    iReturn = -1;
                } else if (b1.getRegno2() == null && b2.getRegno2() == null) {
                    iReturn = 0;
                } else if (b1.getRegno2() != null && b2.getRegno2() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRegno2().compareTo(b2.getRegno2());
                }
                break;
            case HotelManager.ID_REGNO3:
                if (b1.getRegno3() == null && b2.getRegno3() != null) {
                    iReturn = -1;
                } else if (b1.getRegno3() == null && b2.getRegno3() == null) {
                    iReturn = 0;
                } else if (b1.getRegno3() != null && b2.getRegno3() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRegno3().compareTo(b2.getRegno3());
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
