/*
 * These functions below are for various webpage functionalities. 
 * Each function serves to process data on the frontend:
 *      - Before sending requests to the backend.
 *      - After receiving responses from the backend.
 * 
 * To tailor them to your specific needs,
 * adjust or expand these functions to match both your 
 *   backend endpoints 
 * and 
 *   HTML structure.
 * 
 */


// This function checks the database connection and updates its status on the frontend.
async function checkDbConnection() {
    const statusElem = document.getElementById('dbStatus');
    const loadingGifElem = document.getElementById('loadingGif');

    const response = await fetch('/check-db-connection', {
        method: "GET"
    });

    // Hide the loading GIF once the response is received.
    loadingGifElem.style.display = 'none';
    // Display the statusElem's text in the placeholder.
    statusElem.style.display = 'inline';

    response.text()
    .then((text) => {
        statusElem.textContent = text;
    })
    .catch((error) => {
        statusElem.textContent = 'connection timed out';  // Adjust error handling if required.
    });
}

// Fetches data from the demotable and displays it.
async function fetchAndDisplayUsers() {
    const tableElement = document.getElementById('demotable');
    const tableBody = tableElement.querySelector('tbody');

    const response = await fetch('/demotable', {
        method: 'GET'
    });

    const responseData = await response.json();
    const demotableContent = responseData.data;

    // Always clear old, already fetched data before new fetching process.
    if (tableBody) {
        tableBody.innerHTML = '';
    }

    demotableContent.forEach(user => {
        const row = tableBody.insertRow();
        user.forEach((field, index) => {
            const cell = row.insertCell(index);
            cell.textContent = field;
        });
    });
}

// This function resets or initializes the demotable.
async function resetDemotable() {
    const response = await fetch("/initiate-demotable", {
        method: 'POST'
    });
    const responseData = await response.json();

    if (responseData.success) {
        const messageElement = document.getElementById('resetResultMsg');
        messageElement.textContent = "demotable initiated successfully!";
        fetchTableData();
    } else {
        alert("Error initiating table!");
    }
}

// Inserts new records into the Landlord.
async function insertLandlord(event) {
    event.preventDefault();

    const landlordEmailValue = document.getElementById('insertLandlordEmail').value;
    const landlordNameValue = document.getElementById('insertLandlordName').value;
    const phoneNumberValue = document.getElementById('insertLandlordPhoneNumber').value;
    const numPropertiesValue = document.getElementById('insertLandlordNumProperties').value;
    const managerEmailValue = document.getElementById('insertManagerEmail').value;

    const response = await fetch('/insert-landlord', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            landlordEmail: landlordEmailValue,
            landlordName: landlordNameValue,
            phoneNumber: phoneNumberValue,
            numProperties: numPropertiesValue,
            managerEmail: managerEmailValue
        })
    });

    const responseData = await response.json();
    const messageElement = document.getElementById('insertLandlordResultMsg');

    if (responseData.success) {
        messageElement.textContent = "Data inserted successfully!";
        fetchTableData();
    } else {
        messageElement.textContent = "Error inserting data!";
    }
}

// Deletes a current landlord in the Landlord table
async function deleteLandlord(event) {
    event.preventDefault();

    const landlordEmailValue = document.getElementById('landlordEmail').value;

    const response = await fetch('/delete-landlord', {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            landlordEmail: landlordEmailValue
        })
    }); 

    const responseData = await response.json();
    const messageElement = document.getElementById('deleteResultMsg');

    if (responseData.success) {
        messageElement.textContent = "Landlord deleted successfully!";
        fetchTableData();
    } else {
        messageElement.textContent = "Error deleting data!";
    }
}

// Updates num properties in the landlord table.
async function updatePhoneLandlord(event) {
    event.preventDefault();

    const emailValue = document.getElementById('updateEmailLandlord').value;
    const oldNumValue = document.getElementById('updateOldPhoneLandlord').value;
    const newNumValue = document.getElementById('updateNewPhoneLandlord').value;

    const response = await fetch('/update-phone-landlord', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            email: emailValue,
            oldNum: oldNumValue,
            newNum: newNumValue
        })
    });

    const responseData = await response.json();
    const messageElement = document.getElementById('updatePhoneResultMsg');

    if (responseData.success) {
        messageElement.textContent = "phone number updated successfully!";
        fetchTableData();
    } else {
        messageElement.textContent = "Error updating num properties!";
    }
}

async function joinFunc(event) {
    event.preventDefault();

    const sqftValue = document.getElementById('userSQFT').value;
    
    const response = await fetch(`/joinFunc?userSQFT=${sqftValue}`, {
        method: 'GET',
    });

    const responseData = await response.json();
    const messageElement = document.getElementById('joinFuncResultMsg');
    
    if (responseData.success) {
        const joinFunc = responseData.data;
        if (joinFunc != "") {
            messageElement.textContent = `The landlords with the properties that have at least ${sqftValue} sqft are: ${joinFunc}`;
        } else {
            messageElement.textContent = `There are no landlords with at least ${sqftValue} sqft`;
        } 
    } else {
        alert("An error occurred");
    }
}


async function nestedAggGroup() {
    const response = await fetch("/nestedAggGroup", {
        method: 'GET'
    });

    const responseData = await response.json();
    const messageElement = document.getElementById('nestedAggGroupResultMsg');

    if (responseData.success) {
        const nestedAggGroup = responseData.data;
        if (nestedAggGroup != "") {
            messageElement.textContent = `The cities with average property prices lower than Vancouver is: ${nestedAggGroup}`;
        } else {
            messageElement.textContent = `The cities with average property prices lower than Vancouver is: None!`;
        } 
    } else {
        alert("Error calculating cities and average property prices!");
    }
}

