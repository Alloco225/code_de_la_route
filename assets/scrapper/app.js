// app.js

const express = require('express');
const puppeteer = require('puppeteer');
const fs = require('fs/promises');

const app = express();
const port = 3000;

app.get('/scrape', async (req, res) => {
    try {
        const totalPages = await getTotalPages();
        const allProducts = await scrapeAllPages(totalPages);
        await saveDataToFile(allProducts, 'panneaux.json');
        res.json({ message: 'Scraping complete' });
    } catch (error) {
        console.error('Error scraping data:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

async function getTotalPages() {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    //await authenticate(page);

    await page.goto('https://www.stickpng.com/fr/cat/transport/panneaux-de-signalisation');

    const totalPages = await page.evaluate(() => {
        const lastPageLink = document.querySelector('#pagination a.item:last-child');
        return lastPageLink ? parseInt(lastPageLink.innerText, 10) : 1;
    });

    await browser.close();
    return totalPages;
}

async function scrapeAllPages(totalPages) {
    const allProducts = [];

    for (let currentPage = 1; currentPage <= totalPages; currentPage++) {
        const products = await scrapeData(currentPage);
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
    await fs.writeFile(filename, JSON.stringify(data, null, 2));
}

async function authenticate(page) {
    console.log("authenticate");
    // Example: Fill in login form and submit
    await page.goto('https://mht.klama-services.com/admin/login');

    console.log("Login in");
    await page.type('input[name=email]', 'jcisse03@gmail.com');
    await page.type('input[name=password]', 'Djaka@@@');
    await page.click('button[type=submit]');

    // Wait for the login to complete (customize according to the website)
    await page.waitForNavigation();
}

app.listen(port, () => {
    console.log(`Express app listening at http://localhost:${port}`);
});
