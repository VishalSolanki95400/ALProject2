xmlport 50110 "Sales Order XMLImports"
{
    Caption = 'Sales Order Import';
    Direction = Import;
    Format = VariableText;
    UseRequestPage = false;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(SalesOrder)
        {
            MinOccurs = Zero;
            tableelement("Temp sales header "; "Temp sales header ")
            {
                AutoSave = false;
                XmlName = 'SalesOrderPort';

                textelement(No)
                {
                    MinOccurs = Zero;
                }
                textelement(LineNo)
                {
                    MinOccurs = Zero;
                }
                textelement(CustomerNo)
                {
                    MinOccurs = Zero;
                }
                textelement(LocationCode)
                {
                    MinOccurs = Zero;
                }
                textelement(PostingDate)
                {
                    MinOccurs = Zero;
                }
                textelement(ExternalDocNo)
                {
                    MinOccurs = Zero;
                }
                textelement(Type)
                {
                    MinOccurs = Zero;

                }
                textelement(SO_No)
                {
                    MinOccurs = Zero;
                }
                textelement(UOM)
                {
                    MinOccurs = Zero;
                }
                textelement(Quantity)
                {
                    MinOccurs = Zero;
                }
                textelement(UnitCost)
                {
                    MinOccurs = Zero;
                }
                textelement(Amount)
                {
                    MinOccurs = Zero;
                }
                textelement(Status)
                {
                    MinOccurs = Zero;
                }

                trigger OnBeforeInsertRecord()
                var
                    soRec: Record "Temp sales header ";
                begin
                    if No <> '' then
                        Evaluate(soRec."No.", No);
                    dtPostingDate := Today;
                    if LineNo <> '' then
                        Evaluate(soRec."Line No.", LineNo);
                    Evaluate(soRec."Customer No.", CustomerNo);
                    Evaluate(soRec."Location Code", LocationCode);
                    Evaluate(soRec."Posting Date", PostingDate);
                    Evaluate(soRec."External Doc No.", ExternalDocNo);
                    Evaluate(soRec."Type ", Type);
                    Evaluate(soRec."No.", SO_No);
                    Evaluate(soRec."UOM", UOM);
                    Evaluate(soRec."Quantity", Quantity);
                    Evaluate(soRec."Unit Cost", UnitCost);
                    Evaluate(soRec."Amount", Amount);
                    Evaluate(soRec."Status", Status);
                    Evaluate(soRec, "Temp sales header "."Sales order No.");

                    soRec.Insert(true);
                end;
            }
        }
    }

    trigger OnPreXmlPort()
    begin
        // Add any necessary initialization code here
    end;

    trigger OnPostXmlPort()
    begin
        MESSAGE('Data has been successfully imported.');
    end;

    var
        StrToInt: Code[20];
        dtPostingDate: Date;

}