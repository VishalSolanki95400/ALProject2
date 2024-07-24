page 50109 postedRGPCardPage
{
    ApplicationArea = All;
    Caption = 'postedRGPCardPage';
    PageType = Card;
    SourceTable = postedRGPHeader;
    Editable = false;


    layout
    {
        area(content)
        {
            group(GroupName)
            {
                Caption = 'General';

                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Locationcode; Rec.Locationcode)
                {
                    ToolTip = 'Specifies the value of the Locationcode field.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Post "; Rec."Post ")
                {
                    ToolTip = 'Specifies the value of the Post  field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Transporter Vendor No."; Rec."Transporter Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Transporter Vendor No. field.';
                }
                field("Gr/RR No."; Rec."Gr/RR No.")
                {
                    ToolTip = 'Specifies the value of the Gr/RR No. field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field("Shipment Method"; Rec."Shipment Method")
                {
                    ToolTip = 'Specifies the value of the Shipment Method field.';
                }
                field("Gate Entry Inward"; Rec."Gate Entry Inward")
                {
                    ToolTip = 'Specifies the value of the Gate Entry Inward field.';
                }
                field("Gate Entry Outword"; Rec."Gate Entry Outword")
                {
                    ToolTip = 'Specifies the value of the Gate Entry Outword field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group(subform)
            {

                part(General; RGPsubformpage)
                {
                    SubPageLink = "Document No." = field("Document No.");
                    ApplicationArea = all;
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action("Inward Gate Pass Report")
            {
                Caption = 'Report';
                Image = Report;
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    ph: Record postedRGPHeader;
                begin
                    ph.Reset();
                    ph.SetRange("Document No.", rec."Document No.");
                    if ph.FindFirst() then
                        Report.Run(50123, true, false, ph);
                end;


            }

        }
    }
}
