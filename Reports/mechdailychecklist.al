report 50107 "Mech Daily check list"
{
    Caption = ' Mech. Daily CheckList Complience Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\MechDailychecklist.rdl';

    dataset
    {
        dataitem("Posted Mech. ERP checklist"; "Posted Mech. ERP checklist")
        {
            RequestFilterFields = "Area", Date;
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
            column(Date; Date)
            {

            }
            column("Area"; "Area")
            {

            }
            column(Description; Description)
            {

            }
            column(PARAMETER; PARAMETER)
            {

            }
            column(Shift_A; "Shift-A")
            {
            }
            column(SHIFT_A_Condition_1; "SHIFT A Condition-1")
            {
            }
            column(Shift_Incharge_Name; "Shift Incharge Name")
            {
            }
            column(Shift_B; "Shift-B")
            {
            }
            column(SHIFT_B_Condition_1; "SHIFT B Condition-1")
            {
            }
            column(Shift_B_Incharge_Name; "Shift B Incharge Name")
            {

            }
            column(Shift_C; "Shift-C")
            {

            }
            column(SHIFT_C_Condition_1; "SHIFT C Condition-1")
            {

            }
            column(Shift_C_Incharge_Name; "Shift C Incharge Name")
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
        Item: Record "Item Ledger Entry";
}