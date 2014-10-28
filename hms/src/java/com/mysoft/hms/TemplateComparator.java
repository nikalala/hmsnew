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
 * Comparator class is used to sort the TemplateBean objects.
 */
public class TemplateComparator implements Comparator
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
     * Constructor class for TemplateComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new TemplateComparator(TemplateManager.TEMPLATEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>TemplateManager.ID_TEMPLATEID
     *   <li>TemplateManager.ID_NAME
     *   <li>TemplateManager.ID_TEMPLATECATEGORYID
     *   <li>TemplateManager.ID_SUBJECT
     *   <li>TemplateManager.ID_PERSONNELID
     *   <li>TemplateManager.ID_CC
     *   <li>TemplateManager.ID_BCC
     *   <li>TemplateManager.ID_CONTENT
     *   <li>TemplateManager.ID_REGBYID
     *   <li>TemplateManager.ID_REGDATE
     * </ul>
     */
    public TemplateComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for TemplateComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new TemplateComparator(TemplateManager.TEMPLATEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>TemplateManager.ID_TEMPLATEID
     *   <li>TemplateManager.ID_NAME
     *   <li>TemplateManager.ID_TEMPLATECATEGORYID
     *   <li>TemplateManager.ID_SUBJECT
     *   <li>TemplateManager.ID_PERSONNELID
     *   <li>TemplateManager.ID_CC
     *   <li>TemplateManager.ID_BCC
     *   <li>TemplateManager.ID_CONTENT
     *   <li>TemplateManager.ID_REGBYID
     *   <li>TemplateManager.ID_REGDATE
     *   <li>TemplateManager.ID_ACTIVE
     *   <li>TemplateManager.ID_DELETED
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public TemplateComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        TemplateBean b1 = (TemplateBean)pObj1;
        TemplateBean b2 = (TemplateBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case TemplateManager.ID_TEMPLATEID:
                if (b1.getTemplateid() == null && b2.getTemplateid() != null) {
                    iReturn = -1;
                } else if (b1.getTemplateid() == null && b2.getTemplateid() == null) {
                    iReturn = 0;
                } else if (b1.getTemplateid() != null && b2.getTemplateid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getTemplateid().compareTo(b2.getTemplateid());
                }
                break;
            case TemplateManager.ID_NAME:
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
            case TemplateManager.ID_TEMPLATECATEGORYID:
                if (b1.getTemplatecategoryid() == null && b2.getTemplatecategoryid() != null) {
                    iReturn = -1;
                } else if (b1.getTemplatecategoryid() == null && b2.getTemplatecategoryid() == null) {
                    iReturn = 0;
                } else if (b1.getTemplatecategoryid() != null && b2.getTemplatecategoryid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getTemplatecategoryid().compareTo(b2.getTemplatecategoryid());
                }
                break;
            case TemplateManager.ID_SUBJECT:
                if (b1.getSubject() == null && b2.getSubject() != null) {
                    iReturn = -1;
                } else if (b1.getSubject() == null && b2.getSubject() == null) {
                    iReturn = 0;
                } else if (b1.getSubject() != null && b2.getSubject() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getSubject().compareTo(b2.getSubject());
                }
                break;
            case TemplateManager.ID_PERSONNELID:
                if (b1.getPersonnelid() == null && b2.getPersonnelid() != null) {
                    iReturn = -1;
                } else if (b1.getPersonnelid() == null && b2.getPersonnelid() == null) {
                    iReturn = 0;
                } else if (b1.getPersonnelid() != null && b2.getPersonnelid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPersonnelid().compareTo(b2.getPersonnelid());
                }
                break;
            case TemplateManager.ID_CC:
                if (b1.getCc() == null && b2.getCc() != null) {
                    iReturn = -1;
                } else if (b1.getCc() == null && b2.getCc() == null) {
                    iReturn = 0;
                } else if (b1.getCc() != null && b2.getCc() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getCc().compareTo(b2.getCc());
                }
                break;
            case TemplateManager.ID_BCC:
                if (b1.getBcc() == null && b2.getBcc() != null) {
                    iReturn = -1;
                } else if (b1.getBcc() == null && b2.getBcc() == null) {
                    iReturn = 0;
                } else if (b1.getBcc() != null && b2.getBcc() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getBcc().compareTo(b2.getBcc());
                }
                break;
            case TemplateManager.ID_CONTENT:
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
            case TemplateManager.ID_REGBYID:
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
            case TemplateManager.ID_REGDATE:
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
