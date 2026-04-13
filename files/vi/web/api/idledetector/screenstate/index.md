---
title: "IdleDetector: screenState property"
short-title: screenState
slug: Web/API/IdleDetector/screenState
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.IdleDetector.screenState
---

{{securecontext_header}}{{APIRef("Idle Detection API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`screenState`** của giao diện {{domxref("IdleDetector")}} trả về một chuỗi cho biết màn hình có bị khóa hay không, một trong hai giá trị `"locked"` hoặc `"unlocked"`.

## Giá trị

Một trong hai giá trị `"locked"` hoặc `"unlocked"` nếu {{domxref("IdleDetector.start()")}} đã được gọi, hoặc `null` trong trường hợp ngược lại.

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