async function aggGroup() {
    const response = await fetch("/aggGroup", {
        method: 'GET'
    });

    const responseData = await response.json();
    const messageElement = document.getElementById('aggGroupResultMsg');

    if (responseData.success) {
        const aggGroup = responseData.data;
        if (aggGroup != "") {
            messageElement.textContent = `The Property Manager with the most properties is: ${aggGroup}`;
        } else {
            messageElement.textContent = `There are no Property Managers!`;
        } 
    } else {
        alert("Error finding the Property Manager with the most properties");
    }
}

async function division() {
    const response = await fetch("/division", {
        method: 'GET'
    });

    const responseData = await response.json();
    const messageElement = document.getElementById('divisionMsg');

    if (responseData.success) {
        const divisionResult = responseData.data;
        if (divisionResult != "") {
            messageElement.textContent = `Manager(s) that manage properties in all Provinces: ${divisionResult}`;
        } else {
            messageElement.textContent = `Error finding request Managers!`;
        } 
    } else {
        alert("Error finding requested Managers!");
    }
}

async function fetchTables() {
    const response = await fetch('/all-table-names', {
        method: 'GET'
    });

    const tables = await response.json();
    const tableNamesSelect = document.getElementById('tableNames');

    if (tables.success) {
        tables.data.forEach(tableName => {
            const option = document.createElement('option');
            option.value = tableName;
            option.text = tableName;
            tableNamesSelect.add(option);
        });
    } else {
        alert("Error fetching tables!");
    }
}

async function fetchAttributeNames() {
    const tableNamesSelect = document.getElementById('tableNames');
    const selectedTableName = tableNamesSelect.value;

    const response = await fetch(`/attribute-names/${selectedTableName}`);
    const attributes = await response.json();
    const attributeNamesSelect = document.getElementById('attributeNames');

    // Always clear old, already fetched data before new fetching process.
    attributeNamesSelect.innerHTML = '';
        
    if (attributes.success) {
        attributes.data.forEach(attributeName => {
            const option = document.createElement('option');
            option.value = attributeName;
            option.text = attributeName;
            attributeNamesSelect.add(option);
        });
    } else {
        const messageElement = document.getElementById('projectResultMsg');
        messageElement.textContent = `Error finding attributes from selected table!`;
        alert("Error fetching attributes!");
    }
}

// Helper function to display selected data
function displaySelectedData(data) {
    const selectedDataTable = document.getElementById('selectedDataTable');
    const selectedDataBody = document.getElementById('selectedDataBody');

    // Always clear old, already fetched data before new fetching process.
    selectedDataBody.innerHTML = '';

    data.forEach(data => {
        const row = document.createElement('tr');
        Object.values(data).forEach(value => {
            const cell = document.createElement('td');
            cell.textContent = value;
            row.appendChild(cell);
        });
        selectedDataBody.appendChild(row);
    });

    if (selectedDataBody.innerHTML == '') {
        const messageElement = document.getElementById('projectResultMsg');
        messageElement.textContent = `Error finding data from selected attributes!`;
        selectedDataTable.style.display = 'none';
    } else {
        const messageElement = document.getElementById('projectResultMsg');
        messageElement.textContent = ``;
        selectedDataTable.style.display = 'block';
    }
    
}

async function fetchDataForAttributes() {
    const tableNamesSelect = document.getElementById('tableNames');
    const selectedTableName = tableNamesSelect.value;

    const attributeNamesSelect = document.getElementById('attributeNames');
    const selectedAttributes = Array.from(attributeNamesSelect.selectedOptions, option => option.value);

    const response = await fetch('/fetch-data-for-attributes', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ tableName: selectedTableName, selectedAttributes }),
    });

    const responseData = await response.json();
    const messageElement = document.getElementById('projectResultMsg');

    if (responseData.success) {
        displaySelectedData(responseData.data);
    } else {
        messageElement.textContent = `Error finding data from selected attributes!`;
    }
}


// ---------------------------------------------------------------
// Initializes the webpage functionalities.
// Add or remove event listeners based on the desired functionalities.
window.onload = function() {
    checkDbConnection();
    fetchTableData();
    document.getElementById("resetDemotable").addEventListener("click", resetDemotable);
    document.getElementById("insertLandlord").addEventListener("submit", insertLandlord);
    document.getElementById("deleteLandlord").addEventListener("submit", deleteLandlord);
    document.getElementById("updateLandlordPhone").addEventListener("submit", updatePhoneLandlord);
    document.getElementById("AggHaving").addEventListener("click", AggHaving);
    document.getElementById("joinFunc").addEventListener("submit", joinFunc);
    document.getElementById("nestedAggGroup").addEventListener("click", nestedAggGroup);
    document.getElementById("division").addEventListener("click", division);
    document.getElementById("fetchTables").addEventListener("click", fetchTables);
    document.getElementById('fetchAttributeNames').addEventListener('click', fetchAttributeNames);
    document.getElementById('fetchDataForAttributes').addEventListener('click', fetchDataForAttributes);
    document.getElementById("aggGroup").addEventListener("click", aggGroup);
    document.getElementById("countDemotable").addEventListener("click", countDemotable);
};

// General function to refresh the displayed table data. 
// You can invoke this after any table-modifying operation to keep consistency.
function fetchTableData() {
    fetchAndDisplayUsers();
}
