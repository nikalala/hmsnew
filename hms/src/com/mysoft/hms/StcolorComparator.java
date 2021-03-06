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
 * Comparator class is used to sort the StcolorBean objects.
 */
public class StcolorComparator implements Comparator
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
     * Constructor class for StcolorComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new StcolorComparator(StcolorManager.STCOLORID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>StcolorManager.ID_STCOLORID
     *   <li>StcolorManager.ID_ROOMSTATUS
     *   <li>StcolorManager.ID_COLOR
     *   <li>StcolorManager.ID_REGBYID
     *   <li>StcolorManager.ID_REGDATE
     * </ul>
     */
    public StcolorComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for StcolorComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new StcolorComparator(StcolorManager.STCOLORID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>StcolorManager.ID_STCOLORID
     *   <li>StcolorManager.ID_ROOMSTATUS
     *   <li>StcolorManager.ID_COLOR
     *   <li>StcolorManager.ID_REGBYID
     *   <li>StcolorManager.ID_REGDATE
     *   <li>StcolorManager.ID_ACTIVE
     *   <li>StcolorManager.ID_DELETED
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public StcolorComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        StcolorBean b1 = (StcolorBean)pObj1;
        StcolorBean b2 = (StcolorBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case StcolorManager.ID_STCOLORID:
                if (b1.getStcolorid() == null && b2.getStcolorid() != null) {
                    iReturn = -1;
                } else if (b1.getStcolorid() == null && b2.getStcolorid() == null) {
                    iReturn = 0;
                } else if (b1.getStcolorid() != null && b2.getStcolorid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getStcolorid().compareTo(b2.getStcolorid());
                }
                break;
            case StcolorManager.ID_ROOMSTATUS:
                if (b1.getRoomstatus() == null && b2.getRoomstatus() != null) {
                    iReturn = -1;
                } else if (b1.getRoomstatus() == null && b2.getRoomstatus() == null) {
                    iReturn = 0;
                } else if (b1.getRoomstatus() != null && b2.getRoomstatus() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRoomstatus().compareTo(b2.getRoomstatus());
                }
                break;
            case StcolorManager.ID_COLOR:
                if (b1.getColor() == null && b2.getColor() != null) {
                    iReturn = -1;
                } else if (b1.getColor() == null && b2.getColor() == null) {
                    iReturn = 0;
                } else if (b1.getColor() != null && b2.getColor() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getColor().compareTo(b2.getColor());
                }
                break;
            case StcolorManager.ID_REGBYID:
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
            case StcolorManager.ID_REGDATE:
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
