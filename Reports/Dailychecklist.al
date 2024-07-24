report 50106 "Daily check list"
{
    Caption = 'Daily CheckList Complience Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Dailychecklist.rdl';

    dataset
    {
        dataitem("Posted ERP checklist"; "Posted ERP checklist")
        {
            RequestFilterFields = Date;
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
            column(Companycity; Companyinfo.City)
            {

            }
            column(Sno_; "Sno.")
            {

            }

            column(Entry_No_; "Entry No.")
            {

            }
            column(Date; Date)
            {

            }
            column("Area"; "Area")
            {

            }
            column(Description; Description)
            {

            }
            column(Shift_A; "Shift-A")
            {

            }
            column(Shift_B; "Shift-B")
            {

            }
            column(Shift_C; "Shift-C")
            {

            }
            column(Shift_Incharge_Name; "Shift Incharge Name")
            {

            }
            column(Notes; Notes)
            {

            }
            trigger OnAfterGetRecord()
            var
            begin
                "Sno." := "Sno." + 1;
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
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
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
        Companyinfo: record "Company Information";
        "Sno.": Integer;
}