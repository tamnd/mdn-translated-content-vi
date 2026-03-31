---
title: 'TypeError: "x" is not a non-null object'
slug: Web/JavaScript/Reference/Errors/No_non-null_object
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "is not a non-null object" xảy ra khi một đối tượng được kỳ vọng ở đâu đó nhưng không được cung cấp. [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) không phải là đối tượng và không hoạt động trong trường hợp này.

## Thông báo

```plain
TypeError: Property description must be an object: x (V8-based)
TypeError: Property descriptor must be an object, got "x" (Firefox)
TypeError: Property description must be an object. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Một đối tượng được kỳ vọng ở đâu đó nhưng không được cung cấp. [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) không phải là đối tượng và sẽ không hoạt động. Bạn phải cung cấp một đối tượng hợp lệ trong tình huống đã cho.

## Ví dụ

### Kỳ vọng property descriptor

Khi sử dụng các phương thức như {{jsxref("Object.create()")}} hoặc {{jsxref("Object.defineProperty()")}} và {{jsxref("Object.defineProperties()")}}, tham số descriptor tùy chọn yêu cầu một đối tượng property descriptor. Cung cấp không phải đối tượng (chẳng hạn như chỉ một số), sẽ ném ra lỗi:

```js example-bad
Object.defineProperty({}, "key", 1);
// TypeError: 1 is not a non-null object

Object.defineProperty({}, "key", null);
// TypeError: null is not a non-null object
```

Một đối tượng property descriptor hợp lệ có thể trông như thế này:

```js example-good
Object.defineProperty({}, "key", { value: "foo", writable: false });
```

## Xem thêm

- {{jsxref("Object.create()")}}
- {{jsxref("Object.defineProperty()")}}
- {{jsxref("Object.defineProperties()")}}
