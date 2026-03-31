---
title: get
slug: Web/JavaScript/Reference/Functions/get
page-type: javascript-language-feature
browser-compat: javascript.functions.get
sidebar: jssidebar
---

Cú pháp **`get`** liên kết một thuộc tính đối tượng với một hàm sẽ được gọi khi thuộc tính đó được tra cứu. Nó cũng có thể được sử dụng trong [class](/en-US/docs/Web/JavaScript/Reference/Classes).

{{InteractiveExample("JavaScript Demo: Getter declaration")}}

```js interactive-example
const obj = {
  log: ["a", "b", "c"],
  get latest() {
    return this.log[this.log.length - 1];
  },
};

console.log(obj.latest);
// Expected output: "c"
```

## Cú pháp

```js-nolint
{ get prop() { /* … */ } }
{ get [expression]() { /* … */ } }
```

Có một số hạn chế cú pháp bổ sung:

- Getter phải có đúng zero tham số.

### Tham số

- `prop`
  - : Tên của thuộc tính cần liên kết với hàm đã cho. Giống như các thuộc tính khác trong [object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer), nó có thể là chuỗi literal, số literal, hoặc định danh.
- `expression`
  - : Bạn cũng có thể sử dụng biểu thức cho tên thuộc tính được tính toán (computed property name) để liên kết với hàm đã cho.

## Mô tả

Đôi khi, mong muốn cho phép truy cập một thuộc tính trả về một giá trị được tính toán động, hoặc bạn có thể muốn phản ánh trạng thái của một biến nội bộ mà không cần sử dụng lời gọi phương thức rõ ràng. Trong JavaScript, điều này có thể được thực hiện bằng cách sử dụng _getter_.

Một thuộc tính đối tượng là thuộc tính dữ liệu hoặc thuộc tính accessor, nhưng không thể đồng thời là cả hai. Đọc {{jsxref("Object.defineProperty()")}} để biết thêm thông tin. Cú pháp getter cho phép bạn chỉ định hàm getter trong object initializer.

```js
const obj = {
  get prop() {
    // getter, the code executed when reading obj.prop
    return someValue;
  },
};
```

Các thuộc tính được định nghĩa bằng cú pháp này là các thuộc tính riêng của đối tượng được tạo, và chúng là configurable và enumerable.

## Ví dụ

### Định nghĩa getter trên đối tượng mới trong object initializer

Điều này sẽ tạo ra một pseudo-property `latest` cho đối tượng `obj`, sẽ trả về phần tử mảng cuối cùng trong `log`.

```js
const obj = {
  log: ["example", "test"],
  get latest() {
    return this.log.at(-1);
  },
};
console.log(obj.latest); // "test"
```

Lưu ý rằng cố gắng gán giá trị cho `latest` sẽ không thay đổi nó.

### Sử dụng getter trong class

Bạn có thể sử dụng cú pháp hoàn toàn tương tự để định nghĩa các public instance getter có sẵn trên các instance của class. Trong class, bạn không cần dấu phẩy phân tách giữa các phương thức.

```js
class ClassWithGetSet {
  #msg = "hello world";
  get msg() {
    return this.#msg;
  }
  set msg(x) {
    this.#msg = `hello ${x}`;
  }
}

const instance = new ClassWithGetSet();
console.log(instance.msg); // "hello world"

instance.msg = "cake";
console.log(instance.msg); // "hello cake"
```

Các thuộc tính getter được định nghĩa trên thuộc tính `prototype` của class và do đó được chia sẻ bởi tất cả các instance của class. Không giống như các thuộc tính getter trong object literal, các thuộc tính getter trong class không phải là enumerable.

Static getter và private getter sử dụng cú pháp tương tự, được mô tả trong các trang [`static`](/en-US/docs/Web/JavaScript/Reference/Classes/static) và [private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements).

### Xóa getter bằng toán tử `delete`

Nếu bạn muốn xóa getter, bạn có thể {{jsxref("Operators/delete", "delete")}} nó:

```js
delete obj.latest;
```

### Định nghĩa getter trên đối tượng hiện có bằng `defineProperty`

Để thêm getter vào đối tượng hiện có bất cứ lúc nào sau đó, hãy sử dụng {{jsxref("Object.defineProperty()")}}.

```js
const o = { a: 0 };

Object.defineProperty(o, "b", {
  get() {
    return this.a + 1;
  },
});

console.log(o.b); // Runs the getter, which yields a + 1 (which is 1)
```

### Sử dụng tên thuộc tính được tính toán

```js
const expr = "foo";

const obj = {
  get [expr]() {
    return "bar";
  },
};

console.log(obj.foo); // "bar"
```

### Định nghĩa static getter

```js
class MyConstants {
  static get foo() {
    return "foo";
  }
}

console.log(MyConstants.foo); // 'foo'
MyConstants.foo = "bar";
console.log(MyConstants.foo); // 'foo', a static getter's value cannot be changed
```

### Smart / self-overwriting / lazy getter

