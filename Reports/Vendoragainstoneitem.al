Report 50133 "Vendor report against one item"
{
    Caption = 'Vendor report against one item';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Vendorreport.rdl';

    dataset
    {
        dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
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
            column(vendno; vend."No.")
            {
            }
            column(vendname; vend.Name)
            {
            }
            column(vendlocation; vend."Location Code")
            {
            }
            column(vendcontact; vend.Contact)
            {
            }
            column(vendphone; vend."Phone No.")
            {
            }
            column(vendpost; vend."Post Code")
            {
            }
            column(vendpaymentcode; vend."Payment Terms Code")
            {
            }
            column(vendsearch; vend."Search Name")
            {
            }
            // column(vend;vend."MSME No.")
            // {

            // }
            column(vendstatecode; vend."State Code")
            {
            }
            column(vendadd; vend.Address)
            {
            }
            column(vendadd2; vend."Address 2")
            {
            }
            column(vendassess; vend."Assessee Code")
            {
            }
            column(vendpan; vend."P.A.N. No.")
            {
            }
            column(vendgst; vend."GST Registration No.")
            {
            }


            trigger OnPreDataItem()
            begin
                SetRange("No.", item);
            end;

            trigger OnAfterGetRecord()
            var
            begin
                if vend.Get("Purch. Rcpt. Line"."Buy-from Vendor No.") then;
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
                    field(Item; Item)
                    {
                        TableRelation = Item;
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
        Companyinfo: Record "Company Information";
        vend: Record Vendor;
        Item: Code[20];
}