const puppeteer = require('puppeteer');

module.exports.handler = async function(event, context) {

      const browser = await puppeteer.launch({args: ['--no-sandbox', '--disable-setuid-sandbox'], executablePath: '/usr/bin/chromium-browser'});
      const page = await browser.newPage();
      await page.goto('https://google.com');
      await page.screenshot({path: '/tmp/google.png'});
      await browser.close();

    return event;
};