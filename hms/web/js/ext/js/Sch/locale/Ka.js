/*

Ext Scheduler 2.2.25
Copyright(c) 2009-2014 Bryntum AB
http://bryntum.com/contact
http://bryntum.com/license

*/
/**
 * English translations for the Scheduler component
 *
 * NOTE: To change locale for month/day names you have to use the corresponding Ext JS language file.
 */
Ext.define('Sch.locale.Ka', {
    extend      : 'Sch.locale.Locale',
    singleton   : true,

    constructor : function (config) {

        Ext.apply(this , {
            l10n        : {
                'Sch.util.Date' : {
                    unitNames : {
                        YEAR        : { single : 'წელი',        plural : 'წლები',       abbrev : 'წ' },
                        QUARTER     : { single : 'კვარტალი',    plural : 'კვარტლები',   abbrev : 'კვრ' },
                        MONTH       : { single : 'თვე',         plural : 'თვეები',      abbrev : 'თვ' },
                        WEEK        : { single : 'კვირა',       plural : 'კვირები',     abbrev : 'კვ' },
                        DAY         : { single : 'დღე',         plural : 'დღეები',      abbrev : 'დღ' },
                        HOUR        : { single : 'საათი',       plural : 'საათები',     abbrev : 'სთ' },
                        MINUTE      : { single : 'წუთი',        plural : 'წუთები',      abbrev : 'წთ' },
                        SECOND      : { single : 'წამი',        plural : 'წამები',      abbrev : 'წმ' },
                        MILLI       : { single : 'მილიწამი',    plural : 'მილიწამები',  abbrev : 'მწ' }
                    }
                },

                'Sch.view.SchedulerGridView' : {
                    loadingText : 'იტვირთება...'
                },

                'Sch.plugin.CurrentTimeLine' : {
                    tooltipText : 'მიმდინარე დრო'
                },

                'Sch.plugin.EventEditor' : {
                    saveText    : 'შენახვა',
                    deleteText  : 'წაშლა',
                    cancelText  : 'გაუქმება'
                },

                'Sch.plugin.SimpleEditor' : {
                    newEventText    : 'ახალი რეზერვაცია...'
                },

                'Sch.widget.ExportDialog' : {
                    generalError                : 'შეცდომა, ახლიდან სცადეთ.',
                    title                       : 'ექსპორტის პარამეტრები',
                    formatFieldLabel            : 'ქაღალდის ფორმატი',
                    orientationFieldLabel       : 'ორიენტაცია',
                    rangeFieldLabel             : 'ექსპორტირების დიაპაზონი',
                    showHeaderLabel             : 'გვერდის ნომრის დამატება',
                    orientationPortraitText     : 'Portrait',
                    orientationLandscapeText    : 'Landscape',
                    completeViewText            : 'სრულად',
                    currentViewText             : 'მიმდინარე ხედი',
                    dateRangeText               : 'თარიღის დიაპაზონი',
                    dateRangeFromText           : 'ექსპორტირება',
                    pickerText                  : 'Resize column/rows to desired value',
                    dateRangeToText             : 'Export to',
                    exportButtonText            : 'Export',
                    cancelButtonText            : 'Cancel',
                    progressBarText             : 'Exporting...',
                    exportToSingleLabel         : 'Export as single page',
                    adjustCols                  : 'Adjust column width',
                    adjustColsAndRows           : 'Adjust column width and row height',
                    specifyDateRange            : 'Specify date range'
                },

                // -------------- View preset date formats/strings -------------------------------------
                'Sch.preset.Manager' : {
                    hourAndDay  : {
                        displayDateFormat   : 'G:i',
                        middleDateFormat    : 'G:i',
                        topDateFormat       : 'D d/m'
                    },

                    secondAndMinute : {
                        displayDateFormat   : 'g:i:s',
                        topDateFormat       : 'D, d g:iA'
                    },

                    dayAndWeek      : {
                        displayDateFormat   : 'm/d h:i A',
                        middleDateFormat    : 'D d M'
                    },

                    weekAndDay      : {
                        displayDateFormat   : 'm/d',
                        bottomDateFormat    : 'd M',
                        middleDateFormat    : 'Y F d'
                    },

                    weekAndMonth : {
                        displayDateFormat   : 'm/d/Y',
                        middleDateFormat    : 'm/d',
                        topDateFormat       : 'm/d/Y'
                    },

                    weekAndDayLetter : {
                        displayDateFormat   : 'm/d/Y',
                        middleDateFormat    : 'D d M Y'
                    },

                    weekDateAndMonth : {
                        displayDateFormat   : 'm/d/Y',
                        middleDateFormat    : 'd',
                        topDateFormat       : 'Y F'
                    },

                    monthAndYear : {
                        displayDateFormat   : 'm/d/Y',
                        middleDateFormat    : 'M Y',
                        topDateFormat       : 'Y'
                    },

                    year : {
                        displayDateFormat   : 'm/d/Y',
                        middleDateFormat    : 'Y'
                    },

                    manyYears : {
                        displayDateFormat   : 'm/d/Y',
                        middleDateFormat    : 'Y'
                    }
                }
            }
        });

        this.callParent(arguments);
    }
});
