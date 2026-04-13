---
title: "IdleDetector: userState property"
short-title: userState
slug: Web/API/IdleDetector/userState
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.IdleDetector.userState
---

{{securecontext_header}}{{APIRef("Idle Detection API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`userState`** của giao diện {{domxref("IdleDetector")}} trả về một chuỗi cho biết người dùng có tương tác với thiết bị kể từ lần gọi `start()` hay không.

## Giá trị

Một trong hai giá trị `"active"` hoặc `"idle"` nếu {{domxref("IdleDetector.start()")}} đã được gọi, hoặc `null` trong trường hợp ngược lại.

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
