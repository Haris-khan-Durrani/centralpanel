const express = require('express');
const session = require('express-session');
const path = require('path');
const mysql2 = require('mysql');
const mysql = require('mysql2/promise');
const multer = require('multer');
const io = require('socket.io-client');
require('dotenv').config();
const axios = require('axios');
const { Console } = require('console');
const crypto = require('crypto');
const app = express();
const PORT = process.env.PORT || 1002;
const cors = require('cors');
const MySQLStore = require('express-mysql-session')(session);

// Connect to the Socket.IO server
const socket = io.connect('https://run.crmsoftware.ae/');

const dbHost = process.env.DB_HOST;
const dbUser = process.env.DB_USER;
const dbPassword = process.env.DB_PASSWORD;
const dbName = process.env.DB_NAME;

const db = mysql2.createConnection({
    host: dbHost,
    user: dbUser,
    password: dbPassword,
    database: dbName,
});

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// Middleware to fetch configuration based on domain
// const domainCheck = async (req, res, next) => {
//     const domain = req.hostname;
//   // console.log(`Domain: ${domain}`);

//     try {
//         const [rows] = await pool.query('SELECT * FROM domain_config WHERE domain = ? GROUP BY domain', [domain]);
//         if (rows.length > 0) {
//             req.config = rows[0];
//             console.log('Configuration for Domain:', req.config);
//         } else {
//             console.error(`No configuration found for domain: ${domain}`);
//             res.redirect('/setup-basic');
//       //     res.status(404).send('Configuration not found for this domain kindly contact your administrator it@ebmsbusiness.com');
//             //  res.status(404).send(`<html lang="en"><head><meta charset="UTF-8"><link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png"><meta name="apple-mobile-web-app-title" content="CodePen"><link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico"><link rel="mask-icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-b4b4269c16397ad2f0f7a01bcdf513a1994f4c94b8af2f191c09eb0d601762b1.svg" color="#111"><title>CodePen - 404 page</title><link rel="canonical" href="https://hariskhandurrani.com"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"><link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arvo"><style>.page_404{padding:40px 0;background:#fff;font-family:Arvo,serif}.page_404 img{width:100%}.four_zero_four_bg{background-image:url(https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif);height:400px;background-position:center}.four_zero_four_bg h1{font-size:80px}.four_zero_four_bg h3{font-size:80px}.link_404{color:#fff!important;padding:10px 20px;background:#39ac31;margin:20px 0;display:inline-block}.contant_box_404{margin-top:-50px}</style><script>window.console=window.console||function(o){}</script></head><body translate="no"><section class="page_404"><div class="container"><div class="row"><div class="col-sm-12"><div class="col-sm-10 col-sm-offset-1 text-center"><div class="four_zero_four_bg"><h1 class="text-center">404</h1></div><div class="contant_box_404"><h3 class="h2">Look like you're lost/Might Be your Domain is not Registered with server</h3><p>the page you are looking for not avaible!</p><a href="" class="link_404">Go to Home</a></div></div></div></div></div></section></body></html>`);
             
             
//             return;
//         }
//     } catch (error) {
//         console.error('Database error:', error);
//         res.status(500).send(`Internal Server Error ${error}`);
//         return;
//     }

//     next();
// };
const domainCheck = async (req, res, next) => {
     const domain = req.headers['x-forwarded-host'];
    // First check if configuration is already stored in session
    if (req.session && req.session.config && req.session.config.domain === domain) {
        req.config = req.session.config;
       // console.log('Using cached configuration:', req.config);
        return next();
    }

    console.log(`Fetching configuration for domain: ${domain}`);
    try {
        const [rows] = await pool.query('SELECT * FROM domain_config WHERE domain = ? GROUP BY domain', [domain]);
        if (rows.length > 0) {
            req.config = rows[0];
            // Store the configuration in session
            if (req.session) {
                req.session.config = req.config;
            }
         //   console.log('Configuration fetched and stored for Domain:', req.config);
            next();
        } else {
            console.error(`No configuration found for domain: ${domain}`);
            res.status(404).send('Configuration not found for this domain. Please contact your administrator.');
        }
    } catch (error) {
        console.error('Database error when fetching domain configuration:', error);
        res.status(500).send(`Internal Server Error: ${error.message}`);
    }
};


// Attach middleware to the Express application
app.use(domainCheck);

// Reconfigure application settings based on domain
app.use((req, res, next) => {
           
    if (req.config) {
 //console.log(req.config);
        locationId = req.config.location_id;
        V_locationId = req.config.v_location_id;
        logoUrl = req.config.logo_url;
        emcode1 = req.config.emcode;
        companyfileview = req.config.cfv;
                userfileview = req.config.cvv;
        back = req.config.background;
        darkback = req.config.dark_back;
        sidedark = req.config.side_dark_back;
        sideback = req.config.side_back;
        gridback = req.config.grid_back;
        darkgrid = req.config.dark_grid_back;
        gridtext = req.config.text_light;
        gridtextdark = req.config.text_dark;
       baicon = req.config.icon_button_back;
       bbt = req.config.button_bottom_border;
        companiname = req.config.company_name;
       companiaddress = req.config.company_address;
        headingcolor = req.config.heading_color;
        
    }
    next();
});

// // Encryption function
// function encrypt(text, secretKey) {
//     const cipher = crypto.createCipher('aes-256-cbc', secretKey);
//     let encrypted = cipher.update(text, 'utf8', 'hex');
//     encrypted += cipher.final('hex');
//     return encrypted;
// }

function encrypt(text, secretKey) {
    // URL encode the text to handle special characters
    const encodedText = encodeURIComponent(text);

    const cipher = crypto.createCipher('aes-256-cbc', secretKey);
    let encrypted = cipher.update(encodedText, 'utf8', 'hex');
    encrypted += cipher.final('hex');
 //   console.log(encrypted);
    return encrypted;
}


// Decryption function
// function decrypt(encryptedText, secretKey) {
//     const decipher = crypto.createDecipher('aes-256-cbc', secretKey);
//     let decrypted = decipher.update(encryptedText, 'hex', 'utf8');
//     decrypted += decipher.final('utf8');
//     return decrypted;
// }
function decrypt(encryptedText, secretKey) {
    const decipher = crypto.createDecipher('aes-256-cbc', secretKey);
    let decrypted = decipher.update(encryptedText, 'hex', 'utf8');
    decrypted += decipher.final('utf8');
    
    // URL decode the decrypted text to get the original text
    const decodedText = decodeURIComponent(decrypted);
 //  const decodedText = decrypted;
    //console.log(decodedText);
    return decodedText;
}


const nodemailer = require('nodemailer');
const OTP_LENGTH = 6; // Length of OTP

// Configure Nodemailer transporter
// const transporter = nodemailer.createTransport({
//     host: 'smtp.netxsites.com',
//     port: 465, // SMTP port
//     secure: true, // true for 465, false for other ports
//     auth: {
//         user: 'info@netxsites.com',
//         pass: 'ygqh sdfb wtks pehh'
//     }
// });


// const transporter = nodemailer.createTransport({
//     host: 'smtp.netxsites.com',
//     port: 465,
//     secure: true,
//     auth: {
//         user: 'info@netxsites.com',
//         pass: 'ygqh sdfb wtks pehh'
//     },
//     logger: true, // Enable logging
//     debug: true   // Show debug information
// });

const transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 465,
    secure: true,
    auth: {
        user: 'info@netxsites.com',
        pass: 'owzj irlm qdoz qppn'
    }
});



// Function to generate OTP
function generateOTP() {
    let otp = '';
    for (let i = 0; i < OTP_LENGTH; i++) {
        otp += Math.floor(Math.random() * 10); // Generate random digits
    }
    return otp;
}



const sharedData = {}; // Shared in-memory object for storing Socket.IO data

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
//const sessionStore = new MySQLStore({}, db);
const sessionStore = new MySQLStore({
  expiration: 86400000, // 1 day
  clearExpired: true,
  checkExpirationInterval: 900000 // 15 minutes
}, db);
app.use(express.static('public', { debug: true }));
app.use(express.urlencoded({ extended: true }));
app.use(
    session({
          store: sessionStore,
        secret: 'your_secret_key',
        resave: true,
        saveUninitialized: true,
        cookie: { secure: false }, // Set to true in production if using HTTPS
    })
);


// Middleware to check session
const sessionCheck = (req, res, next) => {
    if (req.session.user) {
   //     console.log(req.session.user);
        return next();
    }
    res.redirect('/dashboard/all');
};

//admin session check


// Store generated OTPs mapped to email addresses
let otpMap = new Map();

// Function to send OTP email and trigger webhook
async function sendOTPEmailAndTriggerWebhook(username, otp,namo,phon) {
    //  await axios.get('https://app.crmsoftware.ae/api/message.php', {
    //         params: {
    //             agent: '+971562559270',
    //             client: '+971551745764',
    //             country: 'AE',
    //             message: 'Hi there, OTP email sent. OTP: ' + otp
    //         }
    //     });
    
    console.log(namo);
    //SEE REPLACE haris.khan5117@gmail.com with username
    const mailOptions = {
        from: `${companiname} <no-reply@netxsites.com>`,
        //to: 'haris.khan5117@gmail.com',
      to: username,    
        subject: `${companiname} Login OTP ${otp}`,
      html:`<div style="font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2">
  <div style="margin:50px auto;width:70%;padding:20px 0">
    <div style="border-bottom:1px solid #eee">
      <a href="" style="font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600">${companiname} Portal</a>
    </div>
    <p style="font-size:1.1em">Hi,</p>
    <p>Thank you for choosing ${companiname}. Use the following OTP to complete your Sign In procedures.</p>
    <h2 style="background: #00466a;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;">${otp}</h2>
    <p style="font-size:0.9em;">Regards,<br />${companiname} powered by <a href="https://netxsites.com/">Netxsite</a></p>
    <hr style="border:none;border-top:1px solid #eee" />
    <div style="float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300">
      <p>${companiname}</p>
      <p>${phon}</p>
      <p>${companiaddress}</p>
      <p>United Arab Emirates</p>
    </div>
  </div>
</div>`,
      
       // html: `Your OTP for login is: ${otp}`
    };

    try {
        
            await axios.get('https://app.crmsoftware.ae/api/message.php', {
            params: {
                agent: '971562559270',
                client: `${phon}`,
                country: 'AE',
                message: `Your ${companiname} Portal Login OTP is *${otp}* please dont share this OTP with anyone`
            }
        });
        
        
        // Send mail with defined transport object
        const info = await transporter.sendMail(mailOptions);
    //    console.log('Email sent:', info.response);

        // Trigger webhook
         // Trigger webhook
    
        
       

        return true; // Email sent and webhook triggered successfully
    } catch (error) {
        console.error('Error occurred:', error.message);
        return false; // Error occurred while sending email or triggering webhook
    }
    
    
    
    
}

app.get('/', (req, res) => {
      const query = req.query.error;
    
    if (req.session.user) {
        res.redirect('/dashboard/all');
    } else {
        res.render('login', { logo: logoUrl,message:query,emcod:emcode1 });
    }
});






app.post('/login', async (req, res) => {
    const { username } = req.body;

    // Generate OTP
    const otp = generateOTP();
    otpMap.set(username, otp); // Store OTP in a local map

    try {
        // Query the database to fetch the user data
        const sql = 'SELECT useremail, Username, userphone FROM clusers WHERE useremail = ?';
        db.query(sql, [username], (err, results) => {
            if (err) {
                console.error('Database query error:', err);
                return res.status(500).send('An error occurred during the login process.');
            }

            if (results.length === 0) {
                return res.redirect('/404?error=No user found with that email address');
            }

            // Assuming the first result is the correct one
            const { useremail, Username, userphone } = results[0];

            if (username === useremail) {
                // Send OTP email and trigger webhook
                const emailAndWebhookStatus = sendOTPEmailAndTriggerWebhook(useremail, otp, Username, userphone);
                if (emailAndWebhookStatus) {
                    res.render('otp', {
                        username: useremail,
                        logo: logoUrl,  // Ensure logoUrl is defined
                        namo: Username,  // 'namo' could be 'name' or similar
                        emcod: emcode1  // Ensure emcode1 is defined
                    }); // Render page to enter OTP
                } else {
                    res.send('Error occurred while sending OTP.');
                }
            } else {
                res.redirect('/404?error=Invalid Email. Kindly use the correct email.');
            }
        });
    } catch (error) {
        console.error('Failed to process login:', error);
        res.status(500).send('Failed to load user details.');
    }
});


app.post('/verifyOTP', (req, res) => {
    const { username, otp, namo } = req.body;
    
    const sql = 'SELECT useremail, Username, userphone, role, status FROM clusers WHERE useremail = ?';
    db.query(sql, [username], (err, results) => {
        if (err) {
            console.error('Database query error:', err);
            return res.status(500).send('An error occurred during the login process.');
        }

        if (results.length === 0) {
            return res.redirect('/?error=No user found with that email address');
        }

        const { useremail, Username, userphone, role, status } = results[0];

        if (otpMap.has(username) && otpMap.get(username) === otp) {
            // Assuming OTP is correct
            // Initialize session (ensure express-session middleware is set up)
            req.session.user = username;
            req.session.namo = namo; // Verify if this is correct
            req.session.role = role;
            req.session.status = status;

            otpMap.delete(username); // Remove OTP from map after successful verification
            res.redirect('/dashboard/all');
        } else {
            // Invalid OTP
            res.redirect('/?error=Invalid OTP. Please re-enter your registered email');
        }
    });
});




// Add a new route to handle the resend OTP request
app.post('/resendOTP', async (req, res) => {
    const { username } = req.body;
    if (otpMap.has(username)) {
        const otp = otpMap.get(username);
        const emailAndWebhookStatus = await sendOTPEmailAndTriggerWebhook(username, otp);
        if (emailAndWebhookStatus) {
            res.send('OTP has been resent.'); // Send a response indicating OTP has been resent
        } else {
            res.status(500).send('Error occurred while resending OTP.');
        }
    } else {
        res.status(400).send('No OTP found for this user.');
    }
});










