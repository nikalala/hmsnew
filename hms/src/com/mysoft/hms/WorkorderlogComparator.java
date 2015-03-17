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
 * Comparator class is used to sort the WorkorderlogBean objects.
 */
public class WorkorderlogComparator implements Comparator
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
     * Constructor class for WorkorderlogComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new WorkorderlogComparator(WorkorderlogManager.WORKORDERLOGID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>WorkorderlogManager.ID_WORKORDERLOGID
     *   <li>WorkorderlogManager.ID_WORKORDERID
     *   <li>WorkorderlogManager.ID_CATEGORY
     *   <li>WorkorderlogManager.ID_PRIORITY
     *   <li>WorkorderlogManager.ID_ASSIGNEDTO
     *   <li>WorkorderlogManager.ID_STATUS
     *   <li>WorkorderlogManager.ID_NOTE
     *   <li>WorkorderlogManager.ID_REGDATE
     *   <li>WorkorderlogManager.ID_REGBYID
     *   <li>WorkorderlogManager.ID_ROOM
     * </ul>
     */
    public WorkorderlogComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for WorkorderlogComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new WorkorderlogComparator(WorkorderlogManager.WORKORDERLOGID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>WorkorderlogManager.ID_WORKORDERLOGID
     *   <li>WorkorderlogManager.ID_WORKORDERID
     *   <li>WorkorderlogManager.ID_CATEGORY
     *   <li>WorkorderlogManager.ID_PRIORITY
     *   <li>WorkorderlogManager.ID_ASSIGNEDTO
     *   <li>WorkorderlogManager.ID_STATUS
     *   <li>WorkorderlogManager.ID_NOTE
     *   <li>WorkorderlogManager.ID_REGDATE
     *   <li>WorkorderlogManager.ID_REGBYID
     *   <li>WorkorderlogManager.ID_ROOM
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public WorkorderlogComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        WorkorderlogBean b1 = (WorkorderlogBean)pObj1;
        WorkorderlogBean b2 = (WorkorderlogBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case WorkorderlogManager.ID_WORKORDERLOGID:
                if (b1.getWorkorderlogid() == null && b2.getWorkorderlogid() != null) {
                    iReturn = -1;
                } else if (b1.getWorkorderlogid() == null && b2.getWorkorderlogid() == null) {
                    iReturn = 0;
                } else if (b1.getWorkorderlogid() != null && b2.getWorkorderlogid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getWorkorderlogid().compareTo(b2.getWorkorderlogid());
                }
                break;
            case WorkorderlogManager.ID_WORKORDERID:
                if (b1.getWorkorderid() == null && b2.getWorkorderid() != null) {
                    iReturn = -1;
                } else if (b1.getWorkorderid() == null && b2.getWorkorderid() == null) {
                    iReturn = 0;
                } else if (b1.getWorkorderid() != null && b2.getWorkorderid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getWorkorderid().compareTo(b2.getWorkorderid());
                }
                break;
            case WorkorderlogManager.ID_CATEGORY:
                if (b1.getCategory() == null && b2.getCategory() != null) {
                    iReturn = -1;
                } else if (b1.getCategory() == null && b2.getCategory() == null) {
                    iReturn = 0;
                } else if (b1.getCategory() != null && b2.getCategory() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCategory().compareTo(b2.getCategory());
                }
                break;
            case WorkorderlogManager.ID_PRIORITY:
                if (b1.getPriority() == null && b2.getPriority() != null) {
                    iReturn = -1;
                } else if (b1.getPriority() == null && b2.getPriority() == null) {
                    iReturn = 0;
                } else if (b1.getPriority() != null && b2.getPriority() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPriority().compareTo(b2.getPriority());
                }
                break;
            case WorkorderlogManager.ID_ASSIGNEDTO:
                if (b1.getAssignedto() == null && b2.getAssignedto() != null) {
                    iReturn = -1;
                } else if (b1.getAssignedto() == null && b2.getAssignedto() == null) {
                    iReturn = 0;
                } else if (b1.getAssignedto() != null && b2.getAssignedto() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAssignedto().compareTo(b2.getAssignedto());
                }
                break;
            case WorkorderlogManager.ID_STATUS:
                if (b1.getStatus() == null && b2.getStatus() != null) {
                    iReturn = -1;
                } else if (b1.getStatus() == null && b2.getStatus() == null) {
                    iReturn = 0;
                } else if (b1.getStatus() != null && b2.getStatus() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getStatus().compareTo(b2.getStatus());
                }
                break;
            case WorkorderlogManager.ID_NOTE:
                if (b1.getNote() == null && b2.getNote() != null) {
                    iReturn = -1;
                } else if (b1.getNote() == null && b2.getNote() == null) {
                    iReturn = 0;
                } else if (b1.getNote() != null && b2.getNote() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getNote().compareTo(b2.getNote());
                }
                break;
            case WorkorderlogManager.ID_REGDATE:
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
            case WorkorderlogManager.ID_REGBYID:
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
            case WorkorderlogManager.ID_ROOM:
                if (b1.getRoom() == null && b2.getRoom() != null) {
                    iReturn = -1;
                } else if (b1.getRoom() == null && b2.getRoom() == null) {
                    iReturn = 0;
                } else if (b1.getRoom() != null && b2.getRoom() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRoom().compareTo(b2.getRoom());
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