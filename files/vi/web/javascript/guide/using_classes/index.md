---
title: Using classes
slug: Web/JavaScript/Guide/Using_classes
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Working_with_objects", "Web/JavaScript/Guide/Using_promises")}}

JavaScript là ngôn ngữ dựa trên prototype — hành vi của một đối tượng được xác định bởi các thuộc tính của chính nó và các thuộc tính của prototype của nó. Tuy nhiên, với sự bổ sung của [classes](/en-US/docs/Web/JavaScript/Reference/Classes), việc tạo ra các phân cấp đối tượng và kế thừa thuộc tính cùng giá trị của chúng giờ đây phù hợp hơn với các ngôn ngữ hướng đối tượng khác như Java. Trong phần này, chúng ta sẽ minh họa cách tạo đối tượng từ class.

Trong nhiều ngôn ngữ khác, _class_, hay constructor, được phân biệt rõ ràng với _object_, hay instance. Trong JavaScript, class chủ yếu là sự trừu tượng hóa trên cơ chế kế thừa prototype sẵn có — tất cả các pattern đều có thể chuyển đổi sang kế thừa dựa trên prototype. Bản thân class cũng là các giá trị JavaScript bình thường và có chuỗi prototype riêng của chúng. Trên thực tế, hầu hết các hàm JavaScript thuần túy đều có thể được dùng như constructor — bạn dùng toán tử `new` với một constructor function để tạo object mới.

Trong hướng dẫn này, chúng ta sẽ làm việc với mô hình class được trừu tượng hóa tốt và thảo luận về ngữ nghĩa mà class cung cấp. Nếu muốn tìm hiểu sâu về hệ thống prototype bên dưới, bạn có thể đọc hướng dẫn [Inheritance and the prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain).

Chương này giả định rằng bạn đã quen thuộc phần nào với JavaScript và đã từng sử dụng các object thông thường.

## Tổng quan về class

Nếu bạn có kinh nghiệm thực tế với JavaScript, hoặc đã theo dõi hướng dẫn, có thể bạn đã sử dụng class rồi, dù chưa tự tạo một class nào. Ví dụ, đây là thứ [có thể quen thuộc với bạn](/en-US/docs/Web/JavaScript/Guide/Representing_dates_times):

```js
const bigDay = new Date(2019, 6, 19);
console.log(bigDay.toLocaleDateString());
if (bigDay.getTime() < Date.now()) {
  console.log("Once upon a time...");
}
```

