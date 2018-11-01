codeunit 50100 "TransferPaymentTerms"
{
    trigger OnRun();
    begin
    end;

    // [EventSubscriber(ObjectType::Codeunit, 80, 'OnBeforePostGLAndCustomer', '', true, true)]
    // procedure TransferPaymentTermsToCustLedgerEntry(var CustLedgerEntry: Record "Cust. Ledger Entry"; SalesHeader: Record "Sales Header");
    // var
    // begin
    //     if CustLedgerEntry.IsTemporary THEN
    //         Exit;
    //     CustLedgerEntry."Payment Terms Code" := SalesHeader."Payment Terms Code";

    // end;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnBeforePostCustomerEntry', '', true, true)]

    procedure TransferPaymentTermsToGLJnlLine(var GenJnlLine:Record "Gen. Journal Line";SalesHeader:Record "Sales Header");
    var
    begin
        if GenJnlLine.IsTemporary THEN
            Exit;
         GenJnlLine."Payment Terms Code" := SalesHeader."Payment Terms Code";
    end;
    
    [EventSubscriber(ObjectType::Table, 21, 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
    procedure TransferPaymentTermsToCustLegderEntry(var CustLedgerEntry:Record "Cust. Ledger Entry";GenJournalLine:Record "Gen. Journal Line");
    var
    begin
        if CustLedgerEntry.IsTemporary THEN
            Exit;
         CustLedgerEntry."Payment Terms Code" := GenJournalLine."Payment Terms Code";
    end;
    
    var
        myInt: Integer;
}