Report 50136 "Tap changer record"
{
    Caption = 'Tap changer record list report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Tap changer record.rdl';

    Dataset
    {
        Dataitem("Posted Daily CBM Calender"; "Posted Daily CBM Calender")

        {

            RequestFilterFields = "Equipment no", "Date Of Reading";
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
            column(Sno; Sno)
            {

            }
            column(Date_Of_Reading; "Date Of Reading")
            {

            }
            column(Equipment_no; "Equipment no")
            {

            }
            column(Current_Reading_Operation; "Current Reading/Operation")
            {

            }
            column(Task_Description; "Task Description")
            {

            }

            trigger OnAfterGetRecord()
            var
            begin
                "Sno" := "Sno" + 1;
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
        Sno: Integer;


}