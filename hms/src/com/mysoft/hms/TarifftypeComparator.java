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
 * Comparator class is used to sort the TarifftypeBean objects.
 */
public class TarifftypeComparator implements Comparator
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
     * Constructor class for TarifftypeComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new TarifftypeComparator(TarifftypeManager.TARIFFTYPEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>TarifftypeManager.ID_TARIFFTYPEID
     *   <li>TarifftypeManager.ID_NICKNAME
     *   <li>TarifftypeManager.ID_NAME
     *   <li>TarifftypeManager.ID_MAXADOLT
     *   <li>TarifftypeManager.ID_MINNIGHT
     *   <li>TarifftypeManager.ID_ORD
     *   <li>TarifftypeManager.ID_NUMNIGHTS
     * </ul>
     */
    public TarifftypeComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for TarifftypeComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new TarifftypeComparator(TarifftypeManager.TARIFFTYPEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>TarifftypeManager.ID_TARIFFTYPEID
     *   <li>TarifftypeManager.ID_NICKNAME
     *   <li>TarifftypeManager.ID_NAME
     *   <li>TarifftypeManager.ID_MAXADOLT
     *   <li>TarifftypeManager.ID_MINNIGHT
     *   <li>TarifftypeManager.ID_ORD
     *   <li>TarifftypeManager.ID_NUMNIGHTS
     *   <li>TarifftypeManager.ID_STATUS
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public TarifftypeComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        TarifftypeBean b1 = (TarifftypeBean)pObj1;
        TarifftypeBean b2 = (TarifftypeBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case TarifftypeManager.ID_TARIFFTYPEID:
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
            case TarifftypeManager.ID_NICKNAME:
                if (b1.getNickname() == null && b2.getNickname() != null) {
                    iReturn = -1;
                } else if (b1.getNickname() == null && b2.getNickname() == null) {
                    iReturn = 0;
                } else if (b1.getNickname() != null && b2.getNickname() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getNickname().compareTo(b2.getNickname());
                }
                break;
            case TarifftypeManager.ID_NAME:
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
            case TarifftypeManager.ID_MAXADOLT:
                if (b1.getMaxadolt() == null && b2.getMaxadolt() != null) {
                    iReturn = -1;
                } else if (b1.getMaxadolt() == null && b2.getMaxadolt() == null) {
                    iReturn = 0;
                } else if (b1.getMaxadolt() != null && b2.getMaxadolt() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getMaxadolt().compareTo(b2.getMaxadolt());
                }
                break;
            case TarifftypeManager.ID_MINNIGHT:
                if (b1.getMinnight() == null && b2.getMinnight() != null) {
                    iReturn = -1;
                } else if (b1.getMinnight() == null && b2.getMinnight() == null) {
                    iReturn = 0;
                } else if (b1.getMinnight() != null && b2.getMinnight() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getMinnight().compareTo(b2.getMinnight());
                }
                break;
            case TarifftypeManager.ID_ORD:
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
            case TarifftypeManager.ID_NUMNIGHTS:
                if (b1.getNumnights() == null && b2.getNumnights() != null) {
                    iReturn = -1;
                } else if (b1.getNumnights() == null && b2.getNumnights() == null) {
                    iReturn = 0;
                } else if (b1.getNumnights() != null && b2.getNumnights() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getNumnights().compareTo(b2.getNumnights());
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
