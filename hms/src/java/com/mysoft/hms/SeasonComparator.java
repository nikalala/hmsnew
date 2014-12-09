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
 * Comparator class is used to sort the SeasonBean objects.
 */
public class SeasonComparator implements Comparator
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
     * Constructor class for SeasonComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new SeasonComparator(SeasonManager.SEASONID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>SeasonManager.ID_SEASONID
     *   <li>SeasonManager.ID_CODE
     *   <li>SeasonManager.ID_NAME
     *   <li>SeasonManager.ID_FDAY
     *   <li>SeasonManager.ID_TDAY
     *   <li>SeasonManager.ID_FMONTH
     *   <li>SeasonManager.ID_TMONTH
     *   <li>SeasonManager.ID_STARTDATE
     *   <li>SeasonManager.ID_ENDDATE
     *   <li>SeasonManager.ID_REGBYID
     *   <li>SeasonManager.ID_REGDATE
     * </ul>
     */
    public SeasonComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for SeasonComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new SeasonComparator(SeasonManager.SEASONID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>SeasonManager.ID_SEASONID
     *   <li>SeasonManager.ID_CODE
     *   <li>SeasonManager.ID_NAME
     *   <li>SeasonManager.ID_FDAY
     *   <li>SeasonManager.ID_TDAY
     *   <li>SeasonManager.ID_FMONTH
     *   <li>SeasonManager.ID_TMONTH
     *   <li>SeasonManager.ID_STARTDATE
     *   <li>SeasonManager.ID_ENDDATE
     *   <li>SeasonManager.ID_REGBYID
     *   <li>SeasonManager.ID_REGDATE
     *   <li>SeasonManager.ID_ACTIVE
     *   <li>SeasonManager.ID_DELETED
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public SeasonComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        SeasonBean b1 = (SeasonBean)pObj1;
        SeasonBean b2 = (SeasonBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case SeasonManager.ID_SEASONID:
                if (b1.getSeasonid() == null && b2.getSeasonid() != null) {
                    iReturn = -1;
                } else if (b1.getSeasonid() == null && b2.getSeasonid() == null) {
                    iReturn = 0;
                } else if (b1.getSeasonid() != null && b2.getSeasonid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getSeasonid().compareTo(b2.getSeasonid());
                }
                break;
            case SeasonManager.ID_CODE:
                if (b1.getCode() == null && b2.getCode() != null) {
                    iReturn = -1;
                } else if (b1.getCode() == null && b2.getCode() == null) {
                    iReturn = 0;
                } else if (b1.getCode() != null && b2.getCode() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCode().compareTo(b2.getCode());
                }
                break;
            case SeasonManager.ID_NAME:
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
            case SeasonManager.ID_FDAY:
                if (b1.getFday() == null && b2.getFday() != null) {
                    iReturn = -1;
                } else if (b1.getFday() == null && b2.getFday() == null) {
                    iReturn = 0;
                } else if (b1.getFday() != null && b2.getFday() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getFday().compareTo(b2.getFday());
                }
                break;
            case SeasonManager.ID_TDAY:
                if (b1.getTday() == null && b2.getTday() != null) {
                    iReturn = -1;
                } else if (b1.getTday() == null && b2.getTday() == null) {
                    iReturn = 0;
                } else if (b1.getTday() != null && b2.getTday() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getTday().compareTo(b2.getTday());
                }
                break;
            case SeasonManager.ID_FMONTH:
                if (b1.getFmonth() == null && b2.getFmonth() != null) {
                    iReturn = -1;
                } else if (b1.getFmonth() == null && b2.getFmonth() == null) {
                    iReturn = 0;
                } else if (b1.getFmonth() != null && b2.getFmonth() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getFmonth().compareTo(b2.getFmonth());
                }
                break;
            case SeasonManager.ID_TMONTH:
                if (b1.getTmonth() == null && b2.getTmonth() != null) {
                    iReturn = -1;
                } else if (b1.getTmonth() == null && b2.getTmonth() == null) {
                    iReturn = 0;
                } else if (b1.getTmonth() != null && b2.getTmonth() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getTmonth().compareTo(b2.getTmonth());
                }
                break;
            case SeasonManager.ID_STARTDATE:
                if (b1.getStartdate() == null && b2.getStartdate() != null) {
                    iReturn = -1;
                } else if (b1.getStartdate() == null && b2.getStartdate() == null) {
                    iReturn = 0;
                } else if (b1.getStartdate() != null && b2.getStartdate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getStartdate().compareTo(b2.getStartdate());
                }
                break;
            case SeasonManager.ID_ENDDATE:
                if (b1.getEnddate() == null && b2.getEnddate() != null) {
                    iReturn = -1;
                } else if (b1.getEnddate() == null && b2.getEnddate() == null) {
                    iReturn = 0;
                } else if (b1.getEnddate() != null && b2.getEnddate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getEnddate().compareTo(b2.getEnddate());
                }
                break;
            case SeasonManager.ID_REGBYID:
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
            case SeasonManager.ID_REGDATE:
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