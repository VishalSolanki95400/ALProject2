namespace ALProject.ALProject;

page 50123 Autoitemcreadtionlistpage
{
    ApplicationArea = All;
    Caption = 'Autoitemcreadtionlistpage';
    PageType = List;
    SourceTable = Autoitemcreation;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item Type"; Rec."Item Type")
                {
                    ToolTip = 'Specifies the value of the Item Type field.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("GST Credit"; Rec."GST Credit")
                {
                    ToolTip = 'Specifies the value of the GST Credit field.';
                }
                field("HSN/SAC Code"; Rec."HSN/SAC Code")
                {
                    ToolTip = 'Specifies the value of the HSN/SAC Code field.';
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ToolTip = 'Specifies the value of the Inventory Posting Group field.';
                }
                field("Gen. prod. Posting Group"; Rec."Gen. prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Gen. prod. Posting Group field.';
                }
                field(Type_; Rec.Type_)
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Base Unit Of Measure"; Rec."Base Unit Of Measure")
                {
                    ToolTip = 'Specifies the value of the Base Unit Of Measure field.';
                }
            }
        }
    }
}
