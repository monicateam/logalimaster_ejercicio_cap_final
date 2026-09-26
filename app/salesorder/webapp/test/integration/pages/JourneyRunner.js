sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"salesorder/msc0414/salesorder/test/integration/pages/HeaderList.gen",
	"salesorder/msc0414/salesorder/test/integration/pages/HeaderObjectPage.gen",
	"salesorder/msc0414/salesorder/test/integration/pages/ItemsObjectPage.gen"
], function (JourneyRunner, HeaderListGenerated, HeaderObjectPageGenerated, ItemsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('salesorder/msc0414/salesorder') + '/test/flp.html#app-preview',
        pages: {
			onTheHeaderListGenerated: HeaderListGenerated,
			onTheHeaderObjectPageGenerated: HeaderObjectPageGenerated,
			onTheItemsObjectPageGenerated: ItemsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

