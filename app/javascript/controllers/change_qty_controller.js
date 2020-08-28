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
  }

  plus() {
    let currentValue = parseInt(this.inputTarget.value);

    if (isNaN(currentValue)) {
      currentValue = 0;
    }

    this.inputTarget.value = currentValue + 1;
  }

  minus() {
    let currentValue = parseInt(this.inputTarget.value);

    if (isNaN(currentValue) || currentValue <= 0) {
      return;
    }

    this.inputTarget.value = currentValue - 1;

  }
}
