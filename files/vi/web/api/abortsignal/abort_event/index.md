---
title: "AbortSignal: sự kiện abort"
short-title: abort
slug: Web/API/AbortSignal/abort_event
page-type: web-api-event
browser-compat: api.AbortSignal.abort_event
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Sự kiện **`abort`** của {{domxref("AbortSignal")}} được kích hoạt khi yêu cầu liên kết bị hủy, tức là bằng cách dùng {{domxref("AbortController.abort()")}}.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("abort", (event) => { })

onabort = (event) => { }
```

## Kiểu sự kiện

Một {{DOMxRef("Event")}} tổng quát không có thuộc tính bổ sung nào.

## Ví dụ

Trong các đoạn mã sau, chúng ta tạo một đối tượng `AbortController` mới và lấy {{domxref("AbortSignal")}} của nó, có sẵn qua thuộc tính `signal`. Sau đó, chúng ta kiểm tra xem tín hiệu đã bị hủy hay chưa bằng một thuộc tính trình xử lý sự kiện.

Bạn có thể phát hiện sự kiện `abort` bằng phương thức [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener):

```js
const controller = new AbortController();
const signal = controller.signal;

signal.addEventListener("abort", () => {
  console.log("Request aborted");
});
```

Hoặc dùng thuộc tính trình xử lý sự kiện `onabort`:

```js
const controller = new AbortController();
const signal = controller.signal;

signal.onabort = () => {
  console.log("Request aborted");
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
