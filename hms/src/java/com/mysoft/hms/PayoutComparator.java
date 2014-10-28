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
 * Comparator class is used to sort the PayoutBean objects.
 */
public class PayoutComparator implements Comparator
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
     * Constructor class for PayoutComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new PayoutComparator(PayoutManager.PAYOUTID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>PayoutManager.ID_PAYOUTID
     *   <li>PayoutManager.ID_NAME
     *   <li>PayoutManager.ID_REGBYID
     *   <li>PayoutManager.ID_REGDATE
     * </ul>
     */
    public PayoutComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for PayoutComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new PayoutComparator(PayoutManager.PAYOUTID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>PayoutManager.ID_PAYOUTID
     *   <li>PayoutManager.ID_NAME
     *   <li>PayoutManager.ID_REGBYID
     *   <li>PayoutManager.ID_REGDATE
     *   <li>PayoutManager.ID_ACTIVE
     *   <li>PayoutManager.ID_DETETED
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public PayoutComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        PayoutBean b1 = (PayoutBean)pObj1;
        PayoutBean b2 = (PayoutBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case PayoutManager.ID_PAYOUTID:
                if (b1.getPayoutid() == null && b2.getPayoutid() != null) {
                    iReturn = -1;
                } else if (b1.getPayoutid() == null && b2.getPayoutid() == null) {
                    iReturn = 0;
                } else if (b1.getPayoutid() != null && b2.getPayoutid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPayoutid().compareTo(b2.getPayoutid());
                }
                break;
            case PayoutManager.ID_NAME:
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
            case PayoutManager.ID_REGBYID:
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
            case PayoutManager.ID_REGDATE:
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
