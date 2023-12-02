const express = require('express');
const appService = require('./appService');

const router = express.Router();

// ----------------------------------------------------------
// API endpoints
// Modify or extend these routes based on your project's needs.
router.get('/check-db-connection', async (req, res) => {
    const isConnect = await appService.testOracleConnection();
    if (isConnect) {
        res.send('connected');
    } else {
        res.send('unable to connect');
    }
});

router.get('/demotable', async (req, res) => {
    const tableContent = await appService.fetchDemotableFromDb();
    res.json({data: tableContent});
});

router.post("/insert-landlord", async (req, res) => {
    const { landlordEmail, landlordName, phoneNumber, numProperties, managerEmail } = req.body;
    const insertLandlordResult = await appService.insertLandlord(landlordEmail, landlordName, phoneNumber, numProperties, managerEmail);
    if (insertLandlordResult) {
        res.json({ success: true });
    } else {
        res.json({ success: false });
    }
});  

router.delete("/delete-landlord", async (req, res) => {
    const { landlordEmail } = req.body;
    const deleteResult = await appService.deleteLandlord(landlordEmail);
    if (deleteResult) {
        res.json({ success: true });
    } else {
        res.status(500).json({ success: false });
    }
});

router.post("/update-phone-landlord", async (req, res) => {
    const { email, oldNum, newNum } = req.body;
    const updateResult = await appService.updatePhoneLandlord(email, oldNum, newNum);
    if (updateResult) {
        res.json({ success: true });
    } else {
        res.status(500).json({ success: false });
    }
});

router.get("/joinFunc", async (req, res) => {
    const { userSQFT } = req.query;
    const landlordsOutput = await appService.joinFunc(userSQFT);
    if (landlordsOutput) {
        res.json({ 
            success: true, 
            data: landlordsOutput
        });
    } else {
        res.status(500).json({ 
            success: false, 
            data: landlordsOutput
        });
    }
});

router.get('/AggHaving', async (req, res) => {
    const clients = await appService.AggHaving();
    if (clients) {
        res.json({ 
            success: true,  
            data: clients
        });
    } else {
        res.status(500).json({ 
            success: false, 
            data: clients
        });
    }
});

router.get('/nestedAggGroup', async (req, res) => {
    const cities = await appService.nestedAggGroup();
    if (cities) {
        res.json({ 
            success: true,  
            data: cities
        });
    } else {
        res.status(500).json({ 
            success: false, 
            data: cities
        });
    }
});

router.get('/aggGroup', async (req, res) => {
    const propertymanager = await appService.aggGroup();
    if (propertymanager) {
        res.json({ 
            success: true,  
            data: propertymanager
        });
    } else {
        res.status(500).json({ 
            success: false, 
            data: propertymanager
        });
    }
});

router.get('/division', async (req, res) => {
    const landlords = await appService.division();
    if (landlords) {
        res.json({ 
            success: true,  
            data: landlords
        });
    } else {
        res.status(500).json({ 
            success: false, 
            data: landlords
        });
    }
});

router.get("/selection", async (req, res) => {
    const { minSqft, andor1, bedrooms, andor2, maxPrice } = req.query;
    const selectionResult = await appService.selectionPV(minSqft, andor1, bedrooms, andor2, maxPrice);
    if (selectionResult) {
        res.json({ 
            success: true,
            data: selectionResult
         });
    } else {
        res.status(500).json({ 
            success: false,
            data: selectionResult 
        });
    }
});

router.get('/all-table-names', async (req, res) => {
    const tableNames = await appService.fetchTables();
    if (tableNames) {
        res.json({ success: true, data: tableNames });
    } else {
        res.status(500).json({ success: false });
    }
});

router.get('/attribute-names/:tableName', async (req, res) => {
    const { tableName } = req.params;
    const attributeNames = await appService.fetchAttributeNames(tableName);
    if (attributeNames) {
        res.json({ success: true, data: attributeNames });
    } else {
        res.status(500).json({ success: false });
    }
});

router.post('/fetch-data-for-attributes', async (req, res) => {
    const { tableName, selectedAttributes } = req.body;
    const data = await appService.fetchDataForAttributes(tableName, selectedAttributes);
    if (data) {
        res.json({ success: true, data: data });
    } else {
        res.status(500).json({ success: false });
    }
});

module.exports = router;