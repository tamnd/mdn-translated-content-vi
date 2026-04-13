---
title: "BackgroundFetchRegistration: abort() method"
short-title: abort()
slug: Web/API/BackgroundFetchRegistration/abort
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BackgroundFetchRegistration.abort
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`abort()`** của giao diện {{domxref("BackgroundFetchRegistration")}} hủy một tác vụ tìm nạp nền đang hoạt động.

## Cú pháp

```js-nolint
abort()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành `true` nếu việc tìm nạp được hủy thành công.

## Ví dụ

Dùng `abort()` để chấm dứt một tác vụ tìm nạp nền đang diễn ra.

```js
bgFetch.abort();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
