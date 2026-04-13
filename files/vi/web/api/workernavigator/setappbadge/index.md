---
title: "WorkerNavigator: phương thức setAppBadge()"
short-title: setAppBadge()
slug: Web/API/WorkerNavigator/setAppBadge
page-type: web-api-instance-method
browser-compat: api.WorkerNavigator.setAppBadge
---

{{APIRef("Web Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers("worker")}}

Phương thức **`setAppBadge()`** của giao diện {{domxref("WorkerNavigator")}} đặt huy hiệu trên biểu tượng được liên kết với ứng dụng này và trả về một {{jsxref("Promise")}} được giải quyết thành {{jsxref("undefined")}}.

## Cú pháp

```js-nolint
setAppBadge()
setAppBadge(contents)
```

### Tham số

- `contents` {{optional_inline}}
  - : Nội dung huy hiệu.

### Giá trị trả về

Một {{jsxref("Promise")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
