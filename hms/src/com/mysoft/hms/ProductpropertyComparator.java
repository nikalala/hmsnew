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
 * Comparator class is used to sort the ProductpropertyBean objects.
 */
public class ProductpropertyComparator implements Comparator
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
     * Constructor class for ProductpropertyComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ProductpropertyComparator(ProductpropertyManager.PRODUCTPROPERTYID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ProductpropertyManager.ID_PRODUCTPROPERTYID
     *   <li>ProductpropertyManager.ID_PRODUCTTYPEID
     *   <li>ProductpropertyManager.ID_NAME
     *   <li>ProductpropertyManager.ID_TYPE
     * </ul>
     */
    public ProductpropertyComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for ProductpropertyComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ProductpropertyComparator(ProductpropertyManager.PRODUCTPROPERTYID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ProductpropertyManager.ID_PRODUCTPROPERTYID
     *   <li>ProductpropertyManager.ID_PRODUCTTYPEID
     *   <li>ProductpropertyManager.ID_NAME
     *   <li>ProductpropertyManager.ID_TYPE
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public ProductpropertyComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        ProductpropertyBean b1 = (ProductpropertyBean)pObj1;
        ProductpropertyBean b2 = (ProductpropertyBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case ProductpropertyManager.ID_PRODUCTPROPERTYID:
                if (b1.getProductpropertyid() == null && b2.getProductpropertyid() != null) {
                    iReturn = -1;
                } else if (b1.getProductpropertyid() == null && b2.getProductpropertyid() == null) {
                    iReturn = 0;
                } else if (b1.getProductpropertyid() != null && b2.getProductpropertyid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getProductpropertyid().compareTo(b2.getProductpropertyid());
                }
                break;
            case ProductpropertyManager.ID_PRODUCTTYPEID:
                if (b1.getProducttypeid() == null && b2.getProducttypeid() != null) {
                    iReturn = -1;
                } else if (b1.getProducttypeid() == null && b2.getProducttypeid() == null) {
                    iReturn = 0;
                } else if (b1.getProducttypeid() != null && b2.getProducttypeid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getProducttypeid().compareTo(b2.getProducttypeid());
                }
                break;
            case ProductpropertyManager.ID_NAME:
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
            case ProductpropertyManager.ID_TYPE:
                if (b1.getType() == null && b2.getType() != null) {
                    iReturn = -1;
                } else if (b1.getType() == null && b2.getType() == null) {
                    iReturn = 0;
                } else if (b1.getType() != null && b2.getType() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getType().compareTo(b2.getType());
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