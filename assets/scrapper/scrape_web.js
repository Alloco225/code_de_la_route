// app.js

const express = require('express');
const puppeteer = require('puppeteer');
const fs = require('fs/promises');

const app = express();
const port = 3000;

let browser;
let page;
const timeout = 120000;


app.get('/scrape', async (req, res) => {
    try {
        await authenticate();

        const totalPages = await getTotalPages();
        const allProducts = await scrapeAllPages(totalPages);
        await saveDataToFile(allProducts, 'products.json');
        res.json(allProducts);
    } catch (error) {
        console.error('Error scraping data:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

async function getTotalPages() {
    

    await page.goto('https://mht.klama-services.com/admin/product/show');

    const totalPages = await page.evaluate(() => {
        const lastPageLink = document.querySelector('.pagination .page-item:last-child a');
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
    
    await page.goto(`https://mht.klama-services.com/admin/product/show?page=${pageNumber}`);

    const data = await page.evaluate(() => {
        const products = [];

        // Example: Extracting product information
        document.querySelectorAll('.tb-tnx-item').forEach((productNode) => {
            const productId = productNode.querySelector('.tb-tnx-id span').innerText;
            const productName = productNode.querySelector('.tb-tnx-desc .title').innerText;
            const productCategory = productNode.querySelector('.tb-tnx-date .date').innerText;
            const productSuccessBadge = productNode.querySelector('.tb-tnx-date .badge-success').innerText;
            const productWarningBadge = productNode.querySelector('.tb-tnx-date .badge-warning').innerText;
            const productPriceInfo = productNode.querySelector('.tb-tnx-amount .tb-tnx-total').innerText.split(' / ');
            const productPriceInfoLabel = productNode.querySelectorAll('.tb-tnx-amount .tb-tnx-total span.label');

            const productPrice = productPriceInfoLabel[0].innerText;
            const productTotal = productPriceInfoLabel[1].innerText;

            const productStatusCheckbox = productNode.querySelector('.tb-tnx-amount .tb-tnx-status input[type="checkbox"]');
            const productStatus = productStatusCheckbox ? productStatusCheckbox.checked : false;

            products.push({
                id: productId,
                name: productName,
                category: productCategory,
                quantity: productSuccessBadge,
                quantity_out: productWarningBadge,
                purchase_price: productPrice,
                price: productTotal,
                status: productStatus,
            });
        });

        return products;
    });

    await browser.close();
    return data;
}

async function saveDataToFile(data, filename) {
    await fs.writeFile(filename, JSON.stringify(data, null, 2));
}

async function authenticate(page) {
    console.log("authenticate");

    browser = await puppeteer.launch();
    page = await browser.newPage();
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
