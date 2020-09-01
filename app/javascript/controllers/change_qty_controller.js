// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input" ]

  connect() {
    console.log("Connected!");
    this.totalQty();
  }

  plus() {
    let currentValue = parseInt(this.inputTarget.value);

    if (isNaN(currentValue)) {
      currentValue = 0;
    }

    this.inputTarget.value = currentValue + 1;
    this.totalQty()
  }

  minus() {
    let currentValue = parseInt(this.inputTarget.value);

    if (isNaN(currentValue) || currentValue <= 0) {
      return;
    }

    this.inputTarget.value = currentValue - 1;
    this.totalQty()
  }

  totalQty() {
    // console.log(document.querySelectorAll('.qty'))
    const sum = Array.from(document.querySelectorAll('.qty'))
                                   .map(input => parseInt(input.value, 10))
                                   .reduce((acc, cur) => acc + cur, 0)

    document.querySelector('#sum').innerText = sum

  }
}
