---
title: Closures
slug: Web/JavaScript/Guide/Closures
page-type: guide
sidebar: jssidebar
---

**Closure** là sự kết hợp của một hàm được gói cùng (đóng gói) với các tham chiếu đến trạng thái xung quanh của nó (còn gọi là **lexical environment** - môi trường từ vựng). Nói cách khác, một closure cho phép hàm truy cập vào phạm vi bên ngoài của nó. Trong JavaScript, closure được tạo ra mỗi khi một hàm được tạo, vào thời điểm tạo hàm.

## Lexical scoping

Hãy xem xét đoạn code mẫu sau:

```js
function init() {
  var name = "Mozilla"; // name is a local variable created by init
  function displayName() {
    // displayName() is the inner function, that forms a closure
    console.log(name); // use variable declared in the parent function
  }
  displayName();
}
init();
```

`init()` tạo ra một biến cục bộ gọi là `name` và một hàm gọi là `displayName()`. Hàm `displayName()` là một hàm bên trong được định nghĩa bên trong `init()` và chỉ có thể dùng trong phần thân của hàm `init()`. Lưu ý rằng hàm `displayName()` không có biến cục bộ riêng. Tuy nhiên, vì các hàm bên trong có quyền truy cập vào các biến của phạm vi bên ngoài, `displayName()` có thể truy cập biến `name` được khai báo trong hàm cha `init()`.

Nếu bạn chạy code này trong console, bạn sẽ thấy rằng câu lệnh `console.log()` trong hàm `displayName()` hiển thị thành công giá trị của biến `name`, được khai báo trong hàm cha của nó. Đây là ví dụ về _lexical scoping_ (phạm vi từ vựng), mô tả cách parser phân giải tên biến khi các hàm được lồng nhau. Từ _lexical_ (từ vựng) đề cập đến thực tế là lexical scoping sử dụng vị trí nơi biến được khai báo trong source code để xác định biến đó có sẵn ở đâu. Các hàm lồng nhau có quyền truy cập vào các biến được khai báo trong phạm vi bên ngoài của chúng.

### Phạm vi với let và const

Theo truyền thống (trước ES6), các biến JavaScript chỉ có hai loại phạm vi: _function scope_ (phạm vi hàm) và _global scope_ (phạm vi toàn cục). Các biến được khai báo với `var` có phạm vi hàm hoặc toàn cục, tùy thuộc vào việc chúng được khai báo trong một hàm hay bên ngoài hàm. Điều này có thể gây khó khăn, vì các khối với dấu ngoặc nhọn không tạo ra phạm vi:

```js
if (Math.random() > 0.5) {
  var x = 1;
} else {
  var x = 2;
}
console.log(x);
```

