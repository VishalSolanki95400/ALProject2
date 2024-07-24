Report 50139 "Trial Balance Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\trialbalancenetchange (2).rdl';
    AdditionalSearchTerms = 'year closing,close accounting period,close fiscal year';
    ApplicationArea = Basic, Suite;
    Caption = 'Trial Balance Report With Net Change';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    DataAccessIntent = ReadOnly;


    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Account Type", "Date Filter", "Global Dimension 1 Filter", "Global Dimension 2 Filter";
            column(STRSUBSTNO_Text000_PeriodText_; StrSubstNo(Text000, PeriodText))
            {
            }
            column(COMPANYNAME; COMPANYPROPERTY.DisplayName())
            {
            }
            column(PeriodText; PeriodText)
            {
            }
            column(G_L_Account__TABLECAPTION__________GLFilter; TableCaption + ': ' + GLFilter)
            {
            }
            column(GLFilter; GLFilter)
            {
            }
            column(G_L_Account_No_; "No.")
            {
            }
            column(Trial_BalanceCaption; Trial_BalanceCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Net_ChangeCaption; Net_ChangeCaptionLbl)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(G_L_Account___No__Caption; FieldCaption("No."))
            {
            }
            column(Account_Category; "Account Category")
            {

            }

            column(Income_Balance; "Income/Balance")
            {

            }
            column(PADSTR_____G_L_Account__Indentation___2___G_L_Account__NameCaption; PADSTR_____G_L_Account__Indentation___2___G_L_Account__NameCaptionLbl)
            {
            }
            column(G_L_Account___Net_Change_Caption; G_L_Account___Net_Change_CaptionLbl)
            {
            }
            column(G_L_Account___Net_Change__Control22Caption; G_L_Account___Net_Change__Control22CaptionLbl)
            {
            }
            column(G_L_Account___Balance_at_Date_Caption; G_L_Account___Balance_at_Date_CaptionLbl)
            {
            }
            column(G_L_Account___Balance_at_Date__Control24Caption; G_L_Account___Balance_at_Date__Control24CaptionLbl)
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }

            column(Opening_Credit; "Opening Credit")
            {

            }
            column(Opening_Debit; "Opening Debit")
            {

            }
            column(Net_Change__Credit; "Net Change  Credit")
            {

            }
            column(Net_Change__Debit; "Net Change  Debit")
            {

            }
            column(StartDate; StartDate)
            {

            }
            column(EndDate; EndDate)
            {

            }


            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(G_L_Account___No__; "G/L Account"."No.")
                {
                }
                column(PADSTR_____G_L_Account__Indentation___2___G_L_Account__Name; PadStr('', "G/L Account".Indentation * 2) + "G/L Account".Name)
                {
                }
                column(G_L_Account___Net_Change_; "G/L Account"."Net Change")
                {
                }
                column(G_L_Account___Net_Change__Control22; -"G/L Account"."Net Change")
                {
                    AutoFormatType = 1;
                }
                column(G_L_Account___Balance_at_Date_; "G/L Account"."Balance at Date")
                {
                }
                column(G_L_Account___Balance_at_Date__Control24; -"G/L Account"."Balance at Date")
                {
                    AutoFormatType = 1;
                }
                column(G_L_Account___Account_Type_; Format("G/L Account"."Account Type", 0, 2))
                {
                }
                column(No__of_Blank_Lines; "G/L Account"."No. of Blank Lines")
                {
                }

                dataitem(BlankLineRepeater; "Integer")
                {
                    DataItemTableView = sorting(Number);
                    column(BlankLineNo; BlankLineNo)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        GLEntry.SetRange("Posting Date", StartDate, EndDate);
                        if BlankLineNo = 0 then
                            CurrReport.Break();

                        BlankLineNo -= 1;
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    GLEntry.SetRange("Posting Date", StartDate, EndDate);
                    BlankLineNo := "G/L Account"."No. of Blank Lines" + 1;

                end;
            }

            trigger OnAfterGetRecord()
            var
                glAccount: Record "G/L Account";
            begin
                Clear("Opening Credit");
                Clear("Opening Debit");
                Clear("Net Change  Credit");
                Clear("Net Change  Debit");


                CalcFields("Net Change", "Balance at Date", "Credit Amount", "Debit Amount");

                if ("Credit Amount" = 0) and ("Debit Amount" = 0) then
                    CurrReport.Skip();

                if ChangeGroupNo then begin
                    PageGroupNo += 1;
                    ChangeGroupNo := false;
                end;
                SetRange("Account Type", "Account Type"::Posting);
                ChangeGroupNo := "New Page";

                glAccount.Reset();
                glAccount.SetRange("No.", "No.");

                GLEntry.Reset();
                GLEntry.Setfilter("Posting Date", '<%1', StartDate);
                GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                if GLEntry.FindFirst() then begin
                    if GLEntry.Amount < 0 then begin

                        "Opening Debit" += GLEntry.Amount;
                        "Opening Credit" := 0;
                    end
                    else
                        "Opening Credit" += GLEntry.Amount;
                    "Opening Debit" := 0;
                end
                else
                    GLEntry.Reset();
                GLEntry.SetRange("Posting Date", StartDate, EndDate);
                GLEntry.SetRange("G/L Account No.", "G/L Account"."No.");
                if GLEntry.FindFirst() then begin
                    repeat
                        if GLEntry.Amount < 0 then begin
                            "Net Change  Debit" += GLEntry.Amount;
                        end
                        else
                            "Net Change  Credit" += GLEntry.Amount;
                    until GLEntry.Next() = 0;
                end;

            end;

            trigger OnPreDataItem()
            begin
                PageGroupNo := 0;
                ChangeGroupNo := false;

            end;


        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                field(StartDate; StartDate)
                {
                    ApplicationArea = All;
                }
                field(EndDate; EndDate)
                {
                    ApplicationArea = All;
                }
            }
        }

        actions
        {

        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin

        "G/L Account".SecurityFiltering(SecurityFilter::Filtered);
        GLFilter := "G/L Account".GetFilters();
        PeriodText := "G/L Account".GetFilter("Date Filter");
    end;

    var
        Text000: Label 'Period: %1';
        Trial_BalanceCaptionLbl: Label 'Trial Balance';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Net_ChangeCaptionLbl: Label 'Net Change';
        BalanceCaptionLbl: Label 'Balance';
        PADSTR_____G_L_Account__Indentation___2___G_L_Account__NameCaptionLbl: Label 'Name';
        G_L_Account___Net_Change_CaptionLbl: Label 'Debit';
        G_L_Account___Net_Change__Control22CaptionLbl: Label 'Credit';
        G_L_Account___Balance_at_Date_CaptionLbl: Label 'Debit';
        G_L_Account___Balance_at_Date__Control24CaptionLbl: Label 'Credit';
        "Opening Debit": Decimal;
        "Opening Credit": Decimal;
        "Net Change  Debit": Decimal;
        "Net Change  Credit": Decimal;
        "GLEntry": Record "G/L Entry";
        StartDate: Date;
        EndDate: Date;


    protected var
        GLFilter: Text;
        PeriodText: Text[30];
        PageGroupNo: Integer;
        ChangeGroupNo: Boolean;
        BlankLineNo: Integer;
}

