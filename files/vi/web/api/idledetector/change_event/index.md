---
title: "IdleDetector: change event"
short-title: change
slug: Web/API/IdleDetector/change_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.IdleDetector.change_event
---

{{securecontext_header}}{{APIRef("Idle Detection API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`change`** của giao diện {{domxref("IdleDetector")}} được kích hoạt khi giá trị của `userState` hoặc `screenState` thay đổi.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("change", (event) => { })

onchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} thông thường.

## Ví dụ

Trong ví dụ dưới đây, callback `change` in trạng thái của `userState` và `screenState` ra console.

```js
idleDetector.addEventListener("change", () => {
  const userState = idleDetector.userState;
  const screenState = idleDetector.screenState;
  console.log(`Idle change: ${userState}, ${screenState}.`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
