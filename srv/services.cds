using {com.viseo.monicasanchez as entities} from '../db/schema';

service SalesOrdersService {
    @odata.draft.enabled //Enable Draft
    entity Header as projection on entities.Header;
    entity Items as projection on entities.Items;
    @readonly
    entity Status as projection on entities.Status;
}