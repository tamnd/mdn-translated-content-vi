---
title: "StorageManager: phương thức persisted()"
short-title: persisted()
slug: Web/API/StorageManager/persisted
page-type: web-api-instance-method
browser-compat: api.StorageManager.persisted
---

{{securecontext_header}}{{APIRef("Storage")}} {{AvailableInWorkers}}

Phương thức **`persisted()`** của giao diện {{domxref("StorageManager")}} trả về một {{jsxref('Promise')}} được giải quyết thành `true` nếu bucket lưu trữ của site bạn là persistent.

## Cú pháp

```js-nolint
persisted()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref('Promise')}} được giải quyết thành một {{jsxref('Boolean')}}.

### Ngoại lệ

- `TypeError`
  - : Được ném ra nếu không thể lấy shelf lưu trữ cục bộ. Ví dụ, nếu origin hiện tại là opaque origin hoặc nếu người dùng đã vô hiệu hóa lưu trữ.

## Ví dụ

```js
if (navigator.storage && navigator.storage.persist) {
  navigator.storage.persisted().then((persistent) => {
    if (persistent) {
      console.log("Storage will not be cleared except by explicit user action");
    } else {
      console.log("Storage may be cleared by the UA under storage pressure.");
    }
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
