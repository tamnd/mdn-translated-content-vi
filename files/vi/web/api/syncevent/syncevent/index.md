---
title: "SyncEvent: hàm khởi tạo SyncEvent()"
short-title: SyncEvent()
slug: Web/API/SyncEvent/SyncEvent
page-type: web-api-constructor
browser-compat: api.SyncEvent.SyncEvent
---

{{APIRef("Background Sync")}}{{AvailableInWorkers("service")}}

Hàm khởi tạo **`SyncEvent()`** tạo đối tượng {{domxref("SyncEvent")}} mới.

## Cú pháp

```js-nolint
new SyncEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt luôn đặt nó thành `sync`.
- `options`
  - : Một đối tượng mà, ngoài các thuộc tính được định nghĩa trong {{domxref("ExtendableEvent/ExtendableEvent", "ExtendableEvent()")}}, có thể có các thuộc tính sau:
    - `tag`
      - : Mã định danh duy nhất do nhà phát triển định nghĩa cho `SyncEvent` này.
    - `lastChance` {{optional_inline}}
      - : Một giá trị boolean cho biết tác nhân người dùng sẽ không thực hiện thêm các lần thử đồng bộ hóa sau lần thử hiện tại.
        Mặc định là `false`.

### Giá trị trả về

Một đối tượng {{domxref("SyncEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
