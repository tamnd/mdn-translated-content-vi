---
title: Proxy
slug: Web/JavaScript/Reference/Global_Objects/Proxy
page-type: javascript-class
browser-compat: javascript.builtins.Proxy
sidebar: jsref
---

Đối tượng **`Proxy`** cho phép bạn tạo một proxy cho một đối tượng khác, có khả năng chặn và định nghĩa lại các thao tác cơ bản trên đối tượng đó.

## Mô tả

Đối tượng `Proxy` cho phép bạn tạo ra một đối tượng có thể được dùng thay thế cho đối tượng gốc, nhưng có thể định nghĩa lại các thao tác `Object` cơ bản như lấy giá trị, gán giá trị, và định nghĩa thuộc tính. Các đối tượng Proxy thường được dùng để ghi lại các lần truy cập thuộc tính, kiểm tra hợp lệ, định dạng hoặc làm sạch dữ liệu đầu vào, v.v.

Bạn tạo một `Proxy` với hai tham số:

- `target`: đối tượng gốc mà bạn muốn tạo proxy
- `handler`: một đối tượng xác định những thao tác nào sẽ bị chặn và cách định nghĩa lại các thao tác đó.

Ví dụ, đoạn code sau tạo một proxy cho đối tượng `target`.

```js
const target = {
  message1: "hello",
  message2: "everyone",
};

const handler1 = {};

const proxy1 = new Proxy(target, handler1);
```

Vì handler rỗng, proxy này hoạt động giống hệt target gốc:

```js
console.log(proxy1.message1); // hello
console.log(proxy1.message2); // everyone
```

Để tùy chỉnh proxy, chúng ta định nghĩa các hàm trên đối tượng handler:

```js
const target = {
  message1: "hello",
  message2: "everyone",
};

const handler2 = {
  get(target, prop, receiver) {
    return "world";
  },
};

const proxy2 = new Proxy(target, handler2);
```

Ở đây chúng ta đã cung cấp một triển khai cho handler {{jsxref("Proxy/Proxy/get", "get()")}}, chặn các lần cố gắng truy cập thuộc tính trên target.

Các hàm handler đôi khi được gọi là _trap_ (bẫy), có lẽ vì chúng bắt các lời gọi đến đối tượng target. Trap trong `handler2` ở trên định nghĩa lại tất cả các accessor thuộc tính:

```js
console.log(proxy2.message1); // world
console.log(proxy2.message2); // world
```

