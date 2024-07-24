page 50106 RGPsubformpage
{
    ApplicationArea = All;
    Caption = 'RGPsubformpage';
    PageType = ListPart;
    SourceTable = RGPLine;
    // AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("No."; Rec."No")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(UOM; Rec.UOM)
                {
                    ToolTip = 'Specifies the value of the UOM field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field("Qty to Ship"; Rec."Qty to Ship")
                {
                    ToolTip = 'Specifies the value of the Qty to Ship field.';
                }
                field("Qty Shipped"; Rec."Qty Shipped")
                {
                    ToolTip = 'Specifies the value of the Qty Shipped field.';
                }
                field("Issue Type"; Rec."Issue Type")
                {
                    ToolTip = 'Specifies the value of the Issue Type field.';
                }
                field("Qty to Received"; Rec."Qty to Received")
                {
                    ToolTip = 'Specifies the value of the Qty to Received field.';
                }
                field("Qty Received"; Rec."Qty Received")
                {
                    ToolTip = 'Specifies the value of the Qty Received field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("FARGP Led. Entry No."; Rec."FARGP Led. Entry No.")
                {
                    ToolTip = 'Specifies the value of the FARGP Led. Entry No. field.';
                }
            }
        }
    }
}
