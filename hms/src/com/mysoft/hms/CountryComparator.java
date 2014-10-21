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
 * Comparator class is used to sort the CountryBean objects.
 */
public class CountryComparator implements Comparator
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
     * Constructor class for CountryComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new CountryComparator(CountryManager.COUNTRYID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>CountryManager.ID_COUNTRYID
     *   <li>CountryManager.ID_NAME
     *   <li>CountryManager.ID_CHANGEBYID
     *   <li>CountryManager.ID_CHANGEDATE
     *   <li>CountryManager.ID_CODE
     *   <li>CountryManager.ID_EXT
     * </ul>
     */
    public CountryComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for CountryComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new CountryComparator(CountryManager.COUNTRYID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>CountryManager.ID_COUNTRYID
     *   <li>CountryManager.ID_NAME
     *   <li>CountryManager.ID_CHANGEBYID
     *   <li>CountryManager.ID_CHANGEDATE
     *   <li>CountryManager.ID_CODE
     *   <li>CountryManager.ID_EXT
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public CountryComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        CountryBean b1 = (CountryBean)pObj1;
        CountryBean b2 = (CountryBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case CountryManager.ID_COUNTRYID:
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
            case CountryManager.ID_NAME:
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
            case CountryManager.ID_CHANGEBYID:
                if (b1.getChangebyid() == null && b2.getChangebyid() != null) {
                    iReturn = -1;
                } else if (b1.getChangebyid() == null && b2.getChangebyid() == null) {
                    iReturn = 0;
                } else if (b1.getChangebyid() != null && b2.getChangebyid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getChangebyid().compareTo(b2.getChangebyid());
                }
                break;
            case CountryManager.ID_CHANGEDATE:
                if (b1.getChangedate() == null && b2.getChangedate() != null) {
                    iReturn = -1;
                } else if (b1.getChangedate() == null && b2.getChangedate() == null) {
                    iReturn = 0;
                } else if (b1.getChangedate() != null && b2.getChangedate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getChangedate().compareTo(b2.getChangedate());
                }
                break;
            case CountryManager.ID_CODE:
                if (b1.getCode() == null && b2.getCode() != null) {
                    iReturn = -1;
                } else if (b1.getCode() == null && b2.getCode() == null) {
                    iReturn = 0;
                } else if (b1.getCode() != null && b2.getCode() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCode().compareTo(b2.getCode());
                }
                break;
            case CountryManager.ID_EXT:
                if (b1.getExt() == null && b2.getExt() != null) {
                    iReturn = -1;
                } else if (b1.getExt() == null && b2.getExt() == null) {
                    iReturn = 0;
                } else if (b1.getExt() != null && b2.getExt() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getExt().compareTo(b2.getExt());
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
