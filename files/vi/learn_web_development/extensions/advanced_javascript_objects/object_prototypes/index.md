---
title: Nguyên mẫu đối tượng
slug: Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_prototypes
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Advanced_JavaScript_objects/Object-oriented_programming", "Learn_web_development/Extensions/Advanced_JavaScript_objects")}}

Nguyên mẫu (prototype) là cơ chế mà các đối tượng JavaScript kế thừa tính năng từ nhau. Trong bài viết này, chúng ta giải thích nguyên mẫu là gì, cách chuỗi nguyên mẫu hoạt động và cách thiết lập nguyên mẫu cho một đối tượng.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các kiến thức cơ bản về JavaScript
        (đặc biệt là
        <a href="/en-US/docs/Learn_web_development/Core/Scripting/Object_basics">Kiến thức cơ bản về đối tượng</a>).
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Chuỗi nguyên mẫu JavaScript.</li>
          <li>Khái niệm về shadowing thuộc tính.</li>
          <li>Thiết lập nguyên mẫu.</li>
          <li>Các khái niệm về nguyên mẫu và kế thừa.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Chuỗi nguyên mẫu

Trong bảng điều khiển trình duyệt, hãy thử tạo một đối tượng literal:

```js
const myObject = {
  city: "Madrid",
  greet() {
    console.log(`Greetings from ${this.city}`);
  },
};

myObject.greet(); // Greetings from Madrid
```

Đây là một đối tượng với một thuộc tính dữ liệu `city` và một phương thức `greet()`. Nếu bạn gõ tên đối tượng _theo sau là dấu chấm_ vào bảng điều khiển, như `myObject.`, thì bảng điều khiển sẽ hiện ra danh sách tất cả các thuộc tính có sẵn cho đối tượng này. Bạn sẽ thấy rằng ngoài `city` và `greet`, còn có rất nhiều thuộc tính khác!

```plain
__defineGetter__
__defineSetter__
__lookupGetter__
__lookupSetter__
__proto__
city
constructor
greet
hasOwnProperty
isPrototypeOf
propertyIsEnumerable
toLocaleString
toString
valueOf
```

Hãy thử truy cập một trong số chúng:

```js
myObject.toString(); // "[object Object]"
```

Nó hoạt động (dù không rõ ràng `toString()` làm gì).

Các thuộc tính bổ sung này là gì và chúng đến từ đâu?

Mọi đối tượng trong JavaScript đều có một thuộc tính tích hợp sẵn, được gọi là **nguyên mẫu** (prototype). Nguyên mẫu bản thân là một đối tượng, vì vậy nguyên mẫu cũng sẽ có nguyên mẫu của riêng nó, tạo thành cái gọi là **chuỗi nguyên mẫu**. Chuỗi kết thúc khi chúng ta đến một nguyên mẫu có giá trị `null` cho nguyên mẫu của chính nó.

