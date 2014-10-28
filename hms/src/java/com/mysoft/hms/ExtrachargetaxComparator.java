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
 * Comparator class is used to sort the ExtrachargetaxBean objects.
 */
public class ExtrachargetaxComparator implements Comparator
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
     * Constructor class for ExtrachargetaxComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ExtrachargetaxComparator(ExtrachargetaxManager.EXTRACHARGEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ExtrachargetaxManager.ID_EXTRACHARGEID
     *   <li>ExtrachargetaxManager.ID_TAXID
     * </ul>
     */
    public ExtrachargetaxComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for ExtrachargetaxComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ExtrachargetaxComparator(ExtrachargetaxManager.EXTRACHARGEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ExtrachargetaxManager.ID_EXTRACHARGEID
     *   <li>ExtrachargetaxManager.ID_TAXID
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public ExtrachargetaxComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        ExtrachargetaxBean b1 = (ExtrachargetaxBean)pObj1;
        ExtrachargetaxBean b2 = (ExtrachargetaxBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case ExtrachargetaxManager.ID_EXTRACHARGEID:
                if (b1.getExtrachargeid() == null && b2.getExtrachargeid() != null) {
                    iReturn = -1;
                } else if (b1.getExtrachargeid() == null && b2.getExtrachargeid() == null) {
                    iReturn = 0;
                } else if (b1.getExtrachargeid() != null && b2.getExtrachargeid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getExtrachargeid().compareTo(b2.getExtrachargeid());
                }
                break;
            case ExtrachargetaxManager.ID_TAXID:
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
            default: 
                throw new IllegalArgumentException("Type passed for the field is not supported");
        }

        return bReverse ? (-1 * iReturn) : iReturn;
    }
// class+ 

// class- 
}
