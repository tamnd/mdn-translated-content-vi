---
title: "StorageEvent: phương thức initStorageEvent()"
short-title: initStorageEvent()
slug: Web/API/StorageEvent/initStorageEvent
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.StorageEvent.initStorageEvent
---

{{ApiRef("Web Storage API")}}{{deprecated_header}}

Phương thức **`StorageEvent.initStorageEvent()`** được dùng để khởi tạo giá trị của một {{ domxref("StorageEvent") }}.

## Cú pháp

```js-nolint
initStorageEvent(type)
initStorageEvent(type, canBubble)
initStorageEvent(type, canBubble, cancelable)
initStorageEvent(type, canBubble, cancelable, key)
initStorageEvent(type, canBubble, cancelable, key, oldValue)
initStorageEvent(type, canBubble, cancelable, key, oldValue, newValue)
initStorageEvent(type, canBubble, cancelable, key, oldValue, newValue, url)
initStorageEvent(type, canBubble, cancelable, key, oldValue, newValue, url, storageArea)
```

### Tham số

- `typeArg`
  - : Tên của sự kiện.
- `canBubble` {{optional_inline}}
  - : Một giá trị boolean cho biết sự kiện có nổi lên qua DOM hay không.
- `cancelable` {{optional_inline}}
  - : Một giá trị boolean cho biết sự kiện có thể bị hủy hay không.
- `key` {{optional_inline}}
  - : Khóa mà giá trị của nó đang thay đổi do sự kiện này.
- `oldValue` {{optional_inline}}
  - : Giá trị cũ của khóa.
- `newValue` {{optional_inline}}
  - : Giá trị mới của khóa.
- `url` {{optional_inline}}
  - : URL của tài liệu khởi tạo thay đổi.
- `storageArea` {{optional_inline}}
  - : Đối tượng {{DOMxRef("Storage")}} đại diện cho vùng lưu trữ mà sự kiện này xảy ra trên đó.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Web Storage API", "", "", "nocode")}}
- Constructor nên dùng thay cho phương thức deprecated này: {{domxref("StorageEvent.StorageEvent", "StorageEvent()")}}.
