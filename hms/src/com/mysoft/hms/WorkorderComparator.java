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
 * Comparator class is used to sort the WorkorderBean objects.
 */
public class WorkorderComparator implements Comparator
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
     * Constructor class for WorkorderComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new WorkorderComparator(WorkorderManager.WORKORDERID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>WorkorderManager.ID_WORKORDERID
     *   <li>WorkorderManager.ID_NUM
     *   <li>WorkorderManager.ID_DESCRIPTION
     *   <li>WorkorderManager.ID_CATEGORY
     *   <li>WorkorderManager.ID_ROOMID
     *   <li>WorkorderManager.ID_HOUSEUNITID
     *   <li>WorkorderManager.ID_BLOCKSTART
     *   <li>WorkorderManager.ID_BLOCKEND
     *   <li>WorkorderManager.ID_PRIORITY
     *   <li>WorkorderManager.ID_ASSIGNEDTOID
     *   <li>WorkorderManager.ID_ORDERSTATUS
     *   <li>WorkorderManager.ID_DEADLINE
     *   <li>WorkorderManager.ID_REGDATE
     *   <li>WorkorderManager.ID_REGBYID
     *   <li>WorkorderManager.ID_UPDATEDON
     *   <li>WorkorderManager.ID_NOTE
     * </ul>
     */
    public WorkorderComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for WorkorderComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new WorkorderComparator(WorkorderManager.WORKORDERID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>WorkorderManager.ID_WORKORDERID
     *   <li>WorkorderManager.ID_NUM
     *   <li>WorkorderManager.ID_DESCRIPTION
     *   <li>WorkorderManager.ID_CATEGORY
     *   <li>WorkorderManager.ID_ROOMID
     *   <li>WorkorderManager.ID_HOUSEUNITID
     *   <li>WorkorderManager.ID_BLOCKSTART
     *   <li>WorkorderManager.ID_BLOCKEND
     *   <li>WorkorderManager.ID_PRIORITY
     *   <li>WorkorderManager.ID_ASSIGNEDTOID
     *   <li>WorkorderManager.ID_ORDERSTATUS
     *   <li>WorkorderManager.ID_DEADLINE
     *   <li>WorkorderManager.ID_REGDATE
     *   <li>WorkorderManager.ID_REGBYID
     *   <li>WorkorderManager.ID_UPDATEDON
     *   <li>WorkorderManager.ID_NOTE
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public WorkorderComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        WorkorderBean b1 = (WorkorderBean)pObj1;
        WorkorderBean b2 = (WorkorderBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case WorkorderManager.ID_WORKORDERID:
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
            case WorkorderManager.ID_NUM:
                if (b1.getNum() == null && b2.getNum() != null) {
                    iReturn = -1;
                } else if (b1.getNum() == null && b2.getNum() == null) {
                    iReturn = 0;
                } else if (b1.getNum() != null && b2.getNum() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getNum().compareTo(b2.getNum());
                }
                break;
            case WorkorderManager.ID_DESCRIPTION:
                if (b1.getDescription() == null && b2.getDescription() != null) {
                    iReturn = -1;
                } else if (b1.getDescription() == null && b2.getDescription() == null) {
                    iReturn = 0;
                } else if (b1.getDescription() != null && b2.getDescription() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getDescription().compareTo(b2.getDescription());
                }
                break;
            case WorkorderManager.ID_CATEGORY:
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
            case WorkorderManager.ID_ROOMID:
                if (b1.getRoomid() == null && b2.getRoomid() != null) {
                    iReturn = -1;
                } else if (b1.getRoomid() == null && b2.getRoomid() == null) {
                    iReturn = 0;
                } else if (b1.getRoomid() != null && b2.getRoomid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRoomid().compareTo(b2.getRoomid());
                }
                break;
            case WorkorderManager.ID_HOUSEUNITID:
                if (b1.getHouseunitid() == null && b2.getHouseunitid() != null) {
                    iReturn = -1;
                } else if (b1.getHouseunitid() == null && b2.getHouseunitid() == null) {
                    iReturn = 0;
                } else if (b1.getHouseunitid() != null && b2.getHouseunitid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getHouseunitid().compareTo(b2.getHouseunitid());
                }
                break;
            case WorkorderManager.ID_BLOCKSTART:
                if (b1.getBlockstart() == null && b2.getBlockstart() != null) {
                    iReturn = -1;
                } else if (b1.getBlockstart() == null && b2.getBlockstart() == null) {
                    iReturn = 0;
                } else if (b1.getBlockstart() != null && b2.getBlockstart() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getBlockstart().compareTo(b2.getBlockstart());
                }
                break;
            case WorkorderManager.ID_BLOCKEND:
                if (b1.getBlockend() == null && b2.getBlockend() != null) {
                    iReturn = -1;
                } else if (b1.getBlockend() == null && b2.getBlockend() == null) {
                    iReturn = 0;
                } else if (b1.getBlockend() != null && b2.getBlockend() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getBlockend().compareTo(b2.getBlockend());
                }
                break;
            case WorkorderManager.ID_PRIORITY:
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
            case WorkorderManager.ID_ASSIGNEDTOID:
                if (b1.getAssignedtoid() == null && b2.getAssignedtoid() != null) {
                    iReturn = -1;
                } else if (b1.getAssignedtoid() == null && b2.getAssignedtoid() == null) {
                    iReturn = 0;
                } else if (b1.getAssignedtoid() != null && b2.getAssignedtoid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAssignedtoid().compareTo(b2.getAssignedtoid());
                }
                break;
            case WorkorderManager.ID_ORDERSTATUS:
                if (b1.getOrderstatus() == null && b2.getOrderstatus() != null) {
                    iReturn = -1;
                } else if (b1.getOrderstatus() == null && b2.getOrderstatus() == null) {
                    iReturn = 0;
                } else if (b1.getOrderstatus() != null && b2.getOrderstatus() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getOrderstatus().compareTo(b2.getOrderstatus());
                }
                break;
            case WorkorderManager.ID_DEADLINE:
                if (b1.getDeadline() == null && b2.getDeadline() != null) {
                    iReturn = -1;
                } else if (b1.getDeadline() == null && b2.getDeadline() == null) {
                    iReturn = 0;
                } else if (b1.getDeadline() != null && b2.getDeadline() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getDeadline().compareTo(b2.getDeadline());
                }
                break;
            case WorkorderManager.ID_REGDATE:
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
            case WorkorderManager.ID_REGBYID:
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
            case WorkorderManager.ID_UPDATEDON:
                if (b1.getUpdatedon() == null && b2.getUpdatedon() != null) {
                    iReturn = -1;
                } else if (b1.getUpdatedon() == null && b2.getUpdatedon() == null) {
                    iReturn = 0;
                } else if (b1.getUpdatedon() != null && b2.getUpdatedon() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getUpdatedon().compareTo(b2.getUpdatedon());
                }
                break;
            case WorkorderManager.ID_NOTE:
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
            default: 
                throw new IllegalArgumentException("Type passed for the field is not supported");
        }

        return bReverse ? (-1 * iReturn) : iReturn;
    }
// class+ 

// class- 

}
