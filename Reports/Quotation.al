report 50198 Quotationreport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Quatation.rdl';


    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {

            column(Companyname; Companyinfo.Name)
            {

            }
            column(Companypic; Companyinfo.Picture)
            {

            }
            column(Companyadd; Companyinfo.Address)
            {

            }
            column(Companyadd2; Companyinfo."Address 2")
            {

            }
            column(Companycity; Companyinfo.City)
            {

            }
            column(Companypost; Companyinfo."Post Code")
            {

            }
            column(Companyphone; Companyinfo."Phone No.")
            {

            }
            column(Companyemail; Companyinfo."E-Mail")
            {

            }
            column(No__Series; "No. Series")
            {

            }
            column(Order_Date; "Order Date")
            {

            }
            column(Quote_No_; "Quote No.")
            {

            }
            column(SNo; SNo)
            {

            }
            column(Quote_Accepted_Date; "Quote Accepted Date")
            {

            }
            dataitem("Sales Line"; "Sales Line")
            {

                DataItemTableView = sorting("Document No.", "Line No.", "Document Type");
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = "Sales Header";




                column(Description; Description)
                {

                }
                column(No_; "No.")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_of_Measure; "Unit of Measure")
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Amountinwords; Amountinwords[1])
                {


                }

                trigger OnAfterGetRecord()

                begin

                    SNo := SNo + 1;

                    if cust.Get("Sales header"."Bill-to Customer No.") then;
                    totalamt += Amount;
                    Clear(Amountinwords);
                    check.InitTextVariable();
                    check.FormatNoText(Amountinwords, Round(totalamt), "Sales Header"."Currency Code");
                    check.FormatNoText(Amountinwords, Round(totalamt), "Sales Line"."Currency Code");
                end;

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

    procedure Amountinwordss(amounts: Decimal)
    var
        reportcheck: report "check";
        amountinwords: array[2] of Text[80];
    begin

    end;

    trigger OnPreReport()
    begin
        Companyinfo.get();
        Companyinfo.CalcFields(Companyinfo.Picture);
    end;



    var
        "SNo": Integer;
        Companyinfo: record "Company Information";
        Amountinwords: array[2] of Text[80];
        totalamt: Decimal;
        check: Report Check;
        Cust: Record Customer;


}