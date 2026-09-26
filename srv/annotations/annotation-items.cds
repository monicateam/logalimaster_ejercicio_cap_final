using {SalesOrdersService as p} from '../services';

annotate p.Items {
    ID @title : 'Order Id';
    ItemUUID @title: 'Id';
    Name @title: 'Name';
    Description @title: 'Description';
    ReleaseDate @title: 'Release date';
    DiscontinuedDate @title: 'Discontinuation date';
    Price @title: 'Price' @Measures.ISOCurrency: Waers;
    Waers @title: 'Currency' @Common.IsCurrency: true;
    Height @title: 'Height';
    Width @title: 'Width';
    Depth @title: 'Depth';
    DimensionsUOM @title: 'Dimensions UoM';
    Quantity @title: 'Quantity';
    Unitofmeasure @title: 'Quantity unit';
}

annotate p.Items with @(
    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Value: ItemUUID
        },
        {
            $Type: 'UI.DataField',
            Value: Name
        },
        {
            $Type: 'UI.DataField',
            Value: Description
        },
        {
            $Type: 'UI.DataField',
            Value: ReleaseDate
        },
        {
            $Type: 'UI.DataField',
            Value: DiscontinuedDate
        },
        {
            $Type: 'UI.DataField',
            Value: Price
        },
        {
            $Type: 'UI.DataField',
            Value: Waers
        },
        {
            $Type: 'UI.DataField',
            Value: Height
        },
        {
            $Type: 'UI.DataField',
            Value: Width
        },
        {
            $Type: 'UI.DataField',
            Value: Depth
        },
        {
            $Type: 'UI.DataField',
            Value: DimensionsUOM
        },
        {
            $Type: 'UI.DataField',
            Value: Quantity
        },
        {
            $Type: 'UI.DataField',
            Value: Unitofmeasure
        }
    ],
    UI.FieldGroup #Detail: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                $Type: 'UI.DataField',
                Value: Name
            },
            {
                $Type: 'UI.DataField',
                Value: Description
            },
            {
                $Type: 'UI.DataField',
                Value: ReleaseDate
            },
            {
                $Type: 'UI.DataField',
                Value: DiscontinuedDate
            },
            {
                $Type: 'UI.DataField',
                Value: Price
            },
            {
                $Type: 'UI.DataField',
                Value: Waers
            },
            {
                $Type: 'UI.DataField',
                Value: Quantity
            },
            {
                $Type: 'UI.DataField',
                Value: Unitofmeasure
            }
        ]
    },
    UI.FieldGroup #Dimensions: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                $Type: 'UI.DataField',
                Value: Height
            },
            {
                $Type: 'UI.DataField',
                Value: Width
            },
            {
                $Type: 'UI.DataField',
                Value: Depth
            },
            {
                $Type: 'UI.DataField',
                Value: DimensionsUOM
            }
        ]
    },
    UI.FieldGroup #HeaderData: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                $Type: 'UI.DataField',
                Value: ItemUUID
            }
        ]
    },
    UI.HeaderFacets: [
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#HeaderData'
        }
    ],
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
                    Target: '@UI.FieldGroup#Dimensions'
                },
                
            ]
        }
    ]
);