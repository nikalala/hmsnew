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
 * Comparator class is used to sort the ExtrachargefolioBean objects.
 */
public class ExtrachargefolioComparator implements Comparator
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
     * Constructor class for ExtrachargefolioComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ExtrachargefolioComparator(ExtrachargefolioManager.FOLIOITEMID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ExtrachargefolioManager.ID_FOLIOITEMID
     *   <li>ExtrachargefolioManager.ID_EXTRACHARGEID
     *   <li>ExtrachargefolioManager.ID_RATE
     *   <li>ExtrachargefolioManager.ID_POSTINGTYPE
     *   <li>ExtrachargefolioManager.ID_CHARGEAPPLYRIESON
     *   <li>ExtrachargefolioManager.ID_ADULT
     *   <li>ExtrachargefolioManager.ID_CHILD
     *   <li>ExtrachargefolioManager.ID_QTY
     * </ul>
     */
    public ExtrachargefolioComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for ExtrachargefolioComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ExtrachargefolioComparator(ExtrachargefolioManager.FOLIOITEMID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ExtrachargefolioManager.ID_FOLIOITEMID
     *   <li>ExtrachargefolioManager.ID_EXTRACHARGEID
     *   <li>ExtrachargefolioManager.ID_RATE
     *   <li>ExtrachargefolioManager.ID_POSTINGTYPE
     *   <li>ExtrachargefolioManager.ID_CHARGEAPPLYRIESON
     *   <li>ExtrachargefolioManager.ID_ADULT
     *   <li>ExtrachargefolioManager.ID_CHILD
     *   <li>ExtrachargefolioManager.ID_QTY
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public ExtrachargefolioComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        ExtrachargefolioBean b1 = (ExtrachargefolioBean)pObj1;
        ExtrachargefolioBean b2 = (ExtrachargefolioBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case ExtrachargefolioManager.ID_FOLIOITEMID:
                if (b1.getFolioitemid() == null && b2.getFolioitemid() != null) {
                    iReturn = -1;
                } else if (b1.getFolioitemid() == null && b2.getFolioitemid() == null) {
                    iReturn = 0;
                } else if (b1.getFolioitemid() != null && b2.getFolioitemid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getFolioitemid().compareTo(b2.getFolioitemid());
                }
                break;
            case ExtrachargefolioManager.ID_EXTRACHARGEID:
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
            case ExtrachargefolioManager.ID_RATE:
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
            case ExtrachargefolioManager.ID_POSTINGTYPE:
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
            case ExtrachargefolioManager.ID_CHARGEAPPLYRIESON:
                if (b1.getChargeapplyrieson() == null && b2.getChargeapplyrieson() != null) {
                    iReturn = -1;
                } else if (b1.getChargeapplyrieson() == null && b2.getChargeapplyrieson() == null) {
                    iReturn = 0;
                } else if (b1.getChargeapplyrieson() != null && b2.getChargeapplyrieson() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getChargeapplyrieson().compareTo(b2.getChargeapplyrieson());
                }
                break;
            case ExtrachargefolioManager.ID_ADULT:
                if (b1.getAdult() == null && b2.getAdult() != null) {
                    iReturn = -1;
                } else if (b1.getAdult() == null && b2.getAdult() == null) {
                    iReturn = 0;
                } else if (b1.getAdult() != null && b2.getAdult() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAdult().compareTo(b2.getAdult());
                }
                break;
            case ExtrachargefolioManager.ID_CHILD:
                if (b1.getChild() == null && b2.getChild() != null) {
                    iReturn = -1;
                } else if (b1.getChild() == null && b2.getChild() == null) {
                    iReturn = 0;
                } else if (b1.getChild() != null && b2.getChild() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getChild().compareTo(b2.getChild());
                }
                break;
            case ExtrachargefolioManager.ID_QTY:
                if (b1.getQty() == null && b2.getQty() != null) {
                    iReturn = -1;
                } else if (b1.getQty() == null && b2.getQty() == null) {
                    iReturn = 0;
                } else if (b1.getQty() != null && b2.getQty() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getQty().compareTo(b2.getQty());
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
