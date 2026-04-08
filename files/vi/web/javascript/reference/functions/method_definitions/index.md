---
title: Method definitions
slug: Web/JavaScript/Reference/Functions/Method_definitions
page-type: javascript-language-feature
browser-compat: javascript.functions.method_definitions
sidebar: jssidebar
---

**Method definition** (định nghĩa phương thức) là cú pháp ngắn gọn hơn để định nghĩa một thuộc tính hàm trong object initializer. Nó cũng có thể được sử dụng trong [class](/en-US/docs/Web/JavaScript/Reference/Classes).

{{InteractiveExample("JavaScript Demo: Method definitions")}}

```js interactive-example
const obj = {
  foo() {
    return "bar";
  },
};

console.log(obj.foo());
// Expected output: "bar"
```

## Cú pháp

```js-nolint
({
  property(parameters) {},
  *generator(parameters) {},
  async property(parameters) {},
  async *generator(parameters) {},

  // with computed keys
  [expression](parameters) {},
  *[expression](parameters) {},
  async [expression](parameters) {},
  async *[expression](parameters) {},
})
```

## Mô tả

Cú pháp rút gọn tương tự với cú pháp [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) và [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set).

Với code sau:

```js
const obj = {
  foo: function () {
    // …
  },
  bar: function () {
    // …
  },
};
```

Bây giờ bạn có thể rút gọn thành:

```js
const obj = {
  foo() {
    // …
  },
  bar() {
    // …
  },
};
```

Các thuộc tính được định nghĩa bằng cú pháp này là các thuộc tính riêng của đối tượng được tạo, và chúng là configurable, enumerable và writable, giống như các thuộc tính bình thường.

Các thuộc tính [`function*`](/en-US/docs/Web/JavaScript/Reference/Statements/function*), [`async function`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function), và [`async function*`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*) đều có cú pháp phương thức tương ứng; xem ví dụ bên dưới.

Tuy nhiên, lưu ý rằng cú pháp phương thức không tương đương với thuộc tính thông thường có hàm làm giá trị — có sự khác biệt về ngữ nghĩa. Điều này làm cho các phương thức được định nghĩa trong object literal nhất quán hơn với các phương thức trong [class](/en-US/docs/Web/JavaScript/Reference/Classes).

### Định nghĩa phương thức không thể được khởi tạo

Phương thức không thể là constructor! Chúng sẽ ném ra {{jsxref("TypeError")}} nếu bạn cố gắng khởi tạo chúng. Mặt khác, thuộc tính được tạo như một hàm có thể được dùng như constructor.

```js example-bad
const obj = {
  method() {},
};
new obj.method(); // TypeError: obj.method is not a constructor
```

### Sử dụng super trong định nghĩa phương thức

Chỉ các hàm được định nghĩa như phương thức mới có quyền truy cập vào từ khóa [`super`](/en-US/docs/Web/JavaScript/Reference/Operators/super). `super.prop` tra cứu thuộc tính trên prototype của đối tượng mà phương thức được khởi tạo trên.

```js-nolint example-bad
const obj = {
  __proto__: {
    prop: "foo",
  },
  notAMethod: function () {
    console.log(super.prop); // SyntaxError: 'super' keyword unexpected here
  },
};
```

## Ví dụ

### Sử dụng định nghĩa phương thức

```js
const obj = {
  a: "foo",
  b() {
    return this.a;
  },
};
console.log(obj.b()); // "foo"
```

### Định nghĩa phương thức trong class

Bạn có thể sử dụng cú pháp hoàn toàn tương tự để định nghĩa các public instance method có sẵn trên các instance của class. Trong class, bạn không cần dấu phẩy phân tách giữa các phương thức.

```js
class ClassWithPublicInstanceMethod {
  publicMethod() {
    return "hello world";
  }
  secondPublicMethod() {
    return "goodbye world";
  }
}

const instance = new ClassWithPublicInstanceMethod();
console.log(instance.publicMethod()); // "hello world"
```

Các public instance method được định nghĩa trên thuộc tính `prototype` của class và do đó được chia sẻ bởi tất cả các instance của class. Chúng là writable, non-enumerable và configurable.

Bên trong instance method, [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) và [`super`](/en-US/docs/Web/JavaScript/Reference/Operators/super) hoạt động giống như trong các phương thức bình thường. Thông thường, `this` đề cập đến instance đó. Trong subclass, `super` cho phép bạn truy cập prototype của đối tượng mà phương thức được gắn, cho phép bạn gọi các phương thức từ superclass.

```js
class BaseClass {
  msg = "hello world";
  basePublicMethod() {
    return this.msg;
  }
}

class SubClass extends BaseClass {
  subPublicMethod() {
    return super.basePublicMethod();
  }
}

const instance = new SubClass();
console.log(instance.subPublicMethod()); // "hello world"
```

Static method và private method sử dụng cú pháp tương tự, được mô tả trong các trang [`static`](/en-US/docs/Web/JavaScript/Reference/Classes/static) và [private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements).

### Tên thuộc tính được tính toán

Cú pháp phương thức cũng hỗ trợ [computed property name](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#computed_property_names).

```js
const bar = {
  foo0: function () {
    return 0;
  },
  foo1() {
    return 1;
  },
  ["foo".toUpperCase()]() {
    return 2;
  },
};

console.log(bar.foo0()); // 0
console.log(bar.foo1()); // 1
console.log(bar.FOO()); // 2
```

### Phương thức generator

Lưu ý rằng dấu hoa thị (`*`) trong cú pháp phương thức generator phải đặt _trước_ tên thuộc tính generator. (Tức là, `* g(){}` sẽ hoạt động, nhưng `g *(){}` thì không.)

```js
// Using a named property
const obj = {
  g: function* () {
    let index = 0;
    while (true) {
      yield index++;
    }
  },
};

// The same object using shorthand syntax
const obj2 = {
  *g() {
    let index = 0;
    while (true) {
      yield index++;
    }
  },
};

const it = obj2.g();
console.log(it.next().value); // 0
console.log(it.next().value); // 1
```

### Phương thức async

```js
// Using a named property
const obj = {
  f: async function () {
    await somePromise;
  },
};

// The same object using shorthand syntax
const obj2 = {
  async f() {
    await somePromise;
  },
};
```

### Phương thức async generator

```js
// Using a named property
const obj = {
  f: async function* () {
    yield 1;
    yield 2;
    yield 3;
  },
};

// The same object using shorthand syntax
const obj2 = {
  async *f() {
    yield 1;
    yield 2;
    yield 3;
  },
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Working with objects](/en-US/docs/Web/JavaScript/Guide/Working_with_objects)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- [`get`](/en-US/docs/Web/JavaScript/Reference/Functions/get)
- [`set`](/en-US/docs/Web/JavaScript/Reference/Functions/set)
- [Object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer)
- {{jsxref("Statements/class", "class")}}
