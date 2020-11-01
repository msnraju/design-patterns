codeunit 50131 "Resource Search Impl"
{
    Access = Internal;

    procedure SearchResource(SearchText: Text[100]; Resources: List of [Text[100]])
    var
        Resource: Record Resource;
    begin
        Resource.SetFilter(Name, '@*' + SearchText + '*');
        if Resource.FindSet() then
            repeat
                Resources.Add(Resource.Name);
            until Resource.Next() = 0;
    end;
}