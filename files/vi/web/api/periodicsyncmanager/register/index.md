---
title: "PeriodicSyncManager: register() method"
short-title: register()
slug: Web/API/PeriodicSyncManager/register
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PeriodicSyncManager.register
---

{{APIRef("Periodic Background Sync")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`register()`** của giao diện {{domxref("PeriodicSyncManager")}} đăng ký yêu cầu đồng bộ hóa định kỳ với trình duyệt với tag và tùy chọn được chỉ định. Nó trả về {{jsxref('Promise')}} phân giải khi đăng ký hoàn tất.

## Cú pháp

```js-nolint
register(tag, options)
```

### Tham số

- `tag`
  - : Định danh {{jsxref('String')}} duy nhất.
- `options` {{optional_inline}}
  - : Một {{jsxref('Object')}} chứa dữ liệu tùy chọn sau:
    - `minInterval`
      - : Khoảng thời gian tối thiểu, tính bằng mili giây, mà tại đó đồng bộ hóa định kỳ sẽ xảy ra.

### Giá trị trả về

Trả về {{jsxref("Promise")}} phân giải với {{jsxref('undefined')}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu không có {{domxref('ServiceWorker')}} đang hoạt động.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được trả về nếu quyền cho đồng bộ hóa định kỳ nền không được cấp.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Được trả về nếu cửa sổ đang hoạt động không phải là cửa sổ chính (không thuộc loại `auxiliary` hoặc `top-level`).

## Ví dụ

Hàm bất đồng bộ sau đăng ký một periodic background sync với khoảng thời gian tối thiểu một ngày từ ngữ cảnh duyệt web:

```js
async function registerPeriodicNewsCheck() {
  const registration = await navigator.serviceWorker.ready;
  try {
    await registration.periodicSync.register("fetch-news", {
      minInterval: 24 * 60 * 60 * 1000,
    });
  } catch {
    console.log("Periodic Sync could not be registered!");
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Richer offline experiences with the Periodic Background Sync API](https://developer.chrome.com/docs/capabilities/periodic-background-sync)
