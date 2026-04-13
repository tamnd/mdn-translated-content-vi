---
title: "WindowClient: navigate() method"
short-title: navigate()
slug: Web/API/WindowClient/navigate
page-type: web-api-instance-method
browser-compat: api.WindowClient.navigate
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Phương thức **`navigate()`** của giao diện {{domxref("WindowClient")}} tải một URL được chỉ định vào trang client được kiểm soát, sau đó trả về một {{jsxref("Promise")}} được giải quyết thành đối tượng {{domxref("WindowClient")}} hiện có.

## Cú pháp

```js-nolint
navigate(url)
```

### Tham số

- `url`
  - : Vị trí để điều hướng đến.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết thành {{domxref("WindowClient")}} hiện có nếu URL có cùng nguồn gốc với service worker, hoặc {{jsxref("Operators/null", "null")}} nếu ngược lại.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
