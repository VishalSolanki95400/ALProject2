report 50126 "Daily Transformer"
{
    Caption = 'Daily Transformer Tap Changer Record';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\DailyTransformer.rdl';

    dataset
    {
        dataitem("Posted Condibased Calender"; "Posted Condibased Calender")
        {
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
            column(Date_Of_Reading; "Date Of Reading")
            {

            }
            column(Remarks; Remarks)
            {

            }
            column(month; month)
            {

            }
            column(thrity; thrity)
            {

            }
            column(svn; svn)
            {

            }
            column(twelve; twelve)
            {

            }
            column(tfive; tfive)
            {

            }

            trigger OnAfterGetRecord()
            var
                mnth: Integer;
            begin
                Clear(mnth);
                mnth := Date2DMY("Date of Maintenance", 2);

                if month = month::Jan then
                    if mnth <> 1 then
                        CurrReport.Skip();
                if month = month::Feb then
                    if mnth <> 2 then
                        CurrReport.Skip();
                if month = month::Mar then
                    if mnth <> 3 then
                        CurrReport.Skip();
                if month = month::Apr then
                    if mnth <> 4 then
                        CurrReport.Skip();
                if month = month::May then
                    if mnth <> 5 then
                        CurrReport.Skip();
                if month = month::Jun then
                    if mnth <> 6 then
                        CurrReport.Skip();
                if month = month::Jul then
                    if mnth <> 7 then
                        CurrReport.Skip();
                if month = month::Aug then
                    if mnth <> 8 then
                        CurrReport.Skip();
                if month = month::Sep then
                    if mnth <> 9 then
                        CurrReport.Skip();
                if month = month::Oct then
                    if mnth <> 10 then
                        CurrReport.Skip();
                if month = month::Nov then
                    if mnth <> 11 then
                        CurrReport.Skip();
                if month = month::Dec then
                    if mnth <> 12 then
                        CurrReport.Skip();


                "Sno." := "Sno." + 1;


                Clear(thrity);
                if "Posted Condibased Calender"."Equipment no" = 'ASSYDT100135' then
                    thrity := "Posted Condibased Calender"."Current Reading/Operation";

                Clear(twelve);
                if "Posted Condibased Calender"."Equipment no" = 'ASSYDT200163' then
                    twelve := "Posted Condibased Calender"."Current Reading/Operation";

                Clear(tfive);
                if "Posted Condibased Calender"."Equipment no" = 'ASEETR25MVA10297' then
                    tfive := "Posted Condibased Calender"."Current Reading/Operation";

                Clear(svn);
                if "Posted Condibased Calender"."Equipment no" = 'ASELTR30035' then
                    svn := "Posted Condibased Calender"."Current Reading/Operation";

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
                    field(month; month)
                    {
                        ApplicationArea = All;
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
        Companyinfo: Record "Company Information";
        "Sno.": Integer;
        month: Option Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec;
        thrity: Decimal;
        twelve: Decimal;
        tfive: Decimal;
        svn: Decimal;

}