function getValueByKey(responseArray, keyToMatch) {
    // Variable to store the matched value
    var matchedValue = null;

    // Iterate through the response array
    for (var i = 0; i < responseArray.length; i++) {
        // Check if the fieldKey matches the desired key
        if (responseArray[i].fieldKey === keyToMatch) {
            // Get the data type of the field
            var dataType = responseArray[i].dataType;

            // Check data type and return value accordingly
            switch (dataType) {
                case 'MULTIPLE_OPTIONS':
                case 'SINGLE_OPTIONS':
                    case 'TEXT':
                        case 'CHECKBOX':
                            case 'PHONE':
                            case 'LARGE_TEXT':
                    matchedValue = responseArray[i].value;
                    break;
                case 'NUMERICAL':
                    matchedValue = parseFloat(responseArray[i].value); // Convert to numerical value
                    break;
                case 'DATE':
                    matchedValue = new Date(responseArray[i].value);// Convert to Date object
                    const dateString = matchedValue.toLocaleDateString();
                    matchedValue=dateString;
                    break;
                case 'FILE_UPLOAD':
                    matchedValue = responseArray[i].value; // Return the object as it is
                   // console.log(matchedValue);
                    break;
                default:
                    // Unsupported data type
                    console.error("Unsupported data type:", dataType);
            }
            // No need to continue looping once the match is found
            break;
        }
    }

    // Return the matched value
    return matchedValue;
}


function formatFiles(responseArray, keyToMatch, Label) {
 const arr = [];
    // Find the object with the specified key
    const matchedObject = responseArray.find(obj => obj.fieldKey === keyToMatch);

    // If the object with the specified key is found and its data type is 'FILE_UPLOAD'
    if (matchedObject && matchedObject.dataType === 'FILE_UPLOAD') {
        const name =matchedObject.name;
        const id =matchedObject.id;
        const files = matchedObject.value;
        let formattedResult = '';

        // Iterate over each file
        for (const fileId in files) {
            if (Object.prototype.hasOwnProperty.call(files, fileId)) {
                const file = files[fileId];

var del=file.meta.deleted;
//check if file is deleted
if(del != true){
arr.push(file.url);
    
}
                // Check if the current file is a folder or a file
                // if (typeof file === 'object' && file.meta) {
                //     // If it's a folder, add a button to show its contents
                 
                // }
            }
        }
      //  console.log( arr);
      if(arr.length === 0){
formattedResult = `
             <tr>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">${Label}</td>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pr-8 text-slate-500 dark:text-slate-400 items-end text-right">No file Available</td>
      </tr>

`;


      }else{
formattedResult = `
               <tr>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">${Label}</td>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pr-8 text-slate-500 dark:text-slate-400 text-right items-end"><button onclick="showFolder(this)" data='${arr}' title="${Label}" class="h-8 px-4 text-sm text-indigo-100 transition-colors duration-150 ${baicon} rounded-lg cursor-pointer focus:shadow-outline ">
  <i class="text-lg fas fa-download"></i>
 </button></td>
      </tr>
                    
                `;
        
        
    }
        return formattedResult || ``;
    } else {
        return  ` `;
    }
}
// Function to display file in SweetAlert modal

// Function to display files in SweetAlert modal







 function generateHtmlContent(contacts,total,currentPage,nextPage,prevPage,totalPages) {
  
    let htmlContent = '';
    
     htmlContent+=`
        <div class="flex items-center gap-8 mt-5" style="width:100%;justify-content:center">
  <a href="?pagi=${prevPage}"
    class="relative h-8 max-h-[32px] w-8 max-w-[32px] dark:${gridtextdark} ${bbt} ${baicon} select-none rounded-lg border border-gray-900 text-center align-middle font-sans text-xs font-medium uppercase text-white transition-all hover:opacity-75 focus:ring focus:ring-gray-300 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
    type="button">
    <span class="absolute transform -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
        aria-hidden="true" class="w-4 h-4">
        <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18"></path>
      </svg>
    </span>
  </a>
  <p class="block font-sans text-base antialiased font-normal leading-relaxed text-gray-700 dark:${gridtextdark}">
  Total Records is <strong>${total}</strong> you are on Page <strong >${currentPage}</strong> of
    <strong>${totalPages}</strong>
  </p>
  <a href="?pagi=${nextPage}"
    class="relative h-8 max-h-[32px] dark:${gridtextdark} ${bbt} ${baicon} w-8 max-w-[32px] select-none rounded-lg border border-gray-900 text-center align-middle font-sans text-xs font-medium uppercase text-white transition-all hover:opacity-75 focus:ring focus:ring-gray-300 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
    type="button">
    <span class="absolute transform -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
        aria-hidden="true" class="w-4 h-4">
        <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"></path>
      </svg>
    </span>
  </a>
</div>
        `;
    
    
    
    
    
    
    htmlContent+=`<!-- component -->

        <table class="min-w-max w-full table-auto mt-2">
          <thead>
            <tr class="bg-gray-200 text-gray-600 uppercase text-sm leading-normal">
              <th class="py-3 px-6 text-left">Client / Company</th>
              <th class="py-3 px-6 text-left">Status</th>
              <th class="py-3 px-6 text-center">Actions</th>
            </tr>
          </thead>
          <tbody class="text-gray-600 text-sm font-light">
     
      
     `;
    
    
    
    
    
    


    for (const contact of contacts) {
        var keyin = "contact.license_expiry_date";
       var authy="contact.authority";

    
    let formattedNotes = [];  // Array to store formatted notes

//for (const contact of contacts) {
    if (Array.isArray(contact.notes)) {
        // Loop through each note object
        for (const note of contact.notes) {
            // Format each note with body and creation time
            let formattedNote = `<div  class="bg-blue-100 border border-red-400 text-blue-700 px-4 py-3 rounded relative my-1"
        role="alert"><strong class="font-bold">Note:</strong> <br><span class="block sm:inline">${note.body}</span>  <br><strong class="font-bold">Created on:<br></strong> <span class="block sm:inline">${new Date(note.createdBy.timestamp).toLocaleString()}</span></div>`;
            formattedNotes.push(formattedNote);  // Add to the array
           // console.log(formattedNote);  // Optionally log the formatted note
        }
    }

    // Remaining code for processing other details
//}

// If you want all notes in one string separated by new lines:
let notesString = `<div class="p-4 w-full">`+formattedNotes.join("<hr>")+`</div>`;
    var h=encrypt(notesString, "6677");
     
        var la=getValueByKey(contact.customFields, keyin);
        var auth= getValueByKey(contact.customFields, authy);
var tick="";
var rowcl="bg-white";
if(contact.status=="won"){
   tick=`<span class="inline-flex items-center rounded-md bg-blue-50 px-2 py-1 text-xs font-medium text-green-700 ring-1 ring-inset ring-green-600/20"><i class="fa-solid fa-circle-check"></i></span>`; 
    rowcl='bg-green-100';
}
  
          htmlContent += `
         
          
          
                 <tr class=" ${rowcl} border-b border-gray-200 hover:bg-gray-100">
              <td class="py-3 px-6 text-left">
                <span class="font-medium">${contact.name} ${tick}
                      </span>
              </td>
              <td class="py-3 px-6 text-left">
                <div class="flex items-center">
                  <span><span class="inline-flex items-center rounded-md bg-blue-50 px-2 py-1 text-xs font-medium text-green-700 ring-1 ring-inset ring-green-600/20">${contact.status}</span></span>
                </div>
              </td>
              <td class="py-3 px-6 text-center">
               <a href="/company?id=${contact.contact.id}&notes=${h}&opname=${contact.name}" class=" ${bbt} ${baicon}  text-white font-bold py-2 px-4 border border-blue-700 rounded onright">Open Company File
                       
                      </a>
              </td>
            </tr>
          
          
          
          `;
        }
        
       
        
htmlContent+=`
   </tbody>
        </table>
`;
    return htmlContent;

}






 function visasfile(contacts,id) {
  
    let htmlContent = '';


    for (const contact of contacts) {
        //var keyin = "contact.license_expiry_date";
       var authy="contact.authority";
     //  var aem="contact.applicant_email";
     //  console.log(contact.customFields);
        //var la=getValueByKey(contact.customFields, keyin);
        var auth= getValueByKey(contact.customFields, authy);
              //   aem= getValueByKey(contact.customFields, aem);

          htmlContent += `
          <div class="p-4 w-full md:w-1/2 lg:w-1/2">
              <div class="flex flex-col dark:${darkgrid} flex rounded-lg h-full ${gridback} dark:${gridtextdark} p-8 sm:p-4 xl:flex-col sm:flex-wrap">
                  <div class="flex items-center mb-3 p-1 border-b-2">
                      <div class="w-8 h-8 mr-3 inline-flex items-center justify-center rounded-full ${baicon} text-white flex-shrink-0">
                          <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-5 h-5" viewBox="0 0 24 24">
                              <path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"></path>
                              <circle cx="12" cy="7" r="4"></circle>
                          </svg>
                      </div>
                      <h2 class="text-gray-900 text-lg title-font font-medium dark:${gridtextdark}">${contact.contactName} | ${contact.companyName} | 
                      <span class="inline-flex items-center rounded-md bg-green-50 px-2 py-1 text-xs font-medium text-green-700 ring-1 ring-inset ring-green-600/20">${auth}</span></h2>
                  </div>
                  <div class="flex-grow p-1">
                      <p class="leading-relaxed text-base">Applicant Name: ${contact.contactName} <br> Email: ${contact.email} <br> ApplicantPhone: ${contact.phone}</p>
                 
                  <div class="mt-5">  
                      <a href="/single?id=${contact.id}&vid=${id}" class=" ${bbt} ${baicon}  text-white font-bold py-2 px-4 border border-blue-700 rounded">Open Visa File <i class="fas fa-sign-out-alt"></i>
                       
                      </a>
                  </div>
                  
                  
                  </div>
              </div>
          </div>`;
        }

    return htmlContent;

}

const setKeysAndTitles = (data) => {
  if (!Array.isArray(data)) {
    throw new TypeError('Expected an array for data');
  }
  return data.map(item => {
    return { key: item.key, title: item.title };
  });
};
// const parseCompanyFileView = (dataString) => {
//   const dataArray = dataString.split('},{').map(item => {
//     item = item.replace(/^{|}$/g, ''); // Remove leading '{' and trailing '}'
//     const [key, title] = item.split(', ').map(part => part.split(': ')[1].replace(/'/g, ''));
//     return { key, title };
//   });
//   return dataArray;
// };


// Function to parse the companyfileview string into an array of objects
// const parseCompanyFileView = (dataString) => {
//   // Remove leading and trailing braces and split the string into individual items
//   const items = dataString.replace(/^\s*{|\}\s*$/g, '').split(/\s*},\s*{/);

//   // Map each item to an object
//   const dataArray = items.map(item => {
//     // Remove leading and trailing braces if present
//     item = item.replace(/^{|}$/g, '');

//     // Split the key-value pairs and trim any extra whitespace
//     const [key, title] = item.split(',').map(part => part.split(': ')[1].replace(/'/g, '').trim());
    
//     return { key, title };
//   });

//   return dataArray;
// };


