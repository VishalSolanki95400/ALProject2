table 50102 "Main solar  meter"
{
    Caption = 'Main solar  meter';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Serial No."; Integer)
        {
            Caption = 'Serial No.';
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(3; "Import KVAH Reading"; Decimal)
        {
            Caption = 'Import KVAH Reading';
        }
        field(4; "Import KWH Reading"; Decimal)
        {
            Caption = 'Import KWH Reading';
        }
        field(5; "Import MDI - KVAH  Reading"; Decimal)
        {
            Caption = 'Import MDI - KVAH  Reading';
        }
        field(6; "Export KVAh Reading"; Decimal)
        {
            Caption = 'Export KVAh Reading';
        }
        field(7; "Export KWH Reading"; Decimal)
        {
            Caption = 'Export KWH Reading';
        }
        field(8; "Export MDI - KVAH Reading"; Decimal)
        {
            Caption = 'Export MDI - KVAH Reading';
        }
        field(9; "NET KVAH Reading"; Decimal)
        {
            Caption = 'NET KVAH Reading';
        }
        field(10; "NET KWH Reading"; Decimal)
        {
            Caption = 'NET KWH Reading';
        }
        field(11; "Import Today KVAH Value"; Decimal)
        {
            Caption = 'Import Today KVAH Value';
        }
        field(12; "Import Today KWH Value"; Decimal)
        {
            Caption = 'Import Today KWH Value';
        }
        field(13; "Export Today KVAH Value"; Decimal)
        {
            Caption = 'Export Today KVAH Value';
        }
        field(14; "Export Today KWH Value"; Decimal)
        {
            Caption = 'Export Today KWH Value';
        }
        field(15; "NET Today KVAH Value"; Decimal)
        {
            Caption = 'NET Today KVAH Value';
        }
        field(16; "NET Today KWH Value"; Decimal)
        {
            Caption = 'NET Today KWH Value';
        }
        field(17; "Import ToDate KVAH Value"; Decimal)
        {
            Caption = 'Import ToDate KVAH Value';
        }
        field(18; "Import ToDate KWH Value"; Decimal)
        {
            Caption = 'Import ToDate KWH Value';
        }
        field(19; "Export ToDate KVAH Value"; Decimal)
        {
            Caption = 'Export ToDate KVAH Value';
        }
        field(20; "Export ToDate KWH Value"; Decimal)
        {
            Caption = 'Export ToDate KWH Value';
        }
        field(21; "NET ToDate KVAH Value"; Decimal)
        {
            Caption = 'NET ToDate KVAH Value';
        }
        field(22; "NET ToDate KWH Value"; Decimal)
        {
            Caption = 'NET ToDate KWH Value';
        }
        field(23; "Import Today P.F"; Decimal)
        {
            Caption = 'Import Today P.F';
        }
        field(24; "Import ToDate P.F"; Decimal)
        {
            Caption = 'Import ToDate P.F';
        }
        field(25; "Import MDI Calculated"; Decimal)
        {
            Caption = 'Import MDI Calculated';
        }
        field(26; "Export MDI"; Decimal)
        {
            Caption = 'Export MDI';
        }
        field(27; "PSPCL Import CONSUMPTION KVAH"; Decimal)
        {
            Caption = 'PSPCL Import CONSUMPTION KVAH';
        }
        field(28; "EXPORT (Solar) Genaration KVAH"; Decimal)
        {
            Caption = 'EXPORT (Solar) Genaration KVAH';
        }
        field(29; "EXPORT (Solar)  Genaration KWH"; Decimal)
        {
            Caption = 'EXPORT (Solar)  Genaration KWH';
        }
    }
    keys
    {
        key(PK; "Serial No.")
        {
            Clustered = true;
        }
    }
}
