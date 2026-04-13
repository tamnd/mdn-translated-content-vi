---
title: "console: phương thức tĩnh count()"
short-title: count()
slug: Web/API/console/count_static
page-type: web-api-static-method
browser-compat: api.console.count_static
---

{{APIRef("Console API")}} {{AvailableInWorkers}}

Phương thức tĩnh **`console.count()`** ghi số lần mà lời gọi `count()` cụ thể này đã được gọi.

## Cú pháp

```js-nolint
console.count()
console.count(label)
```

### Tham số

- `label` {{Optional_Inline}}
  - : Một chuỗi. Nếu được cung cấp, `count()` sẽ xuất số lần nó được gọi với nhãn đó. Nếu bị bỏ qua, `count()` hoạt động như thể nó được gọi với nhãn `"default"`.

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
greet();
console.count();
```

Đầu ra trong console sẽ trông giống như sau:

```plain
"default: 1"
"default: 2"
"default: 3"
"default: 4"
```

Nhãn được hiển thị là `default` vì không có nhãn tường minh nào được cung cấp.

Nếu chúng ta truyền biến `user` làm đối số `label` cho lần gọi đầu tiên của `console.count()`, và chuỗi `"alice"` cho lần gọi thứ hai:

```js
function greet(user) {
  console.count(user);
  return `hi ${user}`;
}

greet("bob");
greet("alice");
greet("alice");
console.count("alice");
```

Chúng ta sẽ thấy đầu ra như sau:

```plain
"bob: 1"
"alice: 1"
"alice: 2"
"alice: 3"
```

Giờ đây chúng ta đang duy trì các bộ đếm riêng biệt chỉ dựa trên giá trị của `label`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tài liệu của Microsoft Edge về `console.count()`](https://learn.microsoft.com/en-us/microsoft-edge/devtools/console/api#count)
- [Tài liệu của Node.js về `console.count()`](https://nodejs.org/docs/latest/api/console.html#consolecountlabel)
- [Tài liệu của Google Chrome về `console.count()`](https://developer.chrome.com/docs/devtools/console/api/#count)
