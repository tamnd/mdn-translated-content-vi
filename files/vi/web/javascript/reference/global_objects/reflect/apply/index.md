---
title: Reflect.apply()
short-title: apply()
slug: Web/JavaScript/Reference/Global_Objects/Reflect/apply
page-type: javascript-static-method
browser-compat: javascript.builtins.Reflect.apply
sidebar: jsref
---

Phương thức tĩnh **`Reflect.apply()`** gọi một hàm target với các đối số được chỉ định.

{{InteractiveExample("JavaScript Demo: Reflect.apply()", "taller")}}

```js interactive-example
console.log(Reflect.apply(Math.floor, undefined, [1.75]));
// Expected output: 1

console.log(
  Reflect.apply(String.fromCharCode, undefined, [104, 101, 108, 108, 111]),
);
// Expected output: "hello"

console.log(
  Reflect.apply(RegExp.prototype.exec, /ab/, ["confabulation"]).index,
);
// Expected output: 4

console.log(Reflect.apply("".charAt, "ponies", [3]));
// Expected output: "i"
```

## Cú pháp

```js-nolint
Reflect.apply(target, thisArgument, argumentsList)
```

### Tham số

- `target`
  - : Hàm target cần gọi.
- `thisArgument`
  - : Giá trị của `this` được cung cấp cho lời gọi đến `target`.
- `argumentsList`
  - : Một [đối tượng giống mảng](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#working_with_array-like_objects) xác định các đối số mà `target` sẽ được gọi cùng.

### Giá trị trả về

Kết quả của việc gọi hàm `target` đã cho với giá trị `this` và các đối số được chỉ định.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `target` không phải là hàm hoặc `argumentsList` không phải là đối tượng.

## Mô tả

`Reflect.apply()` cung cấp ngữ nghĩa phản chiếu của một lời gọi hàm. Tức là, `Reflect.apply(target, thisArgument, argumentsList)` tương đương về mặt ngữ nghĩa với:

```js
Math.floor.apply(null, [1.75]);
Reflect.apply(Math.floor, null, [1.75]);
```

Sự khác biệt duy nhất là:

- `Reflect.apply()` nhận hàm cần gọi làm tham số `target` thay vì ngữ cảnh `this`.
- `Reflect.apply()` ném ra lỗi nếu `argumentsList` bị bỏ qua thay vì mặc định gọi mà không có tham số nào.

`Reflect.apply()` gọi phương thức nội tại `[[Call]]` [của đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) trên `target`.

## Ví dụ

### Sử dụng Reflect.apply()

```js
Reflect.apply(Math.floor, undefined, [1.75]);
// 1;

Reflect.apply(String.fromCharCode, undefined, [104, 101, 108, 108, 111]);
// "hello"

Reflect.apply(RegExp.prototype.exec, /ab/, ["confabulation"]).index;
// 4

Reflect.apply("".charAt, "ponies", [3]);
// "i"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Reflect.apply` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-reflect)
- [Polyfill es-shims của `Reflect.apply`](https://www.npmjs.com/package/reflect-apply)
- {{jsxref("Reflect")}}
- {{jsxref("Function.prototype.apply()")}}
- [`handler.apply()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/apply)