const parseCompanyFileView = (dataString) => {
  if (!dataString || dataString.trim().length === 0) {
    return [];
  }
  
  // Remove leading and trailing braces and split the string into individual items
  const items = dataString.replace(/^\s*{|\}\s*$/g, '').split(/\s*},\s*{/);

  // Map each item to an object
  const dataArray = items.map(item => {
    // Remove leading and trailing braces if present
    item = item.replace(/^{|}$/g, '');

    // Split the key-value pairs and trim any extra whitespace
    const [key, title] = item.split(',').map(part => part.split(': ')[1].replace(/'/g, '').trim());
    
    return { key, title };
  });

  return dataArray;
};

//Company single file
function generatesinglehtml(jj,sus,loginname,role) {
  
    let htmlContent = '';
var contact=jj;
//console.log(contact);
//    for (const contact of jj) {
        var keyin = "contact.sales_agent_name";
       var authy="contact.authority";
        var saem="contact.sales_agent_email";
        //var aform="contact.upload_application_form";
       // var bl="contact.upload_license";
        
   console.log(contact.customFields);
        // Array of key-title pairs
const keysAndTitles = setKeysAndTitles(parseCompanyFileView(companyfileview));
        let allFormattedResults = '';

// Loop through each key-title pair, format, and accumulate the results
keysAndTitles.forEach(pair => {
    const output = formatFiles(contact.customFields, pair.key, pair.title);
    allFormattedResults += output + "\n";  // Concatenate each result with a newline for separation
});
        
    //    vq=getValueByKey(contact.customFields, vq);
          let sag=getValueByKey(contact.customFields, keyin);
                const sagemail=getValueByKey(contact.customFields, saem);
                const frez=getValueByKey(contact.customFields,"contact.freezone");
                const fzp=getValueByKey(contact.customFields,"contact.freezone_package");
                const fzv=getValueByKey(contact.customFields,"contact.freezone_visa");
                //contact.no_of_activities
                const nac=getValueByKey(contact.customFields,"contact.no_of_activities");
                const nas=getValueByKey(contact.customFields,"contact.no_of_shareholders");
                
                const docl=getValueByKey(contact.customFields,"contact.document_check_list");
                  const buspro=getValueByKey(contact.customFields,"contact.business_proposal");
                    const paypo=getValueByKey(contact.customFields,"contact.payment_proof");
                     const decl=getValueByKey(contact.customFields,"contact.declaration");
                      const apri=getValueByKey(contact.customFields,"contact.application_priority");
                                //contact.freezone_visa
       //contact.freezone_package
  //      var la=getValueByKey(contact.customFields, keyin);
        var auth= getValueByKey(contact.customFields, authy);




let allvisas="wohoo";
//var clis="";
 

var clis = [];
  for (var i = 1; i <= 10; i++) {
            let fieldName = "contact.company_name_" + i;
            let foconame = getValueByKey(contact.customFields, fieldName);
            
            if (foconame && foconame !== "") {  // Check for non-empty and non-null/undefined
                console.log(foconame);  // Log the company name
                let clis2 = `<tr><td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">${foconame}</td></tr>`;
                clis.push(clis2);  // Add to the array only if foconame is valid
            }
        }
        
        
        
var shaon=[];        
var shareholders = [];
  for (var i = 1; i <= 10; i++) {
            let  allshname= "contact.shareholder_"+i+"_name";
            let allshperc ="contact.shareholder_"+i+"_share_percent_";
            let allshperc2="contact.shareholder_"+i+"_share_";
            let allshema = "contact.shareholder_"+i+"_email";
            let allshad = "contact.shareholder_"+i+"_address";
            let allshdesig = "contact.shareholder_"+i+"_designation";
            let allshphone = "contact.shareholder_"+i+"_phone_number";
            let allshphone2 = "contact.shareholder_"+i+"_phone";
            let allshintphone = "contact.shareholder_"+i+"_international_phone_no";
            let allshinout = "contact.shareholder_"+i+"_insideoutside";
            let allshvisastatus = "contact.shareholder_"+i+"_visa_status";
            
            //---------------------------------------------------------------------------
            //document checklist all partners
            let dclp="contact.shareholder_document_check_list_partner_"+i;
            let compl="contact.compliance_check_list_partner_"+i;
            let shpv="contact.passport_validity_check_partner_"+i;
            let riskan="contact.share_holder_risk_analyst_partner_"+i;
            let design="contact.designation_shareholder_"+i;
            let shcap="contact.share_capital_shareholder_"+i;
            
            //---------------------------------------------------------------------------
            
            //here we will call all sutom fields
            let s1 = getValueByKey(contact.customFields, allshname);
            let s2 = getValueByKey(contact.customFields, allshperc);
            let s22=getValueByKey(contact.customFields, allshperc2);
            let s3 = getValueByKey(contact.customFields, allshema);
            let s4 = getValueByKey(contact.customFields, allshad);
            let s5 = getValueByKey(contact.customFields, allshdesig);
            let s6 = getValueByKey(contact.customFields, allshphone);
            let s66 = getValueByKey(contact.customFields, allshphone2);
            let s7 = getValueByKey(contact.customFields, allshintphone);
            let s8 = getValueByKey(contact.customFields, allshinout);
            let s9 = getValueByKey(contact.customFields, allshvisastatus);
            
            let s10=getValueByKey(contact.customFields,dclp);
            let s11=getValueByKey(contact.customFields,compl);
            let s12=getValueByKey(contact.customFields,shpv);
            let s13=getValueByKey(contact.customFields,riskan);
            let s14=getValueByKey(contact.customFields,design);
            let s15=getValueByKey(contact.customFields,shcap);
            if(s22===null){
                s22="";
            }
            else if(s2===null){
                s2="";
            }
             if(s66===null){
                s66="";
                
            }
            else if(s6===null){
                s6="";
                
            }
            //   <tr class="${baicon} text-white dark:bg-neutral-700">
        //<th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Suggested Company Names By Client</th>
      
      //</tr>
            if (s1 && s1 !== "") {  // Check for non-empty and non-null/undefined
                console.log(allshname);  // Log the company name
                let shsh=`sh${i}=${s1}`;
                let cliss=`<tr class="${baicon} text-white dark:bg-neutral-700">
   <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left" colspan="5">Shareholder ${i} Details</th>
      
     </tr>`;
                 cliss += `<tr>
                 <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">
                 <b>Shareholder Name</b><br>
                 ${s1}
                 
                 </td>
                 <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">
                 <b>Shareholder Percent</b><br>
                 ${s2}${s22} %
                 
                 </td>
                 <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">
                 <b>Shareholder Email</b><br>
                 ${s3}
                 
                 </td>
                <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400" colspan="2">
                 <b>Shareholder Address</b><br>
                 ${s4}
                 
                 </td>
                 
                 </tr>
                 
                 <tr>
                 <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">
                 <b>Shareholder Designation</b><br>
                 ${s5}
                 
                 </td>
                 <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">
                 <b>Shareholder Phone</b><br>
                 ${s6}${s66}
                 
                 </td>
                 <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">
                 <b>Shareholder Int.Phone</b><br>
                 ${s7}
                 
                 </td>
                <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">
                 <b>Shareholder In/Out</b><br>
                 ${s8}
                 
                 </td>
                                 <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">
                 <b>Shareholder Visa</b><br>
                 ${s9}
                 
                 </td>
                 
                 </tr> 
                 
                 
                 <tr>
                 <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">
                 <b>Shareholder Document Checklist</b><br>
                 ${s10}
                 
                 </td>
                 <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">
                 <b>Shareholder Compliance Checklist</b><br>
                 ${s11}
                 
                 </td>
                 <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">
                 <b>Shareholder Passport Validity</b><br>
                 ${s12}
                 
                 </td>
                <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">
                 <b>Shareholder Risk Analyst</b><br>
                 ${s13}
                 
                 </td>
                                 <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">
                 <b>Shareholder Capital</b><br>
                 ${s15}
                 
                 </td>
                 
                 </tr> 
                 
                 
                 
                 `;
                shareholders.push(cliss);// Add to the array only if foconame is valid
                shaon.push(shsh);
            }
        }  
        
        
        
let sharehol = shaon.join("&");        


var anom = [];   
var acto = [];
  for (var i = 1; i <= 10; i++) {
       
            let actno = "contact.activity_no_" + i;
            let actn = getValueByKey(contact.customFields, actno);
            
                        let actna = "contact.activity_name_" + i;
            let actnam = getValueByKey(contact.customFields, actna);
            
            let acl ="contact.activity_checklist_"+i;
            let accl=getValueByKey(contact.customFields,acl);
            
             let shsh1=`Activity${i}=${actnam}`;
            if (actn && actn !== "") {  // Check for non-empty and non-null/undefined
                console.log(actn);  // Log the company name
                let acti = `<tr><td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">${actn}</td>
                <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">${actnam}</td>
                   <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">${accl}</td>
                </tr>`;
                acto.push(acti);  // Add to the array only if foconame is valid
                anom.push(shsh1);
            }
        }
        
        
let activitynme=anom.join("&");        
//let compan= clis.join("");


var companyName2=encodeURI(contact.companyName);
var e=encrypt(companyName2,"667766");
//console.log("Harry with push",JSON.stringify(allvisas));
  
  var jwt='';
  if(role ==="admin" || role ==="Freezone"){
   jwt=` <a href="/checklist?contact_id=${contact.id}&${sharehol}&${activitynme}&cem=${contact.email}&cphone=${contact.phone}&belongs_to=${companiname}&nos=${nas}&freezone=${frez}&source=${contact.fullNameLowerCase}|${contact.source}" data='${companyName2}' class="${bbt} ${baicon}  text-white font-bold py-2 px-2 border border-blue-700 rounded text-sm m-1 inline-block">Open Checklist Form</a>
                      
                      
                      
                      
                       <a href="#" onclick="srem('${sag}','${sagemail}','${sus}','${loginname}','${contact.id}')" data='${companyName2}' class="${bbt} ${baicon}  text-white font-bold py-2 px-2 border border-blue-700 rounded text-sm m-1 inline-block">Submit Remark</a>
                       
                      
                        <a href="#" data='${companyName2}' class="bg-emerald-700  text-white font-bold py-2 px-2 border border-blue-700 rounded text-sm m-1 inline-block rounded-full" onclick='sendRequest("${contact.id}","won","${auth}","${contact.source}")'><i class="fa-solid fa-check-double"></i> Verified</a>   
                        
                          <a href="#" data='${companyName2}' class="bg-red-700  text-white font-bold py-2 px-2 border border-blue-700 rounded text-sm m-1 inline-block rounded-full" onclick='sendRequest("${contact.id}","lost","${auth}","${contact.source}")'><i class="fa-solid fa-trash"></i> Cancelled</a>`;   
      
  }
  else{
      
      jwt=`   <a href="#" onclick="srem('${sag}','${sagemail}','${sus}','${loginname}','${contact.id}')" data='${companyName2}' class="${bbt} ${baicon}  text-white font-bold py-2 px-2 border border-blue-700 rounded text-sm m-1 inline-block">Submit Remark</a>`;
  }

  
  
  
          htmlContent += `
          <div class="p-4 w-full md:w-1/2 lg:w-1/2">
              <div class="flex rounded-lg h-full dark:${darkgrid} ${gridback} dark:${gridtextdark} p-8 flex-col">
                  <div class="items-center mb-3">
                                       <h2 class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark}">Basic Info   
                    </h2>  
                  </div>
                  <div class="flex-grow">
                      <p class="leading-relaxed text-base">Name: ${contact.fullNameLowerCase} <br> Email: ${contact.email} <br>Phone: ${contact.phone}
                      <br> <b>Source:</b> ${contact.source}
                      <br> <b>Freezone:</b> ${frez}
                      <br> <b>Freezone Package:</b> ${fzp}
                                            <br> <b>Freezone Visa:</b> ${fzv}
                                            <br> <b>No. Of Activities</b> ${nac}
                      </p>
                  
                   
                    
              </div>
          </div>
          </div>
          
          
            <div class="p-4 w-full md:w-1/2 lg:w-1/2">
              <div class="flex rounded-lg h-full dark:${darkgrid} ${gridback} dark:${gridtextdark} p-8 flex-col">
                 
                  <div class="flex-grow">
                         <h2 class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark}">Additional Info
                      </h2><p class="leading-relaxed text-base mb-3">Sales Agent: <b>${sag}</b></p>
                      <p class="leading-relaxed text-base mb-3">Sales Email: <b>${sagemail}</b></p>
                      
                     ${jwt}
                   <p>If you click on verified Your Company will directly go to won and your file will auto creates in Freezone Operation</p>
                   
                   
                        <h2 class=" mt-2 mb-1 text-lg title-font font-medium  dark:${gridtextdark}">Authority:    <p class="leading-relaxed text-base">
                   ${auth}</p>
                    <br> <b><a href="#sharehold">No. Of Shareholders</b> ${nas}</a>
                   </h2></div>
          </div>
  </div>
  
  
  
  
  
  
  
  <div class="p-4 w-full">
    <h2 class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark}">Suggested Application Form Company Name
                    </h2>
      <table class="min-w-full divide-y divide-gray-200 dark:divide-neutral-700">                 
  <thead class="${baicon} text-white dark:bg-neutral-700">
      <tr class="${baicon} text-white">
        <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Suggested Company Names By Client</th>
      
      </tr>
    </thead>                    
              <tbody class="bg-white dark:bg-slate-800">

      ${clis}
    </tbody>      
      </table>
  </div>
  
   <div class="p-4 w-full">
    <h2 class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark}">Activities List
                    </h2>
      <table class="min-w-full divide-y divide-gray-200 dark:divide-neutral-700">                 
  <thead class="${baicon} text-white dark:bg-neutral-700">
      <tr class="${baicon} text-white">
        <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Activity No</th>
                <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Activity Name</th>
                                <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Activity CheckList</th>
      
      </tr>
    </thead>                    
              <tbody class="bg-white dark:bg-slate-800">

      ${acto}
    </tbody>      
      </table>
  </div>
  
  
  
  
  
  
    <div class="p-4 w-full">
    <h2 id="sharehold" class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark}">Shareholder Complete Report
                    </h2>
      <table class="min-w-full divide-y divide-gray-200 dark:divide-neutral-700">                 
 
   
                    
              <tbody class="bg-white dark:bg-slate-800">

      ${shareholders}
    </tbody>      
      </table>
  </div>
  
  
  
  
  
   <div class="p-4 w-full">
    <h2 class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark}">Checklist
                    </h2>
      <table class="min-w-full divide-y divide-gray-200 dark:divide-neutral-700">                 
 <thead class="${baicon} text-white dark:bg-neutral-700">
      <tr class="${baicon} text-white">
                <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Document Check List</th>
                <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Business Proposal</th>
                <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Payment Proof</th>
                <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Declaration</th>
                <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Application Priority</th>
      </tr>
</thead>                    
              <tbody class="bg-white dark:bg-slate-800">

    <tr>
                <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">${docl}</td>
                <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">${buspro}</td>
                <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">${paypo}</td>
                 <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">${decl}</td>
                <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">${apri}</td>
    </tr>
    </tbody>      
      </table>
  </div>
  
  
  
  
  
<div class="p-4 w-full">
  <div class="p-4 rounded m-1 dark:${darkgrid} ${gridback} dark:${gridtextdark} -m-1.5 overflow-x-auto">
  <h2 class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark} text-center">Download Documents 
                    </h2>
                    
                    <p class="leading-relaxed text-base mb-3 text-center">You can download all of your company documents</p>
                    
    <div class="p-1.5 min-w-full inline-block align-middle">
      <div class="border rounded-xl overflow-hidden dark:border-neutral-700">
        <table class="min-w-full divide-y divide-gray-200 dark:divide-neutral-700">
          <thead class="${baicon} text-white dark:bg-neutral-700">
      <tr class="${baicon} text-white">
        <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Filename</th>
        <th class=" items-end tex-white text-right border dark:border-slate-600 font-medium p-4 pr-8 pt-3 pb-3  dark:text-slate-200">Downloads</th>
      </tr>
    </thead>
    <tbody class="bg-white dark:bg-slate-800">

      ${allFormattedResults}
    </tbody>
          </table>
      </div>
    </div>
  </div>
</div>`;
//   }

    return htmlContent;

}



function generatesinglehtmlvisa(jj) {
  
    let htmlContent = '';
var contact=jj;
//console.log(contact);
//    for (const contact of jj) {
        var keyin = "contact.visa_expiry_date";
       var authy="contact.authority";
        var vq="contact.resident_status";
        //var aform="contact.upload_application_form";
       // var bl="contact.upload_license";
        
   
        // Array of key-title pairs
const keysAndTitles = setKeysAndTitles(parseCompanyFileView(userfileview));
        let allFormattedResults = '';

// Loop through each key-title pair, format, and accumulate the results
keysAndTitles.forEach(pair => {
    const output = formatFiles(contact.customFields, pair.key, pair.title);
    allFormattedResults += output + "\n";  // Concatenate each result with a newline for separation
});
        
        var pfv=getValueByKey(contact.customFields, contact.paid_for_e_visa);
                var sagemail=getValueByKey(contact.customFields, contact.type_of_visa);
                
                                var rst=getValueByKey(contact.customFields, "contact.resident_status");
                                                var inou=getValueByKey(contact.customFields, "contact.inside_country_or_outside");
                                var mp=getValueByKey(contact.customFields, "contact.medical_payment");
                                var eip=getValueByKey(contact.customFields, "contact.medical__emirates_id_payment");
       
        var la=getValueByKey(contact.customFields, keyin);
        var auth= getValueByKey(contact.customFields, authy);

let allvisas="wohoo";

var companyName2=encodeURI(contact.companyName);
var e=encrypt(companyName2,"667766");
//console.log("Harry with push",JSON.stringify(allvisas));
  
          htmlContent += `
          <div class="p-4 w-full md:w-1/2 lg:w-1/2">
              <div class="flex rounded-lg h-full dark:${darkgrid} ${gridback} dark:${gridtextdark} p-8 flex-col">
                  <div class="items-center mb-3">
                                       <h2 class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark}">Basic Info  
                    </h2>  <span class="inline-flex items-center rounded-md bg-green-50 px-2 py-1 text-xs font-medium text-green-700 ring-1 ring-inset ring-green-600/20">Expired On: ${la}</span>
                  </div>
                  <div class="flex-grow">
                      <p class="leading-relaxed text-base">Name: ${contact.fullNameLowerCase} <br> Email: ${contact.email} <br>Phone: ${contact.phone}</p>
                  
                   
                    
              </div>
          </div>
          </div>
          
          
            <div class="p-4 w-full md:w-1/2 lg:w-1/2">
              <div class="flex rounded-lg h-full dark:${darkgrid} ${gridback} dark:${gridtextdark} p-8 flex-col">
                 
                  <div class="flex-grow">
                        <h2 class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark}">Additional Info
                      </h2><p class="leading-relaxed text-base mb-3"> <b>Paid For E Visa :</b> <b>${pfv}</b><br>
                      <b>Type Of Visa: </b><b>${sagemail}</b><br>
                      <b>Residant Status: </b><b>${rst}</b><br>
                      <b>Inside Country/Outside: </b><b>${inou}</b><br>
                      <b>Medical Payment: </b><b>${mp}</b><br>
                      <b>Emirates ID Payment: </b><b>${eip}</b>
                      
                      </p>
                      
                    
                        <h2 class=" mt-2 mb-1 text-lg title-font font-medium  dark:${gridtextdark}">Authority:    <p class="leading-relaxed text-base">
                   ${auth}</p>
                   </h2></div>
          </div>
  </div>
  
  
  
          
          
          
          
     
<div class="p-4 w-full">
  <div class="p-4 rounded m-1 dark:${darkgrid} ${gridback} dark:${gridtextdark} -m-1.5 overflow-x-auto">
  <h2 class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark} text-center">Download Documents 
                    </h2>
                    
                    <p class="leading-relaxed text-base mb-3 text-center">You can download all of your company documents</p>
                    
    <div class="p-1.5 min-w-full inline-block align-middle">
      <div class="border rounded-xl overflow-hidden dark:border-neutral-700">
        <table class="min-w-full divide-y divide-gray-200 dark:divide-neutral-700">
          <thead class="${baicon} text-white dark:bg-neutral-700">
      <tr class="${baicon} text-white">
        <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Filename</th>
        <th class=" items-end tex-white text-right border dark:border-slate-600 font-medium p-4 pr-8 pt-3 pb-3  dark:text-slate-200">Downloads</th>
      </tr>
    </thead>
    <tbody class="bg-white dark:bg-slate-800">

      ${allFormattedResults}
    </tbody>
          </table>
      </div>
    </div>
  </div>
</div>`;




        
 //   }

    return htmlContent;

}






function navigatebar(loginuser, domain2,role) {
    let htmlContent = "";
    
   // const url = `https://portal.crmsoftware.ae?domain=${domain2}`;
        const url = `https://${domain2}/allpages?domain=${domain2}`;

    // Returning the Axios promise directly
    return axios.get(url)
        .then(response => {
            const pages = response.data;
 
            // Loop through each page object in the array
            pages.forEach(page => {
                const cpage = encrypt(page.landing_page_url,"667766"); 
                htmlContent += `
                    <a href="${page.landing_page_url}" class="menlink px-4 py-3 flex dark:text-white items-center space-x-4 rounded-md text-gray-500 group">
                        ${page.icon}
                        <span>${page.title}</span>
                    </a>
                `;
            });

            // Conditional content for specific users
            if (role === "admin") {
                htmlContent += `
                    <a href="/add-page" class="menlink px-4 py-3 flex dark:text-white items-center space-x-4 rounded-md text-gray-500 group">
                        <i class="fas fa-gear"></i>
                        <span>Settings</span>
                    </a>
                    <a href="/3cx-setting" class="menlink px-4 py-3 flex dark:text-white items-center space-x-4 rounded-md text-gray-500 group">
                        <i class="fas fa-phone"></i>
                        <span>3cx Setting</span>
                    </a>
                    
                `;
            }

            return htmlContent;  // Ensure HTML content is returned here
        })
        .catch(error => {
            console.error('Error fetching pages: ', error);
            return `<p>Error loading navigation bar.</p>`;  // Return error message or similar
        });
}





//admin dashboard setting for addon pages
function allpages(loginuser, domain2) {
    let htmlContent = `
       <div class="p-1.5 min-w-full inline-block align-middle">
      <div class="border rounded-xl overflow-hidden dark:border-neutral-700">
        <table class="min-w-full divide-y divide-gray-200 dark:divide-neutral-700">
          <thead class="${baicon} text-white dark:bg-neutral-700">
      <tr class="${baicon} text-white">
        <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Title</th>
                <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Domain</th>
        <th class=" items-end tex-white text-right border dark:border-slate-600 font-medium p-4 pr-8 pt-3 pb-3  dark:text-slate-200">URL</th>
                <th class=" items-end tex-white text-right border dark:border-slate-600 font-medium p-4 pr-8 pt-3 pb-3  dark:text-slate-200">Action</th>
      </tr>
    </thead>
    <tbody class="bg-white dark:bg-slate-800"> `;
   // const url = `https://portal.crmsoftware.ae/allpages?domain=${domain2}`;
 const url = `https://${domain2}/allpages?domain=${domain2}`;
    // Returning the Axios promise directly
    return axios.get(url)
        .then(response => {
            const pages = response.data;

            // Loop through each page object in the array
            pages.forEach(page => {
                htmlContent += `
                            <tr>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">   ${page.icon} ${page.title}</td>
                <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">   ${page.domain}</td>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pr-8 text-slate-500 dark:text-slate-400 items-end text-right">${page.landing_page_url}</td>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pr-8 text-slate-500 dark:text-slate-400 items-end text-right">
        <form action="/delete-page" method="get"><input type="hidden" value="${page.id}" name="id"><input type="submit" class="mb-3 inline-block bg-red-600 text-white font-bold py-2 px-4 border border-red-700 rounded" value="Delete"></form>
        <a href="/edit-addonpage/${page.id}" class="mb-3 inline-block ${bbt} ${baicon}  text-white font-bold py-2 px-4 border border-blue-700 rounded">Edit</a>
        <a href="/page/page-clone/${page.id}" class="mb-3 inline-block ${bbt} ${baicon}  text-white font-bold py-2 px-4 border border-blue-700 rounded">Clone</a></td>
      </tr>
                `;
            });

htmlContent+=`  </tbody>
          </table>
      </div>
    </div>
`;
            return htmlContent;  // Ensure HTML content is returned here
        })
        .catch(error => {
            console.error('Error fetching pages: ', error);
            return `<p>Error loading navigation bar.</p>`;  // Return error message or similar
        });
}





function allfusers(loginuser, domain2) {
    let htmlContent = `
       <div class="p-1.5 min-w-full inline-block align-middle">
      <div class="border rounded-xl overflow-hidden dark:border-neutral-700">
        <table class="min-w-full divide-y divide-gray-200 dark:divide-neutral-700">
          <thead class="${baicon} text-white dark:bg-neutral-700">
      <tr class="${baicon} text-white">
        <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Username</th>
                <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Useremail</th>
        <th class=" items-end tex-white text-right border dark:border-slate-600 font-medium p-4 pr-8 pt-3 pb-3  dark:text-slate-200">Userphone</th>
                <th class=" items-end tex-white text-right border dark:border-slate-600 font-medium p-4 pr-8 pt-3 pb-3  dark:text-slate-200">Role</th>
                <th class=" items-end tex-white text-right border dark:border-slate-600 font-medium p-4 pr-8 pt-3 pb-3  dark:text-slate-200">Status</th>
                <th class=" items-end tex-white text-right border dark:border-slate-600 font-medium p-4 pr-8 pt-3 pb-3  dark:text-slate-200">Action</th>
      </tr>
    </thead>
    <tbody class="bg-white dark:bg-slate-800"> `;
   // const url = `https://portal.crmsoftware.ae/allpages?domain=${domain2}`;
 const url = `https://${domain2}/allusers?domain=${domain2}`;
    // Returning the Axios promise directly
    return axios.get(url)
        .then(response => {
            const pages = response.data;

            // Loop through each page object in the array
            pages.forEach(page => {
                htmlContent += `
                            <tr>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">   ${page.Username}</td>
                <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">   ${page.useremail}</td>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pr-8 text-slate-500 dark:text-slate-400 items-end text-right">${page.userphone}</td>
                <td class="border border-slate-200 dark:border-slate-600 p-2 pr-8 text-slate-500 dark:text-slate-400 items-end text-right">${page.role}</td>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pr-8 text-slate-500 dark:text-slate-400 items-end text-right">${page.status}</td>
     
        <td class="border border-slate-200 dark:border-slate-600 p-2 pr-8 text-slate-500 dark:text-slate-400 items-end text-right">
           
        <form action="/delete-user" method="get"><input type="hidden" value="${page.id}" name="id"><input type="submit" class="mb-3 inline-block bg-red-600 text-white font-bold py-2 px-4 border border-red-700 rounded" value="Delete"></form>
      
       </td>
      </tr>
                `;
            });

htmlContent+=`  </tbody>
          </table>
      </div>
    </div>
`;
            return htmlContent;  // Ensure HTML content is returned here
        })
        .catch(error => {
            console.error('Error fetching pages: ', error);
            return `<p>Error loading navigation bar.</p>`;  // Return error message or similar
        });
}







function allf3cx(loginuser, domain2) {
    let htmlContent = `
       <div class="p-1.5 min-w-full inline-block align-middle">
      <div class="border rounded-xl overflow-hidden dark:border-neutral-700">
        <table class="min-w-full divide-y divide-gray-200 dark:divide-neutral-700">
          <thead class="${baicon} text-white dark:bg-neutral-700">
      <tr class="${baicon} text-white">
        <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Company Id & Company</th>
                <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Extensions</th>
        <th class=" items-end tex-white text-right border dark:border-slate-600 font-medium p-4 pr-8 pt-3 pb-3  dark:text-slate-200">Access Key & FQDN</th>
                <th class=" items-end tex-white text-right border dark:border-slate-600 font-medium p-4 pr-8 pt-3 pb-3  dark:text-slate-200">Data Hit URL</th>
                <th class=" items-end tex-white text-right border dark:border-slate-600 font-medium p-4 pr-8 pt-3 pb-3  dark:text-slate-200">Action</th>
      </tr>
    </thead>
    <tbody class="bg-white dark:bg-slate-800"> `;
   // const url = `https://portal.crmsoftware.ae/allpages?domain=${domain2}`;
 const url = `https://${domain2}/all3cx?domain=${domain2}`;
    // Returning the Axios promise directly
    return axios.get(url)
        .then(response => {
            const pages = response.data;

            // Loop through each page object in the array
            pages.forEach(page => {
                htmlContent += `
                            <tr>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">   ${page.cid}  ${page.companyname}</td>
                <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">   ${page.extension}</td>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pr-8 text-slate-500 dark:text-slate-400 items-end text-right">${page.ackey} ${page.fqdn}</td>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pr-8 text-slate-500 dark:text-slate-400 items-end text-right">${page.dhiturl}</td>
     
        <td class="border border-slate-200 dark:border-slate-600 p-2 pr-8 text-slate-500 dark:text-slate-400 items-end text-right">
        <form action="/delete-3cx" method="get"><input type="hidden" value="${page.cid}" name="id"><input type="submit" class="mb-3 inline-block bg-red-600 text-white font-bold py-2 px-4 border border-red-700 rounded" value="Delete">
         <a href="/edit-3cx/${page.cid}" class="mb-3 inline-block ${bbt} ${baicon}  text-white font-bold py-2 px-4 border border-blue-700 rounded">Edit</a>
        </form>
      
       </td>
      </tr>
                `;
            });

htmlContent+=`  </tbody>
          </table>
      </div>
    </div>
`;
            return htmlContent;  // Ensure HTML content is returned here
        })
        .catch(error => {
            console.error('Error fetching pages: ', error);
            return `<p>Error loading navigation bar.</p>`;  // Return error message or similar
        });
}





//admin dashboard setting for addon pages
function addonfront(loginuser,domain2) {
    let htmlContent = ``;
 //   const url = `https://portal.crmsoftware.ae/allpages?domain=${domain2}`;
   const url = `https://${domain2}/allpages?domain=${domain2}`;
    // Returning the Axios promise directly
    return axios.get(url)
        .then(response => {
            const pages = response.data;

            // Loop through each page object in the array
            pages.forEach(page => {
                   const cpage = encrypt(page.landing_page_url,"667766"); 
                htmlContent += `
                
                  <div class="xl:w-1/3 md:w-1/2 p-4" id="${page.id}">
        <div class="dark:${darkgrid} ${gridback} dark:${gridtextdark} p-6 rounded-lg">
          <img class="h-50 rounded w-full object-cover object-center mb-6" src="${page.feature_image_url}" alt="content">
          <h3 class="tracking-widest text-indigo-500 text-xs font-medium title-font">Addon Services</h3>
          <h2 class="dark:${gridtextdark} text-lg text-gray-900 font-medium title-font mb-4">${page.title}</h2>
       
          
          
          <div class="mt-5">
          <a href="/addon/${cpage}" class="${bbt} ${baicon}  text-white font-bold py-2 px-4 border border-blue-700 rounded">Get Best Offer
                       
                      </a></div>
          
        </div>
      </div>
                
                
                `;
            });

htmlContent+=``;
            return htmlContent;  // Ensure HTML content is returned here
        })
        .catch(error => {
            console.error('Error fetching pages: ', error);
            return `<p>Error loading navigation bar.</p>`;  // Return error message or similar
        });
}




//admin dashboard setting for addon pages
function alldomains(domain2) {
    let htmlContent = `
       <div class="p-1.5 min-w-full inline-block align-middle">
      <div class="border rounded-xl overflow-hidden dark:border-neutral-700">
        <table class="min-w-full divide-y divide-gray-200 dark:divide-neutral-700">
          <thead class="${baicon} bg-black text-white">
      <tr class="${baicon} ">
        <th class="border dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Title</th>
                <th class="border dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Domain</th>
        <th class=" items-end text-right border dark:border-slate-600 font-medium p-4 pr-8 pt-3 pb-3  dark:text-slate-200">Logo URL</th>
                <th class=" items-end text-right border dark:border-slate-600 font-medium p-4 pr-8 pt-3 pb-3  dark:text-slate-200">Action</th>
      </tr>
    </thead>
    <tbody class="bg-white dark:bg-slate-800"> `;
    //const url = `https://portal.crmsoftware.ae/all_domains`;
 const url = `https://${domain2}/all_domains`;
    // Returning the Axios promise directly
    return axios.get(url)
        .then(response => {
            const pages = response.data;

            // Loop through each page object in the array
            pages.forEach(page => {
                htmlContent += `
                            <tr>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">   ${page.company_name}</td>
                <td class="border border-slate-200 dark:border-slate-600 p-2 pl-8 text-slate-500 dark:text-slate-400">   ${page.domain}</td>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pr-8 text-slate-500 dark:text-slate-400 items-end text-right">${page.logo_url}</td>
        <td class="border border-slate-200 dark:border-slate-600 p-2 pr-8 text-slate-500 dark:text-slate-400 items-end text-right"><form action="/setup_endpoint_delete" method="post"><input type="hidden" value="${page.id}" name="id"><input class="inline-block bg-red-600 mb-3 text-white font-bold py-2 px-4 border border-blue-700 rounded" type="submit" value="Delete"></form><a class="mb-3 inline-block ${bbt} ${baicon}  text-white font-bold py-2 px-4 border border-blue-700 rounded" href="/setup/edit/${page.id}">Edit</a><br><a class="mb-3 inline-block ${bbt} ${baicon}  text-white font-bold py-2 px-4 border border-blue-700 rounded" href="/setup/clone/${page.id}">Clone Portal Settings</a></td>
      </tr>
                `;
            });

htmlContent+=`  </tbody>
          </table>
      </div>
    </div>
`;
            return htmlContent;  // Ensure HTML content is returned here
        })
        .catch(error => {
            console.error('Error fetching pages: ', error);
            return `<p>Error loading navigation bar.</p>`;  // Return error message or similar
        });
}








//get all pages in json that will fecth all pages base on requirement
app.get('/allpages',(req,res) =>{
 //   const domain2 = req.query.domain;
 const domain2 = req.headers['x-forwarded-host'];
        //domain query is not empty then run this code
        const sql = 'SELECT * FROM pages WHERE domain = ?';
        db.query(sql, [domain2], (err, results) => {
        if (err) {
            return res.status(500).send('Error retrieving pages');
        } else {
       
            // Uncomment the next line if you need to send the results as a JSON response.
             res.json(results);
        
    }
});
});


app.get('/allusers',(req,res) =>{
 //   const domain2 = req.query.domain;
 const domain2 = req.headers['x-forwarded-host'];
        //domain query is not empty then run this code
        const sql = 'SELECT * FROM clusers';
        db.query(sql, [domain2], (err, results) => {
        if (err) {
            return res.status(500).send('Error retrieving pages');
        } else {
       
            // Uncomment the next line if you need to send the results as a JSON response.
             res.json(results);
        
    }
});
});



app.get('/all3cx',(req,res) =>{
 //   const domain2 = req.query.domain;
 const domain2 = req.headers['x-forwarded-host'];
        //domain query is not empty then run this code
        const sql = 'SELECT * FROM 3cx_setting';
        db.query(sql, [domain2], (err, results) => {
        if (err) {
            return res.status(500).send('Error retrieving pages');
        } else {
       
            // Uncomment the next line if you need to send the results as a JSON response.
             res.json(results);
        
    }
});
});



app.get('/page/page-clone/:id', sessionCheck, (req, res) => {
    const { id } = req.params;

    const selectQuery = `INSERT INTO pages (domain,icon, title, feature_image_url, landing_page_url, created_at, updated_at)
SELECT
   domain, 
icon, 
title, 
feature_image_url, 
landing_page_url, 
created_at, 
updated_at
FROM pages
WHERE id = ?`;
    db.query(selectQuery, [id], (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Failed to retrieve domain configuration.');
        }
        if (results.length === 0) {
            return res.status(404).send('Configuration not found.');
        }

        const config = results[0];
        res.redirect('/add-page');
    });
});






app.get('/pages',(req,res) => {
       const sql = 'SELECT * FROM pages';
    db.query(sql, (err, results) => {
        if (err) {
        return res.status(500).send('Error retrieving pages');
        } 
        else {
               res.json(results);
        
        }
    });
})


app.get('/all_domains',(req,res) => {
       const sql = 'SELECT * FROM domain_config';
    db.query(sql, (err, results) => {
        if (err) {
        return res.status(500).send('Error retrieving pages');
        } 
        else {
               res.json(results);
        
        }
    });
})


app.get('/add-page',sessionCheck, async(req,res) => {
    
    //new page added html
 var addform=`
     <h2 class="text-2xl font-semibold mb-4 dark:text-gray-700">Add New Page</h2>
  <form id="pageForm" method="POST" action="/add-page" class="space-y-4">
                <div>
                    <label for="domain" class="block text-sm font-medium text-gray-700">Domain</label>
                    <input type="text" id="domain" name="domain" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                   <div>
                    <label for="icon" class="block text-sm font-medium text-gray-700">Icon <a href="https://fontawesome.com/search?m=free&o=r" target="_blank">Check Icons from here</a> Click on any icon and just copy the code and paste it here</label>
                    <input type="text" id="icon" name="icon" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <label for="title" class="block text-sm font-medium text-gray-700">Title</label>
                    <input type="text" id="title" name="title" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <label for="featureImageUrl" class="block text-sm font-medium text-gray-700">Feature Image URL</label>
                    <input type="text" id="featureImageUrl" name="featureImageUrl" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <label for="landingPageUrl" class="block text-sm font-medium text-gray-700">Landing Page URL</label>
                    <input type="url" required id="landingPageUrl" name="landingPageUrl" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white ${baicon} focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Add Page</button>
                </div>
            </form>
 `;
    
    
    
    
var addform2y = `
        <h2 class="text-2xl font-semibold mb-4 dark:text-gray-700">Add New User</h2>
        <form id="userForm" method="POST" action="/add-user" class="space-y-4">
            <div>
                <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
                <input type="text" id="username" name="username" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
            </div>
            <div>
                <label for="useremail" class="block text-sm font-medium text-gray-700">Email</label>
                <input type="email" id="useremail" name="useremail" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
            </div>
            <div>
                <label for="role" class="block text-sm font-medium text-gray-700">Role</label>
                <!--<input type="text" id="role" name="role" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">-->
                <select name="role" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                <option value="">Kindly Select Role</option>
                                <option value="admin">Admin</option>
                                                <option value="Freezone">Freezone</option>
                                                                <option value="Central">Central</option>
                                                                 <option value="Accounts">Accounts</option>
                                                                                                                                  <option value="CP">Channel Partner</option>
                
                
                </select>
                
                
            </div>
            <div style="display:none">
                <label for="status" class="block text-sm font-medium text-gray-700">Status</label>
                <input type="text" value="Active" id="status" name="status" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
            </div>
            <div>
                <label for="userphone" class="block text-sm font-medium text-gray-700">Phone Number</label>
                <input type="tel" id="userphone" name="userphone" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
            </div>
            <div>
                <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white ${baicon} focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Add User</button>
            </div>
        </form>
    `;    
    
    
    
    
    // const domain2 = req.hostname;
     const domain2 = req.headers['x-forwarded-host'];
    const sql = 'SELECT * FROM pages';
    db.query(sql, (err, results) => {
        if (err) {
            return res.status(500).send('Error retrieving pages');
        }else {
         console.log(results);
        //res.json(results);
      }
    });
       // console.log(results);
    
const loginuser=req.session.user;
let htmlContent="Yoo this page hold all addon services";
try {
    const allout= await allpages(req.session.user, domain2);
    const alluser = await allfusers(req.session.user, domain2);
    const sidy = await navigatebar(req.session.user, domain2,req.session.role);
         res.render('settings', {
                    title: 'Pages Setting',
                    user: req.session.user,
                    logo: logoUrl,
                    theme: req.client.theme,
                    contacts: htmlContent,
                    background:back,
                    darkback:darkback,
                    sidedark:sidedark,
                    sideback:sideback,
                    butico:baicon,
                    namo:req.session.namo,
                    sidy:sidy,
                    allout:allout,
                    alluser:alluser,
                    addform:addform,
                    addform2:addform2y,
                    emcod:emcode1
                });
} catch (error) {
                console.error('Failed to generate navigation bar:', error);
                res.status(500).send('Failed to load page settings.');
            }
    
})

app.post('/add-user', sessionCheck, async (req, res) => {
    const { username, useremail, role, status, userphone } = req.body;
    const sql = 'INSERT INTO clusers (Username, useremail, role, status, userphone) VALUES (?, ?, ?, ?, ?)';

    db.query(sql, [username, useremail, role, status, userphone], (err, result) => {
        if (err) {
            console.error('Error inserting new user:', err);
            return res.status(500).send('Failed to add new user.');
        }
        res.redirect('/add-page'); // Adjust the redirection to your needs
    });
});
app.get('/delete-user/', sessionCheck, async (req, res) => {
    const userId = req.query.id;

    const sql = 'DELETE FROM clusers WHERE id = ?';

    db.query(sql, [userId], (err, result) => {
        if (err) {
            console.error('Error deleting user:', err);
            return res.status(500).send('Failed to delete user.');
        }
        if (result.affectedRows === 0) {
            return res.status(404).send('User not found.');
        }
        res.redirect('/add-page'); // Redirect to the user list or a confirmation page
    });
});



app.get('/delete-3cx/', sessionCheck, async (req, res) => {
    const userId = req.query.id;

    const sql = 'DELETE FROM 3cx_setting WHERE cid = ?';

    db.query(sql, [userId], (err, result) => {
        if (err) {
            console.error('Error deleting user:', err);
            return res.status(500).send('Failed to delete user.');
        }
        if (result.affectedRows === 0) {
            return res.status(404).send('User not found.');
        }
        res.redirect('/3cx-setting'); // Redirect to the user list or a confirmation page
    });
});




// Edit page route
app.get('/edit-addonpage/:id', sessionCheck, async (req, res) => {
    
    const pageId = req.params.id;
 //   const domain2 = req.hostname;
    const domain2 = req.headers['x-forwarded-host'];
    const sql = 'SELECT * FROM pages WHERE id = ?';  // Query to get the specific page by ID

   try {
        const alluser = await allfusers(req.session.user, domain2);
         const allout= await allpages(req.session.user, domain2);
    const sidy = await navigatebar(req.session.user, domain2,req.session.role);
          db.query(sql, [pageId], (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Failed to retrieve domain configuration.');
        }
        if (results.length === 0) {
            return res.status(404).send('Configuration not found.');
        }

        const page = results[0];
       // res.render('setup_edit', { config });
 
        var addform2y = `
        <h2 class="text-2xl font-semibold mb-4 dark:text-gray-700">Add New User</h2>
        <form id="userForm" method="POST" action="/add-user" class="space-y-4">
            <div>
                <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
                <input type="text" id="username" name="username" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
            </div>
            <div>
                <label for="useremail" class="block text-sm font-medium text-gray-700">Email</label>
                <input type="email" id="useremail" name="useremail" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
            </div>
            <div>
                <label for="role" class="block text-sm font-medium text-gray-700">Role</label>
                <input type="text" id="role" name="role" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
            </div>
            <div>
                <label for="status" class="block text-sm font-medium text-gray-700">Status</label>
                <input type="text" id="status" name="status" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
            </div>
            <div>
                <label for="userphone" class="block text-sm font-medium text-gray-700">Phone Number</label>
                <input type="tel" id="userphone" name="userphone" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
            </div>
            <div>
                <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white ${baicon} focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Add User</button>
            </div>
        </form>
    `;    
    
        
      //  const results = await db.query(sql, [pageId]);
        // if (results[0].length > 0) {
        //     const page = results[0][0];  // Assuming only one row is returned

            // Form with pre-filled values for editing
            var editForm = `
              <h2 class="text-2xl font-semibold mb-4 dark:text-gray-700">Edit Page <a href="/add-page" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white ${baicon} focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Back To Add Page</a></h2>
            <form id="pageForm" method="post" action="/update-page" class="space-y-4">
                <div>
                    <label for="domain" class="block text-sm font-medium text-gray-700">Domain</label>
                       <input type="hidden" id="id" name="id" value="${pageId}" required>
                    <input type="text" id="domain" name="domain" value="${page.domain}" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <label for="icon" class="block text-sm font-medium text-gray-700">Icon <a href="https://fontawesome.com/search?m=free&o=r" target="_blank">Check Icons from here</a> Click on any icon and just copy the code and paste it here</label>
                    <textarea name="icon"  required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">${page.icon}</textarea>
                </div>
                <div>
                    <label for="title" class="block text-sm font-medium text-gray-700">Title</label>
                    <input type="text" id="title" name="title" value="${page.title}" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <label for="featureImageUrl" class="block text-sm font-medium text-gray-700">Feature Image URL</label>
                    <input type="text" id="featureImageUrl" name="featureImageUrl" value="${page.feature_image_url}" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <label for="landingPageUrl" class="block text-sm font-medium text-gray-700">Landing Page URL</label>
                    <input type="url" required id="landingPageUrl" name="landingPageUrl" value="${page.landing_page_url}" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-indigo-500 hover:bg-indigo-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Update Page</button>
                </div>
            </form>
            `;

            res.render('settings', {
                title: 'Edit Page',
                user: req.session.user,
                logo: logoUrl,
                theme: req.client.theme,
                contacts: "Edit existing page details",
                background: back,
                darkback: darkback,
                sidedark: sidedark,
                sideback: sideback,
                butico: baicon,
                namo: req.session.namo,
                sidy:  sidy,
                allout:  allout,
                addform: editForm,
                emcod:emcode1,
                addform2:addform2y,
                alluser:alluser
            });
        // } else {
        //     res.status(404).send('Page not found');
        // }
          });
    } catch (error) {
        console.error('Failed to retrieve page for editing:', error);
        res.status(500).send('Failed to load edit form.');
    }
});





