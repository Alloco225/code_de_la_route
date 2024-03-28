// scrape.js

const puppeteer = require('puppeteer');
const fs = require('fs/promises');

let browser;
let page;
// const timeout = 120000;
const timeout = 0;

async function getTotalPages() {


    return 5;

    
    console.log("getTotalPages")
    const browser = await puppeteer.launch();
    console.log("browser created", browser)
    const page = await browser.newPage();
    console.log("page created", page)
    //await authenticate(page);
    
    await page.goto('https://www.stickpng.com/fr/cat/transport/panneaux-de-signalisation');
    console.log("got to page")



    try {
        
        const totalPages = await page.evaluate(() => {
            console.log("evaluating totalPages")
            const lastPageLink = document.querySelector('#pagination a:last-child');
            console.log("lastPageLink", lastPageLink)
            return lastPageLink ? parseInt(lastPageLink.innerText, 10) : 1;
        });
    
        await browser.close();
        return totalPages;
    } catch (error) {
        console.error("xx error", error)
    }
}

async function scrapeAllPages(totalPages) {
    console.log("scrapeAllPages:", totalPages);
    const allProducts = [];
    

    for (let currentPage = 1; currentPage <= totalPages; currentPage++) {
        console.log("PAGE:",currentPage);
        const products = await scrapeData(currentPage);
        await saveDataToFile(products, 'panneaux_'+currentPage+'.json');
        await sleep(3000);
        allProducts.push(...products);
    }

    return allProducts;
}

async function scrapeData(pageNumber) {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    //await authenticate(page); 

    await page.goto(`https://www.stickpng.com/fr/cat/transport/panneaux-de-signalisation?page=${pageNumber}`);

    const data = await page.evaluate(() => {
        const panneaux = [];

        // Example: Extracting product information
        document.querySelectorAll('.item .image.pattern img').forEach((itemNode) => {
            const image = itemNode.src;
            const name = itemNode.alt;

            panneaux.push({
                image,
                name,
            });
        });

        return panneaux;
    });

    await browser.close();
    return data;
}

async function saveDataToFile(data, filename) {
    console.log("saveData To File");
    await fs.writeFile(filename, JSON.stringify(data, null, 2));
}

async function authenticate() {
    console.log("authenticate");

    browser = await puppeteer.launch({
        // executablePath: `C:\\ProgramFiles\\Google\\Chrome\\Application`
        headless: false,
    });
    page = await browser.newPage();
    page.setDefaultNavigationTimeout(0);

    console.log("authenticate");
    // Example: Fill in login form and submit
    let status = await page.goto('https://mht.klama-services.com/admin/login');

    status = status.status();
    console.log("goto login ", status);

    console.log("Login in");
    await page.type('input[name=email]', 'jcisse03@gmail.com');
    await page.type('input[name=password]', 'Djaka@@@');
    await page.click('button[type=submit]');
    console.log("Loged in");
    
    // Wait for the login to complete (customize according to the website)
    console.log("waiting for navigation");
    // await page.waitForNavigation();
    // page.waitForSelector('body');
    await sleep(3000);
    console.log("navigation");
}

async function main(){
    console.log(`Launching scrapper`);
    try {
        // await authenticate();

        const totalPages = await getTotalPages();
        if(!totalPages){
            console.log("totalPages invalid", totalPages)
            return;
        }
        const allProducts = await scrapeAllPages(totalPages);
        await saveDataToFile(allProducts, 'products.json');
        console.log('Scraping complete');
        await browser.close();

    } catch (error) {
        console.error('xx Error scraping data:', error);
    }
}

async function sleep(duration = 3000){
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            resolve(true)
        }, duration);
    })
}

main();