Ở dòng đầu tiên, chúng ta tạo một instance của class [`Date`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date) và gọi nó là `bigDay`. Ở dòng thứ hai, chúng ta gọi [method](/en-US/docs/Glossary/Method) [`toLocaleDateString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleDateString) trên instance `bigDay`, trả về một chuỗi. Sau đó, chúng ta so sánh hai số: một từ method [`getTime()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/getTime), một từ class `Date` _trực tiếp_, như [`Date.now()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/now).

`Date` là một class có sẵn của JavaScript. Từ ví dụ này, chúng ta có thể rút ra một số ý tưởng cơ bản về class:

- Class tạo ra object thông qua toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new).
- Mỗi object có một số thuộc tính (dữ liệu hoặc method) được thêm bởi class.
- Class lưu trữ một số thuộc tính (dữ liệu hoặc method) trong chính nó, thường dùng để tương tác với các instance.

Những điều này tương ứng với ba tính năng chính của class:

- Constructor;
- Instance method và instance field;
- Static method và static field.

## Khai báo class

Class thường được tạo bằng _class declaration_ (khai báo class).

```js
class MyClass {
  // class body...
}
```

Bên trong thân class, có nhiều tính năng có thể sử dụng.

```js
class MyClass {
  // Constructor
  constructor() {
    // Constructor body
  }
  // Instance field
  myField = "foo";
  // Instance method
  myMethod() {
    // myMethod body
  }
  // Static field
  static myStaticField = "bar";
  // Static method
  static myStaticMethod() {
    // myStaticMethod body
  }
  // Static block
  static {
    // Static initialization code
  }
  // Fields, methods, static fields, and static methods all have
  // "private" forms
  #myPrivateField = "bar";
}
```

Nếu bạn đến từ thời trước ES6, có thể bạn quen dùng hàm như constructor hơn. Pattern trên sẽ được dịch xấp xỉ sang cú pháp function constructor như sau:

```js
function MyClass() {
  this.myField = "foo";
  // Constructor body
}
MyClass.myStaticField = "bar";
MyClass.myStaticMethod = function () {
  // myStaticMethod body
};
MyClass.prototype.myMethod = function () {
  // myMethod body
};

(function () {
  // Static initialization code
})();
```

> [!NOTE]
> Private field và method là tính năng mới trong class và không có tương đương đơn giản trong function constructor.

### Khởi tạo class

Sau khi khai báo class, bạn có thể tạo instance từ nó bằng toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new).

```js
const myInstance = new MyClass();
console.log(myInstance.myField); // 'foo'
myInstance.myMethod();
```

Function constructor thông thường có thể được khởi tạo bằng `new` lẫn gọi thẳng không cần `new`. Tuy nhiên, nếu cố gắng "gọi" class mà không dùng `new` sẽ gây ra lỗi.

```js
const myInstance = MyClass(); // TypeError: Class constructor MyClass cannot be invoked without 'new'
```

### Hoisting của khai báo class

Khác với khai báo hàm, khai báo class không được [hoisted](/en-US/docs/Glossary/Hoisting) (hoặc theo một số cách hiểu, được hoisted nhưng bị giới hạn bởi temporal dead zone), có nghĩa là bạn không thể sử dụng class trước khi khai báo nó.

```js
new MyClass(); // ReferenceError: Cannot access 'MyClass' before initialization

class MyClass {}
```

Hành vi này tương tự như biến được khai báo bằng [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let) và [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const).

### Biểu thức class

Tương tự như hàm, khai báo class cũng có dạng biểu thức tương ứng.

```js
const MyClass = class {
  // Class body...
};
```

Biểu thức class cũng có thể có tên. Tên của biểu thức chỉ hiển thị bên trong thân class.

```js
const MyClass = class MyClassLongerName {
  // Class body. Here MyClass and MyClassLongerName point to the same class.
};
new MyClassLongerName(); // ReferenceError: MyClassLongerName is not defined
```

## Constructor

Có lẽ nhiệm vụ quan trọng nhất của class là đóng vai trò "nhà máy" tạo object. Ví dụ, khi dùng constructor `Date`, chúng ta mong nó tạo ra một object mới đại diện cho dữ liệu ngày được truyền vào — rồi chúng ta có thể thao tác thông qua các method mà instance đó cung cấp. Trong class, việc tạo instance được thực hiện bởi [constructor](/en-US/docs/Web/JavaScript/Reference/Classes/constructor).

Ví dụ, chúng ta sẽ tạo một class tên `Color` đại diện cho một màu cụ thể. Người dùng tạo màu bằng cách truyền vào bộ ba giá trị [RGB](/en-US/docs/Glossary/RGB).

```js
class Color {
  constructor(r, g, b) {
    // Assign the RGB values as a property of `this`.
    this.values = [r, g, b];
  }
}
```

Mở DevTools của trình duyệt, dán đoạn code trên vào console, rồi tạo một instance:

```js
const red = new Color(255, 0, 0);
console.log(red);
```

Bạn sẽ thấy kết quả tương tự như sau:

```plain
Object { values: (3) […] }
  values: Array(3) [ 255, 0, 0 ]
```

Bạn đã tạo thành công một instance `Color`, và instance có thuộc tính `values` là mảng chứa các giá trị RGB bạn đã truyền vào. Điều này gần tương đương với:

```js
function createColor(r, g, b) {
  return {
    values: [r, g, b],
  };
}
```

Cú pháp của constructor hoàn toàn giống một hàm thông thường — nghĩa là bạn có thể dùng các cú pháp khác, chẳng hạn như [rest parameters](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters):

```js
class Color {
  constructor(...values) {
    this.values = values;
  }
}

const red = new Color(255, 0, 0);
// Creates an instance with the same shape as above.
```

Mỗi lần gọi `new`, một instance khác nhau được tạo ra.

```js
const red = new Color(255, 0, 0);
const anotherRed = new Color(255, 0, 0);
console.log(red === anotherRed); // false
```

Trong constructor của class, giá trị `this` trỏ đến instance mới được tạo. Bạn có thể gán thuộc tính cho nó hoặc đọc các thuộc tính hiện có (đặc biệt là method — sẽ đề cập sau).

Giá trị `this` sẽ tự động được trả về làm kết quả của `new`. Bạn không nên trả về giá trị nào từ constructor — vì nếu bạn trả về một giá trị không phải primitive, nó sẽ trở thành giá trị của biểu thức `new` và giá trị `this` sẽ bị bỏ qua. (Bạn có thể đọc thêm về `new` trong [phần mô tả](/en-US/docs/Web/JavaScript/Reference/Operators/new#description).)

```js
class MyClass {
  constructor() {
    this.myField = "foo";
    return {};
  }
}

console.log(new MyClass().myField); // undefined
```

## Instance method

Nếu một class chỉ có constructor, nó không khác gì một hàm factory `createX` tạo ra các object đơn thuần. Tuy nhiên, sức mạnh của class nằm ở chỗ chúng có thể dùng làm "template" tự động gán method cho các instance.

Ví dụ, với các instance `Date`, bạn có thể dùng nhiều method để lấy các thông tin khác nhau từ một giá trị ngày, như [năm](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/getFullYear), [tháng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/getMonth), [ngày trong tuần](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/getDay), v.v. Bạn cũng có thể thiết lập các giá trị đó qua các method `setX` tương ứng như [`setFullYear`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/setFullYear).

Với class `Color` của chúng ta, chúng ta có thể thêm một method gọi là `getRed` trả về giá trị đỏ của màu.

```js
class Color {
  constructor(r, g, b) {
    this.values = [r, g, b];
  }
  getRed() {
    return this.values[0];
  }
}

const red = new Color(255, 0, 0);
console.log(red.getRed()); // 255
```

Không có method, bạn có thể bị cám dỗ định nghĩa hàm trong constructor:

```js
class Color {
  constructor(r, g, b) {
    this.values = [r, g, b];
    this.getRed = function () {
      return this.values[0];
    };
  }
}
```

Cách này cũng hoạt động. Tuy nhiên, vấn đề là mỗi lần tạo một instance `Color`, một hàm mới lại được tạo ra, dù tất cả đều thực hiện cùng một việc!

```js
console.log(new Color().getRed === new Color().getRed); // false
```

Ngược lại, nếu dùng method, nó sẽ được chia sẻ giữa tất cả các instance. Một hàm có thể được chia sẻ giữa mọi instance nhưng vẫn có hành vi khác nhau khi các instance khác nhau gọi nó, vì giá trị `this` khác nhau. Nếu bạn thắc mắc method được lưu ở đâu — nó được định nghĩa trên prototype của tất cả các instance, hay `Color.prototype`, được giải thích chi tiết hơn trong [Inheritance and the prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain).

Tương tự, chúng ta có thể tạo một method mới gọi là `setRed` để thiết lập giá trị đỏ của màu.

```js
class Color {
  constructor(r, g, b) {
    this.values = [r, g, b];
  }
  getRed() {
    return this.values[0];
  }
  setRed(value) {
    this.values[0] = value;
  }
}

const red = new Color(255, 0, 0);
red.setRed(0);
console.log(red.getRed()); // 0; of course, it should be called "black" at this stage!
```

## Private field

Bạn có thể tự hỏi: tại sao phải phức tạp dùng method `getRed` và `setRed` khi chúng ta có thể trực tiếp truy cập mảng `values` trên instance?

```js
class Color {
  constructor(r, g, b) {
    this.values = [r, g, b];
  }
}

const red = new Color(255, 0, 0);
red.values[0] = 0;
console.log(red.values[0]); // 0
```

Có một triết lý trong lập trình hướng đối tượng gọi là "encapsulation" (đóng gói). Điều này có nghĩa là bạn không nên truy cập vào triển khai nội bộ của một object, mà thay vào đó dùng các method được trừu tượng hóa để tương tác với nó. Ví dụ, nếu chúng ta đột ngột quyết định biểu diễn màu sắc bằng [HSL](/en-US/docs/Web/CSS/Reference/Values/color_value/hsl) thay vì:

```js
class Color {
  constructor(r, g, b) {
    // values is now an HSL array!
    this.values = rgbToHSL([r, g, b]);
  }
  getRed() {
    return hslToRGB(this.values)[0];
  }
  setRed(value) {
    const rgb = hslToRGB(this.values);
    rgb[0] = value;
    this.values = rgbToHSL(rgb);
  }
}

const red = new Color(255, 0, 0);
console.log(red.values[0]); // 0; It's not 255 anymore, because the H value for pure red is 0
```

Giả định của người dùng rằng `values` nghĩa là giá trị RGB đột ngột sụp đổ và có thể khiến logic của họ bị lỗi. Vì vậy, nếu bạn là người triển khai class, bạn sẽ muốn ẩn cấu trúc dữ liệu nội bộ của instance khỏi người dùng, vừa để giữ API gọn gàng vừa để tránh code của người dùng bị hỏng khi bạn thực hiện "refactor vô hại". Trong class, điều này được thực hiện thông qua [_private field_](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements).

Private field là một định danh có tiền tố `#` (ký tự hash). Hash là một phần không thể tách rời trong tên field, nghĩa là private field không bao giờ xung đột tên với public field hay method. Để tham chiếu đến private field ở bất cứ đâu trong class, bạn phải _khai báo_ nó trong thân class (bạn không thể tạo private element một cách động). Ngoài điều này, private field gần tương đương với thuộc tính thông thường.

```js
class Color {
  // Declare: every Color instance has a private field called #values.
  #values;
  constructor(r, g, b) {
    this.#values = [r, g, b];
  }
  getRed() {
    return this.#values[0];
  }
  setRed(value) {
    this.#values[0] = value;
  }
}

const red = new Color(255, 0, 0);
console.log(red.getRed()); // 255
```

Việc truy cập private field bên ngoài class là lỗi cú pháp sớm. Ngôn ngữ có thể bảo vệ điều này vì `#privateField` là cú pháp đặc biệt, nên có thể phân tích tĩnh và tìm tất cả lần dùng private field trước khi thực thi code.

```js-nolint example-bad
console.log(red.#values); // SyntaxError: Private field '#values' must be declared in an enclosing class
```

> [!NOTE]
> Code chạy trong Chrome console có thể truy cập private element bên ngoài class. Đây là sự nới lỏng hạn chế cú pháp JavaScript dành riêng cho DevTools.

Private field trong JavaScript là _hard private_: nếu class không triển khai method nào để lộ các private field đó, thì hoàn toàn không có cơ chế nào để lấy chúng từ bên ngoài class. Điều này có nghĩa là bạn có thể thoải mái refactor private field của class, miễn là hành vi của các method được lộ ra vẫn giữ nguyên.

Sau khi đã làm cho field `values` là private, chúng ta có thể thêm logic vào method `getRed` và `setRed` thay vì chỉ đơn thuần truyền qua. Ví dụ, chúng ta có thể thêm kiểm tra trong `setRed` để xem liệu có phải là giá trị R hợp lệ không:

```js
class Color {
  #values;
  constructor(r, g, b) {
    this.#values = [r, g, b];
  }
  getRed() {
    return this.#values[0];
  }
  setRed(value) {
    if (value < 0 || value > 255) {
      throw new RangeError("Invalid R value");
    }
    this.#values[0] = value;
  }
}

const red = new Color(255, 0, 0);
red.setRed(1000); // RangeError: Invalid R value
```

Nếu chúng ta để lộ thuộc tính `values`, người dùng có thể dễ dàng vượt qua kiểm tra đó bằng cách gán trực tiếp vào `values[0]` và tạo ra màu không hợp lệ. Nhưng với API được đóng gói tốt, chúng ta có thể làm code mạnh mẽ hơn và ngăn ngừa lỗi logic về sau.

Một method của class có thể đọc private field của các instance khác, miễn là chúng thuộc cùng class.

```js
class Color {
  #values;
  constructor(r, g, b) {
    this.#values = [r, g, b];
  }
  redDifference(anotherColor) {
    // #values doesn't necessarily need to be accessed from this:
    // you can access private fields of other instances belonging
    // to the same class.
    return this.#values[0] - anotherColor.#values[0];
  }
}

const red = new Color(255, 0, 0);
const crimson = new Color(220, 20, 60);
red.redDifference(crimson); // 35
```

Tuy nhiên, nếu `anotherColor` không phải instance của Color, `#values` sẽ không tồn tại. (Dù một class khác có private field trùng tên `#values`, nó không trỏ đến cùng thứ và không thể truy cập tại đây.) Truy cập vào private element không tồn tại sẽ gây lỗi thay vì trả về `undefined` như thuộc tính thông thường. Nếu không biết liệu private field có tồn tại trên một object hay không và muốn truy cập mà không dùng `try`/`catch`, bạn có thể dùng toán tử [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in).

```js
class Color {
  #values;
  constructor(r, g, b) {
    this.#values = [r, g, b];
  }
  redDifference(anotherColor) {
    if (!(#values in anotherColor)) {
      throw new TypeError("Color instance expected");
    }
    return this.#values[0] - anotherColor.#values[0];
  }
}
```

> [!NOTE]
> Hãy nhớ rằng `#` là cú pháp định danh đặc biệt và bạn không thể dùng tên field như thể là chuỗi. `"#values" in anotherColor` sẽ tìm kiếm thuộc tính có tên đúng nghĩa là `"#values"` chứ không phải private field.

Có một số hạn chế khi dùng private element: cùng một tên không thể khai báo hai lần trong một class, và chúng không thể bị xóa. Cả hai đều dẫn đến lỗi cú pháp sớm.

```js-nolint example-bad
class BadIdeas {
  #firstName;
  #firstName; // syntax error occurs here
  #lastName;
  constructor() {
    delete this.#lastName; // also a syntax error
  }
}
```

Method, [getter và setter](#accessor_fields) cũng có thể là private. Chúng hữu ích khi class cần thực hiện điều gì đó phức tạp bên trong nhưng không cho phần code nào khác gọi tới.

Ví dụ, hãy tưởng tượng bạn tạo [HTML custom element](/en-US/docs/Web/API/Web_components/Using_custom_elements) cần thực hiện điều gì đó khá phức tạp khi được nhấp/chạm/kích hoạt. Hơn nữa, những điều phức tạp xảy ra khi element được nhấp nên bị giới hạn trong class này, vì không có phần JavaScript nào khác nên (hoặc cần) truy cập.

```js
class Counter extends HTMLElement {
  #xValue = 0;
  constructor() {
    super();
    this.onclick = this.#clicked.bind(this);
  }
  get #x() {
    return this.#xValue;
  }
  set #x(value) {
    this.#xValue = value;
    window.requestAnimationFrame(this.#render.bind(this));
  }
  #clicked() {
    this.#x++;
  }
  #render() {
    this.textContent = this.#x.toString();
  }
  connectedCallback() {
    this.#render();
  }
}

customElements.define("num-counter", Counter);
```

Trong trường hợp này, hầu hết mọi field và method đều là private trong class. Do đó, nó cung cấp giao diện cho phần còn lại của code về cơ bản giống như một HTML element có sẵn. Không có phần nào khác của chương trình có thể ảnh hưởng đến bất kỳ phần nội bộ nào của `Counter`.

## Accessor field

`color.getRed()` và `color.setRed()` cho phép chúng ta đọc và ghi giá trị đỏ của màu. Nếu bạn đến từ ngôn ngữ như Java, bạn sẽ rất quen với pattern này. Tuy nhiên, dùng method chỉ để truy cập thuộc tính vẫn còn hơi bất tiện trong JavaScript. _Accessor field_ cho phép chúng ta thao tác với thứ gì đó như thể nó là một "thuộc tính thực sự".

```js
class Color {
  constructor(r, g, b) {
    this.values = [r, g, b];
  }
  get red() {
    return this.values[0];
  }
  set red(value) {
    this.values[0] = value;
  }
}

const red = new Color(255, 0, 0);
red.red = 0;
console.log(red.red); // 0
```

Trông như thể object có thuộc tính tên `red` — nhưng thực ra không có thuộc tính nào như vậy trên instance! Chỉ có hai method, nhưng chúng có tiền tố `get` và `set`, cho phép thao tác như thể chúng là thuộc tính.

Nếu một field chỉ có getter mà không có setter, nó sẽ thực sự chỉ đọc.

```js
class Color {
  constructor(r, g, b) {
    this.values = [r, g, b];
  }
  get red() {
    return this.values[0];
  }
}

const red = new Color(255, 0, 0);
red.red = 0;
console.log(red.red); // 255
```

Trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), dòng `red.red = 0` sẽ ném ra TypeError: "Cannot set property red of #\<Color> which has only a getter". Trong non-strict mode, lệnh gán bị bỏ qua một cách thầm lặng.

## Public field

Private field cũng có dạng public tương ứng, cho phép mỗi instance có một thuộc tính. Field thường được thiết kế độc lập với các tham số của constructor.

```js
class MyClass {
  luckyNumber = Math.random();
}
console.log(new MyClass().luckyNumber); // 0.5
console.log(new MyClass().luckyNumber); // 0.3
```

Public field gần tương đương với việc gán thuộc tính cho `this`. Ví dụ trên cũng có thể được chuyển thành:

```js
class MyClass {
  constructor() {
    this.luckyNumber = Math.random();
  }
}
```

## Static property

Với ví dụ `Date`, chúng ta cũng đã gặp method [`Date.now()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/now), trả về ngày hiện tại. Method này không thuộc về bất kỳ instance ngày nào — nó thuộc về chính class. Tuy nhiên, nó được đặt trên class `Date` thay vì được lộ ra như hàm toàn cục `DateNow()`, vì nó hữu ích nhất khi làm việc với các instance ngày.

> [!NOTE]
> Đặt tiền tố cho các method tiện ích bằng thứ chúng xử lý được gọi là "namespacing" và được coi là thực hành tốt. Ví dụ, ngoài method cũ, không có tiền tố [`parseInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/parseInt), JavaScript sau đó cũng thêm method có tiền tố [`Number.parseInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/parseInt) để cho biết nó dùng cho số.

[_Static property_](/en-US/docs/Web/JavaScript/Reference/Classes/static) là nhóm tính năng của class được định nghĩa trên bản thân class, không phải trên từng instance. Các tính năng này bao gồm:

- Static method
- Static field
- Static getter và setter

Mọi thứ cũng có dạng private tương ứng. Ví dụ, với class `Color`, chúng ta có thể tạo một static method kiểm tra xem một bộ ba giá trị có phải là RGB hợp lệ không:

```js
class Color {
  static isValid(r, g, b) {
    return r >= 0 && r <= 255 && g >= 0 && g <= 255 && b >= 0 && b <= 255;
  }
}

Color.isValid(255, 0, 0); // true
Color.isValid(1000, 0, 0); // false
```

Static property rất giống với dạng instance tương ứng, ngoại trừ:

- Tất cả đều có tiền tố `static`, và
- Chúng không thể truy cập từ các instance.

```js
console.log(new Color(0, 0, 0).isValid); // undefined
```

Ngoài ra còn có một cấu trúc đặc biệt gọi là [_static initialization block_](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks), là một khối code chạy khi class được tải lần đầu tiên.

```js
class MyClass {
  static {
    MyClass.myStaticProperty = "foo";
  }
}

console.log(MyClass.myStaticProperty); // 'foo'
```

Static initialization block gần tương đương với việc thực thi ngay một đoạn code sau khi khai báo class. Điểm khác biệt duy nhất là chúng có quyền truy cập vào các static private element.

## Extends và kế thừa

Một tính năng quan trọng mà class mang lại (ngoài việc đóng gói tiện lợi với private field) là _kế thừa_, nghĩa là một object có thể "mượn" nhiều hành vi của object khác, trong khi ghi đè hoặc nâng cao một số phần bằng logic của chính nó.

Ví dụ, giả sử class `Color` của chúng ta cần hỗ trợ độ trong suốt. Chúng ta có thể muốn thêm một field mới biểu thị độ trong suốt:

```js
class Color {
  #values;
  constructor(r, g, b, a = 1) {
    this.#values = [r, g, b, a];
  }
  get alpha() {
    return this.#values[3];
  }
  set alpha(value) {
    if (value < 0 || value > 1) {
      throw new RangeError("Alpha value must be between 0 and 1");
    }
    this.#values[3] = value;
  }
}
```

Tuy nhiên, điều này có nghĩa là mỗi instance — kể cả đại đa số không trong suốt (những instance có giá trị alpha là 1) — sẽ phải có thêm giá trị alpha, điều này không thật sự tinh tế. Hơn nữa, nếu các tính năng cứ tăng thêm, class `Color` của chúng ta sẽ trở nên rất cồng kềnh và khó bảo trì.

Thay vào đó, trong lập trình hướng đối tượng, chúng ta sẽ tạo một _derived class_ (lớp dẫn xuất). Derived class có quyền truy cập tất cả thuộc tính public của class cha. Trong JavaScript, derived class được khai báo bằng mệnh đề [`extends`](/en-US/docs/Web/JavaScript/Reference/Classes/extends), cho biết class mà nó kế thừa từ.

```js
class ColorWithAlpha extends Color {
  #alpha;
  constructor(r, g, b, a) {
    super(r, g, b);
    this.#alpha = a;
  }
  get alpha() {
    return this.#alpha;
  }
  set alpha(value) {
    if (value < 0 || value > 1) {
      throw new RangeError("Alpha value must be between 0 and 1");
    }
    this.#alpha = value;
  }
}
```

Có một vài điều đáng chú ý ngay. Đầu tiên là trong constructor, chúng ta gọi `super(r, g, b)`. Đây là yêu cầu của ngôn ngữ khi phải gọi [`super()`](/en-US/docs/Web/JavaScript/Reference/Operators/super) trước khi truy cập `this`. Lời gọi `super()` gọi constructor của class cha để khởi tạo `this` — ở đây nó gần tương đương với `this = new Color(r, g, b)`. Bạn có thể có code trước `super()`, nhưng không thể truy cập `this` trước `super()` — ngôn ngữ ngăn bạn truy cập `this` chưa được khởi tạo.

Sau khi class cha hoàn tất việc sửa đổi `this`, derived class có thể thực hiện logic riêng của nó. Ở đây chúng ta thêm private field `#alpha` và cung cấp một cặp getter/setter để tương tác với chúng.

Derived class kế thừa tất cả method từ class cha. Ví dụ, hãy xem accessor `get red()` mà chúng ta đã thêm vào `Color` trong phần [Accessor field](#accessor_fields) — dù chúng ta chưa khai báo trong `ColorWithAlpha`, chúng ta vẫn có thể truy cập `red` vì hành vi này được chỉ định bởi class cha:

```js
const color = new ColorWithAlpha(255, 0, 0, 0.5);
console.log(color.red); // 255
```

Derived class cũng có thể ghi đè method từ class cha. Ví dụ, tất cả class đều ngầm định kế thừa class [`Object`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object), định nghĩa một số method cơ bản như [`toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString). Tuy nhiên, method `toString()` gốc nổi tiếng là vô dụng vì nó in `[object Object]` trong hầu hết các trường hợp:

```js
console.log(red.toString()); // [object Object]
```

Thay vào đó, class của chúng ta có thể ghi đè nó để in các giá trị RGB của màu:

```js
class Color {
  #values;
  // …
  toString() {
    return this.#values.join(", ");
  }
}

console.log(new Color(255, 0, 0).toString()); // '255, 0, 0'
```

Trong derived class, bạn có thể truy cập method của class cha bằng `super`. Điều này cho phép bạn xây dựng các method nâng cao và tránh trùng lặp code.

```js
class ColorWithAlpha extends Color {
  #alpha;
  // …
  toString() {
    // Call the parent class's toString() and build on the return value
    return `${super.toString()}, ${this.#alpha}`;
  }
}

console.log(new ColorWithAlpha(255, 0, 0, 0.5).toString()); // '255, 0, 0, 0.5'
```

Khi dùng `extends`, các static method cũng kế thừa lẫn nhau, vì vậy bạn cũng có thể ghi đè hoặc nâng cao chúng.

```js
class ColorWithAlpha extends Color {
  // …
  static isValid(r, g, b, a) {
    // Call the parent class's isValid() and build on the return value
    return super.isValid(r, g, b) && a >= 0 && a <= 1;
  }
}

console.log(ColorWithAlpha.isValid(255, 0, 0, -1)); // false
```

Derived class không có quyền truy cập private field của class cha — đây là một khía cạnh quan trọng của private field trong JavaScript là "hard private". Private field bị giới hạn trong thân class và không cấp quyền truy cập cho bất kỳ code bên ngoài nào.

```js-nolint example-bad
class ColorWithAlpha extends Color {
  log() {
    console.log(this.#values); // SyntaxError: Private field '#values' must be declared in an enclosing class
  }
}
```

Một class chỉ có thể kế thừa từ một class. Điều này ngăn ngừa các vấn đề trong đa kế thừa như [bài toán kim cương](https://en.wikipedia.org/wiki/Multiple_inheritance#The_diamond_problem). Tuy nhiên, do tính động của JavaScript, vẫn có thể đạt được hiệu ứng đa kế thừa thông qua class composition và [mixin](/en-US/docs/Web/JavaScript/Reference/Classes/extends#mix-ins).

Instance của derived class cũng là [instance của](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof) class cơ sở.

```js
const color = new ColorWithAlpha(255, 0, 0, 0.5);
console.log(color instanceof Color); // true
console.log(color instanceof ColorWithAlpha); // true
```

## Tại sao lại dùng class?

Hướng dẫn đến nay đã thực dụng: chúng ta tập trung vào _cách_ sử dụng class, nhưng có một câu hỏi chưa được trả lời: _tại sao_ lại dùng class? Câu trả lời là: tuỳ.

Class giới thiệu một _paradigm_, hay cách tổ chức code. Class là nền tảng của lập trình hướng đối tượng, được xây dựng trên các khái niệm như [kế thừa](<https://en.wikipedia.org/wiki/Inheritance_(object-oriented_programming)>) và [đa hình](<https://en.wikipedia.org/wiki/Polymorphism_(computer_science)>) (đặc biệt là _subtype polymorphism_). Tuy nhiên, nhiều người có quan điểm triết học phản đối một số thực hành OOP và do đó không dùng class.

Ví dụ, một điều làm cho object `Date` bị chê là chúng _có thể thay đổi_ (mutable).

```js
function incrementDay(date) {
  return new Date(date.setDate(date.getDate() + 1));
}
const date = new Date(); // 2019-06-19
const newDay = incrementDay(date);
console.log(newDay); // 2019-06-20
// The old date is modified as well!?
console.log(date); // 2019-06-20
```

Tính có thể thay đổi và trạng thái nội bộ là những khía cạnh quan trọng của lập trình hướng đối tượng, nhưng thường làm code khó suy luận — vì bất kỳ thao tác nào có vẻ vô hại đều có thể có tác dụng phụ bất ngờ và thay đổi hành vi ở các phần khác của chương trình.

Để tái sử dụng code, chúng ta thường dùng cách mở rộng class, điều này có thể tạo ra các phân cấp kế thừa lớn.

![A typical OOP inheritance tree, with five classes and three levels](figure8.1.png)

Tuy nhiên, thường khó mô tả kế thừa một cách rõ ràng khi một class chỉ có thể kế thừa từ một class khác. Thông thường, chúng ta muốn hành vi của nhiều class. Trong Java, điều này được thực hiện thông qua interface; trong JavaScript, có thể dùng mixin. Nhưng cuối cùng, nó vẫn chưa thật sự tiện lợi.

Mặt tích cực, class là cách rất mạnh mẽ để tổ chức code ở mức độ cao hơn. Ví dụ, nếu không có class `Color`, chúng ta có thể cần tạo hàng chục hàm tiện ích:

```js
function isRed(color) {
  return color.red === 255;
}
function isValidColor(color) {
  return (
    color.red >= 0 &&
    color.red <= 255 &&
    color.green >= 0 &&
    color.green <= 255 &&
    color.blue >= 0 &&
    color.blue <= 255
  );
}
// …
```

Nhưng với class, chúng ta có thể tập hợp tất cả chúng dưới namespace `Color`, cải thiện khả năng đọc. Ngoài ra, việc giới thiệu private field cho phép chúng ta ẩn một số dữ liệu khỏi người dùng, tạo ra API gọn gàng.

Nhìn chung, bạn nên cân nhắc dùng class khi muốn tạo các object lưu trữ dữ liệu nội bộ riêng và cung cấp nhiều hành vi. Hãy lấy các class JavaScript có sẵn làm ví dụ:

- Class [`Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) và [`Set`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set) lưu trữ một tập hợp phần tử và cho phép truy cập chúng theo key bằng `get()`, `set()`, `has()`, v.v.
- Class [`Date`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date) lưu trữ ngày dưới dạng Unix timestamp (một số) và cho phép format, cập nhật và đọc các thành phần ngày riêng lẻ.
- Class [`Error`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error) lưu trữ thông tin về ngoại lệ cụ thể, bao gồm thông báo lỗi, stack trace, nguyên nhân, v.v. Đây là một trong số ít class có cấu trúc kế thừa phong phú: có nhiều class có sẵn như [`TypeError`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypeError) và [`ReferenceError`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ReferenceError) kế thừa từ `Error`. Trong trường hợp lỗi, kế thừa này cho phép tinh chỉnh ngữ nghĩa của lỗi: mỗi class lỗi đại diện cho một loại lỗi cụ thể, có thể dễ dàng kiểm tra bằng [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof).

JavaScript cung cấp cơ chế để tổ chức code theo cách hướng đối tượng chuẩn, nhưng việc sử dụng hay không và cách sử dụng hoàn toàn tùy thuộc vào quyết định của lập trình viên.

{{PreviousNext("Web/JavaScript/Guide/Working_with_objects", "Web/JavaScript/Guide/Using_promises")}}
