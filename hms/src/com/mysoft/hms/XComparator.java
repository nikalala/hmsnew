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
 * Comparator class is used to sort the XBean objects.
 */
public class XComparator implements Comparator
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
     * Constructor class for XComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new XComparator(XManager.SUM, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>XManager.ID_SUM
     * </ul>
     */
    public XComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for XComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new XComparator(XManager.SUM, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>XManager.ID_SUM
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public XComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        XBean b1 = (XBean)pObj1;
        XBean b2 = (XBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case XManager.ID_SUM:
                if (b1.getSum() == null && b2.getSum() != null) {
                    iReturn = -1;
                } else if (b1.getSum() == null && b2.getSum() == null) {
                    iReturn = 0;
                } else if (b1.getSum() != null && b2.getSum() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getSum().compareTo(b2.getSum());
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
