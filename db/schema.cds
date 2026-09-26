namespace com.viseo.monicasanchez;

using {
    cuid, managed
} from '@sap/cds/common';

type DecimalPrice: Decimal(12,2);
type QuantityHeight: Decimal(15,3);
type QuantityWidth: Decimal(13,3);
type DecimalDepth: Decimal(12,2);
type QuantityItem: Decimal(16,2);

entity Header: managed {
    key ID : String(36);
    email: String(40);
    firstname: String(40);
    lastname: String(40);
    Country: String(30);
    Createon: Date;
    deliverydate: DateTime;
    OrderStatus: Association to Status;
    ImageUrl: String;
    items: Composition of many Items on items.ID=$self;
    virtual isDraft: Boolean;
}

entity Items: managed {
    key ID: association to Header @cds.on.insert: 1;
    key ItemUUID: String(36);
    Name: String(40);
    Description: String(40);
    ReleaseDate: Date;
    DiscontinuedDate: Date;
    Price: DecimalPrice;
    Waers: String default 'EUR';
    Height: QuantityHeight;
    Width: QuantityWidth;
    Depth: DecimalDepth;
    DimensionsUOM: String default 'CM';
    Quantity: QuantityItem;
    Unitofmeasure: String default 'EA';
}

entity Status {
    key status: Integer;
    description: String(16);
}