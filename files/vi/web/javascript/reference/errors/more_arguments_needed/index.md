---
title: "TypeError: More arguments needed"
slug: Web/JavaScript/Reference/Errors/More_arguments_needed
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "more arguments needed" xảy ra khi có lỗi trong cách gọi hàm. Cần cung cấp thêm đối số.

## Thông báo

```plain
TypeError: Object prototype may only be an Object or null: undefined (V8-based)
TypeError: Object.create requires at least 1 argument, but only 0 were passed (Firefox)
TypeError: Object.setPrototypeOf requires at least 2 arguments, but only 0 were passed (Firefox)
TypeError: Object.defineProperties requires at least 1 argument, but only 0 were passed (Firefox)
TypeError: Object prototype may only be an Object or null. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}.

## Nguyên nhân?

Có lỗi trong cách gọi hàm. Cần cung cấp thêm đối số.

## Ví dụ

### Thiếu đối số bắt buộc

Phương thức {{jsxref("Object.create()")}} yêu cầu ít nhất một đối số và phương thức {{jsxref("Object.setPrototypeOf()")}} yêu cầu ít nhất hai đối số:

```js example-bad
const obj = Object.create();
// TypeError: Object.create requires at least 1 argument, but only 0 were passed

const obj2 = Object.setPrototypeOf({});
// TypeError: Object.setPrototypeOf requires at least 2 arguments, but only 1 were passed
```

Bạn có thể khắc phục bằng cách đặt [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) làm prototype, ví dụ:

```js example-good
const obj = Object.create(null);

const obj2 = Object.setPrototypeOf({}, null);
```

## Xem thêm

- [Hướng dẫn Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
