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
 * Comparator class is used to sort the TaxsequenceBean objects.
 */
public class TaxsequenceComparator implements Comparator
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
     * Constructor class for TaxsequenceComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new TaxsequenceComparator(TaxsequenceManager.TAXID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>TaxsequenceManager.ID_TAXID
     *   <li>TaxsequenceManager.ID_AFTERID
     * </ul>
     */
    public TaxsequenceComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for TaxsequenceComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new TaxsequenceComparator(TaxsequenceManager.TAXID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>TaxsequenceManager.ID_TAXID
     *   <li>TaxsequenceManager.ID_AFTERID
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public TaxsequenceComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        TaxsequenceBean b1 = (TaxsequenceBean)pObj1;
        TaxsequenceBean b2 = (TaxsequenceBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case TaxsequenceManager.ID_TAXID:
                if (b1.getTaxid() == null && b2.getTaxid() != null) {
                    iReturn = -1;
                } else if (b1.getTaxid() == null && b2.getTaxid() == null) {
                    iReturn = 0;
                } else if (b1.getTaxid() != null && b2.getTaxid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getTaxid().compareTo(b2.getTaxid());
                }
                break;
            case TaxsequenceManager.ID_AFTERID:
                if (b1.getAfterid() == null && b2.getAfterid() != null) {
                    iReturn = -1;
                } else if (b1.getAfterid() == null && b2.getAfterid() == null) {
                    iReturn = 0;
                } else if (b1.getAfterid() != null && b2.getAfterid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAfterid().compareTo(b2.getAfterid());
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
