import { BrowserQRCodeReader } from '@zxing/library';

const codeReader = new BrowserQRCodeReader();

codeReader
  .decodeFromInputVideoDevice(undefined, 'video')
  .then((result) => {
    // process the result
    console.log(result.text)

    document.getElementById('link').setAttribute('href', result.text );
    document.getElementById('link').setAttribute('style', 'background-color: #0087d3; padding: 15px; border-radius: 5px; color: white; text-decoration: none; font-size: 150%');
    document.getElementById('link').innerHTML = 'Discover the menu';
  })
  .catch(err => console.error(err));
