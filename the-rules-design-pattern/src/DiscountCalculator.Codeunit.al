codeunit 50105 DiscountCalculator
{
    procedure Execute(CustomerNo: Code[20]): Decimal
    var
        DiscountEvaluator: Codeunit DiscountEvaluator;
        Discount: Decimal;
    begin
        OnExecute(DiscountEvaluator, CustomerNo, Discount);
        exit(Discount);
    end;

    [BusinessEvent(false)]
    local procedure OnExecute(DiscountEvaluator: Codeunit DiscountEvaluator; CustomerNo: Code[20]; var Discount: Decimal)
    begin
    end;
}