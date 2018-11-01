tableextension 50100 "PaymentTerms" extends "Cust. Ledger Entry"
{
    fields
    {
        
        field(50000; "Payment Terms Code"; Code[10])
        {
            TableRelation = "Payment Terms";
            CaptionML = ENU = 'Payment Terms Code', DEU='Zahlungsbedingungscode';

            trigger OnValidate();
            begin
                IF("Payment Terms Code" <> '') AND("Document Date" <> 0D) THEN BEGIN
                    PaymentTerms.GET("Payment Terms Code");
                    "Due Date" := CALCDATE(PaymentTerms."Due Date Calculation", "Document Date");
                    "Pmt. Discount Date" := CALCDATE(PaymentTerms."Discount Date Calculation", "Document Date");
                end;
            end;
        }
    }

    var
        myInt: Integer;
        PaymentTerms: Record "Payment Terms";
}