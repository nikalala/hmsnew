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
 * Comparator class is used to sort the ExtrachargeBean objects.
 */
public class ExtrachargeComparator implements Comparator
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
     * Constructor class for ExtrachargeComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ExtrachargeComparator(ExtrachargeManager.EXTRACHARGEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ExtrachargeManager.ID_EXTRACHARGEID
     *   <li>ExtrachargeManager.ID_CODE
     *   <li>ExtrachargeManager.ID_NAME
     *   <li>ExtrachargeManager.ID_RATE
     *   <li>ExtrachargeManager.ID_ORD
     *   <li>ExtrachargeManager.ID_VOUCHERNO
     *   <li>ExtrachargeManager.ID_WEBDESCRIPTION
     *   <li>ExtrachargeManager.ID_CHARGEAPPLIESON
     *   <li>ExtrachargeManager.ID_EXTRAPOSTINGTYPE
     *   <li>ExtrachargeManager.ID_WEBORD
     *   <li>ExtrachargeManager.ID_REGBYID
     *   <li>ExtrachargeManager.ID_REGDATE
     * </ul>
     */
    public ExtrachargeComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for ExtrachargeComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ExtrachargeComparator(ExtrachargeManager.EXTRACHARGEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ExtrachargeManager.ID_EXTRACHARGEID
     *   <li>ExtrachargeManager.ID_CODE
     *   <li>ExtrachargeManager.ID_NAME
     *   <li>ExtrachargeManager.ID_RATE
     *   <li>ExtrachargeManager.ID_FIXEDPRICE
     *   <li>ExtrachargeManager.ID_ORD
     *   <li>ExtrachargeManager.ID_VOUCHERNO
     *   <li>ExtrachargeManager.ID_WEB
     *   <li>ExtrachargeManager.ID_WEBDESCRIPTION
     *   <li>ExtrachargeManager.ID_CHARGEAPPLIESON
     *   <li>ExtrachargeManager.ID_EXTRAPOSTINGTYPE
     *   <li>ExtrachargeManager.ID_APPLYCHARGEALWAYS
     *   <li>ExtrachargeManager.ID_WEBORD
     *   <li>ExtrachargeManager.ID_REGBYID
     *   <li>ExtrachargeManager.ID_REGDATE
     *   <li>ExtrachargeManager.ID_ACTIVE
     *   <li>ExtrachargeManager.ID_DELETED
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public ExtrachargeComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        ExtrachargeBean b1 = (ExtrachargeBean)pObj1;
        ExtrachargeBean b2 = (ExtrachargeBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case ExtrachargeManager.ID_EXTRACHARGEID:
                if (b1.getExtrachargeid() == null && b2.getExtrachargeid() != null) {
                    iReturn = -1;
                } else if (b1.getExtrachargeid() == null && b2.getExtrachargeid() == null) {
                    iReturn = 0;
                } else if (b1.getExtrachargeid() != null && b2.getExtrachargeid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getExtrachargeid().compareTo(b2.getExtrachargeid());
                }
                break;
            case ExtrachargeManager.ID_CODE:
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
            case ExtrachargeManager.ID_NAME:
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
            case ExtrachargeManager.ID_RATE:
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
            case ExtrachargeManager.ID_ORD:
                if (b1.getOrd() == null && b2.getOrd() != null) {
                    iReturn = -1;
                } else if (b1.getOrd() == null && b2.getOrd() == null) {
                    iReturn = 0;
                } else if (b1.getOrd() != null && b2.getOrd() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getOrd().compareTo(b2.getOrd());
                }
                break;
            case ExtrachargeManager.ID_VOUCHERNO:
                if (b1.getVoucherno() == null && b2.getVoucherno() != null) {
                    iReturn = -1;
                } else if (b1.getVoucherno() == null && b2.getVoucherno() == null) {
                    iReturn = 0;
                } else if (b1.getVoucherno() != null && b2.getVoucherno() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getVoucherno().compareTo(b2.getVoucherno());
                }
                break;
            case ExtrachargeManager.ID_WEBDESCRIPTION:
                if (b1.getWebdescription() == null && b2.getWebdescription() != null) {
                    iReturn = -1;
                } else if (b1.getWebdescription() == null && b2.getWebdescription() == null) {
                    iReturn = 0;
                } else if (b1.getWebdescription() != null && b2.getWebdescription() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getWebdescription().compareTo(b2.getWebdescription());
                }
                break;
            case ExtrachargeManager.ID_CHARGEAPPLIESON:
                if (b1.getChargeapplieson() == null && b2.getChargeapplieson() != null) {
                    iReturn = -1;
                } else if (b1.getChargeapplieson() == null && b2.getChargeapplieson() == null) {
                    iReturn = 0;
                } else if (b1.getChargeapplieson() != null && b2.getChargeapplieson() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getChargeapplieson().compareTo(b2.getChargeapplieson());
                }
                break;
            case ExtrachargeManager.ID_EXTRAPOSTINGTYPE:
                if (b1.getExtrapostingtype() == null && b2.getExtrapostingtype() != null) {
                    iReturn = -1;
                } else if (b1.getExtrapostingtype() == null && b2.getExtrapostingtype() == null) {
                    iReturn = 0;
                } else if (b1.getExtrapostingtype() != null && b2.getExtrapostingtype() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getExtrapostingtype().compareTo(b2.getExtrapostingtype());
                }
                break;
            case ExtrachargeManager.ID_WEBORD:
                if (b1.getWebord() == null && b2.getWebord() != null) {
                    iReturn = -1;
                } else if (b1.getWebord() == null && b2.getWebord() == null) {
                    iReturn = 0;
                } else if (b1.getWebord() != null && b2.getWebord() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getWebord().compareTo(b2.getWebord());
                }
                break;
            case ExtrachargeManager.ID_REGBYID:
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
            case ExtrachargeManager.ID_REGDATE:
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
