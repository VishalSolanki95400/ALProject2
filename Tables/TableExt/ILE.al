tableextension 50175 ilext extends "Item Ledger Entry"
{

    fields
    {

        field(50010; "Varient"; code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50011; "Product Code"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50012; Grade1; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50013; Dia; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50014; Shape1; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50015; "Item Code"; Code[50])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(50016; "Item Type"; Code[50])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(item."Base Unit of Measure" where("No." = field("Item No.")));
        }
        field(50017; "Invenoty Post Group"; Code[50])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(item."Inventory Posting Group" where("No." = field("Item No.")));
        }
        field(50018; "ShortCut Dim. 3"; Code[50])
        {
            Editable = false;
            Caption = 'Cost Center';
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"), "Dimension Code" = const('COST CENTER')));
            FieldClass = FlowField;
        }
        field(50019; "ShortCut Dim. 4"; Code[50])
        {
            Editable = false;
            Caption = 'Project';
            CalcFormula = lookup("Dimension Set Entry"."Dimension Value Code" where("Dimension Set ID" = field("Dimension Set ID"), "Dimension Code" = const('PROJECT')));
            FieldClass = FlowField;
        }
        field(50020; "QC Remarks"; Option)
        {
            Editable = false;
            OptionMembers = " ","QC TRF";
            DataClassification = ToBeClassified;
        }
        field(50021; "Reason"; Text[100])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(50022; "Consumption"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50023; "Heat No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }

    }

}