> [!NOTE]
> Thuộc tính của một đối tượng trỏ đến nguyên mẫu của nó **không** được gọi là `prototype`. Tên của nó không được tiêu chuẩn hóa, nhưng trên thực tế tất cả các trình duyệt đều sử dụng [`__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto). Cách tiêu chuẩn để truy cập nguyên mẫu của một đối tượng là phương thức {{jsxref("Object/getPrototypeOf", "Object.getPrototypeOf()")}}.

Khi bạn cố gắng truy cập một thuộc tính của đối tượng: nếu thuộc tính không tìm thấy trong chính đối tượng đó, thì nguyên mẫu sẽ được tìm kiếm. Nếu vẫn không tìm thấy, thì nguyên mẫu của nguyên mẫu sẽ được tìm kiếm, và cứ thế tiếp tục cho đến khi thuộc tính được tìm thấy, hoặc cuối chuỗi đã đến, trong trường hợp đó `undefined` được trả về.

Vì vậy khi chúng ta gọi `myObject.toString()`, trình duyệt:

- tìm kiếm `toString` trong `myObject`
- không tìm thấy ở đó, vì vậy tìm kiếm trong đối tượng nguyên mẫu của `myObject` cho `toString`
- tìm thấy ở đó và gọi nó.

Nguyên mẫu của `myObject` là gì? Để tìm ra, chúng ta có thể sử dụng hàm `Object.getPrototypeOf()`:

```js
Object.getPrototypeOf(myObject); // Object { }
```

Đây là một đối tượng có tên là `Object.prototype`, và đây là nguyên mẫu cơ bản nhất mà tất cả các đối tượng đều có theo mặc định. Nguyên mẫu của `Object.prototype` là `null`, vì vậy nó ở cuối chuỗi nguyên mẫu:

![Chuỗi nguyên mẫu cho myObject](myobject-prototype-chain.svg)

Nguyên mẫu của một đối tượng không phải lúc nào cũng là `Object.prototype`. Hãy thử điều này:

```js
const myDate = new Date();
let object = myDate;

do {
  object = Object.getPrototypeOf(object);
  console.log(object);
} while (object);

// Date.prototype
// Object { }
// null
```

Code này tạo một đối tượng `Date`, sau đó duyệt qua chuỗi nguyên mẫu, ghi nhật ký các nguyên mẫu. Nó cho chúng ta thấy rằng nguyên mẫu của `myDate` là một đối tượng `Date.prototype`, và nguyên mẫu của _đó_ là `Object.prototype`.

![Chuỗi nguyên mẫu cho myDate](mydate-prototype-chain.svg)

Thực tế, khi bạn gọi các phương thức quen thuộc, như `myDate2.getTime()`,
bạn đang gọi một phương thức được định nghĩa trên `Date.prototype`.

## Shadowing thuộc tính

Điều gì xảy ra nếu bạn định nghĩa một thuộc tính trong một đối tượng, khi một thuộc tính có cùng tên được định nghĩa trong nguyên mẫu của đối tượng? Hãy xem:

```js
const myDate = new Date(1995, 11, 17);

console.log(myDate.getTime()); // 819129600000

myDate.getTime = function () {
  console.log("something else!");
};

myDate.getTime(); // 'something else!'
```

Điều này có thể đoán trước được, nhờ mô tả về chuỗi nguyên mẫu. Khi chúng ta gọi `getTime()`, trình duyệt trước tiên tìm kiếm trong `myDate` một thuộc tính có tên đó, và chỉ kiểm tra nguyên mẫu nếu `myDate` không định nghĩa nó. Vì vậy khi chúng ta thêm `getTime()` vào `myDate`, thì phiên bản trong `myDate` sẽ được gọi.

Điều này được gọi là "shadowing" thuộc tính.

## Thiết lập nguyên mẫu

Có nhiều cách để thiết lập nguyên mẫu của một đối tượng trong JavaScript, và ở đây chúng ta sẽ mô tả hai cách: `Object.create()` và hàm khởi tạo.

### Sử dụng Object.create

Phương thức `Object.create()` tạo một đối tượng mới và cho phép bạn chỉ định một đối tượng sẽ được sử dụng làm nguyên mẫu của đối tượng mới.

Đây là một ví dụ:

```js
const personPrototype = {
  greet() {
    console.log("hello!");
  },
};

const carl = Object.create(personPrototype);
carl.greet(); // hello!
```

Ở đây chúng ta tạo một đối tượng `personPrototype`, có phương thức `greet()`. Sau đó chúng ta dùng `Object.create()` để tạo một đối tượng mới với `personPrototype` là nguyên mẫu của nó. Bây giờ chúng ta có thể gọi `greet()` trên đối tượng mới, và nguyên mẫu cung cấp cách triển khai của nó.

### Sử dụng hàm khởi tạo

Trong JavaScript, tất cả các hàm đều có một thuộc tính tên là `prototype`. Khi bạn gọi một hàm như một hàm khởi tạo, thuộc tính này được đặt làm nguyên mẫu của đối tượng mới được tạo (theo quy ước, trong thuộc tính tên là `__proto__`).

Vì vậy nếu chúng ta đặt `prototype` của một hàm khởi tạo, chúng ta có thể đảm bảo rằng tất cả các đối tượng được tạo với hàm khởi tạo đó đều được cấp nguyên mẫu đó:

```js
const personPrototype = {
  greet() {
    console.log(`hello, my name is ${this.name}!`);
  },
};

function Person(name) {
  this.name = name;
}

Object.assign(Person.prototype, personPrototype);
// or
// Person.prototype.greet = personPrototype.greet;
```

Ở đây chúng ta tạo:

- một đối tượng `personPrototype`, có phương thức `greet()`
- một hàm khởi tạo `Person()` để khởi tạo tên của người cần tạo.

Sau đó chúng ta đặt các phương thức được định nghĩa trong `personPrototype` vào thuộc tính `prototype` của hàm `Person` bằng cách sử dụng [`Object.assign`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign).

Sau code này, các đối tượng được tạo bằng `Person()` sẽ nhận `Person.prototype` làm nguyên mẫu của chúng, có phương thức `greet` một cách tự động.

```js
const reuben = new Person("Reuben");
reuben.greet(); // hello, my name is Reuben!
```

Điều này cũng giải thích tại sao chúng ta đã nói trước đó rằng nguyên mẫu của `myDate` được gọi là `Date.prototype`: đó là thuộc tính `prototype` của hàm khởi tạo `Date`.

### Thuộc tính riêng

Các đối tượng chúng ta tạo bằng hàm khởi tạo `Person` ở trên có hai thuộc tính:

- một thuộc tính `name`, được đặt trong hàm khởi tạo, nên nó xuất hiện trực tiếp trên các đối tượng `Person`
- một phương thức `greet()`, được đặt trong nguyên mẫu.

Đây là một mẫu phổ biến, trong đó các phương thức được định nghĩa trên nguyên mẫu, nhưng thuộc tính dữ liệu được định nghĩa trong hàm khởi tạo. Điều đó là vì các phương thức thường giống nhau cho mọi đối tượng chúng ta tạo ra, trong khi chúng ta thường muốn mỗi đối tượng có giá trị riêng cho thuộc tính dữ liệu của nó (giống như ở đây, mỗi người có tên khác nhau).

Các thuộc tính được định nghĩa trực tiếp trong đối tượng, như `name` ở đây, được gọi là **thuộc tính riêng** (own properties), và bạn có thể kiểm tra xem một thuộc tính có phải là thuộc tính riêng hay không bằng phương thức tĩnh {{jsxref("Object/hasOwn", "Object.hasOwn()")}}:

```js
const irma = new Person("Irma");

console.log(Object.hasOwn(irma, "name")); // true
console.log(Object.hasOwn(irma, "greet")); // false
```

> [!NOTE]
> Bạn cũng có thể sử dụng phương thức không tĩnh {{jsxref("Object/hasOwnProperty", "Object.hasOwnProperty()")}} ở đây, nhưng chúng tôi khuyên bạn nên sử dụng `Object.hasOwn()` nếu có thể.

## Nguyên mẫu và kế thừa

Nguyên mẫu là một tính năng mạnh mẽ và rất linh hoạt của JavaScript, giúp cho phép tái sử dụng code và kết hợp các đối tượng.

Đặc biệt, chúng hỗ trợ một phiên bản của **kế thừa**. Kế thừa là một tính năng của các ngôn ngữ lập trình hướng đối tượng cho phép lập trình viên thể hiện ý tưởng rằng một số đối tượng trong hệ thống là các phiên bản chuyên biệt hơn của các đối tượng khác.

Ví dụ, nếu chúng ta đang mô hình hóa một trường học, chúng ta có thể có _giáo sư_ và _sinh viên_: cả hai đều là _người_, vì vậy có một số tính năng chung (ví dụ, cả hai đều có tên), nhưng mỗi người có thể thêm các tính năng phụ (ví dụ, giáo sư có môn học họ giảng dạy), hoặc có thể triển khai cùng một tính năng theo những cách khác nhau. Trong một hệ thống OOP, chúng ta có thể nói rằng cả giáo sư và sinh viên đều **kế thừa từ** người.

Bạn có thể thấy rằng trong JavaScript, nếu các đối tượng `Professor` và `Student` có thể có nguyên mẫu `Person`, thì chúng có thể kế thừa các thuộc tính chung, trong khi thêm và định nghĩa lại các thuộc tính cần phải khác nhau.

Trong bài viết tiếp theo, chúng ta sẽ thảo luận về kế thừa cùng với các tính năng chính khác của các ngôn ngữ lập trình hướng đối tượng, và xem JavaScript hỗ trợ chúng như thế nào.

## Tóm tắt

Bài viết này đã đề cập đến các nguyên mẫu đối tượng JavaScript, bao gồm cách chuỗi đối tượng nguyên mẫu cho phép các đối tượng kế thừa tính năng từ nhau, thuộc tính prototype và cách nó có thể được sử dụng để thêm phương thức vào hàm khởi tạo, và các chủ đề liên quan khác.

Trong bài viết tiếp theo, chúng ta sẽ xem xét các khái niệm nền tảng của lập trình hướng đối tượng.

{{NextMenu("Learn_web_development/Extensions/Advanced_JavaScript_objects/Object-oriented_programming", "Learn_web_development/Extensions/Advanced_JavaScript_objects")}}
