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
 * Comparator class is used to sort the PaytypeBean objects.
 */
public class PaytypeComparator implements Comparator
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
     * Constructor class for PaytypeComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new PaytypeComparator(PaytypeManager.PAYTYPEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>PaytypeManager.ID_PAYTYPEID
     *   <li>PaytypeManager.ID_NAME
     * </ul>
     */
    public PaytypeComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for PaytypeComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new PaytypeComparator(PaytypeManager.PAYTYPEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>PaytypeManager.ID_PAYTYPEID
     *   <li>PaytypeManager.ID_NAME
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public PaytypeComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        PaytypeBean b1 = (PaytypeBean)pObj1;
        PaytypeBean b2 = (PaytypeBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case PaytypeManager.ID_PAYTYPEID:
                if (b1.getPaytypeid() == null && b2.getPaytypeid() != null) {
                    iReturn = -1;
                } else if (b1.getPaytypeid() == null && b2.getPaytypeid() == null) {
                    iReturn = 0;
                } else if (b1.getPaytypeid() != null && b2.getPaytypeid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPaytypeid().compareTo(b2.getPaytypeid());
                }
                break;
            case PaytypeManager.ID_NAME:
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
            default: 
                throw new IllegalArgumentException("Type passed for the field is not supported");
        }

        return bReverse ? (-1 * iReturn) : iReturn;
    }
// class+ 

// class- 

}
