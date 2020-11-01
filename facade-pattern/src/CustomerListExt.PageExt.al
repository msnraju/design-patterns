pageextension 50130 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        ItemSearchImpl: Codeunit "Item Search Impl";
        Items: List of [Text[100]];
    begin
        ItemSearchImpl.SearchItems('A', Items);
        Message('Count: %1', Items.Count);
    end;
}