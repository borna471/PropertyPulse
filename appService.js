const oracledb = require('oracledb');
const loadEnvFile = require('./utils/envUtil');
const fs = require('fs');

const envVariables = loadEnvFile('./.env');

// Database configuration setup. Ensure your .env file has the required database credentials.
const dbConfig = {
    user: envVariables.ORACLE_USER,
    password: envVariables.ORACLE_PASS,
    connectString: `${envVariables.ORACLE_HOST}:${envVariables.ORACLE_PORT}/${envVariables.ORACLE_DBNAME}`
};


// ----------------------------------------------------------
// Wrapper to manage OracleDB actions, simplifying connection handling.
async function withOracleDB(action) {
    try {
        connection = await oracledb.getConnection(dbConfig);
        return await action(connection);
    } catch (err) {
        console.error(err);
        throw err;
    } finally {
        if (connection) {
            try {
                await connection.close();
            } catch (err) {
                console.error(err);
            }
        }
    }
}


// ----------------------------------------------------------
// Core functions for database operations
// Modify these functions, especially the SQL queries, based on your project's requirements and design.
async function testOracleConnection() {
    return await withOracleDB(async (connection) => {
        return true;
    }).catch(() => {
        return false;
    });
}

async function fetchDemotableFromDb() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute('SELECT * FROM LANDLORD');
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function initiateDemotable() {
    return await withOracleDB(async (connection) => {
        try {
            //await connection.execute(`DROP TABLE DEMOTABLE`);
        } catch(err) {
            console.log('Table might not exist, proceeding to create...');
        }
        // const result = await connection.execute(`
        //     CREATE TABLE DEMOTABLE (
        //         id NUMBER PRIMARY KEY,
        //         name VARCHAR2(20)
        //     )
        // `); 
    }).catch(() => {
        return false;
    });
}

async function insertLandlord(landlordEmail, landlordName, phoneNumber, numProperties, managerEmail) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `INSERT INTO Landlord (landlordEmail, landlordName, phoneNumber, numProperties, managerEmail) VALUES (:landlordEmail, :landlordName, :phoneNumber, :numProperties, :managerEmail)`,
            [landlordEmail, landlordName, phoneNumber, numProperties, managerEmail],
            { autoCommit: true }
        );

        return result.rowsAffected && result.rowsAffected > 0;
    }).catch(() => {
        return false;
    });
}

async function deleteLandlord(landlordEmail) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `DELETE FROM LANDLORD WHERE landlordEmail=:landlordEmail`,
            [landlordEmail],
            { autoCommit: true }
        );

        return result.rowsAffected && result.rowsAffected > 0;
    }).catch(() => {
        return false;
    });
}


async function updatePhoneLandlord(email, oldNum, newNum) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `UPDATE LANDLORD SET PhoneNumber=:newNum WHERE LandlordEmail=:email AND PhoneNumber=:oldNum`,
            [newNum, email, oldNum],
            { autoCommit: true }
        );
 
        return result.rowsAffected && result.rowsAffected > 0;
    }).catch(() => {
        return false;
    });
}

async function AggHaving() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT LandlordName
            FROM Landlord
            GROUP BY NumProperties, LandlordName
            HAVING NumProperties >= 3`
            );
        return result.rows;
    }).catch(() => {
        return false;
    });
}

async function nestedAggGroup() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT P1.City
            FROM Property P1 NATURAL JOIN PropertyValue PV1
            GROUP BY P1.City
            HAVING AVG(PV1.Price) < 
            (SELECT AVG(PV2.Price) FROM Property P2 NATURAL JOIN PropertyValue PV2 WHERE City = 'Vancouver')`);
        return result.rows;
    }).catch(() => {
        return false;
    });
}

async function aggGroup() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT PropertyManager.ManagerName
            FROM PropertyManager JOIN Property
            ON PropertyManager.Email = Property.ManagerEmail
            GROUP BY PropertyManager.ManagerName
            HAVING COUNT(*) > 0
            ORDER BY COUNT(*) DESC
            OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY            
            `);
        return result.rows;
    }).catch(() => {
        return false;
    });
}

async function joinFunc(userSQFT) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT DISTINCT Landlord.LandlordName
            FROM Landlord JOIN Property 
            ON Landlord.LandlordEmail = Property.LandlordEmail
            WHERE Property.Sqft > :userSQFT`,
            [userSQFT],
            { autoCommit: true }
        );
 
        return result.rows;
    }).catch(() => {
        return false;
    });
}
// Query TODO
async function division() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT ManagerName 
            FROM PropertyManager PM
            WHERE NOT EXISTS
            ((SELECT DISTINCT Province
              FROM Property)
              MINUS
              (SELECT DISTINCT P.Province
               FROM Property P
               WHERE P.ManagerEmail = PM.Email))`
            );
        return result.rows;
    }).catch(() => {
        return false;
    });
}

async function fetchTables() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute('SELECT table_name FROM user_tables');
        return result.rows.map(row => row[0]);
    }).catch(() => {
        return [];
    });
}

async function fetchAttributeNames(tableName) {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            `SELECT column_name FROM user_tab_columns WHERE table_name = :tableName`, 
            [tableName],
            { autoCommit: true }
        );
        return result.rows.map(row => row[0]);
    }).catch(() => {
        return [];
    });
}

async function fetchDataForAttributes(tableName, selectedAttributes) {
    const selectedAttributesStr = selectedAttributes.join(', ');
    const query = `SELECT ${selectedAttributesStr} FROM ${tableName}`;
    
    return await withOracleDB(async (connection) => {
        const result = await connection.execute(
            query,
            [],
            { autoCommit: true }
        );
        return result.rows;
    }).catch(() => {
        return [];
    });
}

async function countDemotable() {
    return await withOracleDB(async (connection) => {
        const result = await connection.execute('SELECT Count(*) FROM DEMOTABLE');
        return result.rows[0][0];
    }).catch(() => {
        return -1;
    });
}

module.exports = {
    testOracleConnection,
    fetchDemotableFromDb,
    initiateDemotable, 
    insertLandlord, 
    deleteLandlord,
    updatePhoneLandlord,
    AggHaving,
    joinFunc,
    nestedAggGroup,
    division, 
    fetchTables,
    fetchAttributeNames,
    fetchDataForAttributes,
    aggGroup,
    countDemotable
};