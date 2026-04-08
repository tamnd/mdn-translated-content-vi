---
title: set
slug: Web/JavaScript/Reference/Functions/set
page-type: javascript-language-feature
browser-compat: javascript.functions.set
sidebar: jssidebar
---

Cú pháp **`set`** liên kết một thuộc tính đối tượng với một hàm được gọi khi có nỗ lực thiết lập thuộc tính đó. Nó cũng có thể được sử dụng trong [class](/en-US/docs/Web/JavaScript/Reference/Classes).

{{InteractiveExample("JavaScript Demo: Setter declaration")}}

```js interactive-example
const language = {
  set current(name) {
    this.log.push(name);
  },
  log: [],
};

language.current = "EN";
language.current = "FA";

console.log(language.log);
// Expected output: Array ["EN", "FA"]
```

## Cú pháp

```js-nolint
{ set prop(val) { /* … */ } }
{ set [expression](val) { /* … */ } }
```

Có một số hạn chế cú pháp bổ sung:

- Setter phải có đúng một tham số.

### Tham số

- `prop`
  - : Tên của thuộc tính cần liên kết với hàm đã cho. Giống như các thuộc tính khác trong [object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer), nó có thể là chuỗi literal, số literal, hoặc định danh.
- `val`
  - : Một bí danh cho biến giữ giá trị được cố gắng gán vào `prop`.
- `expression`
  - : Bạn cũng có thể sử dụng biểu thức cho tên thuộc tính được tính toán (computed property name) để liên kết với hàm đã cho.

## Mô tả

Trong JavaScript, setter có thể được dùng để thực thi một hàm bất cứ khi nào có nỗ lực thay đổi giá trị của thuộc tính. Setter thường được dùng cùng với getter.

Một thuộc tính đối tượng là thuộc tính dữ liệu hoặc thuộc tính accessor, nhưng không thể đồng thời là cả hai. Đọc {{jsxref("Object.defineProperty()")}} để biết thêm thông tin. Cú pháp setter cho phép bạn chỉ định hàm setter trong object initializer.

```js
const obj = {
  set prop() {
    // setter, the code executed when setting obj.prop
  },
}
```

Các thuộc tính được định nghĩa bằng cú pháp này là các thuộc tính riêng của đối tượng được tạo, và chúng là configurable và enumerable.

## Ví dụ

### Định nghĩa setter trên đối tượng mới trong object initializer

Ví dụ sau định nghĩa một pseudo-property `current` của đối tượng `language`. Khi `current` được gán một giá trị, nó cập nhật `log` với giá trị đó:

```js
const language = {
  set current(name) {
    this.log.push(name);
  },
  log: [],
};

language.current = "EN";
console.log(language.log); // ['EN']

language.current = "FA";
console.log(language.log); // ['EN', 'FA']
```

Lưu ý rằng `current` không được định nghĩa, và bất kỳ nỗ lực truy cập nào cũng sẽ dẫn đến `undefined`.

### Sử dụng setter trong class

Bạn có thể sử dụng cú pháp hoàn toàn tương tự để định nghĩa các public instance setter có sẵn trên các instance của class. Trong class, bạn không cần dấu phẩy phân tách giữa các phương thức.

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

Các thuộc tính setter được định nghĩa trên thuộc tính `prototype` của class và do đó được chia sẻ bởi tất cả các instance của class. Không giống như các thuộc tính setter trong object literal, các thuộc tính setter trong class không phải là enumerable.

Static setter và private setter sử dụng cú pháp tương tự, được mô tả trong các trang [`static`](/en-US/docs/Web/JavaScript/Reference/Classes/static) và [private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements).

### Xóa setter bằng toán tử `delete`

Nếu bạn muốn xóa setter, bạn có thể {{jsxref("Operators/delete", "delete")}} nó:

```js
delete language.current;
```

### Định nghĩa setter trên đối tượng hiện có bằng `defineProperty`

Để thêm setter vào một đối tượng _hiện có_, hãy sử dụng {{jsxref("Object.defineProperty()")}}.

```js
const o = { a: 0 };

Object.defineProperty(o, "b", {
  set(x) {
    this.a = x / 2;
  },
});

o.b = 10;
// Runs the setter, which assigns 10 / 2 (5) to the 'a' property

console.log(o.a); // 5
```

### Sử dụng tên thuộc tính được tính toán

```js
const expr = "foo";

const obj = {
  baz: "bar",
  set [expr](v) {
    this.baz = v;
  },
};

console.log(obj.baz); // "bar"

obj.foo = "baz";
// Run the setter

console.log(obj.baz); // "baz"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Working with objects](/en-US/docs/Web/JavaScript/Guide/Working_with_objects)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- [`get`](/en-US/docs/Web/JavaScript/Reference/Functions/get)
- {{jsxref("Object.defineProperty()")}}
- [Object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer)
- {{jsxref("Statements/class", "class")}}
- [Property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors)
- [Incompatible ES5 change: literal getter and setter functions must now have exactly zero or one arguments](https://whereswalden.com/2010/08/22/incompatible-es5-change-literal-getter-and-setter-functions-must-now-have-exactly-zero-or-one-arguments/) by Jeff Walden (2010)
- [More SpiderMonkey changes: ancient, esoteric, very rarely used syntax for creating getters and setters is being removed](https://whereswalden.com/2010/04/16/more-spidermonkey-changes-ancient-esoteric-very-rarely-used-syntax-for-creating-getters-and-setters-is-being-removed/) by Jeff Walden (2010)