Đối với những người đến từ các ngôn ngữ khác (ví dụ: C, Java) nơi các khối tạo ra phạm vi, code trên nên ném lỗi trên dòng `console.log`, vì chúng ta đang ngoài phạm vi của `x` trong cả hai khối. Tuy nhiên, vì các khối không tạo ra phạm vi cho `var`, các câu lệnh `var` ở đây thực sự tạo ra một biến toàn cục. Ngoài ra còn có [một ví dụ thực tế](#creating_closures_in_loops_a_common_mistake) được giới thiệu bên dưới minh họa cách điều này có thể gây ra lỗi thực sự khi kết hợp với closure.

Trong ES6, JavaScript đã giới thiệu các khai báo `let` và `const`, trong số những thứ khác như [temporal dead zones](/en-US/docs/Web/JavaScript/Reference/Statements/let#temporal_dead_zone_tdz), cho phép bạn tạo các biến có phạm vi khối.

```js
if (Math.random() > 0.5) {
  const x = 1;
} else {
  const x = 2;
}
console.log(x); // ReferenceError: x is not defined
```

Về bản chất, các khối cuối cùng được coi là phạm vi trong ES6, nhưng chỉ khi bạn khai báo biến với `let` hoặc `const`. Ngoài ra, ES6 đã giới thiệu [module](/en-US/docs/Web/JavaScript/Guide/Modules), giới thiệu một loại phạm vi khác. Closure có thể bắt các biến trong tất cả các phạm vi này, điều chúng ta sẽ giới thiệu sau.

## Closure

Hãy xem xét đoạn code ví dụ sau:

```js
function makeFunc() {
  const name = "Mozilla";
  function displayName() {
    console.log(name);
  }
  return displayName;
}

const myFunc = makeFunc();
myFunc();
```

Chạy code này có hiệu quả giống hệt với ví dụ trước về hàm `init()`. Điều khác biệt (và thú vị) là hàm bên trong `displayName()` được trả về từ hàm bên ngoài _trước khi được thực thi_.

Thoạt nhìn, có vẻ không trực quan khi code này vẫn hoạt động. Trong một số ngôn ngữ lập trình, các biến cục bộ trong một hàm chỉ tồn tại trong suốt thời gian thực thi của hàm đó. Khi `makeFunc()` kết thúc thực thi, bạn có thể nghĩ rằng biến `name` sẽ không còn có thể truy cập được nữa. Tuy nhiên, vì code vẫn hoạt động, rõ ràng đây không phải là trường hợp trong JavaScript.

Lý do là vì các hàm trong JavaScript tạo thành closure. Một _closure_ là sự kết hợp của một hàm và môi trường từ vựng trong đó hàm đó được khai báo. Môi trường này bao gồm bất kỳ biến nào nằm trong phạm vi tại thời điểm closure được tạo. Trong trường hợp này, `myFunc` là tham chiếu đến thể hiện của hàm `displayName` được tạo khi `makeFunc` chạy. Thể hiện của `displayName` duy trì tham chiếu đến môi trường từ vựng của nó, trong đó biến `name` tồn tại. Vì lý do này, khi `myFunc` được gọi, biến `name` vẫn có sẵn để sử dụng và "Mozilla" được truyền vào `console.log`.

Đây là một ví dụ thú vị hơn một chút — hàm `makeAdder`:

```js
function makeAdder(x) {
  return function (y) {
    return x + y;
  };
}

const add5 = makeAdder(5);
const add10 = makeAdder(10);

console.log(add5(2)); // 7
console.log(add10(2)); // 12
```

Trong ví dụ này, chúng ta đã định nghĩa một hàm `makeAdder(x)`, nhận một đối số duy nhất `x`, và trả về một hàm mới. Hàm nó trả về nhận một đối số duy nhất `y`, và trả về tổng của `x` và `y`.

Về bản chất, `makeAdder` là một function factory (nhà máy hàm). Nó tạo ra các hàm có thể cộng một giá trị cụ thể vào đối số của chúng. Trong ví dụ trên, function factory tạo ra hai hàm mới — một hàm cộng năm vào đối số của nó, và một hàm cộng 10.

`add5` và `add10` đều tạo thành closure. Chúng chia sẻ cùng định nghĩa phần thân hàm, nhưng lưu trữ các môi trường từ vựng khác nhau. Trong môi trường từ vựng của `add5`, `x` là 5, trong khi trong môi trường từ vựng của `add10`, `x` là 10.

## Closure thực tế

Closure hữu ích vì chúng cho phép bạn kết hợp dữ liệu (môi trường từ vựng) với một hàm vận hành trên dữ liệu đó. Điều này có sự song song rõ ràng với lập trình hướng đối tượng, nơi các object cho phép bạn kết hợp dữ liệu (các thuộc tính của object) với một hoặc nhiều phương thức.

Do đó, bạn có thể sử dụng closure ở bất cứ đâu mà bạn thường sử dụng một object chỉ có một phương thức duy nhất.

Các tình huống bạn có thể muốn làm điều này đặc biệt phổ biến trên web. Phần lớn code được viết trong JavaScript frontend là event-based (dựa trên sự kiện). Bạn định nghĩa một số hành vi, sau đó đính kèm nó vào một sự kiện được kích hoạt bởi người dùng (như nhấp chuột hoặc nhấn phím). Code được đính kèm như một callback (một hàm duy nhất được thực thi để phản hồi sự kiện).

Chẳng hạn, giả sử chúng ta muốn thêm các nút vào trang để điều chỉnh kích thước chữ. Một cách để làm điều này là chỉ định font-size của phần tử `body` (tính bằng pixel), sau đó đặt kích thước của các phần tử khác trên trang (như tiêu đề) bằng đơn vị tương đối `em`:

```css
body {
  font-family: "Helvetica", "Arial", sans-serif;
  font-size: 12px;
}

h1 {
  font-size: 1.5em;
}

h2 {
  font-size: 1.2em;
}
```

Các nút kích thước chữ tương tác như vậy có thể thay đổi thuộc tính `font-size` của phần tử `body`, và các điều chỉnh sẽ được các phần tử khác trên trang tiếp nhận nhờ các đơn vị tương đối.

Đây là JavaScript:

```js
function makeSizer(size) {
  return () => {
    document.body.style.fontSize = `${size}px`;
  };
}

const size12 = makeSizer(12);
const size14 = makeSizer(14);
const size16 = makeSizer(16);
```

`size12`, `size14` và `size16` bây giờ là các hàm thay đổi kích thước văn bản body lần lượt thành 12, 14 và 16 pixel. Bạn có thể đính kèm chúng vào các nút như được minh họa trong ví dụ code sau.

```js
document.getElementById("size-12").onclick = size12;
document.getElementById("size-14").onclick = size14;
document.getElementById("size-16").onclick = size16;
```

```html
<button id="size-12">12</button>
<button id="size-14">14</button>
<button id="size-16">16</button>
<p>This is some text that will change size when you click the buttons above.</p>
```

{{EmbedLiveSample("practical closures", "", "200")}}

## Mô phỏng phương thức private với closure

Các ngôn ngữ như Java cho phép bạn khai báo phương thức là private, có nghĩa là chúng chỉ có thể được gọi bởi các phương thức khác trong cùng lớp.

JavaScript, trước khi có [class](/en-US/docs/Web/JavaScript/Reference/Classes), không có cách tự nhiên để khai báo [phương thức private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements#private_methods), nhưng có thể mô phỏng các phương thức private bằng cách sử dụng closure. Các phương thức private không chỉ hữu ích để hạn chế quyền truy cập vào code. Chúng cũng cung cấp một cách mạnh mẽ để quản lý không gian tên toàn cục của bạn.

Code sau minh họa cách sử dụng closure để định nghĩa các hàm công khai có thể truy cập các hàm và biến private. Lưu ý rằng các closure này tuân theo [Module Design Pattern](https://www.google.com/search?q=javascript+module+pattern).

```js
const counter = (function () {
  let privateCounter = 0;
  function changeBy(val) {
    privateCounter += val;
  }

  return {
    increment() {
      changeBy(1);
    },

    decrement() {
      changeBy(-1);
    },

    value() {
      return privateCounter;
    },
  };
})();

console.log(counter.value()); // 0.

counter.increment();
counter.increment();
console.log(counter.value()); // 2.

counter.decrement();
console.log(counter.value()); // 1.
```

Trong các ví dụ trước, mỗi closure có môi trường từ vựng riêng của nó. Tuy nhiên ở đây, có một môi trường từ vựng duy nhất được chia sẻ bởi ba hàm: `counter.increment`, `counter.decrement` và `counter.value`.

Môi trường từ vựng được chia sẻ được tạo ra trong phần thân của một hàm ẩn danh, _được thực thi ngay khi nó được định nghĩa_ (còn được gọi là [IIFE](/en-US/docs/Glossary/IIFE)). Môi trường từ vựng chứa hai mục private: một biến gọi là `privateCounter`, và một hàm gọi là `changeBy`. Bạn không thể truy cập trực tiếp một trong hai thành phần private này từ bên ngoài hàm ẩn danh. Thay vào đó, bạn có thể truy cập gián tiếp chúng bằng cách sử dụng ba hàm công khai được trả về từ wrapper ẩn danh.

Ba hàm công khai đó tạo thành closure chia sẻ cùng môi trường từ vựng. Nhờ lexical scoping của JavaScript, chúng đều có quyền truy cập vào biến `privateCounter` và hàm `changeBy`.

```js
function makeCounter() {
  let privateCounter = 0;
  function changeBy(val) {
    privateCounter += val;
  }
  return {
    increment() {
      changeBy(1);
    },

    decrement() {
      changeBy(-1);
    },

    value() {
      return privateCounter;
    },
  };
}

const counter1 = makeCounter();
const counter2 = makeCounter();

console.log(counter1.value()); // 0.

counter1.increment();
counter1.increment();
console.log(counter1.value()); // 2.

counter1.decrement();
console.log(counter1.value()); // 1.
console.log(counter2.value()); // 0.
```

Hãy chú ý cách hai bộ đếm duy trì tính độc lập của chúng với nhau. Mỗi closure tham chiếu đến một phiên bản khác nhau của biến `privateCounter` thông qua closure riêng của nó. Mỗi lần một trong các bộ đếm được gọi, môi trường từ vựng của nó thay đổi bằng cách thay đổi giá trị của biến này. Các thay đổi đối với giá trị biến trong một closure không ảnh hưởng đến giá trị trong closure khác.

> [!NOTE]
> Sử dụng closure theo cách này cung cấp những lợi ích thường liên quan đến lập trình hướng đối tượng. Cụ thể là _ẩn dữ liệu_ (data hiding) và _đóng gói_ (encapsulation).

## Chuỗi phạm vi closure

Quyền truy cập của hàm lồng nhau vào phạm vi của hàm bên ngoài bao gồm phạm vi bao quanh của hàm bên ngoài — thực tế tạo ra một chuỗi phạm vi hàm. Để minh họa, hãy xem đoạn code ví dụ sau.

```js
// global scope
const e = 10;
function sum(a) {
  return function (b) {
    return function (c) {
      // outer functions scope
      return function (d) {
        // local scope
        return a + b + c + d + e;
      };
    };
  };
}

console.log(sum(1)(2)(3)(4)); // 20
```

Bạn cũng có thể viết mà không dùng hàm ẩn danh:

```js
// global scope
const e = 10;
function sum(a) {
  return function sum2(b) {
    return function sum3(c) {
      // outer functions scope
      return function sum4(d) {
        // local scope
        return a + b + c + d + e;
      };
    };
  };
}

const sum2 = sum(1);
const sum3 = sum2(2);
const sum4 = sum3(3);
const result = sum4(4);
console.log(result); // 20
```

Trong ví dụ trên, có một chuỗi các hàm lồng nhau, tất cả đều có quyền truy cập vào phạm vi của các hàm bên ngoài. Trong ngữ cảnh này, chúng ta có thể nói rằng closure có quyền truy cập vào _tất cả_ các phạm vi bên ngoài.

Closure cũng có thể bắt các biến trong phạm vi khối và phạm vi module. Ví dụ, code sau tạo ra một closure trên biến có phạm vi khối `y`:

```js
function outer() {
  let getY;
  {
    const y = 6;
    getY = () => y;
  }
  console.log(typeof y); // undefined
  console.log(getY()); // 6
}

outer();
```

Closure trên module có thể thú vị hơn.

```js
// myModule.js
let x = 5;
export const getX = () => x;
export const setX = (val) => {
  x = val;
};
```

Ở đây, module export một cặp hàm getter-setter, đóng gói biến có phạm vi module `x`. Ngay cả khi `x` không thể truy cập trực tiếp từ các module khác, nó vẫn có thể được đọc và viết thông qua các hàm đó.

```js
import { getX, setX } from "./myModule.js";

console.log(getX()); // 5
setX(6);
console.log(getX()); // 6
```

Closure cũng có thể đóng gói trên các giá trị được import, được coi là _live {{Glossary("binding", "bindings")}}_ (ràng buộc sống), vì khi giá trị gốc thay đổi, giá trị được import cũng thay đổi tương ứng.

```js
// myModule.js
export let x = 1;
export const setX = (val) => {
  x = val;
};
```

```js
// closureCreator.js
import { x } from "./myModule.js";

export const getX = () => x; // Close over an imported live binding
```

```js
import { getX } from "./closureCreator.js";
import { setX } from "./myModule.js";

console.log(getX()); // 1
setX(2);
console.log(getX()); // 2
```

## Tạo closure trong vòng lặp: Một lỗi phổ biến

Trước khi từ khóa [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let) được giới thiệu, một vấn đề phổ biến với closure xảy ra khi bạn tạo chúng bên trong vòng lặp. Để minh họa, hãy xem đoạn code ví dụ sau.

```html live-sample___closures_bad
<p id="help">Helpful notes will appear here</p>
<p>Email: <input type="text" id="email" name="email" /></p>
<p>Name: <input type="text" id="name" name="name" /></p>
<p>Age: <input type="text" id="age" name="age" /></p>
```

```js example-bad live-sample___closures_bad
function showHelp(help) {
  document.getElementById("help").textContent = help;
}

function setupHelp() {
  var helpText = [
    { id: "email", help: "Your email address" },
    { id: "name", help: "Your full name" },
    { id: "age", help: "Your age (you must be over 16)" },
  ];

  for (var i = 0; i < helpText.length; i++) {
    // Culprit is the use of `var` on this line
    var item = helpText[i];
    document.getElementById(item.id).onfocus = function () {
      showHelp(item.help);
    };
  }
}

setupHelp();
```

{{EmbedLiveSample("closures_bad", "", "200")}}

Mảng `helpText` định nghĩa ba gợi ý hữu ích, mỗi cái liên quan đến ID của một trường input trong document. Vòng lặp duyệt qua các định nghĩa này, gắn một sự kiện `onfocus` vào mỗi cái để hiển thị phương thức trợ giúp liên quan.

Nếu bạn thử code này, bạn sẽ thấy rằng nó không hoạt động như mong đợi. Dù bạn focus vào trường nào, thông báo về tuổi của bạn vẫn sẽ được hiển thị.

Lý do là vì các hàm được gán cho `onfocus` tạo thành closure; chúng bao gồm định nghĩa hàm và môi trường được bắt từ phạm vi của hàm `setupHelp`. Ba closure đã được tạo bởi vòng lặp, nhưng mỗi cái chia sẻ cùng một môi trường từ vựng, có một biến với các giá trị thay đổi (`item`). Điều này là vì biến `item` được khai báo với `var` và do đó có phạm vi hàm do hoisting. Giá trị của `item.help` được xác định khi các callback `onfocus` được thực thi. Vì vòng lặp đã chạy xong vào thời điểm đó, đối tượng biến `item` (được chia sẻ bởi tất cả ba closure) đã được để trỏ đến mục cuối cùng trong danh sách `helpText`.

Một giải pháp trong trường hợp này là sử dụng nhiều closure hơn: cụ thể là sử dụng một function factory như được mô tả trước đó:

```html hidden live-sample___closures_factory
<p id="help">Helpful notes will appear here</p>
<p>Email: <input type="text" id="email" name="email" /></p>
<p>Name: <input type="text" id="name" name="name" /></p>
<p>Age: <input type="text" id="age" name="age" /></p>
```

```js live-sample___closures_factory
function showHelp(help) {
  document.getElementById("help").textContent = help;
}

function makeHelpCallback(help) {
  return function () {
    showHelp(help);
  };
}

function setupHelp() {
  var helpText = [
    { id: "email", help: "Your email address" },
    { id: "name", help: "Your full name" },
    { id: "age", help: "Your age (you must be over 16)" },
  ];

  for (var i = 0; i < helpText.length; i++) {
    var item = helpText[i];
    document.getElementById(item.id).onfocus = makeHelpCallback(item.help);
  }
}

setupHelp();
```

{{EmbedLiveSample("closures_factory", "", "200")}}

Điều này hoạt động như mong đợi. Thay vì tất cả các callback chia sẻ một môi trường từ vựng duy nhất, hàm `makeHelpCallback` tạo ra _một môi trường từ vựng mới_ cho mỗi callback, trong đó `help` tham chiếu đến chuỗi tương ứng từ mảng `helpText`.

Một cách khác để viết đoạn trên bằng cách sử dụng closure ẩn danh là:

```js
function showHelp(help) {
  document.getElementById("help").textContent = help;
}

function setupHelp() {
  var helpText = [
    { id: "email", help: "Your email address" },
    { id: "name", help: "Your full name" },
    { id: "age", help: "Your age (you must be over 16)" },
  ];

  for (var i = 0; i < helpText.length; i++) {
    (function () {
      var item = helpText[i];
      document.getElementById(item.id).onfocus = function () {
        showHelp(item.help);
      };
    })(); // Immediate event listener attachment with the current value of item (preserved until iteration).
  }
}

setupHelp();
```

Nếu bạn không muốn sử dụng thêm closure, bạn có thể sử dụng từ khóa [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let) hoặc [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const):

```js
function showHelp(help) {
  document.getElementById("help").textContent = help;
}

function setupHelp() {
  const helpText = [
    { id: "email", help: "Your email address" },
    { id: "name", help: "Your full name" },
    { id: "age", help: "Your age (you must be over 16)" },
  ];

  for (let i = 0; i < helpText.length; i++) {
    const item = helpText[i];
    document.getElementById(item.id).onfocus = () => {
      showHelp(item.help);
    };
  }
}

setupHelp();
```

Ví dụ này sử dụng `const` thay vì `var`, vì vậy mỗi closure ràng buộc biến có phạm vi khối, nghĩa là không cần thêm closure nào nữa.

Nếu bạn đang viết JavaScript hiện đại, bạn có thể xem xét thêm các lựa chọn thay thế cho vòng lặp `for` thông thường, chẳng hạn như sử dụng vòng lặp {{jsxref("Statements/for...of", "for...of")}} và khai báo `item` là `let` hoặc `const`, hoặc sử dụng phương thức {{jsxref("Array/forEach", "forEach()")}}, cả hai đều tránh được vấn đề closure.

```js
for (const item of helpText) {
  document.getElementById(item.id).onfocus = () => {
    document.getElementById("help").textContent = item.help;
  };
}

helpText.forEach((item) => {
  document.getElementById(item.id).onfocus = () => {
    showHelp(item.help);
  };
});
```

## Cân nhắc hiệu suất

Như đã đề cập trước đó, mỗi thể hiện hàm quản lý phạm vi và closure riêng của mình. Do đó, không nên tạo hàm không cần thiết trong các hàm khác nếu closure không cần thiết cho một tác vụ cụ thể, vì điều đó sẽ ảnh hưởng tiêu cực đến hiệu suất script cả về tốc độ xử lý lẫn tiêu thụ bộ nhớ.

Ví dụ, khi tạo một object/class mới, các phương thức thường nên được liên kết với prototype của object thay vì được định nghĩa trong constructor của object. Lý do là mỗi khi constructor được gọi, các phương thức sẽ được gán lại (tức là, cho mỗi lần tạo object).

Hãy xem xét trường hợp sau:

```js
function MyObject(name, message) {
  this.name = name.toString();
  this.message = message.toString();
  this.getName = function () {
    return this.name;
  };

  this.getMessage = function () {
    return this.message;
  };
}
```

Vì code trước không tận dụng được lợi ích của việc sử dụng closure trong trường hợp cụ thể này, chúng ta có thể viết lại để tránh sử dụng closure như sau:

```js
function MyObject(name, message) {
  this.name = name.toString();
  this.message = message.toString();
}
MyObject.prototype = {
  getName() {
    return this.name;
  },
  getMessage() {
    return this.message;
  },
};
```

Tuy nhiên, việc định nghĩa lại prototype không được khuyến nghị. Ví dụ sau thay vào đó nối thêm vào prototype hiện có:

```js
function MyObject(name, message) {
  this.name = name.toString();
  this.message = message.toString();
}
MyObject.prototype.getName = function () {
  return this.name;
};
MyObject.prototype.getMessage = function () {
  return this.message;
};
```

Trong hai ví dụ trước, prototype được kế thừa có thể được chia sẻ bởi tất cả các object và các định nghĩa phương thức không cần phải xảy ra mỗi lần tạo object. Xem [Kế thừa và chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) để biết thêm.
