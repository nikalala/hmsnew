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
 * Comparator class is used to sort the PreferencetypeBean objects.
 */
public class PreferencetypeComparator implements Comparator
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
     * Constructor class for PreferencetypeComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new PreferencetypeComparator(PreferencetypeManager.PREFERENCETYPEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>PreferencetypeManager.ID_PREFERENCETYPEID
     *   <li>PreferencetypeManager.ID_NAME
     *   <li>PreferencetypeManager.ID_REGBYID
     *   <li>PreferencetypeManager.ID_REGDATE
     * </ul>
     */
    public PreferencetypeComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for PreferencetypeComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new PreferencetypeComparator(PreferencetypeManager.PREFERENCETYPEID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>PreferencetypeManager.ID_PREFERENCETYPEID
     *   <li>PreferencetypeManager.ID_NAME
     *   <li>PreferencetypeManager.ID_REGBYID
     *   <li>PreferencetypeManager.ID_REGDATE
     *   <li>PreferencetypeManager.ID_ACTIVE
     *   <li>PreferencetypeManager.ID_DETETED
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public PreferencetypeComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        PreferencetypeBean b1 = (PreferencetypeBean)pObj1;
        PreferencetypeBean b2 = (PreferencetypeBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case PreferencetypeManager.ID_PREFERENCETYPEID:
                if (b1.getPreferencetypeid() == null && b2.getPreferencetypeid() != null) {
                    iReturn = -1;
                } else if (b1.getPreferencetypeid() == null && b2.getPreferencetypeid() == null) {
                    iReturn = 0;
                } else if (b1.getPreferencetypeid() != null && b2.getPreferencetypeid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getPreferencetypeid().compareTo(b2.getPreferencetypeid());
                }
                break;
            case PreferencetypeManager.ID_NAME:
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
            case PreferencetypeManager.ID_REGBYID:
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
            case PreferencetypeManager.ID_REGDATE:
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
