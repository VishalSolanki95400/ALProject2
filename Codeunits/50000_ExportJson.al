codeunit 50100 ExportJson
{
    local procedure CreateJSON(Customer: Record Customer)
    var
        ShiptoAddress: Record "Ship-to Address";
        JArray: JsonArray;
        CustObject: JsonObject;
        JsonObject: JsonObject;
        ShiptoObject: JsonObject;
        JsonData: Text;

    begin
        Clear(JsonObject);
        Clear(CustObject);

        CustObject.Add('No', Customer."No.");
        CustObject.Add('Address', Customer.Address);
        CustObject.Add('Address_2', Customer."Address 2");
        CustObject.Add('City', Customer.City);
        CustObject.Add('County', Customer.County);
        CustObject.Add('Country_Region', Customer."Country/Region Code");
        CustObject.Add('Post_Code', Customer."Post Code");

        ShiptoAddress.SetRange("Customer No.", Customer."No.");
        if ShiptoAddress.FindSet() then begin
            Clear(JArray);
            repeat
                Clear(ShiptoObject);
                ShiptoObject.Add('Code', ShiptoAddress.Code);
                ShiptoObject.Add('Address', ShiptoAddress.Address);
                ShiptoObject.Add('Address_2', ShiptoAddress."Address 2");
                ShiptoObject.Add('City', ShiptoAddress.City);
                ShiptoObject.Add('County', ShiptoAddress.County);
                ShiptoObject.Add('Post_Code', ShiptoAddress."Post Code");
                JArray.Add(ShiptoObject);
            until ShiptoAddress.Next() = 0;
            CustObject.Add('Ship-to', JArray);
        end;

        JsonObject.Add('Customer', CustObject);

        JsonObject.WriteTo(JsonData);

    end;
    /*local procedure ExportCustomerJson(customer: record customer)
    var
        customerJson: JsonObject;
        tempblob : Codeunit "Temp Blob";
        customeroutstream: OutStream;
    begin
        customer.SetAutoCalcFields("Balance (LCY)", "Sales (LCY)");
        customerJson.Add(customer.FieldCaption("No."), customer."No.");
        customerJson.Add(customer.FieldCaption(Name), customer.Name);
        customerJson.Add(customer.FieldCaption("Balance (LCY)"), customer."Balance (LCY)");
        customerJson.Add(customer.FieldCaption("Sales (LCY)"), customer."Sales (LCY)");

        tempblob.CreateOutStream()

    end;
    */
}