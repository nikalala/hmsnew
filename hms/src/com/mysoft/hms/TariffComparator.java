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
 * Comparator class is used to sort the TariffBean objects.
 */
public class TariffComparator implements Comparator
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
     * Constructor class for TariffComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new TariffComparator(TariffManager.TARIFFID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>TariffManager.ID_TARIFFID
     *   <li>TariffManager.ID_ROOMTYPEID
     *   <li>TariffManager.ID_TARIFFTYPEID
     *   <li>TariffManager.ID_SEASONID
     *   <li>TariffManager.ID_SOURCEID
     *   <li>TariffManager.ID_AMOUNT
     *   <li>TariffManager.ID_AMOUNTADULT
     *   <li>TariffManager.ID_AMOUNTCHILD
     * </ul>
     */
    public TariffComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for TariffComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new TariffComparator(TariffManager.TARIFFID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>TariffManager.ID_TARIFFID
     *   <li>TariffManager.ID_ROOMTYPEID
     *   <li>TariffManager.ID_TARIFFTYPEID
     *   <li>TariffManager.ID_SEASONID
     *   <li>TariffManager.ID_SOURCEID
     *   <li>TariffManager.ID_AMOUNT
     *   <li>TariffManager.ID_AMOUNTADULT
     *   <li>TariffManager.ID_AMOUNTCHILD
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public TariffComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        TariffBean b1 = (TariffBean)pObj1;
        TariffBean b2 = (TariffBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case TariffManager.ID_TARIFFID:
                if (b1.getTariffid() == null && b2.getTariffid() != null) {
                    iReturn = -1;
                } else if (b1.getTariffid() == null && b2.getTariffid() == null) {
                    iReturn = 0;
                } else if (b1.getTariffid() != null && b2.getTariffid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getTariffid().compareTo(b2.getTariffid());
                }
                break;
            case TariffManager.ID_ROOMTYPEID:
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
            case TariffManager.ID_TARIFFTYPEID:
                if (b1.getTarifftypeid() == null && b2.getTarifftypeid() != null) {
                    iReturn = -1;
                } else if (b1.getTarifftypeid() == null && b2.getTarifftypeid() == null) {
                    iReturn = 0;
                } else if (b1.getTarifftypeid() != null && b2.getTarifftypeid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getTarifftypeid().compareTo(b2.getTarifftypeid());
                }
                break;
            case TariffManager.ID_SEASONID:
                if (b1.getSeasonid() == null && b2.getSeasonid() != null) {
                    iReturn = -1;
                } else if (b1.getSeasonid() == null && b2.getSeasonid() == null) {
                    iReturn = 0;
                } else if (b1.getSeasonid() != null && b2.getSeasonid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getSeasonid().compareTo(b2.getSeasonid());
                }
                break;
            case TariffManager.ID_SOURCEID:
                if (b1.getSourceid() == null && b2.getSourceid() != null) {
                    iReturn = -1;
                } else if (b1.getSourceid() == null && b2.getSourceid() == null) {
                    iReturn = 0;
                } else if (b1.getSourceid() != null && b2.getSourceid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getSourceid().compareTo(b2.getSourceid());
                }
                break;
            case TariffManager.ID_AMOUNT:
                if (b1.getAmount() == null && b2.getAmount() != null) {
                    iReturn = -1;
                } else if (b1.getAmount() == null && b2.getAmount() == null) {
                    iReturn = 0;
                } else if (b1.getAmount() != null && b2.getAmount() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAmount().compareTo(b2.getAmount());
                }
                break;
            case TariffManager.ID_AMOUNTADULT:
                if (b1.getAmountadult() == null && b2.getAmountadult() != null) {
                    iReturn = -1;
                } else if (b1.getAmountadult() == null && b2.getAmountadult() == null) {
                    iReturn = 0;
                } else if (b1.getAmountadult() != null && b2.getAmountadult() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAmountadult().compareTo(b2.getAmountadult());
                }
                break;
            case TariffManager.ID_AMOUNTCHILD:
                if (b1.getAmountchild() == null && b2.getAmountchild() != null) {
                    iReturn = -1;
                } else if (b1.getAmountchild() == null && b2.getAmountchild() == null) {
                    iReturn = 0;
                } else if (b1.getAmountchild() != null && b2.getAmountchild() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAmountchild().compareTo(b2.getAmountchild());
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