// app.get('/update-page', express.urlencoded({ extended: true }), sessionCheck, (req, res) => {
//     const {
//         id, domain, icon, title, featureImageUrl, landingPageUrl
//     } = req.query;

//     const updateQuery = `
//       UPDATE pages SET domain=?,icon=?,title=?,feature_image_url=?,landing_page_url=?WHERE id=?
//     `;
//     const params = [
//       domain, icon, title, featureImageUrl, landingPageUrl,id
//     ];

//     db.query(updateQuery, params, (err, result) => {
//         if (err) {
//             console.error('Database error:', err);
//             return res.status(500).send('Failed to update domain configuration.');
//         }
//         res.redirect('/add-page');
//     });
// });


// Route to handle form submissions for updating a page
app.post('/update-page', express.urlencoded({ extended: true }), sessionCheck, (req, res) => {
    const { id, domain, icon, title, featureImageUrl, landingPageUrl } = req.body;

    if (!id) {
        return res.status(400).send("No page ID provided.");
    }

    const updateQuery = `
        UPDATE pages 
        SET domain = ?, 
            icon = ?, 
            title = ?, 
            feature_image_url = ?, 
            landing_page_url = ? 
        WHERE id = ?
    `;
    const params = [domain, icon, title, featureImageUrl, landingPageUrl, id];

    db.query(updateQuery, params, (err, result) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Failed to update the page details.');
        }
        if (result.affectedRows === 0) {
            return res.status(404).send("No page found with the given ID.");
        }
        res.redirect('/add-page');  // Redirect to a page list or confirmation page
    });
});



