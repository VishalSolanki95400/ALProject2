tableextension 50145 Purchaseorderext extends "Purchase Header"
{
    fields
    {
        field(50000; "Project"; code[50])
        {
            DataClassification = ToBeClassified;
            //   TableRelation = "Project master";

        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}