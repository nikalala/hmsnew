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
 * Comparator class is used to sort the SproductpriceBean objects.
 */
public class SproductpriceComparator implements Comparator
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
     * Constructor class for SproductpriceComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new SproductpriceComparator(SproductpriceManager.SPRODUCTPRICEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>SproductpriceManager.ID_SPRODUCTPRICEID
     *   <li>SproductpriceManager.ID_SPRODUCTID
     *   <li>SproductpriceManager.ID_CALCDATE
     *   <li>SproductpriceManager.ID_PRICE
     * </ul>
     */
    public SproductpriceComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for SproductpriceComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new SproductpriceComparator(SproductpriceManager.SPRODUCTPRICEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>SproductpriceManager.ID_SPRODUCTPRICEID
     *   <li>SproductpriceManager.ID_SPRODUCTID
     *   <li>SproductpriceManager.ID_CALCDATE
     *   <li>SproductpriceManager.ID_PRICE
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public SproductpriceComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        SproductpriceBean b1 = (SproductpriceBean)pObj1;
        SproductpriceBean b2 = (SproductpriceBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case SproductpriceManager.ID_SPRODUCTPRICEID:
                if (b1.getSproductpriceid() == null && b2.getSproductpriceid() != null) {
                    iReturn = -1;
                } else if (b1.getSproductpriceid() == null && b2.getSproductpriceid() == null) {
                    iReturn = 0;
                } else if (b1.getSproductpriceid() != null && b2.getSproductpriceid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getSproductpriceid().compareTo(b2.getSproductpriceid());
                }
                break;
            case SproductpriceManager.ID_SPRODUCTID:
                if (b1.getSproductid() == null && b2.getSproductid() != null) {
                    iReturn = -1;
                } else if (b1.getSproductid() == null && b2.getSproductid() == null) {
                    iReturn = 0;
                } else if (b1.getSproductid() != null && b2.getSproductid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getSproductid().compareTo(b2.getSproductid());
                }
                break;
            case SproductpriceManager.ID_CALCDATE:
                if (b1.getCalcdate() == null && b2.getCalcdate() != null) {
                    iReturn = -1;
                } else if (b1.getCalcdate() == null && b2.getCalcdate() == null) {
                    iReturn = 0;
                } else if (b1.getCalcdate() != null && b2.getCalcdate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCalcdate().compareTo(b2.getCalcdate());
                }
                break;
            case SproductpriceManager.ID_PRICE:
                if (b1.getPrice() == null && b2.getPrice() != null) {
                    iReturn = -1;
                } else if (b1.getPrice() == null && b2.getPrice() == null) {
                    iReturn = 0;
                } else if (b1.getPrice() != null && b2.getPrice() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPrice().compareTo(b2.getPrice());
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
