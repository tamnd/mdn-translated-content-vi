---
title: "console: phương thức tĩnh trace()"
short-title: trace()
slug: Web/API/console/trace_static
page-type: web-api-static-method
browser-compat: api.console.trace_static
---

{{APIRef("Console API")}} {{AvailableInWorkers}}

Phương thức tĩnh **`console.trace()`** xuất một dấu vết ngăn xếp ra console.

> [!NOTE]
> Trong một số trình duyệt, `console.trace()` cũng có thể xuất chuỗi các lời gọi và sự kiện bất đồng bộ dẫn đến `console.trace()` hiện tại nhưng không nằm trên ngăn xếp lời gọi, nhằm giúp xác định nguồn gốc của vòng lặp đánh giá sự kiện hiện tại.

Xem [Dấu vết ngăn xếp](/en-US/docs/Web/API/console#stack_traces) trong tài liệu của {{domxref("console")}} để biết chi tiết và ví dụ.

## Cú pháp

```js-nolint
console.trace()
console.trace(object1, /* …, */ objectN)
```

### Tham số

- `objects` {{optional_inline}}
  - : Không hoặc nhiều đối tượng sẽ được xuất ra console cùng với dấu vết. Chúng được ghép và định dạng theo cùng cách như khi được truyền vào phương thức {{domxref("console/log_static", "console.log()")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
function foo() {
  function bar() {
    console.trace();
  }
  bar();
}

foo();
```

Trong console, dấu vết sau sẽ được hiển thị:

```plain
bar
foo
<anonymous>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tài liệu của Microsoft Edge về `console.trace()`](https://learn.microsoft.com/en-us/microsoft-edge/devtools/console/api#trace)
- [Tài liệu của Node.js về `console.trace()`](https://nodejs.org/docs/latest/api/console.html#consoletracemessage-args)
- [Tài liệu của Google Chrome về `console.trace()`](https://developer.chrome.com/docs/devtools/console/api/#trace)
