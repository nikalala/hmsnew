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
 * Comparator class is used to sort the SalutationBean objects.
 */
public class SalutationComparator implements Comparator
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
     * Constructor class for SalutationComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new SalutationComparator(SalutationManager.SALUTATIONID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>SalutationManager.ID_SALUTATIONID
     *   <li>SalutationManager.ID_NAME
     * </ul>
     */
    public SalutationComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for SalutationComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new SalutationComparator(SalutationManager.SALUTATIONID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>SalutationManager.ID_SALUTATIONID
     *   <li>SalutationManager.ID_NAME
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public SalutationComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        SalutationBean b1 = (SalutationBean)pObj1;
        SalutationBean b2 = (SalutationBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case SalutationManager.ID_SALUTATIONID:
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
            case SalutationManager.ID_NAME:
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
