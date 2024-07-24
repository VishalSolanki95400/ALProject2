page 50103 "Main Solar Meter"
{
    ApplicationArea = All;
    Caption = 'Main Solar Meter';
    PageType = List;
    SourceTable = "Main solar  meter";
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Import KVAH Reading"; Rec."Import KVAH Reading")
                {
                    ToolTip = 'Specifies the value of the Import KVAH Reading field.';
                }
                field("Import KWH Reading"; Rec."Import KWH Reading")
                {
                    ToolTip = 'Specifies the value of the Import KWH Reading field.';
                }
                field("Import MDI - KVAH  Reading"; Rec."Import MDI - KVAH  Reading")
                {
                    ToolTip = 'Specifies the value of the Import MDI - KVAH  Reading field.';
                }
                field("Export KVAh Reading"; Rec."Export KVAh Reading")
                {
                    ToolTip = 'Specifies the value of the Export KVAh Reading field.';
                }
                field("Export KWH Reading"; Rec."Export KWH Reading")
                {
                    ToolTip = 'Specifies the value of the Export KWH Reading field.';
                }
                field("Export MDI - KVAH Reading"; Rec."Export MDI - KVAH Reading")
                {
                    ToolTip = 'Specifies the value of the Export MDI - KVAH Reading field.';
                }
                field("NET KVAH Reading"; Rec."NET KVAH Reading")
                {
                    ToolTip = 'Specifies the value of the NET KVAH Reading field.';
                }
                field("NET KWH Reading"; Rec."NET KWH Reading")
                {
                    ToolTip = 'Specifies the value of the NET KWH Reading field.';
                }
                field("Import Today KVAH Value"; Rec."Import Today KVAH Value")
                {
                    ToolTip = 'Specifies the value of the Import Today KVAH Value field.';
                }
                field("Import Today KWH Value"; Rec."Import Today KWH Value")
                {
                    ToolTip = 'Specifies the value of the Import Today KWH Value field.';
                }
                field("Export Today KVAH Value"; Rec."Export Today KVAH Value")
                {
                    ToolTip = 'Specifies the value of the Export Today KVAH Value field.';
                }
                field("Export Today KWH Value"; Rec."Export Today KWH Value")
                {
                    ToolTip = 'Specifies the value of the Export Today KWH Value field.';
                }
                field("NET Today KVAH Value"; Rec."NET Today KVAH Value")
                {
                    ToolTip = 'Specifies the value of the NET Today KVAH Value field.';
                }
                field("NET Today KWH Value"; Rec."NET Today KWH Value")
                {
                    ToolTip = 'Specifies the value of the NET Today KWH Value field.';
                }
                field("Import ToDate KVAH Value"; Rec."Import ToDate KVAH Value")
                {
                    ToolTip = 'Specifies the value of the Import ToDate KVAH Value field.';
                }
                field("Import ToDate KWH Value"; Rec."Import ToDate KWH Value")
                {
                    ToolTip = 'Specifies the value of the Import ToDate KWH Value field.';
                }
                field("Export ToDate KVAH Value"; Rec."Export ToDate KVAH Value")
                {
                    ToolTip = 'Specifies the value of the Export ToDate KVAH Value field.';
                }
                field("Export ToDate KWH Value"; Rec."Export ToDate KWH Value")
                {
                    ToolTip = 'Specifies the value of the Export ToDate KWH Value field.';
                }
                field("NET ToDate KVAH Value"; Rec."NET ToDate KVAH Value")
                {
                    ToolTip = 'Specifies the value of the NET ToDate KVAH Value field.';
                }
                field("NET ToDate KWH Value"; Rec."NET ToDate KWH Value")
                {
                    ToolTip = 'Specifies the value of the NET ToDate KWH Value field.';
                }
                field("Import Today P.F"; Rec."Import Today P.F")
                {
                    ToolTip = 'Specifies the value of the Import Today P.F field.';
                }
                field("Import ToDate P.F"; Rec."Import ToDate P.F")
                {
                    ToolTip = 'Specifies the value of the Import ToDate P.F field.';
                }
                field("Import MDI Calculated"; Rec."Import MDI Calculated")
                {
                    ToolTip = 'Specifies the value of the Import MDI Calculated field.';
                }
                field("Export MDI"; Rec."Export MDI")
                {
                    ToolTip = 'Specifies the value of the Export MDI field.';
                }
                field("PSPCL Import CONSUMPTION KVAH"; Rec."PSPCL Import CONSUMPTION KVAH")
                {
                    ToolTip = 'Specifies the value of the PSPCL Import CONSUMPTION KVAH field.';
                }
                field("EXPORT (Solar) Genaration KVAH"; Rec."EXPORT (Solar) Genaration KVAH")
                {
                    ToolTip = 'Specifies the value of the EXPORT (Solar) Genaration KVAH field.';
                }
                field("EXPORT (Solar)  Genaration KWH"; Rec."EXPORT (Solar)  Genaration KWH")
                {
                    ToolTip = 'Specifies the value of the EXPORT (Solar)  Genaration KWH field.';
                }
            }
        }
    }
}
