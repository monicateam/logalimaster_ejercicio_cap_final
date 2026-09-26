using {SalesOrdersService as p} from '../services';

annotate p.Status with {
    status @title: 'Status' @Common.Label : 'Status';
    description @title: 'Description' @Common.Label : 'Description';
}

annotate p.Status with @(
    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Value: status
        },
        {
            $Type: 'UI.DataField',
            Value: description
        }
    ]

);

annotate p.Status with @(UI.FieldGroup: {
    $Type: 'UI.FieldGroupType',
    Data: [
        {
            $Type: 'UI.DataField',
            Value: status
        },
        {
            $Type: 'UI.DataField',
            Value: description
        }
    ]
});