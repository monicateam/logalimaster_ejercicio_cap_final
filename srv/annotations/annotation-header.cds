using {SalesOrdersService as p} from '../services';

annotate p.Header with {
    ID @title: 'Id' @Common.Label : 'Id';
    email @title: 'Email' @Common.Label : 'Email';
    firstname @title : 'First name';
    lastname @title:  'Last name';
    Country @title: 'Country';
    Createon @title: 'Created on';
    deliverydate @title: 'Delivery date';
    OrderStatus @title: 'Status';
}

annotate p.Header with {
    OrderStatus @Common: {
        Text: OrderStatus.description,
        TextArrangement : #TextOnly,
        ValueList: {
            $Type: 'Common.ValueListType',
            CollectionPath: 'Status',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: OrderStatus_status,
                    ValueListProperty: 'status'

                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                }
            ]
        }
    }
}

annotate p.Header with @(
    UI.SelectionFields: [
        ID, 
        email, 
        Createon,
        OrderStatus_status
    ],
    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Value: ID
        },
        {
            $Type: 'UI.DataField',
            Value: email
        },
        {
            $Type: 'UI.DataField',
            Value: firstname
        },
        {
            $Type: 'UI.DataField',
            Value: lastname
        },
        {
            $Type: 'UI.DataField',
            Value: Country
        },
        {
            $Type: 'UI.DataField',
            Value: Createon
        },
        {
            $Type: 'UI.DataField',
            Value: deliverydate
        },
        {
            $Type: 'UI.DataField',
            Value: OrderStatus
        }
    ],
    UI.FieldGroup #Detail: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                $Type: 'UI.DataField',
                Value: email
            },
            {
                $Type: 'UI.DataField',
                Value: firstname
            },
            {
                $Type: 'UI.DataField',
                Value: lastname
            },
            {
                $Type: 'UI.DataField',
                Value: Country
            },
            {
                $Type: 'UI.DataField',
                Value: OrderStatus_status,
                Label: 'Order Status'
            },
            {
                $Type: 'UI.DataField',
                Value: Createon,
                @Common.FieldControl: {
                    $edmJson: {
                        $If:[
                            {
                                $Eq:[
                                    {
                                        $Path: 'isDraft'
                                    },
                                    true
                                ]
                            },
                            3,
                            1
                        ]
                    }
                }
            },
            {
                $Type: 'UI.DataField',
                Value: deliverydate
            },
            {
                $Type: 'UI.DataField',
                Value: ImageUrl,
                @Common.FieldControl: {
                    $edmJson: {
                        $If:[
                            {
                                $Eq:[
                                    {
                                        $Path: 'isDraft'
                                    },
                                    true
                                ]
                            },
                            3,
                            1
                        ]
                    }
                }
            }
        ]
    },
    UI.Facets: [
        {
            $Type: 'UI.CollectionFacet',
            Facets: [
                {
                    $Type: 'UI.ReferenceFacet',
                    Target: '@UI.FieldGroup#Detail'
                },
                {
                    $Type: 'UI.ReferenceFacet',
                    Target: 'items/@UI.LineItem',
                    Label: 'Items'
                }
            ]
        }
    ]

);