report 50149 "TBM Report"
{
    Caption = 'TBM Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\TBMReport.rdl';

    dataset
    {
        dataitem("Posted Timebased Calender"; "Posted Timebased Calender")
        {
            RequestFilterFields = HOD, "Maintenance Type", "Area";
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
            column("Area"; "Area")
            {

            }
            column(Equipment_no; "Equipment no")
            {

            }
            column(Assemlly; Assemlly)
            {

            }
            column(sub_assembly; "sub assembly")
            {

            }
            column(Task_Code; "Task Code")
            {

            }
            column(Task_Description; "Task Description")
            {

            }
            column(Department; Department)
            {

            }
            column(HOD; HOD)
            {

            }
            column(Schedule_Date; "Schedule Date")
            {

            }
            column(Maintenance_Type; "Maintenance Type")
            {

            }
            column(Date_of_Maintenance; "Date of Maintenance")
            {

            }
            column(Frequency; Frequency)
            {

            }
            column(Status; Status)
            {

            }
            column(Remarks; Remarks)
            {

            }
            column(FromDate; FromDate)
            {

            }
            column(ToDate; ToDate)
            {

            }
            trigger OnPreDataItem()
            var

            begin
                "Posted Timebased Calender".SetRange("Date of Maintenance", Fromdate, todate);
            end;

        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
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
                action(LayoutName)
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
        myInt: Integer;
        companyInfo: Record "Company Information";

        FromDate: Date;
        ToDate: Date;
}