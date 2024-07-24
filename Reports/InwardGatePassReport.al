report 50123 "Inward Gate Pass Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reportlayout\Inwardgatepass.rdl';


    dataset
    {
        dataitem(postedRGPHeader; postedRGPHeader)
        {
            RequestFilterFields = "Document No.";
            column(Document_No_; "Document No.")
            {

            }
            column(Type; Type)
            {

            }
            column(Locationcode; Locationcode)
            {

            }
            column(Vendor_No_; "Vendor No.")
            {

            }
            column(Vendor_Name; "Vendor Name")
            {

            }
            column(Gr_RR_No_; "Gr/RR No.")
            {

            }
            column(Shipment_Method; "Shipment Method")
            {

            }
            dataitem(postedRGPLine; postedRGPLine)
            {
                DataItemLink = "Document No." = field("Document No.");
                column(No; No)
                {

                }
                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Qty_Received; "Qty Received")
                {

                }
                column(Qty_to_Received; "Qty to Received")
                {

                }
                column(Unit_Cost; "Unit Cost")
                {

                }
                column(Line_Amount; "Line Amount")
                {

                }
                column(Remarks; Remarks)
                {

                }
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

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = Excel;
    //         LayoutFile = 'mySpreadsheet.xlsx';
    //     }
    // }

    var
        myInt: Integer;
}