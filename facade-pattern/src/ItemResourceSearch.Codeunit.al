codeunit 50132 "Item / Resource Search"
{
    Access = Public;

    procedure SearchItems(SearchText: Text[100]; Items: List of [Text[100]])
    var
        ItemSearchImpl: Codeunit "Item Search Impl";
    begin
        ItemSearchImpl.SearchItems(SearchText, Items);
    end;

    procedure SearchResource(SearchText: Text[100]; Resources: List of [Text[100]])
    var
        ResourceSearchImpl: Codeunit "Resource Search Impl";
    begin
        ResourceSearchImpl.SearchResource(SearchText, Resources);
    end;
}