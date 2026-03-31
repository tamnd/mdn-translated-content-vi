---
title: "TypeError: derived class constructor returned invalid value x"
slug: Web/JavaScript/Reference/Errors/Invalid_derived_return
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "derived class constructor returned invalid value x" xảy ra khi constructor của lớp dẫn xuất trả về một giá trị không phải là object hay `undefined`.

## Thông báo

```plain
TypeError: Derived constructors may only return object or undefined (V8-based)
TypeError: derived class constructor returned invalid value 1 (Firefox)
TypeError: Cannot return a non-object type in the constructor of a derived class. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Thông thường, một constructor không cần trả về bất kỳ thứ gì — giá trị của `this` sẽ tự động được trả về khi class được khởi tạo. Một constructor cũng có thể trả về một object, và object đó sẽ ghi đè lên `this` như là instance mới được khởi tạo. Tuy nhiên, trả về một thứ gì đó không phải là object hay `undefined` thường là nhầm lẫn, vì giá trị đó sẽ bị bỏ qua. Trong các lớp cơ sở và function constructor (sử dụng cú pháp `function`), việc trả về giá trị như vậy sẽ bị bỏ qua một cách im lặng, còn trong các lớp dẫn xuất thì sẽ ném ra lỗi.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
class Base {
  constructor() {}
}

class Derived extends Base {
  constructor() {
    return 2;
  }
}

new Derived(); // TypeError: derived class constructor returned invalid value 2
```

### Trường hợp hợp lệ

```js example-good
class Base {
  constructor() {}
}

class Derived extends Base {
  constructor() {
    return { x: 1 };
  }
}

new Derived(); // { x: 1 }
```

## Xem thêm

- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- {{jsxref("Classes/extends", "extends")}}
- {{jsxref("Operators/new", "new")}}
