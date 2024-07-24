namespace ALProject.ALProject;

page 50127 "Import status"
{
    ApplicationArea = All;
    Caption = 'Import status';
    PageType = Worksheet;
    SourceTable = "Import Status";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Import stage status"; Rec."Import stage status")
                {
                    ApplicationArea = all;
                }
                field("Supplier No."; Rec."Supplier No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Supplier No. field.', Comment = '%';
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Supplier field.', Comment = '%';
                }
                field(Origin; Rec.Origin)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Origin field.', Comment = '%';
                }
                field(Total; Rec.Total)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Total field.', Comment = '%';
                }
                field(LOT; Rec.LOT)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the LOT field.', Comment = '%';
                }
                field("PER TON"; Rec."PER TON")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the PER TON field.', Comment = '%';
                }
                field(RATE; Rec.RATE)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the RATE field.', Comment = '%';
                }
                field("CONTRACT DATE"; Rec."CONTRACT DATE")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the CONTRACT DATE field.', Comment = '%';
                }
                field("GRADE "; Rec."GRADE ")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the GRADE field.', Comment = '%';
                }
                field(INDENTOR; Rec.INDENTOR)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the INDENTOR field.', Comment = '%';
                }
                field(CHA; Rec.CHA)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the CHA field.', Comment = '%';
                }
                field(ARRIVAL; Rec.ARRIVAL)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the ARRIVAL field.', Comment = '%';
                }
                field(PORT; Rec.PORT)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the PORT field.', Comment = '%';
                }
                field(TERM; Rec.TERM)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the TERM field.', Comment = '%';
                }
                field(INVOICE; Rec.INVOICE)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the INVOICE field.', Comment = '%';
                }
                field("DO VALIDITY"; Rec."DO VALIDITY")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the DO VALIDITY field.', Comment = '%';
                }
                field("SHIPPING LINE"; Rec."SHIPPING LINE")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the SHIPPING LINE field.', Comment = '%';
                }
                field(BL; Rec.BL)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the BL field.', Comment = '%';
                }
                field(TPT; Rec.TPT)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the TPT field.', Comment = '%';
                }
                field("CUSTOM DUTY"; Rec."CUSTOM DUTY")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the CUSTOM DUTY field.', Comment = '%';
                }
                field("COC DT."; Rec."COC DT.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the COC DT. field.', Comment = '%';
                }
                field("W/H"; Rec."W/H")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the W/H field.', Comment = '%';
                }
                field("SIMS "; Rec."SIMS ")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the SIMS field.', Comment = '%';
                }
                field(SECURITY; Rec.SECURITY)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the SECURITY field.', Comment = '%';
                }
                field("BOE NO."; Rec."BOE NO.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the BOE NO. field.', Comment = '%';
                }
                field("DATE"; Rec."DATE")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the DATE field.', Comment = '%';
                }
                field(REMARKS; Rec.REMARKS)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the REMARKS field.', Comment = '%';
                }
                field("PURCHASE ORDER"; Rec."PURCHASE ORDER")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the PURCHASE ORDER field.', Comment = '%';
                }
            }
        }
    }
}
