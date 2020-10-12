codeunit 50105 PriceRules
{
    procedure Execute(ItemNo: Code[20]; CustomerNo: Code[20]): Decimal
    var
        Price: Decimal;
    begin
        OnExecute(ItemNo, CustomerNo, Price);
        exit(Price);
    end;

    procedure ExecuteRule(PriceRule: Interface PriceRule; ItemNo: Code[20]; CustomerNo: Code[20]; var Price: Decimal)
    var
        NewPrice: Decimal;
    begin
        if PriceRule.CanExecute(ItemNo, CustomerNo) then begin
            NewPrice := PriceRule.Execute(ItemNo, CustomerNo);
            if Price > NewPrice then
                Price := NewPrice;
        end;
    end;

    [BusinessEvent(false)]
    local procedure OnExecute(ItemNo: Code[20]; CustomerNo: Code[20]; var Price: Decimal)
    begin
    end;
}