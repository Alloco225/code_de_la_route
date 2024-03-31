// app.js

const express = require('express');
const puppeteer = require('puppeteer');

const app = express();
const port = 3000;
const timeout =  600000;

app.get('/scrape', async (req, res) => {
  try {
    const page = req.query?.page ?? null;
    const data = await scrapeData(page);
    res.json(data);
  } catch (error) {
    console.error('Error scraping data:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

async function scrapeData(pageNumber = null) {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    console.log("Page created");
    
    // Navigate to the login page
    console.log("Going to login");
    
    await page.goto('https://mht.klama-services.com/admin/login', {timeout});
    
    console.log("Login in");
    // Example: Fill in login form and submit
    await page.type('input[name=email]', 'jcisse03@gmail.com');
    await page.type('input[name=password]', 'Djaka@@@');
    await page.click('button[type=submit]');
    console.log("Loged in");
    
    // Wait for the login to complete (customize according to the website)
    console.log("Waiting for navigation");
  await page.waitForNavigation({ timeout });
    console.log("Navigation ok");
    
    console.log("Going to products");
    let url = 'https://mht.klama-services.com/admin/product/show';
    if (pageNumber) {
      url += '?page=' + pageNumber;
    }
  await page.goto(url, { timeout });
    console.log("Evaluating products");
    // Extract data from the page using JavaScript
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
                // status: productStatus,
            });
        });

      let fileName = 'products.json';
      if(pageNumber){
        fileName = 'products_' + pageNumber + '.json';
      }

        saveDataToFile(products, fileName);
        return products;
    });

    await browser.close();

    return data;
}


async function saveDataToFile(data, filename) {
  console.log("saveData To File");
  await fs.writeFile(filename, JSON.stringify(data, null, 2));
}

app.listen(port, () => {
  console.log(`Express app listening at http://localhost:${port}`);
});