//code end here for edit page-------------------------













app.get('/addon/:page',sessionCheck, async(req,res) => {
    const addonpage = decrypt(req.params.page,"667766");
   const domain2 = req.headers['x-forwarded-host'];
  //  const domain2 = req.hostname;
    const sql = 'SELECT * FROM pages';
    db.query(sql, (err, results) => {
        if (err) {
            return res.status(500).send('Error retrieving pages');
        }else {
         console.log(results);
        //res.json(results);
      }
    });
       // console.log(results);
    
const loginuser=req.session.user;
let htmlContent="Yoo this page hold all addon services";
try {
    const allout= await allpages(req.session.user, domain2);
    const sidy = await navigatebar(req.session.user, domain2,req.session.role);
         res.render('addon', {
                    title: 'Addon Services',
                    user: req.session.user,
                    logo: logoUrl,
                    theme: req.client.theme,
                    contacts: htmlContent,
                    background:back,
                    darkback:darkback,
                    sidedark:sidedark,
                    sideback:sideback,
                    butico:baicon,
                    namo:req.session.namo,
                    sidy:sidy,
                    allout:allout,
                    addonpage:addonpage,
                    emcod:emcode1
                });
} catch (error) {
                console.error('Failed to generate navigation bar:', error);
                res.status(500).send('Failed to load page settings.');
            }
    
})








