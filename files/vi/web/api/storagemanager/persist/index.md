---
title: "StorageManager: phương thức persist()"
short-title: persist()
slug: Web/API/StorageManager/persist
page-type: web-api-instance-method
browser-compat: api.StorageManager.persist
---

{{securecontext_header}}{{APIRef("Storage")}}

Phương thức **`persist()`** của giao diện {{domxref("StorageManager")}} yêu cầu quyền dùng bộ nhớ lưu trữ bền vững, và trả về một {{jsxref('Promise')}} được giải quyết thành `true` nếu quyền được cấp và bucket mode là persistent, và `false` trong các trường hợp khác. Trình duyệt có thể chấp nhận hoặc từ chối yêu cầu này, tùy theo các quy tắc riêng của từng trình duyệt. (Để biết thêm chi tiết, xem hướng dẫn [Storage quotas and eviction criteria](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria#does_browser-stored_data_persist).)

> [!NOTE]
> Phương thức này không khả dụng trong [Web Workers](/en-US/docs/Web/API/Web_Workers_API), mặc dù giao diện {{domxref("StorageManager")}} thì có.

## Cú pháp

```js-nolint
persist()
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
  navigator.storage.persist().then((persistent) => {
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
