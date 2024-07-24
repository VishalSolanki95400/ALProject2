Report 50135 "Motor Greasing report"
{
    Caption = 'Motor Greasing report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Motor Greasing report.rdl';

    Dataset
    {
        Dataitem("Posted MotorGreasing Checklist"; "Posted MotorGreasing Checklist")

        {

            RequestFilterFields = "Location Code", "Posting Date";
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
            column(Motor_No_; "Motor No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Frequency; Frequency)
            {

            }
            column(Execution_Date; "Execution Date")
            {

            }
            column(Next_Due_Date; "Next Due Date")
            {

            }
            column(Motor_Greasing; "Motor Greasing")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Location_Code; "Location Code")
            {

            }


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
                // group(GroupName)
                // {


                // }
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
        Companyinfo: record "Company Information";


}