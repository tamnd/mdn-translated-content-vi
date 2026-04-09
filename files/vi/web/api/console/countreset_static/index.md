---
title: "console: phương thức tĩnh countReset()"
short-title: countReset()
slug: Web/API/console/countReset_static
page-type: web-api-static-method
browser-compat: api.console.countReset_static
---

{{APIRef("Console API")}} {{AvailableInWorkers}}

Phương thức tĩnh **`console.countReset()`** đặt lại bộ đếm được dùng với {{domxref("console/count_static", "console.count()")}}.

## Cú pháp

```js-nolint
console.countReset()
console.countReset(label)
```

### Tham số

- `label` {{optional_inline}}
  - : Một chuỗi. Nếu được cung cấp, `countReset()` sẽ đặt lại bộ đếm cho nhãn đó về 0. Nếu bị bỏ qua, `countReset()` sẽ đặt lại bộ đếm mặc định về 0.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ, với đoạn mã như sau:

```js
function greet(user) {
  console.count();
  return `hi ${user}`;
}

greet("bob");
greet("alice");
greet("alice");
console.count();
console.countReset();
```

Đầu ra trong console sẽ trông giống như sau:

```plain
"default: 1"
"default: 2"
"default: 3"
"default: 4"
"default: 0"
```

Lưu ý rằng lời gọi `console.counterReset()` sẽ đặt lại giá trị của bộ đếm mặc định về 0.

Nếu chúng ta truyền biến `user` làm đối số `label` với chuỗi `"bob"` cho lần gọi đầu tiên của `console.count()`, và chuỗi `"alice"` cho lần gọi thứ hai:

```js
function greet(user) {
  console.count(user);
  return `hi ${user}`;
}

greet("bob");
greet("alice");
greet("alice");
console.countReset("bob");
console.count("alice");
```

Chúng ta sẽ thấy đầu ra như sau:

```plain
"bob: 1"
"alice: 1"
"alice: 2"
"bob: 0"
"alice: 3"
```

Việc đặt lại giá trị của bộ đếm `"bob"` chỉ thay đổi giá trị của bộ đếm đó. Giá trị của `"alice"` không thay đổi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tài liệu của Microsoft Edge về `console.countReset()`](https://learn.microsoft.com/en-us/microsoft-edge/devtools/console/api#countreset)
- [Tài liệu của Node.js về `console.countReset()`](https://nodejs.org/docs/latest/api/console.html#consolecountresetlabel)
- [Tài liệu của Google Chrome về `console.countReset()`](https://developer.chrome.com/docs/devtools/console/api/#countreset)
