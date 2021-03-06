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
 * Comparator class is used to sort the ReportitemBean objects.
 */
public class ReportitemComparator implements Comparator
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
     * Constructor class for ReportitemComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ReportitemComparator(ReportitemManager.REPORTITEMID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ReportitemManager.ID_REPORTITEMID
     *   <li>ReportitemManager.ID_REPORTID
     *   <li>ReportitemManager.ID_NAME
     *   <li>ReportitemManager.ID_IDX
     *   <li>ReportitemManager.ID_FIELDTYPE
     *   <li>ReportitemManager.ID_ALIGN
     *   <li>ReportitemManager.ID_WD
     *   <li>ReportitemManager.ID_PARAM
     *   <li>ReportitemManager.ID_DEFVAL1
     *   <li>ReportitemManager.ID_DEFVAL2
     * </ul>
     */
    public ReportitemComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for ReportitemComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new ReportitemComparator(ReportitemManager.REPORTITEMID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>ReportitemManager.ID_REPORTITEMID
     *   <li>ReportitemManager.ID_REPORTID
     *   <li>ReportitemManager.ID_NAME
     *   <li>ReportitemManager.ID_IDX
     *   <li>ReportitemManager.ID_FIELDTYPE
     *   <li>ReportitemManager.ID_ALIGN
     *   <li>ReportitemManager.ID_WD
     *   <li>ReportitemManager.ID_HASSUM
     *   <li>ReportitemManager.ID_ORDERED
     *   <li>ReportitemManager.ID_SEARCH
     *   <li>ReportitemManager.ID_PARAM
     *   <li>ReportitemManager.ID_MANDATORY
     *   <li>ReportitemManager.ID_DEFVAL1
     *   <li>ReportitemManager.ID_DEFVAL2
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public ReportitemComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        ReportitemBean b1 = (ReportitemBean)pObj1;
        ReportitemBean b2 = (ReportitemBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case ReportitemManager.ID_REPORTITEMID:
                if (b1.getReportitemid() == null && b2.getReportitemid() != null) {
                    iReturn = -1;
                } else if (b1.getReportitemid() == null && b2.getReportitemid() == null) {
                    iReturn = 0;
                } else if (b1.getReportitemid() != null && b2.getReportitemid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getReportitemid().compareTo(b2.getReportitemid());
                }
                break;
            case ReportitemManager.ID_REPORTID:
                if (b1.getReportid() == null && b2.getReportid() != null) {
                    iReturn = -1;
                } else if (b1.getReportid() == null && b2.getReportid() == null) {
                    iReturn = 0;
                } else if (b1.getReportid() != null && b2.getReportid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getReportid().compareTo(b2.getReportid());
                }
                break;
            case ReportitemManager.ID_NAME:
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
            case ReportitemManager.ID_IDX:
                if (b1.getIdx() == null && b2.getIdx() != null) {
                    iReturn = -1;
                } else if (b1.getIdx() == null && b2.getIdx() == null) {
                    iReturn = 0;
                } else if (b1.getIdx() != null && b2.getIdx() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getIdx().compareTo(b2.getIdx());
                }
                break;
            case ReportitemManager.ID_FIELDTYPE:
                if (b1.getFieldtype() == null && b2.getFieldtype() != null) {
                    iReturn = -1;
                } else if (b1.getFieldtype() == null && b2.getFieldtype() == null) {
                    iReturn = 0;
                } else if (b1.getFieldtype() != null && b2.getFieldtype() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getFieldtype().compareTo(b2.getFieldtype());
                }
                break;
            case ReportitemManager.ID_ALIGN:
                if (b1.getAlign() == null && b2.getAlign() != null) {
                    iReturn = -1;
                } else if (b1.getAlign() == null && b2.getAlign() == null) {
                    iReturn = 0;
                } else if (b1.getAlign() != null && b2.getAlign() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAlign().compareTo(b2.getAlign());
                }
                break;
            case ReportitemManager.ID_WD:
                if (b1.getWd() == null && b2.getWd() != null) {
                    iReturn = -1;
                } else if (b1.getWd() == null && b2.getWd() == null) {
                    iReturn = 0;
                } else if (b1.getWd() != null && b2.getWd() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getWd().compareTo(b2.getWd());
                }
                break;
            case ReportitemManager.ID_PARAM:
                if (b1.getParam() == null && b2.getParam() != null) {
                    iReturn = -1;
                } else if (b1.getParam() == null && b2.getParam() == null) {
                    iReturn = 0;
                } else if (b1.getParam() != null && b2.getParam() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getParam().compareTo(b2.getParam());
                }
                break;
            case ReportitemManager.ID_DEFVAL1:
                if (b1.getDefval1() == null && b2.getDefval1() != null) {
                    iReturn = -1;
                } else if (b1.getDefval1() == null && b2.getDefval1() == null) {
                    iReturn = 0;
                } else if (b1.getDefval1() != null && b2.getDefval1() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getDefval1().compareTo(b2.getDefval1());
                }
                break;
            case ReportitemManager.ID_DEFVAL2:
                if (b1.getDefval2() == null && b2.getDefval2() != null) {
                    iReturn = -1;
                } else if (b1.getDefval2() == null && b2.getDefval2() == null) {
                    iReturn = 0;
                } else if (b1.getDefval2() != null && b2.getDefval2() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getDefval2().compareTo(b2.getDefval2());
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
