report 50140 "comparative expense report"
{
    Caption = 'Comparative Expense Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\Comparativeexpense.rdl';



    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            RequestFilterFields = "Account Category";


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

            column(No_; "No.")
            {

            }
            column(Name; Name)
            {

            }
            column(Account_Category; "Account Category")
            {

            }
            column(FromYear; FromYear)
            {

            }
            column(TOYear; TOYear)
            {

            }
            column(colValue1; colValue1) { }
            column(colValue2; colValue2) { }
            column(colValue3; colValue3) { }
            column(colValue4; colValue4) { }
            column(colValue5; colValue5) { }
            column(colValue6; colValue6) { }
            column(colValue7; colValue7) { }
            column(colValue8; colValue8) { }
            column(colValue9; colValue9) { }
            column(colValue10; colValue10) { }
            column(colValue11; colValue11) { }
            column(colValue12; colValue12) { }


            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLinkReference = "G/L Account";
                DataItemLink = "G/L Account No." = field("No.");
                column(Posting_Date; "Posting Date")
                {

                }
                column(Amount; Amount)
                {

                }


                trigger OnPreDataItem()
                var
                begin
                    "G/L Entry".SetRange("Posting Date", FromYear, TOYear);
                end;

                trigger OnAfterGetRecord()
                var
                    mnth: Integer;
                    GLEntry: Record "G/L Entry";
                begin
                    // CalcFields(Amount);


                    Clear(mnth);
                    Clear(colValue1);
                    Clear(colValue2);
                    Clear(colValue3);
                    Clear(colValue4);
                    Clear(colValue5);
                    Clear(colValue6);
                    Clear(colValue7);
                    Clear(colValue8);
                    Clear(colValue9);
                    Clear(colValue10);
                    Clear(colValue11);
                    Clear(colValue12);

                    //
                    GLEntry.Reset();
                    GLEntry.SetRange("Posting Date", FromYear, TOYear);
                    GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                    // // GLEntry.SetRange("Entry No.", "Entry No.");
                    if GLEntry.FindFirst() then begin
                        repeat
                            mnth := Date2DMY(GLEntry."posting date", 2);
                            if mnth = 1 then begin
                                colValue1 += GLEntry.Amount;

                            end
                            else

                                if mnth = 2 then begin
                                    colValue2 += GLEntry.Amount;
                                end
                                else
                                    if mnth = 3 then begin
                                        colValue3 += GLEntry.Amount;
                                    end
                                    else
                                        if mnth = 4 then begin
                                            colValue4 += GLEntry.Amount;
                                        end
                                        else
                                            if mnth = 5 then begin
                                                colValue5 += GLEntry.Amount;
                                            end
                                            else
                                                if mnth = 6 then begin
                                                    colValue6 += GLEntry.Amount;

                                                end
                                                ELSE
                                                    if mnth = 7 then begin
                                                        colValue7 += GLEntry.Amount;
                                                    end
                                                    else
                                                        if mnth = 8 then begin
                                                            colValue8 += GLEntry.Amount;
                                                        end
                                                        else
                                                            if mnth = 9 then begin
                                                                colValue9 += GLEntry.Amount;
                                                            end
                                                            else
                                                                if mnth = 10 then begin
                                                                    colValue10 += GLEntry.Amount;

                                                                end
                                                                else
                                                                    if mnth = 11 then begin
                                                                        colValue11 += GLEntry.Amount;
                                                                    end
                                                                    else
                                                                        if mnth = 12 then begin
                                                                            colValue12 += GLEntry.Amount;
                                                                        end;

                        until GLEntry.Next() = 0;

                    end;
                    /*
                    if month = month::Jan then
                        colValue1 := Value1;
                    if month = month::Feb then
                        colValue2 := Value2;

                    if month = month::Mar then
                        colValue3 := Value3;
                    if month = month::Apr then
                        colValue4 := Value4;
                    if month = month::May then
                        colValue5 := Value5;
                    if month = month::Jun then
                        colValue6 := Value6;
                    if month = month::Jul then
                        colValue7 := Value7;
                    if month = month::Aug then
                        colValue8 := Value8;
                    if month = month::Sep then
                        colValue9 := Value9;
                    if month = month::Oct then
                        colValue10 := Value10;
                    if month = month::Nov then
                        colValue11 := Value11;
                    if month = month::Dec then
                        colValue12 := Value12;

*/



                    //

                    // System.DMY2Date(Day: Integer [, Month: Integer] [, Year: Integer])
                end;
            }
            // trigger OnPreDataItem()
            // var
            //     myInt: Integer;
            // Begin
            //     if category = category::"Cost of Good Sold" then begin
            //         "G/L Account".SetRange("Account Category", category::"Cost of Good Sold");
            //     end else
            //         if category = category::Expense then begin
            //             "G/L Account".SetRange("Account Category", category::Expense);

            //         end
            //         else
            //             if category = category::Income then begin
            //                 "G/L Account".SetRange("Account Category", category::Income);

            //             end;
            // end;
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
                    field(FromYear; FromYear)
                    {
                        ApplicationArea = All;
                        Caption = 'From Year';
                    }
                    field(TOYear; TOYear)
                    {
                        ApplicationArea = All;
                        Caption = 'To- Year';
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
        Companyinfo: Record "Company Information";
        myInt: Integer;
        month: Option Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec;
        TOYear: Date;
        FromYear: date;
        category: option "Cost of Good Sold",Income,Expense;
        colValue1: Decimal;

        colValue2: Decimal;
        colValue3: Decimal;
        colValue4: Decimal;
        colValue5: Decimal;
        colValue6: Decimal;
        colValue7: Decimal;
        colValue8: Decimal;
        colValue9: Decimal;
        colValue10: Decimal;
        colValue11: Decimal;
        colValue12: Decimal;
        Value1: Decimal;
        Value2: Decimal;
        Value3: Decimal;
        Value4: Decimal;
        Value5: Decimal;
        Value6: Decimal;
        Value7: Decimal;
        Value8: Decimal;
        Value9: Decimal;
        Value10: Decimal;
        Value11: Decimal;
        Value12: Decimal;



}