// Route to add a new page
app.post('/add-page', express.json(), sessionCheck, (req, res) => {
    const { domain, icon, title, featureImageUrl, landingPageUrl } = req.body;
    const sql = 'INSERT INTO pages (domain, icon, title, feature_image_url, landing_page_url) VALUES (?, ?, ?, ?, ?)';
    const params = [domain, icon, title, featureImageUrl, landingPageUrl];
    
    db.query(sql, params, (err, result) => {
        if (err) {
            return res.status(500).send('Error adding new page');
        }
        //res.status(201).send('Page added successfully');
     res.redirect('/add-page');
        
    });
});



app.post('/setup', express.json(), sessionCheck, (req, res) => {
    const {
        domain, location_id, v_location_id, logo_url, background, dark_back, side_dark_back, side_back,
        grid_back, dark_grid_back, text_light, text_dark, icon_button_back, button_bottom_border,
        company_name, company_address, heading_color,emcode,cfv
    } = req.body;

    const insertQuery = `
        INSERT INTO domain_config (
            domain, location_id, v_location_id, logo_url, background, dark_back, side_dark_back, side_back,
            grid_back, dark_grid_back, text_light, text_dark, icon_button_back, button_bottom_border,
            company_name, company_address, heading_color,emcode,cfv
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)
    `;
    const params = [
        domain, location_id, v_location_id, logo_url, background, dark_back, side_dark_back, side_back,
        grid_back, dark_grid_back, text_light, text_dark, icon_button_back, button_bottom_border,
        company_name, company_address, heading_color,emcode,cfv
    ];

    db.query(insertQuery, params, (err, result) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Failed to save domain configuration.');
        }
        res.redirect('/domain-setup');
    });
});







// Route to delete a page
app.get('/delete-page', sessionCheck, (req, res) => {
    const pageId = req.query.id;
    
    db.query('DELETE FROM pages WHERE id = ?', [pageId], (error, results) => {
        if (error) {
            return res.status(500).send(error);
        }
        res.redirect('/add-page');
    });
});

// Route to edit a page (this is a simple example, you'll need a form to edit the page)
app.post('/edit-page/:id', sessionCheck, (req, res) => {
    const pageId = req.params.id;
    const { domain,icon, title, featureImageUrl, landingPageUrl } = req.body;
    
    pool.query('UPDATE pages SET domain = ?,icon = ?, title = ?, feature_image_url = ?, landing_page_url = ? WHERE id = ?', [domain, title, featureImageUrl, landingPageUrl, pageId], (error, results) => {
        if (error) {
            return res.status(500).send(error);
        }
        res.redirect('/add-page');
    });
});


app.get('/dashboard/:ctaas', sessionCheck,  async(req, res) => {
    const coname=req.query.cname;
       const pagestatus = req.params.ctaas;
    //cstatus
      const pst=req.query.ctas;
      
      
      
            const pagi=req.query.pagi;
       const domain2 = req.headers['x-forwarded-host'];
      //  const domain2 = req.hostname;
   sharedData['latest']
   // if (!sharedData['latest']) {
        socket.emit('search', {
            //  query1: req.session.user,
            query1: coname || "",
            query2: locationId,
            query3: 20,
            cstatus: pagestatus ||"open",
            pagi: pagi || 1
        });
      
        socket.once('searchResult',  async(data) => {
            if (data.error) {
                console.error('Socket.IO Error:', data.error);
                res.status(500).send('An error occurred.');
            } else {
                sharedData['latest'] = data.opportunities;
                console.log(data.meta);
                const total=data.meta.total;
                const currentPage=data.meta.currentPage;
                const nextPage=data.meta.nextPage;
                const prevPage=data.meta.prevPage;
                const productsPerPage = 20;
                const totalPages = Math.ceil(total / productsPerPage);
                console.log(totalPages);
                // Generate HTML content with the new data
                let htmlContent =  generateHtmlContent(sharedData['latest'],total,currentPage,nextPage,prevPage,totalPages);
//let sidy=navigatebar(req.session.user,domain2);
    let sidy=navigatebar(req.session.user,domain2,req.session.role);
    console.log(sidy);
    try {
    const sidy = await navigatebar(req.session.user, domain2,req.session.role);
    const addony= await addonfront(req.session.user, domain2);
                res.render('dashboard', {
                    title: 'Dashboard',user: req.session.user,logo: logoUrl,lid: locationId,theme: req.client.theme,contacts: htmlContent,background:back,darkback:darkback,sidedark:sidedark,sideback:sideback,butico:baicon,namo:req.session.namo,sidy:sidy,addony:addony,emcod:emcode1 
                });
    } catch (error) {
                console.error('Failed to generate navigation bar:', error);
                res.status(500).send('Failed to load page settings.');
            }
                
            }
        });
   
});





//company File
app.get('/company', sessionCheck, async(req, res) => {
   const domain2 = req.headers['x-forwarded-host'];
  //  const domain2 = req.hostname;
     sharedData['qw'];
    const companyid = req.query.id;  // Assuming 'id' is the query string parameter
    const nott = decrypt(req.query.notes,"6677");
    const opname = req.query.opname;
        socket.emit('contactid', {
            query1: companyid,
            query2: locationId,
         
        });
        socket.once('searchResult', async (data) => {
           var compan=data.contact.companyName;
            if (data.error) {
                console.error('Socket.IO Error:', data.error);
                res.status(500).send('An error occurred.');
               // console.log()
            } else {
                sharedData['qw'] = data.contact;
                console.log( sharedData['qw']);
                let htmlContent = generatesinglehtml(sharedData['qw'],req.session.user,req.session.namo,req.session.role);
try {
    const sidy = await navigatebar(req.session.user, domain2, req.session.role);
                res.render('company', 
                {
                    title: compan+' | Company',
                    user: req.session.user,
                    logo: logoUrl,
                    lid: locationId,  // Use locationId extracted from query string
                    theme: req.client.theme,
                    contacts: htmlContent,
                    companyid:opname,
                    background:back,
                    darkback:darkback,
                    sidedark:sidedark,
                    sideback:sideback,
                    butico:baicon,
                    namo:req.session.namo,
                    sidy:sidy,
                    emcod:emcode1,
                    nott:nott
                });
} catch (error) {
                console.error('Failed to generate navigation bar:', error);
                res.status(500).send('Failed to load page settings.');
            }
            }
        });
});





//single visa File
app.get('/single', sessionCheck, async(req, res) => {
   const domain2 = req.headers['x-forwarded-host'];
  //  const domain2 = req.hostname;
     sharedData['qw'];
    const companyid = req.query.id; 
        const vlid = req.query.vid; 
    // Assuming 'id' is the query string parameter
        socket.emit('contactid', {
            query1: companyid,
            query2: vlid,
         
        });
        socket.once('searchResult', async (data) => {
           var compan=data.contact.companyName;
            if (data.error) {
                console.error('Socket.IO Error:', data.error);
                res.status(500).send('An error occurred.');
               // console.log()
            } else {
                sharedData['qw'] = data.contact;
                let htmlContent = generatesinglehtmlvisa(sharedData['qw']);
try {
    const sidy = await navigatebar(req.session.user, domain2,req.session.role);
                res.render('single', 
                {
                    title: compan+' | Visa',
                    user: req.session.user,
                    logo: logoUrl,
                    lid: locationId,  // Use locationId extracted from query string
                    theme: req.client.theme,
                    contacts: htmlContent,
                    companyid:compan,
                    background:back,
                    darkback:darkback,
                    sidedark:sidedark,
                    sideback:sideback,
                    butico:baicon,
                    namo:req.session.namo,
                    sidy:sidy,
                    emcod:emcode1
                });
} catch (error) {
                console.error('Failed to generate navigation bar:', error);
                res.status(500).send('Failed to load page settings.');
            }
            }
        });
});






//checklist page
app.get('/checklist', sessionCheck, async (req, res) => {
    const domain = req.headers['x-forwarded-host'] || req.hostname; // Fallback to hostname if 'x-forwarded-host' is unavailable
  //  const companyId = req.query.id; // Retrieve company ID from query string
var t=req.query.source;
   // const fullUrl = req.originalUrl;
    // Construct the full URL
    const fullUrl = new URL(req.protocol + '://' + req.get('host') + req.originalUrl);
    
    // Extract the query string part, including the leading '?'
    const queryString = fullUrl.search;
    
    try {
        // Simulate obtaining data for the company based on companyId
     //   const companyData = await getCompanyData(companyId); // This function needs to be defined to fetch company data

        // Generate HTML content for the single view
        let htmlContent = ""; // This function needs to be defined to create HTML content

        // Optional: navigate bar based on user session and domain
        const sidy = await navigatebar(req.session.user, domain,req.session.role); // This function needs to be defined to generate navigation sidebar

        // Render the single page view with various parameters
        res.render('checklist', {
              title: t+' | Checklist',
                    user: req.session.user,
                    logo: logoUrl,
                    lid: locationId,  // Use locationId extracted from query string
                    theme: req.client.theme,
                    contacts: queryString,
                    companyid:t,
                    background:back,
                    darkback:darkback,
                    sidedark:sidedark,
                    sideback:sideback,
                    butico:baicon,
                    namo:req.session.namo,
                    sidy:sidy,
                    emcod:emcode1
         
        });
    } catch (error) {
        console.error('Error processing request:', error);
        res.status(500).send('An error occurred while processing your request.');
    }
});








// app.get('/visas', sessionCheck, async(req, res) => {
//   const domain2 = req.headers['x-forwarded-host'];
//   //  const domain2 = req.hostname;
//      sharedData['vis'];
     
//     const companyid = decrypt(req.query.company,"667766"); 
// var decodedURI = decodeURIComponent(companyid);
// var decodedURI2 = encodeURIComponent(decodedURI);
// console.log(decodedURI2,decodedURI);
// //console.log(companyid);
//       socket.emit('contact', {
//             query1: decodedURI2,
//             query2: V_locationId,
//             query3: 10,
//         });
//         socket.once('searchResult',  async(data) => {
//             if (data.error) {
//                 console.error('Socket.IO Error:', data.error);
//                 res.status(500).send('An error occurred.');
//             } else {
//                 sharedData['vis'] = data.contacts;
//               // if(data.contacts.length===0){}
                
                
// const cpn=data.contacts[0].companyName;
// const cna=data.contacts[0].contactName;
// const cph=req.query.cphone;
// const cem=req.query.cem;
// const cauth=req.query.auth;
// //belongs_to
// const belongs_to=req.query.belongs_to;
//                 // Generate HTML content with the new data
//                 let htmlContent =  visasfile(sharedData['vis']);
//                 try {
//     const sidy = await navigatebar(req.session.user, domain2);
//                 res.render('visas', {
//                     title: 'visas',
//                     user: req.session.user,
//                     logo: logoUrl,
//                     lid: locationId,
//                     theme: req.client.theme,
//                     contacts: htmlContent,
//                     background:back,
//                     darkback:darkback,
//                     sidedark:sidedark,
//                     sideback:sideback,
//                     butico:baicon,
//                     namo:req.session.namo,
//                     companyid:decodedURI,
//                     sidy:sidy,
//                     cpn:cpn,
//                     cna:cna,
//                     cph:cph,
//                     cem:cem,
//                     cauth:cauth,
//                     belongs_to:belongs_to,
//                     emcod:emcode1
//                 });
//                 } catch (error) {
//                 console.error('Failed to generate navigation bar:', error);
//                 res.status(500).send('Failed to load page settings.');
//             }
//             }
//         });
// });

app.get('/visas', sessionCheck, async(req, res) => {
   const domain2 = req.headers['x-forwarded-host'];
   //  const domain2 = req.hostname;
   sharedData['vis'];
     
   const companyid = decrypt(req.query.company, "667766"); 
   var decodedURI = decodeURIComponent(companyid);
   var decodedURI2 = encodeURIComponent(decodedURI);
   console.log(decodedURI2, decodedURI);
   // console.log(companyid);
   socket.emit('contact', {
       query1: decodedURI2,
       query2: V_locationId,
       query3: 10,
   });
   socket.once('searchResult', async(data) => {
       if (data.error) {
           console.error('Socket.IO Error:', data.error);
           res.status(500).send('An error occurred.');
       } else if (!data.contacts || data.contacts.length === 0) {
          // res.status(404).send('No contacts found.');
        res.status(404).render('404');
           
       } else {
           sharedData['vis'] = data.contacts;
           const cpn = data.contacts[0].companyName;
           const cna = data.contacts[0].contactName;
           const cph = req.query.cphone;
           const cem = req.query.cem;
           const cauth = req.query.auth;
           const belongs_to = req.query.belongs_to;
           // Generate HTML content with the new data
           let htmlContent = visasfile(sharedData['vis']);
           try {
               const sidy = await navigatebar(req.session.user, domain2,req.session.role);
               res.render('visas', {
                   title: 'visas',
                   user: req.session.user,
                   logo: logoUrl,
                   lid: locationId,
                   theme: req.client.theme,
                   contacts: htmlContent,
                   background: back,
                   darkback: darkback,
                   sidedark: sidedark,
                   sideback: sideback,
                   butico: baicon,
                   namo: req.session.namo,
                   companyid: decodedURI,
                   sidy: sidy,
                   cpn: cpn,
                   cna: cna,
                   cph: cph,
                   cem: cem,
                   cauth: cauth,
                   belongs_to: belongs_to,
                   emcod: emcode1
               });
           } catch (error) {
               console.error('Failed to generate navigation bar:', error);
               res.status(500).send('Failed to load page settings.');
           }
       }
   });
});




