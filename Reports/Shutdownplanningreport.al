report 50144 "Shutdown planning report"
{
    Caption = 'Shutdown planning report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Shutdownplanning.rdl';

    dataset
    {
        dataitem("Posted ShutdownPlanning"; "Posted ShutdownPlanning")
        {
            RequestFilterFields = "Area";
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
            column(Equipment; Equipment)
            {

            }
            column(Description_of_Job_to_be_done; "Description of Job to be done")
            {

            }
            column(Date; Date)
            {

            }
            column(Time; Time)
            {

            }
            column(Time_Required; "Time Required")
            {

            }
            column(Shutdown_Start_Date; "Shutdown Start Date")
            {

            }
            column(Shutdown_End_Date; "Shutdown End Date")
            {

            }
            column(ManPower_Required; "ManPower Required")
            {

            }
            column(Status_of_the_Job; "Status of the Job")
            {

            }
            column(Remarks; Remarks)
            {

            }
            column(Fromdate; Fromdate)
            {

            }
            column(todate; todate)
            {

            }

            trigger OnPreDataItem()
            var

            begin
                "Posted ShutdownPlanning".SetRange(Date, Fromdate, todate);
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
        Fromdate: Date;
        todate: Date;
        Companyinfo: record "Company Information";
}