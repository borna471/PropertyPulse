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

router.post("/initiate-demotable", async (req, res) => {
    const initiateResult = await appService.initiateDemotable();
    if (initiateResult) {
        res.json({ success: true });
    } else {
        res.status(500).json({ success: false });
    }
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
    const { userSQFT } = req.body;
    const landlordsOutput = await appService.joinFunc(userSQFT);
    if (landlordsOutput) {
        res.json({ 
            success: true, 
            data: landlordsOutput
        });
    } else {
        res.status(500).json({ 
            success: false, 
            //data: landlordsOutput
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

router.get('/count-demotable', async (req, res) => {
    const tableCount = await appService.countDemotable();
    if (tableCount >= 0) {
        res.json({ 
            success: true,  
            count: tableCount
        });
    } else {
        res.status(500).json({ 
            success: false, 
            count: tableCount
        });
    }
});


module.exports = router;