Getter cho bạn cách _định nghĩa_ một thuộc tính của đối tượng, nhưng chúng không _tính toán_ giá trị của thuộc tính cho đến khi nó được truy cập. Getter trì hoãn chi phí tính toán giá trị cho đến khi giá trị cần thiết. Nếu nó không bao giờ cần thiết, bạn không bao giờ phải trả chi phí đó.

Một kỹ thuật tối ưu hóa bổ sung để làm chậm hoặc trì hoãn việc tính toán giá trị thuộc tính và lưu vào cache cho lần truy cập sau là _smart_ (hay _[memoized](https://en.wikipedia.org/wiki/Memoization)_) getter. Giá trị được tính toán lần đầu tiên getter được gọi và sau đó được lưu vào cache để các lần truy cập tiếp theo trả về giá trị đã cache mà không tính toán lại. Điều này hữu ích trong các tình huống sau:

- Nếu việc tính toán giá trị thuộc tính tốn kém (sử dụng nhiều RAM hay CPU, tạo worker thread, truy xuất file từ xa, v.v.).
- Nếu giá trị không cần ngay bây giờ. Nó sẽ được sử dụng sau, hoặc trong một số trường hợp, nó hoàn toàn không được sử dụng.
- Nếu nó được sử dụng, nó sẽ được truy cập nhiều lần, và không cần phải tính toán lại giá trị đó vì nó sẽ không bao giờ thay đổi hoặc không nên được tính toán lại.

> [!NOTE]
> Điều này có nghĩa là bạn không nên viết lazy getter cho một thuộc tính mà giá trị của nó bạn mong đợi thay đổi, vì nếu getter là lazy, thì nó sẽ không tính toán lại giá trị.
>
> Lưu ý rằng getter không "lazy" hay "memoized" theo bản chất; bạn phải triển khai kỹ thuật này nếu bạn muốn hành vi này.

Trong ví dụ sau, đối tượng có getter như thuộc tính riêng của nó. Khi lấy thuộc tính, thuộc tính bị xóa khỏi đối tượng và được thêm lại, nhưng lần này một cách ngầm định là thuộc tính dữ liệu. Cuối cùng, giá trị được trả về.

```js
const obj = {
  get notifier() {
    delete this.notifier;
    this.notifier = document.getElementById("bookmarked-notification-anchor");
    return this.notifier;
  },
};
```

### Phát hiện tính năng

Nhiều hàm chấp nhận một đối tượng và lấy các thuộc tính riêng lẻ từ đó làm các tham số riêng biệt (đối tượng tham số này được gọi là _options bag_). Bạn có thể phát hiện xem một tùy chọn cụ thể có được hỗ trợ hay không bằng cách sử dụng getter để theo dõi xem thuộc tính đã được lấy chưa. Ví dụ này kiểm tra xem tùy chọn `colorType` có được hỗ trợ bởi phương thức {{domxref("HTMLCanvasElement.getContext()")}} không.

```js
function isColorTypeSupported() {
  let supported = false;
  const obj = {
    get colorType() {
      supported = true;
      return undefined;
    },
  };
  document.createElement("canvas").getContext("2d", obj);
  return supported;
}
```

### get so với defineProperty

Trong khi sử dụng từ khóa `get` và {{jsxref("Object.defineProperty()")}} có kết quả tương tự, có một sự khác biệt nhỏ giữa hai cách khi được sử dụng trên [class](/en-US/docs/Web/JavaScript/Reference/Classes). Cú pháp `get` định nghĩa thuộc tính trên prototype của instance, trong khi {{jsxref("Object.defineProperty()")}} định nghĩa thuộc tính trên instance mà nó được áp dụng.

```js
class Example {
  get hello() {
    return "world";
  }
}

const obj = new Example();
console.log(obj.hello);
// "world"

console.log(Object.getOwnPropertyDescriptor(obj, "hello"));
// undefined

console.log(
  Object.getOwnPropertyDescriptor(Object.getPrototypeOf(obj), "hello"),
);
// { configurable: true, enumerable: false, get: function get hello() { return 'world'; }, set: undefined }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Working with objects](/en-US/docs/Web/JavaScript/Guide/Working_with_objects)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- [`set`](/en-US/docs/Web/JavaScript/Reference/Functions/set)
- {{jsxref("Object.defineProperty()")}}
- [Object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer)
- {{jsxref("Statements/class", "class")}}
- [Property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors)
- [Incompatible ES5 change: literal getter and setter functions must now have exactly zero or one arguments](https://whereswalden.com/2010/08/22/incompatible-es5-change-literal-getter-and-setter-functions-must-now-have-exactly-zero-or-one-arguments/) by Jeff Walden (2010)
- [More SpiderMonkey changes: ancient, esoteric, very rarely used syntax for creating getters and setters is being removed](https://whereswalden.com/2010/04/16/more-spidermonkey-changes-ancient-esoteric-very-rarely-used-syntax-for-creating-getters-and-setters-is-being-removed/) by Jeff Walden (2010)