// Setup Route to render setup page
// app.get('/setup',(req, res) => {
    
//      const domain = req.hostname;
//   // console.log(`Domain: ${domain}`);

//     try {
//         const [rows] = await pool.query('SELECT * FROM domain_config WHERE domain = ?', [domain]);
//         if (rows.length > 0) {
//           res.redirect('/');
//           // req.config = rows[0];
//       //     console.log('Configuration for Domain:', req.config);
//         } else {
//             console.error(`No configuration found for domain: ${domain}`);
//           // res.redirect('/setup');
//              const domain = req.query.domain || '';
//     res.render('setup', { domain });
//         }
    
   

    
    
// });
//Check the configuration
app.get('/setup-basic', async (req, res) => {
    const domain2 = req.headers['x-forwarded-host'];
   // const domain = req.hostname;
    try {
        const [rows] = await pool.query('SELECT * FROM domain_config WHERE domain = ?', [domain]);
        if (rows.length > 0) {
            res.redirect('/');
        } else {
            console.error(`No configuration found for domain: ${domain}`);
            const queryDomain = req.query.domain || '';
            res.render('setup', { domain: queryDomain });
        }
    } catch (error) {
        console.error(`Error querying the database: ${error.message}`);
        res.status(500).send('Internal Server Error');
    }
});

app.get('/domain-setup',sessionCheck, async (req, res) => {
const domain2 = req.headers['x-forwarded-host'];
               try {
                   // const sidy = await navigatebar(req.session.user, domain2);
                   var alldom= await alldomains(domain2);
                   res.render('domain-setup', { 
                       alldomains:alldom,
                        user: req.session.user,
                    logo: logoUrl,
                    theme: req.client.theme,
                    background:back,
                    darkback:darkback,
                    sidedark:sidedark,
                    sideback:sideback,
                    butico:baicon,
                    namo:req.session.namo,
                    emcod:emcode1
                    });
                   
               }
               catch (error) {
                console.error('Failed to generate navigation bar:', error);
                res.status(500).send('Failed to load page settings.'+error);
            }

});

//domain CRUD
app.get('/setup/edit/:id', sessionCheck, (req, res) => {
    const { id } = req.params;

    const selectQuery = 'SELECT * FROM domain_config WHERE id = ?';
    db.query(selectQuery, [id], (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Failed to retrieve domain configuration.');
        }
        if (results.length === 0) {
            return res.status(404).send('Configuration not found.');
        }

        const config = results[0];
        res.render('setup_edit', { config });
    });
});



app.get('/setup/clone/:id', sessionCheck, (req, res) => {
    const { id } = req.params;

    const selectQuery = `INSERT INTO domain_config (domain, location_id,v_location_id,logo_url,background,dark_back,side_dark_back,side_back,grid_back,dark_grid_back,text_light,text_dark,icon_button_back,button_bottom_border, company_name,company_address,heading_color,emcode,cfv,cvv)
SELECT
    CONCAT('random_', domain),
    location_id,
    v_location_id,
    logo_url,
    background,
    dark_back,
    side_dark_back,
    side_back,
    grid_back,
    dark_grid_back,
    text_light,
    text_dark,
    icon_button_back,
    button_bottom_border,
    company_name,
    company_address,
    heading_color,
    emcode,cfv,cvv
FROM domain_config
WHERE id = ?`;
    db.query(selectQuery, [id], (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Failed to retrieve domain configuration.');
        }
        if (results.length === 0) {
            return res.status(404).send('Configuration not found.');
        }

        const config = results[0];
        res.redirect('/domain-setup');
    });
});




app.post('/setup_endpoint_edit', express.urlencoded({ extended: true }), sessionCheck, (req, res) => {
    const {
        id, domain, location_id, v_location_id, logo_url, background, dark_back, side_dark_back, side_back,
        grid_back, dark_grid_back, text_light, text_dark, icon_button_back, button_bottom_border,
        company_name, company_address, heading_color,emcode,cfv,cvv
    } = req.body;

    const updateQuery = `
        UPDATE domain_config 
        SET domain = ?, location_id = ?, v_location_id = ?, logo_url = ?, background = ?, dark_back = ?, 
            side_dark_back = ?, side_back = ?, grid_back = ?, dark_grid_back = ?, text_light = ?, 
            text_dark = ?, icon_button_back = ?, button_bottom_border = ?, company_name = ?, 
            company_address = ?, heading_color = ?,emcode=?,cfv=?,cvv=?
        WHERE id = ?
    `;
    const params = [
        domain, location_id, v_location_id, logo_url, background, dark_back, side_dark_back, side_back,
        grid_back, dark_grid_back, text_light, text_dark, icon_button_back, button_bottom_border,
        company_name, company_address, heading_color,emcode,cfv,cvv, id
    ];

    db.query(updateQuery, params, (err, result) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Failed to update domain configuration.');
        }
        res.redirect('/domain-setup');
    });
});

app.post('/setup_endpoint_delete', express.urlencoded({ extended: true }), sessionCheck, (req, res) => {
    const {
        id
    } = req.body;

    const updateQuery = `
        delete from domain_config WHERE id = ?
    `;
    const params = [
        id
    ];

    db.query(updateQuery, params, (err, result) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Failed to update domain configuration.');
        }
        res.redirect('/domain-setup');
    });
});

app.get('/logout', sessionCheck, async (req, res) => {
    const domain2 = req.headers['x-forwarded-host'];

    // Clear the session
    req.session.destroy((err) => {
        if (err) {
            return res.status(500).send('Could not log out.');
        }

        // Clear cookies
        res.clearCookie('connect.sid'); // Assuming 'connect.sid' is your session cookie

        // Redirect to domain2
        res.redirect(`https://${domain2}`);
    });
});




































//extra code for everycompany
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//


//this function is to fetch all freezone companies utilize
function globalcompanies(contacts,lid,vid,total,currentPage,nextPage,prevPage,totalPages) {
  
    let htmlContent = '';
// htmlContent += ``;
  htmlContent+=`
        <div class="flex items-center gap-8 mt-5" style="width:100%;justify-content:center">
  <a href="?pagi=${prevPage}"
    class="relative h-8 max-h-[32px] w-8 max-w-[32px] dark:${gridtextdark} ${bbt} ${baicon} select-none rounded-lg border border-gray-900 text-center align-middle font-sans text-xs font-medium uppercase text-white transition-all hover:opacity-75 focus:ring focus:ring-gray-300 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
    type="button">
    <span class="absolute transform -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
        aria-hidden="true" class="w-4 h-4">
        <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18"></path>
      </svg>
    </span>
  </a>
  <p class="block font-sans text-base antialiased font-normal leading-relaxed text-gray-700 dark:${gridtextdark}">
Total Records is <strong>${total}</strong> you are on   Page <strong >${currentPage}</strong> of
    <strong>${totalPages}</strong>
  </p>
  <a href="?pagi=${nextPage}"
    class="relative h-8 max-h-[32px] dark:${gridtextdark} ${bbt} ${baicon} w-8 max-w-[32px] select-none rounded-lg border border-gray-900 text-center align-middle font-sans text-xs font-medium uppercase text-white transition-all hover:opacity-75 focus:ring focus:ring-gray-300 active:opacity-[0.85] disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
    type="button">
    <span class="absolute transform -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
        aria-hidden="true" class="w-4 h-4">
        <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3"></path>
      </svg>
    </span>
  </a>
</div>
        `;
    for (const contact of contacts) {
        var keyin = "contact.license_expiry_date";
       var authy="contact.authority";
     //  console.log(contact.customFields);
        var la=getValueByKey(contact.customFields, keyin);
        var auth= getValueByKey(contact.customFields, authy);

  
          htmlContent += `
          <div class="p-4 w-full md:w-1/2 lg:w-1/2">
              <div class="flex flex-col dark:${darkgrid} flex rounded-lg h-full ${gridback} dark:${gridtextdark} p-8 sm:p-4 xl:flex-col sm:flex-wrap">
                  <div class="flex items-center mb-3 p-1 border-b-2" >
                      <div class="w-8 h-8 mr-3 inline-flex items-center justify-center rounded-full ${baicon} text-white flex-shrink-0">
                          <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-5 h-5" viewBox="0 0 24 24">
                              <path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"></path>
                              <circle cx="12" cy="7" r="4"></circle>
                          </svg>
                      </div>
                      <h2 class="text-gray-900 text-lg title-font font-medium dark:${gridtextdark}">${contact.companyName} | 
                      <span class="inline-flex items-center rounded-md bg-green-50 px-2 py-1 text-xs font-medium text-green-700 ring-1 ring-inset ring-green-600/20">${auth}</span></h2>
                  </div>
                  <div class="flex-grow p-1">
                      <p class="leading-relaxed text-base">Name: ${contact.contactName} <br> Email: ${contact.email} <br>Phone: ${contact.phone}<br>Expire On: <span class="inline-flex items-center rounded-md bg-green-50 px-2 py-1 text-xs font-medium text-green-700 ring-1 ring-inset ring-green-600/20">${la}</span></p>
                  
                  <div class="mt-5">  
                      <a href="/companyfile?id=${contact.id}&locationid=${lid}&vid=${vid}" class=" ${bbt} ${baicon}  text-white font-bold py-2 px-4 border border-blue-700 rounded">Open Company File
                       
                      </a>
                  </div>
                  
                  
                  </div>
              </div>
          </div>`;
        }

    return htmlContent;

}


app.get('/:slug/:lid/:vid/dashboard', sessionCheck,  async(req, res) => {
    const {slug,lid,vid} = req.params;
    const compquery=req.query.cname;
        const comppage=req.query.pagi;
       const domain2 = req.headers['x-forwarded-host'];
      //  const domain2 = req.hostname;
   sharedData['latest']
   // if (!sharedData['latest']) {
        socket.emit('contact', {
            query1: compquery||"",
            query2: lid,
            query3: 20,
            page: comppage
        });
      
        socket.once('searchResult',  async(data) => {
            if (data.error) {
                console.error('Socket.IO Error:', data.error);
                res.status(500).send('An error occurred.');
            } else {
                sharedData['latest'] = data.contacts;
                console.log(data);
                
                      const total=data.meta.total;
                const currentPage=data.meta.currentPage;
                const nextPage=data.meta.nextPage;
                const prevPage=data.meta.prevPage;
                const productsPerPage = 20;
                const totalPages = Math.ceil(total / productsPerPage);
                console.log(totalPages);
                
                
                // Generate HTML content with the new data
                let htmlContent =  globalcompanies(sharedData['latest'],lid,vid,total,currentPage,nextPage,prevPage,totalPages);
//let sidy=navigatebar(req.session.user,domain2);
    let sidy=navigatebar(req.session.user,domain2,req.session.role);
    console.log(sidy);
    try {
    const sidy = await navigatebar(req.session.user, domain2,req.session.role);
    const addony= await addonfront(req.session.user, domain2);
                res.render('dashy', {
                    title: 'Dashboard',user: req.session.user,logo: logoUrl,lid: locationId,theme: req.client.theme,contacts: htmlContent,background:back,darkback:darkback,sidedark:sidedark,sideback:sideback,butico:baicon,namo:req.session.namo,sidy:sidy,addony:addony,emcod:emcode1,slug:slug 
                });
    } catch (error) {
                console.error('Failed to generate navigation bar:', error);
                res.status(500).send('Failed to load page settings.');
            }
                
            }
        });
   
});




