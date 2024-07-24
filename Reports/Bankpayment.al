report 50145 "Bank Payment"
{
    Caption = 'Bank Payment Voucher Due Balance';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Bankpayment.rdl';

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            RequestFilterFields = "Document No.", "Vendor No.";
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
            column(Vendor_No_; "Vendor No.")
            {

            }
            column(Vend; Vend.Name)
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(Remaining_Amount; "Remaining Amount")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(External_Document_No_; "External Document No.")
            {

            }
            column(PPIH; PPIH."Payment Terms Code")
            {

            }
            column(Due_Date; "Due Date")
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
                "Vendor Ledger Entry".SetRange("Due Date", Fromdate, Todate);
                "Vendor Ledger Entry".setrange("Document Type", "Document Type"::Invoice);
            end;

            trigger OnAfterGetRecord()

            var

            begin
                if PPIH.Get("Vendor Ledger Entry"."Document No.") then;
                if "Remaining Amount" = 0 then
                    CurrReport.Skip();


                if Vend.get("Vendor No.") then;


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
                    field(FromDate; FromDate)
                    {
                        ApplicationArea = All;

                    }
                    field(ToDate; ToDate)
                    {
                        ApplicationArea = all;
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
        FromDate: Date;
        ToDate: Date;
        companyinfo: Record "Company Information";
        PPIH: record "Purch. Inv. Header";
        Vend: record Vendor;

}