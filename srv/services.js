const cds = require('@sap/cds')
const { SELECT } = cds.ql;
require('dotenv').config()

module.exports = class SalesOrdersService extends cds.ApplicationService {
  init() {
        const{Header, Items} = this.entities;
        this.before('NEW', Header.drafts, async(requ)=> {
            const headerID = requ.data.ID;
            if(headerID === undefined || headerID !== undefined && headerID.length < 1) {
                return requ.error(400,'ID is mandatory');
            }
            const existID = await SELECT.one.from(Header).where({ID: headerID});

            if(existID !== undefined && existID.ID.length > 0) {
                return requ.error(400,'It already exists a Header with that ID');
            } else {
                const existID2 = await SELECT.one.from(Header.drafts).where({ID: headerID});
                if(existID2 !== undefined && existID2.ID.length > 0) {
                    return requ.error(400,'It already exists a Header with that ID');
                }
            }
        });

        this.before(['UPDATE','CREATE'], Header, async(requ)=> {
            const email = requ.data.email;
            if(email === undefined || email === null || email !== undefined && email.length < 1) {
                return requ.error(400,'Email is mandatory');
            }
        });

        this.before('NEW', Items.drafts, async(requ)=> {
            const headerID = requ.data.ID_ID;
            const itemUUID = requ.data.ItemUUID;
            if(itemUUID === undefined || itemUUID !== undefined && itemUUID.length < 1) {
                return requ.error(400,'ID is mandatory');
            }
            const existID = await SELECT.one.from(Items).where({ID_ID: headerID, ItemUUID: itemUUID});
            if(existID !== undefined && existID.ID_ID.length > 0) {
                return requ.error(400,'It already exists an Item with that ID');
            }else {
                const existID2 = await SELECT.one.from(Items.drafts).where({ID_ID: headerID, ItemUUID: itemUUID});
                if(existID2 !== undefined && existID2.ID_ID.length > 0) {
                    return requ.error(400,'It already exists an Item with that ID');
                }
            }
        });


        return super.init();
    }
};