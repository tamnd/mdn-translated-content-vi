---
title: "BackgroundFetchManager: phương thức getIds()"
short-title: getIds()
slug: Web/API/BackgroundFetchManager/getIds
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BackgroundFetchManager.getIds
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`getIds()`** của giao diện {{domxref("BackgroundFetchManager")}} trả về mã nhận dạng của tất cả background fetch đã đăng ký.

## Cú pháp

```js-nolint
getIds()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết bằng một {{jsxref('Array')}} các {{jsxref('String', 'chuỗi')}}.

### Ngoại lệ

Không có.

## Ví dụ

Ví dụ sau cho thấy cách truy xuất mã nhận dạng của tất cả background fetch đã đăng ký. Khi có một [service worker](/en-US/docs/Web/API/ServiceWorker) đang hoạt động, hãy dùng thuộc tính {{domxref('ServiceWorkerRegistration.backgroundFetch')}} để truy cập đối tượng `BackgroundFetchManager` và gọi phương thức `getIds()` của nó.

```js
navigator.serviceWorker.ready.then(async (swReg) => {
  const ids = await swReg.backgroundFetch.getIds();
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