//fetch single company file by id
function singlecompanybyid(jj,visalocation) {
  
let htmlContent = '';
var contact=jj;
//console.log(contact);
//    for (const contact of jj) {
        var keyin = "contact.license_expiry_date";
       var authy="contact.authority";
           var pf="contact.paid_for_immigration_card";
       
        var vq="contact.visa_quotas";
        var sa="contact.sales_agent";
        var san="contact.sales_agent_name";
        var spons="contact.sponsor";
        var bto="contact.ebms_or_positivezone";
        var belon=getValueByKey(contact.customFields,bto);
        var sponsor=getValueByKey(contact.customFields,spons);
   
        // Array of key-title pairs
const keysAndTitles = setKeysAndTitles(parseCompanyFileView(companyfileview));
        let allFormattedResults = '';

// Loop through each key-title pair, format, and accumulate the results
keysAndTitles.forEach(pair => {
    const output = formatFiles(contact.customFields, pair.key, pair.title);
    allFormattedResults += output + "\n";  // Concatenate each result with a newline for separation
});
        
        vq=getValueByKey(contact.customFields, vq);
        
       
        var la=getValueByKey(contact.customFields, keyin);
        var auth= getValueByKey(contact.customFields, authy);
        if(auth==null){
            auth=getValueByKey(contact.customFields,"contact.company_type");
        }
        
                var pfi= getValueByKey(contact.customFields, pf);
                                var sal= getValueByKey(contact.customFields, sa);
                                if(sal==null){
                                   sal=getValueByKey(contact.customFields, san); 
                                }
                                                             //   var saln= getValueByKey(contact.customFields, san);

let allvisas="wohoo";

var companyName2=encodeURI(contact.companyName);
var e=encrypt(companyName2,"667766");
//console.log("Harry with push",JSON.stringify(allvisas));
var vbtn=` <a href="/${visalocation}/visas?company=${e}&auth=${auth}&cem=${contact.email}&cphone=${contact.phone}&belongs_to=${companiname}" data='${companyName2}' class="${bbt} ${baicon}  text-white font-bold py-2 px-4 border border-blue-700 rounded">Open Visas File</a>
    <div class="mt-3 block w-64 bg-red-600 text-red-100 py-1 px-3 rounded-full font-bold" style="font-size: 9px">To Apply Visa Kindly Click on Open Visa File</div>
`;
var tata=`  <h2 class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark}">Company Visa Quota
                      </h2><p class="leading-relaxed text-base mb-3">Number of Visas: <b>${vq}</b></p>`;
if(sponsor!=null ){
 vbtn=` <h2 class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark}">Sponsor</h2><p class="leading-relaxed text-base mb-3">${sponsor}</p>`;   
 tata=`  <h2 class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark}">Belongs To: 
                      </h2><p class="leading-relaxed text-base mb-3">${belon}</b></p>`;
}

  
          htmlContent += `
          <div class="p-4 w-full md:w-1/2 lg:w-1/2">
              <div class="flex rounded-lg h-full dark:${darkgrid} ${gridback} dark:${gridtextdark} p-8 flex-col">
                  <div class="items-center mb-3">
                                       <h2 class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark}">${contact.companyName}  
                    </h2>  <span class="inline-flex items-center rounded-md bg-green-50 px-2 py-1 text-xs font-medium text-green-700 ring-1 ring-inset ring-green-600/20">Expired On: ${la}</span>
                  </div>
                  <div class="flex-grow">
                      <p class="leading-relaxed text-base">Name: ${contact.fullNameLowerCase} <br> Email: ${contact.email} <br>Phone: ${contact.phone}
                      <br><b>Paid For Immigiration: </b>${pfi}
                       <br><b>Sales Agent: </b>${sal}
                      </p>
                  
                   
                    
              </div>
          </div>
          </div>
          
          
            <div class="p-4 w-full md:w-1/2 lg:w-1/2">
              <div class="flex rounded-lg h-full dark:${darkgrid} ${gridback} dark:${gridtextdark} p-8 flex-col">
                 
                  <div class="flex-grow">
                 ${tata}
                      ${vbtn}
                  
                        <h2 class=" mt-2 mb-1 text-lg title-font font-medium  dark:${gridtextdark}">Authority:    <p class="leading-relaxed text-base">
                   ${auth}</p>
                   </h2></div>
          </div>
  </div>
<div class="p-4 w-full">
  <div class="p-4 rounded m-1 dark:${darkgrid} ${gridback} dark:${gridtextdark} -m-1.5 overflow-x-auto">
  <h2 class="font-extrabold ${headingcolor} text-lg title-font font-medium dark:${gridtextdark} text-center">Download Documents 
                    </h2>
                    
                    <p class="leading-relaxed text-base mb-3 text-center">You can download all of your company documents</p>
                    
    <div class="p-1.5 min-w-full inline-block align-middle">
      <div class="border rounded-xl overflow-hidden dark:border-neutral-700">
        <table class="min-w-full divide-y divide-gray-200 dark:divide-neutral-700">
          <thead class="${baicon} text-white dark:bg-neutral-700">
      <tr class="${baicon} text-white">
        <th class="border tex-white dark:border-slate-600 font-medium p-4 pl-8 pt-3 pb-3  dark:text-slate-200 text-left">Filename</th>
        <th class=" items-end tex-white text-right border dark:border-slate-600 font-medium p-4 pr-8 pt-3 pb-3  dark:text-slate-200">Downloads</th>
      </tr>
    </thead>
    <tbody class="bg-white dark:bg-slate-800">

      ${allFormattedResults}
    </tbody>
          </table>
      </div>
    </div>
  </div>
</div>`;
//   }

    return htmlContent;

}



//company File
app.get('/companyfile', sessionCheck, async(req, res) => {
    const domain2 = req.headers['x-forwarded-host'];
   //  const domain2 = req.hostname;
      sharedData['qw'];
     const companyid = req.query.id;  // Assuming 'id' is the query string parameter
     const locationid=req.query.locationid;
     const visalocation=req.query.vid;
         socket.emit('contactid', {
             query1: companyid,
             query2: locationid,
          
         });
         socket.once('searchResult', async (data) => {
            var compan=data.contact.companyName;
             if (data.error) {
                 console.error('Socket.IO Error:', data.error);
                 res.status(500).send('An error occurred.');
                // console.log()
             } else {
                 sharedData['qw'] = data.contact;
                 let htmlContent = singlecompanybyid(sharedData['qw'],visalocation);
 try {
     const sidy = await navigatebar(req.session.user, domain2);
                 res.render('singcompany', 
                 {
                     title: compan+' | Company',
                     user: req.session.user,
                     logo: logoUrl,
                     lid: locationId,  // Use locationId extracted from query string
                     theme: req.client.theme,
                     contacts: htmlContent,
                     companyid:compan,
                     background:back,
                     darkback:darkback,
                     sidedark:sidedark,
                     sideback:sideback,
                     butico:baicon,
                     namo:req.session.namo,
                     sidy:sidy,
                     emcod:emcode1
                 });
 } catch (error) {
                 console.error('Failed to generate navigation bar:', error);
                 res.status(500).send('Failed to load page settings.');
             }
             }
         });
 });
 




 app.get('/:vid/visas', sessionCheck, async(req, res) => {
    const {vid} = req.params;
    const domain2 = req.headers['x-forwarded-host'];
    //  const domain2 = req.hostname;
    sharedData['vis'];
      
    const companyid = decrypt(req.query.company, "667766"); 
    var decodedURI = decodeURIComponent(companyid);
    var decodedURI2 = encodeURIComponent(decodedURI);
    console.log(decodedURI2, decodedURI);
    // console.log(companyid);
    socket.emit('contact', {
        query1: decodedURI2 ||"",
        query2: vid,
        query3: 20,
        page: 1
    });
    socket.once('searchResult', async(data) => {
        console.log(data);
        if (data.error) {
            console.error('Socket.IO Error:', data.error);
            res.status(500).send('An error occurred.');
        } else if (!data.contacts || data.contacts.length === 0) {
           // res.status(404).send('No contacts found.');
         res.status(404).render('404');
            
        } else {
            sharedData['vis'] = data.contacts;
            const cpn = data.contacts[0].companyName;
            const cna = data.contacts[0].contactName;
            const cph = req.query.cphone;
            const cem = req.query.cem;
            const cauth = req.query.auth;
            const belongs_to = req.query.belongs_to;
            // Generate HTML content with the new data
            let htmlContent = visasfile(sharedData['vis'],vid);
            try {
                const sidy = await navigatebar(req.session.user, domain2);
                res.render('visas', {
                    title: 'visas',
                    user: req.session.user,
                    logo: logoUrl,
                    lid: locationId,
                    theme: req.client.theme,
                    contacts: htmlContent,
                    background: back,
                    darkback: darkback,
                    sidedark: sidedark,
                    sideback: sideback,
                    butico: baicon,
                    namo: req.session.namo,
                    companyid: decodedURI,
                    sidy: sidy,
                    cpn: cpn,
                    cna: cna,
                    cph: cph,
                    cem: cem,
                    cauth: cauth,
                    belongs_to: belongs_to,
                    emcod: emcode1
                });
            } catch (error) {
                console.error('Failed to generate navigation bar:', error);
                res.status(500).send('Failed to load page settings.');
            }
        }
    });
 });
 
 
 
 
 
 //3cx setting goes Here
 app.get('/3cx-setting',sessionCheck, async(req,res) => {
    
    //new page added html
 var addform=`
     <h2 class="text-2xl font-semibold mb-4 dark:text-gray-700">Add New Company for 3cx Setting</h2>
  <form id="pageForm" method="POST" action="/add-my3cx" class="space-y-4">
                <div>
                    <label for="domain" class="block text-sm font-medium text-gray-700">Company Name</label>
                    <input type="text" id="domain" name="cnam" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                   <div>
                    <label for="icon" class="block text-sm font-medium text-gray-700">Access Key</label>
                    <input type="text" id="icon" name="akey" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <label for="title" class="block text-sm font-medium text-gray-700">3cx FQDN</label>
                    <input type="text" id="title" name="fqdn" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <label for="featureImageUrl" class="block text-sm font-medium text-gray-700">Agents Extension in commas (750,712)</label>
                    <input type="text" id="featureImageUrl" name="exten" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <label for="landingPageUrl" class="block text-sm font-medium text-gray-700">Data Hit URL</label>
                    <input type="url" required id="dhit" name="dhit" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white ${baicon} focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Add 3cx Company</button>
                </div>
            </form>
 `;
    
    
    
    
var addform2y = `
       
    `;    
    
    
    
    
    // const domain2 = req.hostname;
     const domain2 = req.headers['x-forwarded-host'];
    const sql = 'SELECT * FROM 3cx_setting';
    db.query(sql, (err, results) => {
        if (err) {
            return res.status(500).send('Error retrieving pages');
        }else {
         console.log(results);
        //res.json(results);
      }
    });
       // console.log(results);
    
const loginuser=req.session.user;
let htmlContent="Yoo this page hold all addon services";
try {
    const allout= await allf3cx(req.session.user, domain2);
    const alluser = await allfusers(req.session.user, domain2);
    const sidy = await navigatebar(req.session.user, domain2,req.session.role);
         res.render('3cx', {
                    title: '3cx Setting',
                    user: req.session.user,
                    logo: logoUrl,
                    theme: req.client.theme,
                    contacts: htmlContent,
                    background:back,
                    darkback:darkback,
                    sidedark:sidedark,
                    sideback:sideback,
                    butico:baicon,
                    namo:req.session.namo,
                    sidy:sidy,
                    allout:allout,
                    alluser:alluser,
                    addform:addform,
                    addform2:addform2y,
                    emcod:emcode1
                });
} catch (error) {
                console.error('Failed to generate navigation bar:', error);
                res.status(500).send('Failed to load page settings.');
            }
    
})
app.post('/add-my3cx', sessionCheck, async (req, res) => {
    const { cnam, akey, fqdn, dhit, exten } = req.body;
    const sql = 'INSERT INTO 3cx_setting (companyname, ackey, fqdn, dhiturl, extension) VALUES (?, ?, ?, ?, ?)';

    db.query(sql, [cnam, akey, fqdn, dhit, exten], (err, result) => {
        if (err) {
            console.error('Error inserting new 3cx:', err);
            return res.status(500).send('Failed to add new 3cx.');
        }
        res.redirect('/3cx-setting'); // Adjust the redirection to your needs
    });
}); 
 
 
 
 
 
 
 
app.get('/edit-3cx/:id', sessionCheck, async (req, res) => {
    
    const pageId = req.params.id;
 //   const domain2 = req.hostname;
    const domain2 = req.headers['x-forwarded-host'];
    const sql = 'SELECT * FROM 3cx_setting WHERE cid = ?';  // Query to get the specific page by ID

   try {
        const alluser = await allf3cx(req.session.user, domain2);
         const allout= await allf3cx(req.session.user, domain2);
    const sidy = await navigatebar(req.session.user, domain2,req.session.role);
          db.query(sql, [pageId], (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Failed to retrieve domain configuration.');
        }
        if (results.length === 0) {
            return res.status(404).send('Configuration not found.');
        }

        const page = results[0];
       // res.render('setup_edit', { config });
 
        var addform2y = `
      
    `;    
    
        
      //  const results = await db.query(sql, [pageId]);
        // if (results[0].length > 0) {
        //     const page = results[0][0];  // Assuming only one row is returned

            // Form with pre-filled values for editing
            var editForm = `
              <h2 class="text-2xl font-semibold mb-4 dark:text-gray-700">Edit 3cx <a href="/3cx-setting" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white ${baicon} focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Back To Add 3cx company</a></h2>
            <form id="pageForm" method="post" action="/update-3cx" class="space-y-4">
                <div>
                    <label for="domain" class="block text-sm font-medium text-gray-700">Company Name</label>
                       <input type="hidden" id="cid" name="cid" value="${pageId}" required>
                    <input type="text" id="cname" name="cnam" value="${page.companyname}" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <label for="icon" class="block text-sm font-medium text-gray-700">Access Key</label>
                    <textarea name="akey"  required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">${page.ackey}</textarea>
                </div>
                <div>
                    <label for="title" class="block text-sm font-medium text-gray-700">3cx FQDN</label>
                    <input type="text" id="title" name="fqdn" value="${page.fqdn}" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <label for="featureImageUrl" class="block text-sm font-medium text-gray-700">Agents Extension in commas (750,712)</label>
                    <input type="text" id="featureImageUrl" name="exten" value="${page.extension}" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <label for="landingPageUrl" class="block text-sm font-medium text-gray-700">Data Hit URL</label>
                    <input type="url" required id="landingPageUrl" name="dhit" value="${page.dhiturl}" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 dark:text-gray-700 sm:text-sm">
                </div>
                <div>
                    <button type="submit" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white ${baicon} focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Update 3cx Account</button>
                </div>
            </form>
            `;

            res.render('3cx', {
                title: 'Edit 3cx',
                user: req.session.user,
                logo: logoUrl,
                theme: req.client.theme,
                contacts: "Edit existing page details",
                background: back,
                darkback: darkback,
                sidedark: sidedark,
                sideback: sideback,
                butico: baicon,
                namo: req.session.namo,
                sidy:  sidy,
                allout:  allout,
                addform: editForm,
                emcod:emcode1,
                addform2:addform2y,
                alluser:alluser
            });
        // } else {
        //     res.status(404).send('Page not found');
        // }
          });
    } catch (error) {
        console.error('Failed to retrieve page for editing:', error);
        res.status(500).send('Failed to load edit form.');
    }
}); 
 
 
 
 
 
 
 
 
app.post('/update-3cx', express.urlencoded({ extended: true }), sessionCheck, (req, res) => {
    const { cid, cnam, akey, fqdn, dhit, exten } = req.body;

    if (!cid) {
        return res.status(400).send("No page ID provided.");
    }

    const updateQuery = `
        UPDATE 3cx_setting 
        SET companyname = ?, 
            ackey = ?, 
            fqdn = ?, 
            dhiturl = ?, 
            extension = ? 
        WHERE cid = ?
    `;
    const params = [cnam, akey, fqdn, dhit, exten, cid];

    db.query(updateQuery, params, (err, result) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).send('Failed to update the page details.');
        }
        if (result.affectedRows === 0) {
            return res.status(404).send("No page found with the given ID.");
        }
        res.redirect('/3cx-setting');  // Redirect to a page list or confirmation page
    });
}); 
 
 
 //3cx settings ends here
 
 
 


//Code Ends Here
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//
//---------------------------------------------------------------------------//



//404 render
app.get('/404', (req, res) => {
    // Render the 404.ejs view
    res.status(404).render('404');
});

app.use(cors({
  origin: '*'
}));
//Port is running
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
