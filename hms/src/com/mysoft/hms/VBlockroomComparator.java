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
 * Comparator class is used to sort the VBlockroomBean objects.
 */
public class VBlockroomComparator implements Comparator
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
     * Constructor class for VBlockroomComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new VBlockroomComparator(VBlockroomManager.BLOCKROOMID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>VBlockroomManager.ID_BLOCKROOMID
     *   <li>VBlockroomManager.ID_ROOMID
     *   <li>VBlockroomManager.ID_BLOCKSTART
     *   <li>VBlockroomManager.ID_BLOCKEND
     *   <li>VBlockroomManager.ID_REASONID
     *   <li>VBlockroomManager.ID_NOTE
     *   <li>VBlockroomManager.ID_REGDATE
     *   <li>VBlockroomManager.ID_REGBYID
     *   <li>VBlockroomManager.ID_ROOM
     *   <li>VBlockroomManager.ID_ROOMTYPE
     *   <li>VBlockroomManager.ID_REASON
     *   <li>VBlockroomManager.ID_CREATEDBY
     * </ul>
     */
    public VBlockroomComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for VBlockroomComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new VBlockroomComparator(VBlockroomManager.BLOCKROOMID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>VBlockroomManager.ID_BLOCKROOMID
     *   <li>VBlockroomManager.ID_ROOMID
     *   <li>VBlockroomManager.ID_BLOCKSTART
     *   <li>VBlockroomManager.ID_BLOCKEND
     *   <li>VBlockroomManager.ID_REASONID
     *   <li>VBlockroomManager.ID_NOTE
     *   <li>VBlockroomManager.ID_REGDATE
     *   <li>VBlockroomManager.ID_REGBYID
     *   <li>VBlockroomManager.ID_ISUNBLOCKED
     *   <li>VBlockroomManager.ID_ROOM
     *   <li>VBlockroomManager.ID_ROOMTYPE
     *   <li>VBlockroomManager.ID_REASON
     *   <li>VBlockroomManager.ID_CREATEDBY
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public VBlockroomComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        VBlockroomBean b1 = (VBlockroomBean)pObj1;
        VBlockroomBean b2 = (VBlockroomBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case VBlockroomManager.ID_BLOCKROOMID:
                if (b1.getBlockroomid() == null && b2.getBlockroomid() != null) {
                    iReturn = -1;
                } else if (b1.getBlockroomid() == null && b2.getBlockroomid() == null) {
                    iReturn = 0;
                } else if (b1.getBlockroomid() != null && b2.getBlockroomid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getBlockroomid().compareTo(b2.getBlockroomid());
                }
                break;
            case VBlockroomManager.ID_ROOMID:
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
            case VBlockroomManager.ID_BLOCKSTART:
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
            case VBlockroomManager.ID_BLOCKEND:
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
            case VBlockroomManager.ID_REASONID:
                if (b1.getReasonid() == null && b2.getReasonid() != null) {
                    iReturn = -1;
                } else if (b1.getReasonid() == null && b2.getReasonid() == null) {
                    iReturn = 0;
                } else if (b1.getReasonid() != null && b2.getReasonid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getReasonid().compareTo(b2.getReasonid());
                }
                break;
            case VBlockroomManager.ID_NOTE:
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
            case VBlockroomManager.ID_REGDATE:
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
            case VBlockroomManager.ID_REGBYID:
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
            case VBlockroomManager.ID_ROOM:
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
            case VBlockroomManager.ID_ROOMTYPE:
                if (b1.getRoomtype() == null && b2.getRoomtype() != null) {
                    iReturn = -1;
                } else if (b1.getRoomtype() == null && b2.getRoomtype() == null) {
                    iReturn = 0;
                } else if (b1.getRoomtype() != null && b2.getRoomtype() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRoomtype().compareTo(b2.getRoomtype());
                }
                break;
            case VBlockroomManager.ID_REASON:
                if (b1.getReason() == null && b2.getReason() != null) {
                    iReturn = -1;
                } else if (b1.getReason() == null && b2.getReason() == null) {
                    iReturn = 0;
                } else if (b1.getReason() != null && b2.getReason() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getReason().compareTo(b2.getReason());
                }
                break;
            case VBlockroomManager.ID_CREATEDBY:
                if (b1.getCreatedby() == null && b2.getCreatedby() != null) {
                    iReturn = -1;
                } else if (b1.getCreatedby() == null && b2.getCreatedby() == null) {
                    iReturn = 0;
                } else if (b1.getCreatedby() != null && b2.getCreatedby() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCreatedby().compareTo(b2.getCreatedby());
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