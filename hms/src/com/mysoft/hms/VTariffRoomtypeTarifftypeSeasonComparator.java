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
 * Comparator class is used to sort the VTariffRoomtypeTarifftypeSeasonBean objects.
 */
public class VTariffRoomtypeTarifftypeSeasonComparator implements Comparator
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
     * Constructor class for VTariffRoomtypeTarifftypeSeasonComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new VTariffRoomtypeTarifftypeSeasonComparator(VTariffRoomtypeTarifftypeSeasonManager.TID, bReverse));<code>
     *
     * @param iType the field from which you want to sort
     * <br>
     * Possible values are:
     * <ul>
     *   <li>VTariffRoomtypeTarifftypeSeasonManager.ID_TID
     *   <li>VTariffRoomtypeTarifftypeSeasonManager.ID_RID
     *   <li>VTariffRoomtypeTarifftypeSeasonManager.ID_SID
     * </ul>
     */
    public VTariffRoomtypeTarifftypeSeasonComparator(int iType)
    {
        this(iType, false);
    }

    /**
     * Constructor class for VTariffRoomtypeTarifftypeSeasonComparator.
     * <br>
     * Example:
     * <br>
     * <code>Arrays.sort(pArray, new VTariffRoomtypeTarifftypeSeasonComparator(VTariffRoomtypeTarifftypeSeasonManager.TID, bReverse));<code>
     *
     * @param iType the field from which you want to sort.
     * <br>
     * Possible values are:
     * <ul>
     *   <li>VTariffRoomtypeTarifftypeSeasonManager.ID_TID
     *   <li>VTariffRoomtypeTarifftypeSeasonManager.ID_RID
     *   <li>VTariffRoomtypeTarifftypeSeasonManager.ID_SID
     * </ul>
     *
     * @param bReverse set this value to true, if you want to reverse the sorting results
     */
    public VTariffRoomtypeTarifftypeSeasonComparator(int iType, boolean bReverse)
    {
        this.iType = iType;
        this.bReverse = bReverse;
    }

    /**
     * Implementation of the compare method.
     */
    public int compare(Object pObj1, Object pObj2)
    {
        VTariffRoomtypeTarifftypeSeasonBean b1 = (VTariffRoomtypeTarifftypeSeasonBean)pObj1;
        VTariffRoomtypeTarifftypeSeasonBean b2 = (VTariffRoomtypeTarifftypeSeasonBean)pObj2;
        int iReturn = 0;
        switch(iType)
        {
            case VTariffRoomtypeTarifftypeSeasonManager.ID_TID:
                if (b1.getTid() == null && b2.getTid() != null) {
                    iReturn = -1;
                } else if (b1.getTid() == null && b2.getTid() == null) {
                    iReturn = 0;
                } else if (b1.getTid() != null && b2.getTid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getTid().compareTo(b2.getTid());
                }
                break;
            case VTariffRoomtypeTarifftypeSeasonManager.ID_RID:
                if (b1.getRid() == null && b2.getRid() != null) {
                    iReturn = -1;
                } else if (b1.getRid() == null && b2.getRid() == null) {
                    iReturn = 0;
                } else if (b1.getRid() != null && b2.getRid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getRid().compareTo(b2.getRid());
                }
                break;
            case VTariffRoomtypeTarifftypeSeasonManager.ID_SID:
                if (b1.getSid() == null && b2.getSid() != null) {
                    iReturn = -1;
                } else if (b1.getSid() == null && b2.getSid() == null) {
                    iReturn = 0;
                } else if (b1.getSid() != null && b2.getSid() == null) {
                    iReturn = 1;
                } else { 
                    iReturn = b1.getSid().compareTo(b2.getSid());
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