Các Proxy thường được dùng cùng với đối tượng {{jsxref("Reflect")}}, cung cấp các phương thức có cùng tên với các trap của `Proxy`. Các phương thức `Reflect` cung cấp ngữ nghĩa phản chiếu để gọi các [phương thức nội tại tương ứng của đối tượng](#phương_thức_nội_tại_của_đối_tượng). Ví dụ, chúng ta có thể gọi `Reflect.get` nếu không muốn định nghĩa lại hành vi của đối tượng:

```js
const target = {
  message1: "hello",
  message2: "everyone",
};

const handler3 = {
  get(target, prop, receiver) {
    if (prop === "message2") {
      return "world";
    }
    return Reflect.get(...arguments);
  },
};

const proxy3 = new Proxy(target, handler3);

console.log(proxy3.message1); // hello
console.log(proxy3.message2); // world
```

Phương thức `Reflect` vẫn tương tác với đối tượng thông qua các phương thức nội tại của đối tượng — nó không "bỏ proxy" nếu được gọi trên một proxy. Nếu bạn dùng các phương thức `Reflect` bên trong một trap của proxy, và lời gọi phương thức `Reflect` lại bị trap chặn lại, có thể xảy ra đệ quy vô hạn.

### Thuật ngữ

Các thuật ngữ sau được dùng khi nói về tính năng của proxy.

- [handler](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy#handler_functions)
  - : Đối tượng được truyền làm đối số thứ hai cho constructor `Proxy`. Nó chứa các trap xác định hành vi của proxy.
- trap
  - : Hàm xác định hành vi cho [phương thức nội tại tương ứng của đối tượng](#phương_thức_nội_tại_của_đối_tượng). (Điều này tương tự với khái niệm _trap_ trong hệ điều hành.)
- target
  - : Đối tượng mà proxy ảo hóa. Nó thường được dùng làm backend lưu trữ cho proxy. Các bất biến (ngữ nghĩa không thay đổi) liên quan đến tính không thể mở rộng hoặc thuộc tính không thể cấu hình của đối tượng được xác minh với target.
- {{Glossary("invariant", "invariants")}}
  - : Ngữ nghĩa không thay đổi khi triển khai các thao tác tùy chỉnh. Nếu triển khai trap của bạn vi phạm các bất biến của một handler, {{jsxref("TypeError")}} sẽ được ném ra.

### Phương thức nội tại của đối tượng

[Các đối tượng](/en-US/docs/Web/JavaScript/Guide/Data_structures#objects) là tập hợp các thuộc tính. Tuy nhiên, ngôn ngữ không cung cấp bất kỳ cơ chế nào để _trực tiếp_ thao tác dữ liệu được lưu trữ trong đối tượng — thay vào đó, đối tượng định nghĩa một số phương thức nội tại xác định cách nó có thể được tương tác. Ví dụ, khi bạn đọc `obj.x`, bạn có thể mong đợi những điều sau xảy ra:

- Thuộc tính `x` được tìm kiếm theo [chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) cho đến khi tìm thấy.
- Nếu `x` là thuộc tính dữ liệu, thuộc tính `value` trong property descriptor được trả về.
- Nếu `x` là thuộc tính accessor, getter được gọi và giá trị trả về của getter được trả về.

Không có gì đặc biệt trong quá trình này của ngôn ngữ — đó chỉ là vì các đối tượng thông thường, theo mặc định, có phương thức nội tại `[[Get]]` được định nghĩa với hành vi này. Cú pháp truy cập thuộc tính `obj.x` chỉ đơn giản là gọi phương thức `[[Get]]` trên đối tượng, và đối tượng dùng triển khai phương thức nội tại của chính mình để xác định cần trả về gì.

Ví dụ khác, [mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) khác với các đối tượng thông thường vì chúng có thuộc tính ma thuật [`length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length) mà khi được thay đổi, tự động cấp phát các slot trống hoặc xóa các phần tử khỏi mảng. Tương tự, thêm phần tử vào mảng tự động thay đổi thuộc tính `length`. Điều này là vì mảng có phương thức nội tại `[[DefineOwnProperty]]` biết cách cập nhật `length` khi một chỉ số nguyên được ghi vào, hoặc cập nhật nội dung mảng khi `length` được ghi vào. Các đối tượng như vậy có các phương thức nội tại với các triển khai khác nhau so với các đối tượng thông thường được gọi là _exotic objects_ (đối tượng kỳ lạ). `Proxy` cho phép các nhà phát triển định nghĩa các exotic object của riêng mình với đầy đủ khả năng.

Tất cả đối tượng đều có các phương thức nội tại sau:

| Phương thức nội tại     | Trap tương ứng                                                                   |
| ----------------------- | -------------------------------------------------------------------------------- |
| `[[GetPrototypeOf]]`    | {{jsxref("Proxy/Proxy/getPrototypeOf", "getPrototypeOf()")}}                     |
| `[[SetPrototypeOf]]`    | {{jsxref("Proxy/Proxy/setPrototypeOf", "setPrototypeOf()")}}                     |
| `[[IsExtensible]]`      | {{jsxref("Proxy/Proxy/isExtensible", "isExtensible()")}}                         |
| `[[PreventExtensions]]` | {{jsxref("Proxy/Proxy/preventExtensions", "preventExtensions()")}}               |
| `[[GetOwnProperty]]`    | {{jsxref("Proxy/Proxy/getOwnPropertyDescriptor", "getOwnPropertyDescriptor()")}} |
| `[[DefineOwnProperty]]` | {{jsxref("Proxy/Proxy/defineProperty", "defineProperty()")}}                     |
| `[[HasProperty]]`       | {{jsxref("Proxy/Proxy/has", "has()")}}                                           |
| `[[Get]]`               | {{jsxref("Proxy/Proxy/get", "get()")}}                                           |
| `[[Set]]`               | {{jsxref("Proxy/Proxy/set", "set()")}}                                           |
| `[[Delete]]`            | {{jsxref("Proxy/Proxy/deleteProperty", "deleteProperty()")}}                     |
| `[[OwnPropertyKeys]]`   | {{jsxref("Proxy/Proxy/ownKeys", "ownKeys()")}}                                   |

Các đối tượng hàm cũng có các phương thức nội tại sau:

| Phương thức nội tại | Trap tương ứng                                     |
| ------------------- | -------------------------------------------------- |
| `[[Call]]`          | {{jsxref("Proxy/Proxy/apply", "apply()")}}         |
| `[[Construct]]`     | {{jsxref("Proxy/Proxy/construct", "construct()")}} |

Điều quan trọng cần nhận ra là tất cả các tương tác với một đối tượng đều quy về việc gọi một trong những phương thức nội tại này, và tất cả chúng đều có thể tùy chỉnh thông qua proxy. Điều này có nghĩa là hầu như không có hành vi nào (ngoại trừ một số bất biến quan trọng nhất định) được đảm bảo trong ngôn ngữ — mọi thứ đều được xác định bởi chính đối tượng. Khi bạn chạy [`delete obj.x`](/en-US/docs/Web/JavaScript/Reference/Operators/delete), không có gì đảm bảo rằng [`"x" in obj`](/en-US/docs/Web/JavaScript/Reference/Operators/in) trả về `false` sau đó — điều đó phụ thuộc vào các triển khai `[[Delete]]` và `[[HasProperty]]` của đối tượng. Một `delete obj.x` có thể ghi ra console, sửa đổi một số trạng thái toàn cục, hoặc thậm chí định nghĩa một thuộc tính mới thay vì xóa thuộc tính hiện có, mặc dù những ngữ nghĩa này nên được tránh trong code của bạn.

Tất cả các phương thức nội tại đều được gọi bởi chính ngôn ngữ, và không thể truy cập trực tiếp trong code JavaScript. Namespace {{jsxref("Reflect")}} cung cấp các phương thức làm ít hơn là gọi các phương thức nội tại, bên cạnh một số chuẩn hóa/xác thực đầu vào. Trong trang của mỗi trap, chúng tôi liệt kê một số tình huống điển hình khi trap được gọi, nhưng các phương thức nội tại này được gọi ở _rất nhiều_ nơi. Ví dụ, các phương thức mảng đọc và ghi vào mảng thông qua các phương thức nội tại này, vì vậy các phương thức như [`push()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push) cũng sẽ gọi trap `get()` và `set()`.

Hầu hết các phương thức nội tại đều đơn giản trong những gì chúng làm. Chỉ có hai phương thức có thể gây nhầm lẫn là `[[Set]]` và `[[DefineOwnProperty]]`. Đối với các đối tượng thông thường, phương thức trước gọi setter; phương thức sau thì không. (Và `[[Set]]` gọi `[[DefineOwnProperty]]` nội bộ nếu không có thuộc tính hiện có hoặc thuộc tính là thuộc tính dữ liệu.) Mặc dù bạn có thể biết rằng cú pháp `obj.x = 1` dùng `[[Set]]`, và {{jsxref("Object.defineProperty()")}} dùng `[[DefineOwnProperty]]`, không phải lúc nào cũng rõ ràng các phương thức và cú pháp tích hợp khác sử dụng ngữ nghĩa nào. Ví dụ, [các trường lớp](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields) dùng ngữ nghĩa `[[DefineOwnProperty]]`, đó là lý do tại sao các setter được định nghĩa trong lớp cha không được gọi khi một trường được khai báo trên lớp dẫn xuất.

## Constructor

- {{jsxref("Proxy/Proxy", "Proxy()")}}
  - : Tạo một đối tượng `Proxy` mới.

> [!NOTE]
> Không có thuộc tính `Proxy.prototype`, vì vậy các instance của `Proxy` không có bất kỳ thuộc tính hoặc phương thức đặc biệt nào.

## Phương thức tĩnh

- {{jsxref("Proxy.revocable()")}}
  - : Tạo một đối tượng `Proxy` có thể thu hồi.

## Ví dụ

### Ví dụ cơ bản

Trong ví dụ này, số `37` được trả về làm giá trị mặc định khi tên thuộc tính không có trong đối tượng. Ví dụ sử dụng handler {{jsxref("Proxy/Proxy/get", "get()")}}.

```js
const handler = {
  get(obj, prop) {
    return prop in obj ? obj[prop] : 37;
  },
};

const p = new Proxy({}, handler);
p.a = 1;
p.b = undefined;

console.log(p.a, p.b); // 1, undefined

console.log("c" in p, p.c); // false, 37
```

### Proxy chuyển tiếp không thao tác

Trong ví dụ này, chúng ta đang sử dụng một đối tượng JavaScript gốc mà proxy của chúng ta sẽ chuyển tiếp tất cả các thao tác được áp dụng cho nó.

```js
const target = {};
const p = new Proxy(target, {});

p.a = 37; // Operation forwarded to the target

console.log(target.a); // 37 (The operation has been properly forwarded!)
```

Lưu ý rằng mặc dù "no-op" này hoạt động với các đối tượng JavaScript thuần, nhưng nó không hoạt động với các đối tượng gốc như phần tử DOM, đối tượng [`Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map), hoặc bất cứ thứ gì có internal slot. Xem [không chuyển tiếp private field](#không_chuyển_tiếp_private_field) để biết thêm thông tin.

### Không chuyển tiếp private field

Một proxy vẫn là một đối tượng khác với danh tính khác — đó là một _proxy_ hoạt động giữa đối tượng được bọc và bên ngoài. Do đó, proxy không có quyền truy cập trực tiếp vào [các phần tử private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) của đối tượng gốc.

```js
class Secret {
  #secret;
  constructor(secret) {
    this.#secret = secret;
  }
  get secret() {
    return this.#secret.replace(/\d+/, "[REDACTED]");
  }
}

const secret = new Secret("123456");
console.log(secret.secret); // [REDACTED]
// Looks like a no-op forwarding...
const proxy = new Proxy(secret, {});
console.log(proxy.secret); // TypeError: Cannot read private member #secret from an object whose class did not declare it
```

Đây là vì khi trap `get` của proxy được gọi, giá trị `this` là `proxy` thay vì `secret` gốc, vì vậy `#secret` không thể truy cập được. Để khắc phục điều này, hãy dùng `secret` gốc làm `this`:

```js
const proxy = new Proxy(secret, {
  get(target, prop, receiver) {
    // By default, it looks like Reflect.get(target, prop, receiver)
    // which has a different value of `this`
    return target[prop];
  },
});
console.log(proxy.secret);
```

Đối với các phương thức, điều này có nghĩa là bạn cũng phải chuyển hướng giá trị `this` của phương thức sang đối tượng gốc:

```js
class Secret {
  #x = 1;
  x() {
    return this.#x;
  }
}

const secret = new Secret();
const proxy = new Proxy(secret, {
  get(target, prop, receiver) {
    const value = target[prop];
    if (value instanceof Function) {
      return function (...args) {
        return value.apply(this === receiver ? target : this, args);
      };
    }
    return value;
  },
});
console.log(proxy.x());
```

Một số đối tượng JavaScript gốc có các thuộc tính gọi là _[internal slots](https://tc39.es/ecma262/multipage/ecmascript-data-types-and-values.html#sec-object-internal-methods-and-internal-slots)_, không thể truy cập từ code JavaScript. Ví dụ, các đối tượng [`Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) có một internal slot gọi là `[[MapData]]`, lưu trữ các cặp key-value của map. Do đó, bạn không thể tầm thường tạo một proxy chuyển tiếp cho một map:

```js
const proxy = new Proxy(new Map(), {});
console.log(proxy.size); // TypeError: get size method called on incompatible Proxy
```

Bạn phải dùng proxy "phục hồi `this`" được minh họa ở trên để giải quyết vấn đề này.

### Kiểm tra hợp lệ

Với `Proxy`, bạn có thể dễ dàng kiểm tra hợp lệ giá trị được truyền vào cho một đối tượng. Ví dụ này sử dụng handler {{jsxref("Proxy/Proxy/set", "set()")}}.

```js
const validator = {
  set(obj, prop, value) {
    if (prop === "age") {
      if (!Number.isInteger(value)) {
        throw new TypeError("The age is not an integer");
      }
      if (value > 200) {
        throw new RangeError("The age seems invalid");
      }
    }

    // The default behavior to store the value
    obj[prop] = value;

    // Indicate success
    return true;
  },
};

const person = new Proxy({}, validator);

person.age = 100;
console.log(person.age); // 100
person.age = "young"; // Throws an exception
person.age = 300; // Throws an exception
```

### Thao tác với các node DOM

Trong ví dụ này chúng ta dùng `Proxy` để bật/tắt một thuộc tính của hai phần tử khác nhau: vì vậy khi chúng ta đặt thuộc tính trên một phần tử, thuộc tính đó được bỏ trên phần tử kia.

Chúng ta tạo một đối tượng `view` là proxy cho một đối tượng có thuộc tính `selected`. Handler proxy định nghĩa handler {{jsxref("Proxy/Proxy/set", "set()")}}.

Khi chúng ta gán một phần tử HTML cho `view.selected`, thuộc tính `'aria-selected'` của phần tử đó được đặt thành `true`. Nếu sau đó chúng ta gán một phần tử khác cho `view.selected`, thuộc tính `'aria-selected'` của phần tử này được đặt thành `true` và thuộc tính `'aria-selected'` của phần tử trước tự động được đặt thành `false`.

```js
const view = new Proxy(
  {
    selected: null,
  },
  {
    set(obj, prop, newVal) {
      const oldVal = obj[prop];

      if (prop === "selected") {
        if (oldVal) {
          oldVal.setAttribute("aria-selected", "false");
        }
        if (newVal) {
          newVal.setAttribute("aria-selected", "true");
        }
      }

      // The default behavior to store the value
      obj[prop] = newVal;

      // Indicate success
      return true;
    },
  },
);

const item1 = document.getElementById("item-1");
const item2 = document.getElementById("item-2");

// select item1:
view.selected = item1;

console.log(`item1: ${item1.getAttribute("aria-selected")}`);
// item1: true

// selecting item2 de-selects item1:
view.selected = item2;

console.log(`item1: ${item1.getAttribute("aria-selected")}`);
// item1: false

console.log(`item2: ${item2.getAttribute("aria-selected")}`);
// item2: true
```

### Hiệu chỉnh giá trị và thuộc tính bổ sung

Đối tượng proxy `products` đánh giá giá trị được truyền vào và chuyển đổi nó thành mảng nếu cần. Đối tượng cũng hỗ trợ một thuộc tính bổ sung gọi là `latestBrowser` vừa là getter vừa là setter.

```js
const products = new Proxy(
  {
    browsers: ["Firefox", "Chrome"],
  },
  {
    get(obj, prop) {
      // An extra property
      if (prop === "latestBrowser") {
        return obj.browsers[obj.browsers.length - 1];
      }

      // The default behavior to return the value
      return obj[prop];
    },
    set(obj, prop, value) {
      // An extra property
      if (prop === "latestBrowser") {
        obj.browsers.push(value);
        return true;
      }

      // Convert the value if it is not an array
      if (typeof value === "string") {
        value = [value];
      }

      // The default behavior to store the value
      obj[prop] = value;

      // Indicate success
      return true;
    },
  },
);

console.log(products.browsers);
//  ['Firefox', 'Chrome']

products.browsers = "Safari";
//  pass a string (by mistake)

console.log(products.browsers);
//  ['Safari'] <- no problem, the value is an array

products.latestBrowser = "Edge";

console.log(products.browsers);
//  ['Safari', 'Edge']

console.log(products.latestBrowser);
//  'Edge'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Bài thuyết trình [Proxies are awesome](https://youtu.be/sClk6aB_CPk) của Brendan Eich tại JSConf (2014)
