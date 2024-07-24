report 50157 "Checklist Compliance"

{
    Caption = 'Checklist Compliance Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Checklistcompliance.rdl';

    dataset
    {
        dataitem("Posted Timebased Calender"; "Posted Timebased Calender")
        {
            RequestFilterFields = "Area", HOD;
            column(Companypic; Companyinfo.Picture)
            {
            }
            column(Companyname; Companyinfo.Name)
            {
            }
            column(Companyadd; Companyinfo.Address)
            {
            }
            column(Companyadd2; Companyinfo."Address 2")
            {
            }
            column(Companypostcode; Companyinfo."Post Code")
            {
            }
            column(Companystatecode; Companyinfo."State Code")
            {
            }
            column(Companycity; Companyinfo.City)
            {
            }
            column(Companyphone; Companyinfo."Phone No.")
            {
            }
            column(CompanyEMAIL; Companyinfo."E-Mail")
            {
            }
            column(Companyinfo; Companyinfo."GST Registration No.")
            {
            }
            column(Sno_; "Sno.")
            {

            }
            column(Task_Description; "Task Description")
            {
            }
            column(Frequency; Frequency)
            {
            }
            column("Area"; "Area")
            {
            }
            column(FromDate; FromDate)
            {
            }
            column(ToDate; ToDate)
            {
            }
            column(Week1; Week1)
            {
            }
            column(L1; L1)
            {
            }
            column(Week4; Week4)
            {
            }
            column(Week2; Week2)
            {
            }
            column(Week3; Week3)
            {
            }
            column(Week5; Week5)
            {
            }
            column(supervisour1; supervisour1)
            {
            }
            column(supervisour2; supervisour2)
            {

            }
            column(supervisour3; supervisour3)
            {

            }
            column(supervisour4; supervisour4)
            {

            }
            column(supervisour5; supervisour5)
            {

            }
            trigger OnPreDataItem()
            var

            begin
                "Posted Timebased Calender".SetRange("Date of Maintenance", Fromdate, todate);

            end;

            trigger OnAfterGetRecord()
            var
            begin
                Clear(Week);
                Clear(Week1);
                Clear(Week2);
                Clear(Week3);
                Clear(Week4);
                Clear(Week5);
                Clear(supervisour1);
                Clear(supervisour2);
                Clear(supervisour3);
                Clear(supervisour4);
                Clear(supervisour5);

                "Sno." := "Sno." + 1;

                //   "Posted Timebased Calender".SetRange("Date of Maintenance", FromDate, ToDate);
                // if "Posted Timebased Calender".FindSet() then begin
                ptbc.Reset();
                ptbc.SetRange("Entry No.", "Posted Timebased Calender"."Entry No.");
                if ptbc.FindSet() then begin
                    Week := Date2DMY(ptbc."Date of Maintenance", 2);
                    Message('%1...%2', ptbc."Date of Maintenance", Week);
                    if (Week = 1) or (Week = 7) or (Week = 12) or (Week = 17) or (Week = 21) then begin
                        Week1 := ptbc."Date of Maintenance";
                        supervisour1 := ptbc.Supervisor
                    end
                    else
                        if (Week = 2) or (Week = 7) or (Week = 12) or (Week = 17) or (Week = 23) then begin
                            Week2 := ptbc."Date of Maintenance";
                            supervisour2 := ptbc.Supervisor
                        end
                        else
                            if (Week = 3) or (Week = 8) or (Week = 13) or (Week = 18) or (Week = 24) then begin
                                week3 := ptbc."Date of Maintenance";
                                supervisour3 := ptbc.Supervisor
                            end
                            else
                                if (Week = 4) or (Week = 9) or (Week = 14) or (Week = 19) or (Week = 24) then begin
                                    Week4 := ptbc."Date of Maintenance";
                                    supervisour4 := ptbc.Supervisor
                                end
                                else
                                    if (Week = 5) or (Week = 10) or (Week = 15) or (Week = 20) or (Week = 25) then begin
                                        Week5 := ptbc."Date of Maintenance";
                                        supervisour5 := ptbc.Supervisor;
                                    end
                                    else
                                        if (week = 6) or (Week = 11) or (Week = 16) or (Week = 21) or (week = 26) then begin
                                            Week1 := ptbc."Date of Maintenance";
                                            supervisour1 := ptbc.Supervisor;
                                        end;
                end;
                // Message('%1...%2...%3...%4...%5', Week, Week1, Week2, Week3, Week4);
                // end;



                // week := Date2DWY("Date of Maintenance", 2);
                // "Posted Timebased Calender".SetRange("Date of Maintenance", FromDate, ToDate);
                /*
                                ptbc.Reset();
                                ptbc.SetRange("Date of Maintenance", FromDate, ToDate);
                                if ptbc.FindSet() then begin
                                    repeat
                                        Week := Date2DWY(ptbc."Date of Maintenance", 2);
                                        if Week = 1 then begin
                                            Week1 := ptbc."Date of Maintenance";
                                            supervisour1 := ptbc.Supervisor
                                        end
                                        else
                                            if Week = 2 then begin
                                                Week2 := ptbc."Date of Maintenance";
                                                supervisour2 := ptbc.Supervisor
                                            end
                                            else
                                                if Week = 3 then begin
                                                    week3 := ptbc."Date of Maintenance";
                                                    supervisour3 := ptbc.Supervisor
                                                end
                                                else
                                                    if Week = 4 then begin
                                                        Week4 := ptbc."Date of Maintenance";
                                                        supervisour4 := ptbc.Supervisor
                                                    end
                                                    else
                                                        if Week = 5 then begin
                                                            Week5 := ptbc."Date of Maintenance";
                                                            supervisour5 := ptbc.Supervisor;
                                                        end;
                                        Message('%1...%2...%3...%4...%5', Week, Week1, Week2, Week3, Week4);
                                    until ptbc.Next() = 0;
                                end;
                                */
            end;

        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Fromdate; Fromdate)
                    {
                        ApplicationArea = All;
                        Caption = 'From Date';
                    }
                    field(todate; todate)
                    {
                        ApplicationArea = all;
                        caption = 'To Date';
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(group)
                {
                    ApplicationArea = All;

                }

            }
        }
    }

    trigger OnPreReport()
    var
    begin

        CompanyInfo.Get();
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        ptbc: Record "Posted Timebased Calender";
        myInt: Integer;
        "Sno.": Integer;
        Companyinfo: record "Company Information";
        FromDate: Date;
        ToDate: Date;
        Week: Integer;
        Week1: Date;
        Week2: Date;
        Week3: Date;
        Week4: Date;
        Week5: Date;
        L1: Label 'Week';
        supervisour1: text[50];
        supervisour2: text[50];
        supervisour3: text[50];
        supervisour4: text[50];
        supervisour5: text[50];

}