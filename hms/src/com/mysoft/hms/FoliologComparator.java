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
 * Comparator class is used to sort the FoliologBean objects.
 */
public class FoliologComparator implements Comparator
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
     * Constructor class for FoliologComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new FoliologComparator(FoliologManager.FOLIOLOGID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>FoliologManager.ID_FOLIOLOGID
     *   <li>FoliologManager.ID_LOGNAME
     *   <li>FoliologManager.ID_CONTENT
     *   <li>FoliologManager.ID_REGDATE
     *   <li>FoliologManager.ID_REGBYID
     *   <li>FoliologManager.ID_FOLIOITEMID
     * </ul>
     */
    public FoliologComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for FoliologComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new FoliologComparator(FoliologManager.FOLIOLOGID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>FoliologManager.ID_FOLIOLOGID
     *   <li>FoliologManager.ID_LOGNAME
     *   <li>FoliologManager.ID_CONTENT
     *   <li>FoliologManager.ID_REGDATE
     *   <li>FoliologManager.ID_REGBYID
     *   <li>FoliologManager.ID_FOLIOITEMID
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public FoliologComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        FoliologBean b1 = (FoliologBean)pObj1;
        FoliologBean b2 = (FoliologBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case FoliologManager.ID_FOLIOLOGID:
                if (b1.getFoliologid() == null && b2.getFoliologid() != null) {
                    iReturn = -1;
                } else if (b1.getFoliologid() == null && b2.getFoliologid() == null) {
                    iReturn = 0;
                } else if (b1.getFoliologid() != null && b2.getFoliologid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getFoliologid().compareTo(b2.getFoliologid());
                }
                break;
            case FoliologManager.ID_LOGNAME:
                if (b1.getLogname() == null && b2.getLogname() != null) {
                    iReturn = -1;
                } else if (b1.getLogname() == null && b2.getLogname() == null) {
                    iReturn = 0;
                } else if (b1.getLogname() != null && b2.getLogname() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getLogname().compareTo(b2.getLogname());
                }
                break;
            case FoliologManager.ID_CONTENT:
                if (b1.getContent() == null && b2.getContent() != null) {
                    iReturn = -1;
                } else if (b1.getContent() == null && b2.getContent() == null) {
                    iReturn = 0;
                } else if (b1.getContent() != null && b2.getContent() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getContent().compareTo(b2.getContent());
                }
                break;
            case FoliologManager.ID_REGDATE:
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
            case FoliologManager.ID_REGBYID:
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
            case FoliologManager.ID_FOLIOITEMID:
                if (b1.getFolioitemid() == null && b2.getFolioitemid() != null) {
                    iReturn = -1;
                } else if (b1.getFolioitemid() == null && b2.getFolioitemid() == null) {
                    iReturn = 0;
                } else if (b1.getFolioitemid() != null && b2.getFolioitemid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getFolioitemid().compareTo(b2.getFolioitemid());
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