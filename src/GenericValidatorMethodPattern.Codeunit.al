// Generic Validator Method Pattern
codeunit 50101 CreateSalesOrderValidator
{
    procedure Validate(Customer: Record Customer)
    var
        Errors: List of [Text];
    begin
        if HasErrors(Customer, Errors) then
            Error(ErrorsToText(Errors));
    end;

    procedure HasErrors(Customer: Record Customer; Errors: List of [Text]): Boolean
    var
        Handled: Boolean;
    begin
        OnBeforeCreateSalesOrderValidator(Customer, Handled);
        DoCreateSalesOrder(Customer, Errors, Handled);
        OnAfterCreateSalesOrderValidator(Customer);

        if Errors.Count() > 0 then
            exit(true);
    end;

    local procedure ErrorsToText(Errors: List of [Text]): Text
    var
        ErrText: Text;
        TxtBuffer: TextBuilder;
    begin
        foreach ErrText in Errors do
            TxtBuffer.AppendLine(ErrText);

        exit(TxtBuffer.ToText());
    end;

    local procedure DoCreateSalesOrder(Customer: Record Customer; Errors: List of [Text]; Handled: Boolean)
    begin
        if Handled then
            exit;

        ValidateGenBusinessPostingGroup(Customer, Errors);
        ValidateVATBusPostingGroup(Customer, Errors);
        ValidateVATRegistrationNo(Customer, Errors);
    end;

    local procedure ValidateGenBusinessPostingGroup(Customer: Record Customer; Errors: List of [Text])
    var
        GenBusPostingGroupErr: Label 'Gen. Bus. Posting Group should not be empty.';
    begin
        if Customer."Gen. Bus. Posting Group" = '' then
            Errors.Add(GenBusPostingGroupErr);
    end;

    local procedure ValidateVATBusPostingGroup(Customer: Record Customer; Errors: List of [Text])
    var
        GenBusPostingGroupErr: Label 'VAT Bus. Posting Group should not be empty.';
    begin
        if Customer."VAT Bus. Posting Group" = '' then
            Errors.Add(GenBusPostingGroupErr);
    end;

    local procedure ValidateVATRegistrationNo(Customer: Record Customer; Errors: List of [Text])
    var
        GenBusPostingGroupErr: Label 'Customer should have a valid VAT Registration No.';
    begin
        if Customer."VAT Registration No." = '' then
            Errors.Add(GenBusPostingGroupErr);
    end;

    [BusinessEvent(false)]
    local procedure OnBeforeCreateSalesOrderValidator(Customer: Record Customer; var Handled: Boolean)
    begin
    end;

    [BusinessEvent(false)]
    local procedure OnAfterCreateSalesOrderValidator(Customer: Record Customer)
    begin
    end;
}