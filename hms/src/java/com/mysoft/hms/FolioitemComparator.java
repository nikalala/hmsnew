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
 * Comparator class is used to sort the FolioitemBean objects.
 */
public class FolioitemComparator implements Comparator
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
     * Constructor class for FolioitemComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new FolioitemComparator(FolioitemManager.FOLIOITEMID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>FolioitemManager.ID_FOLIOITEMID
     *   <li>FolioitemManager.ID_FOLIOID
     *   <li>FolioitemManager.ID_ROOMID
     *   <li>FolioitemManager.ID_ITEMDATE
     *   <li>FolioitemManager.ID_REFNO
     *   <li>FolioitemManager.ID_PARTICULAR
     *   <li>FolioitemManager.ID_AMOUNT
     *   <li>FolioitemManager.ID_EXTRACHARGEID
     *   <li>FolioitemManager.ID_ORDERMAINID
     *   <li>FolioitemManager.ID_DISCOUNTID
     *   <li>FolioitemManager.ID_TAXID
     *   <li>FolioitemManager.ID_PAYMENTID
     *   <li>FolioitemManager.ID_REGBYID
     *   <li>FolioitemManager.ID_REGDATE
     *   <li>FolioitemManager.ID_NOTE
     * </ul>
     */
    public FolioitemComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for FolioitemComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new FolioitemComparator(FolioitemManager.FOLIOITEMID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>FolioitemManager.ID_FOLIOITEMID
     *   <li>FolioitemManager.ID_FOLIOID
     *   <li>FolioitemManager.ID_ROOMID
     *   <li>FolioitemManager.ID_ITEMDATE
     *   <li>FolioitemManager.ID_REFNO
     *   <li>FolioitemManager.ID_PARTICULAR
     *   <li>FolioitemManager.ID_AMOUNT
     *   <li>FolioitemManager.ID_EXTRACHARGEID
     *   <li>FolioitemManager.ID_ORDERMAINID
     *   <li>FolioitemManager.ID_DISCOUNTID
     *   <li>FolioitemManager.ID_TAXID
     *   <li>FolioitemManager.ID_PAYMENTID
     *   <li>FolioitemManager.ID_ZVOID
     *   <li>FolioitemManager.ID_DONE
     *   <li>FolioitemManager.ID_REGBYID
     *   <li>FolioitemManager.ID_REGDATE
     *   <li>FolioitemManager.ID_NOTE
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public FolioitemComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        FolioitemBean b1 = (FolioitemBean)pObj1;
        FolioitemBean b2 = (FolioitemBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case FolioitemManager.ID_FOLIOITEMID:
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
            case FolioitemManager.ID_FOLIOID:
                if (b1.getFolioid() == null && b2.getFolioid() != null) {
                    iReturn = -1;
                } else if (b1.getFolioid() == null && b2.getFolioid() == null) {
                    iReturn = 0;
                } else if (b1.getFolioid() != null && b2.getFolioid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getFolioid().compareTo(b2.getFolioid());
                }
                break;
            case FolioitemManager.ID_ROOMID:
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
            case FolioitemManager.ID_ITEMDATE:
                if (b1.getItemdate() == null && b2.getItemdate() != null) {
                    iReturn = -1;
                } else if (b1.getItemdate() == null && b2.getItemdate() == null) {
                    iReturn = 0;
                } else if (b1.getItemdate() != null && b2.getItemdate() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getItemdate().compareTo(b2.getItemdate());
                }
                break;
            case FolioitemManager.ID_REFNO:
                if (b1.getRefno() == null && b2.getRefno() != null) {
                    iReturn = -1;
                } else if (b1.getRefno() == null && b2.getRefno() == null) {
                    iReturn = 0;
                } else if (b1.getRefno() != null && b2.getRefno() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRefno().compareTo(b2.getRefno());
                }
                break;
            case FolioitemManager.ID_PARTICULAR:
                if (b1.getParticular() == null && b2.getParticular() != null) {
                    iReturn = -1;
                } else if (b1.getParticular() == null && b2.getParticular() == null) {
                    iReturn = 0;
                } else if (b1.getParticular() != null && b2.getParticular() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getParticular().compareTo(b2.getParticular());
                }
                break;
            case FolioitemManager.ID_AMOUNT:
                if (b1.getAmount() == null && b2.getAmount() != null) {
                    iReturn = -1;
                } else if (b1.getAmount() == null && b2.getAmount() == null) {
                    iReturn = 0;
                } else if (b1.getAmount() != null && b2.getAmount() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getAmount().compareTo(b2.getAmount());
                }
                break;
            case FolioitemManager.ID_EXTRACHARGEID:
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
            case FolioitemManager.ID_ORDERMAINID:
                if (b1.getOrdermainid() == null && b2.getOrdermainid() != null) {
                    iReturn = -1;
                } else if (b1.getOrdermainid() == null && b2.getOrdermainid() == null) {
                    iReturn = 0;
                } else if (b1.getOrdermainid() != null && b2.getOrdermainid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getOrdermainid().compareTo(b2.getOrdermainid());
                }
                break;
            case FolioitemManager.ID_DISCOUNTID:
                if (b1.getDiscountid() == null && b2.getDiscountid() != null) {
                    iReturn = -1;
                } else if (b1.getDiscountid() == null && b2.getDiscountid() == null) {
                    iReturn = 0;
                } else if (b1.getDiscountid() != null && b2.getDiscountid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getDiscountid().compareTo(b2.getDiscountid());
                }
                break;
            case FolioitemManager.ID_TAXID:
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
            case FolioitemManager.ID_PAYMENTID:
                if (b1.getPaymentid() == null && b2.getPaymentid() != null) {
                    iReturn = -1;
                } else if (b1.getPaymentid() == null && b2.getPaymentid() == null) {
                    iReturn = 0;
                } else if (b1.getPaymentid() != null && b2.getPaymentid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPaymentid().compareTo(b2.getPaymentid());
                }
                break;
            case FolioitemManager.ID_REGBYID:
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
            case FolioitemManager.ID_REGDATE:
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
            case FolioitemManager.ID_NOTE:
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
