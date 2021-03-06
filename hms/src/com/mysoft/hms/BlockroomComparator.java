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
 * Comparator class is used to sort the BlockroomBean objects.
 */
public class BlockroomComparator implements Comparator
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
     * Constructor class for BlockroomComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new BlockroomComparator(BlockroomManager.BLOCKROOMID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>BlockroomManager.ID_BLOCKROOMID
     *   <li>BlockroomManager.ID_ROOMID
     *   <li>BlockroomManager.ID_BLOCKSTART
     *   <li>BlockroomManager.ID_BLOCKEND
     *   <li>BlockroomManager.ID_REASONID
     *   <li>BlockroomManager.ID_NOTE
     *   <li>BlockroomManager.ID_REGDATE
     *   <li>BlockroomManager.ID_REGBYID
     * </ul>
     */
    public BlockroomComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for BlockroomComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new BlockroomComparator(BlockroomManager.BLOCKROOMID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>BlockroomManager.ID_BLOCKROOMID
     *   <li>BlockroomManager.ID_ROOMID
     *   <li>BlockroomManager.ID_BLOCKSTART
     *   <li>BlockroomManager.ID_BLOCKEND
     *   <li>BlockroomManager.ID_REASONID
     *   <li>BlockroomManager.ID_NOTE
     *   <li>BlockroomManager.ID_REGDATE
     *   <li>BlockroomManager.ID_REGBYID
     *   <li>BlockroomManager.ID_ISUNBLOCKED
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public BlockroomComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        BlockroomBean b1 = (BlockroomBean)pObj1;
        BlockroomBean b2 = (BlockroomBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case BlockroomManager.ID_BLOCKROOMID:
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
            case BlockroomManager.ID_ROOMID:
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
            case BlockroomManager.ID_BLOCKSTART:
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
            case BlockroomManager.ID_BLOCKEND:
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
            case BlockroomManager.ID_REASONID:
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
            case BlockroomManager.ID_NOTE:
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
            case BlockroomManager.ID_REGDATE:
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
            case BlockroomManager.ID_REGBYID:
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
            default: 
                throw new IllegalArgumentException("Type passed for the field is not supported");
        }

        return bReverse ? (-1 * iReturn) : iReturn;
    }
// class+ 

// class- 

}
