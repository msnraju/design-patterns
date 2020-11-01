codeunit 50130 "Item Search Impl"
{
    Access = Internal;

    procedure SearchItems(SearchText: Text[100]; Items: List of [Text[100]])
    var
        Item: Record Item;
    begin
        Item.SetFilter(Description, '@*' + SearchText + '*');
        if Item.FindSet() then
            repeat
                Items.Add(Item.Description);
            until Item.Next() = 0;
    end;
}