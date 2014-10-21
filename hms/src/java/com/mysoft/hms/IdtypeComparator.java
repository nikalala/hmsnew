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
 * Comparator class is used to sort the IdtypeBean objects.
 */
public class IdtypeComparator implements Comparator
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
     * Constructor class for IdtypeComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new IdtypeComparator(IdtypeManager.IDTYPEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>IdtypeManager.ID_IDTYPEID
     *   <li>IdtypeManager.ID_NAME
     * </ul>
     */
    public IdtypeComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for IdtypeComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new IdtypeComparator(IdtypeManager.IDTYPEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>IdtypeManager.ID_IDTYPEID
     *   <li>IdtypeManager.ID_NAME
     *   <li>IdtypeManager.ID_ACTIVE
     *   <li>IdtypeManager.ID_DELETED
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public IdtypeComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        IdtypeBean b1 = (IdtypeBean)pObj1;
        IdtypeBean b2 = (IdtypeBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case IdtypeManager.ID_IDTYPEID:
                if (b1.getIdtypeid() == null && b2.getIdtypeid() != null) {
                    iReturn = -1;
                } else if (b1.getIdtypeid() == null && b2.getIdtypeid() == null) {
                    iReturn = 0;
                } else if (b1.getIdtypeid() != null && b2.getIdtypeid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getIdtypeid().compareTo(b2.getIdtypeid());
                }
                break;
            case IdtypeManager.ID_NAME:
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
