codeunit 50106 DiscountEvaluator
{
    procedure Evaluate(DiscountRule: Interface DiscountRule; CustomerNo: Code[20]; var Discount: Decimal)
    var
        NewDiscount: Decimal;
    begin
        if not DiscountRule.CanProcess(CustomerNo) then
            exit;

        NewDiscount := DiscountRule.Process(CustomerNo);
        if NewDiscount > Discount then
            Discount := NewDiscount;
    end;
}