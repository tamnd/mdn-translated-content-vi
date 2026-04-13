---
title: "BlobEvent: Bộ hàm dựng BlobEvent()"
short-title: BlobEvent()
slug: Web/API/BlobEvent/BlobEvent
page-type: web-api-constructor
browser-compat: api.BlobEvent.BlobEvent
---

{{APIRef("MediaStream Recording")}}

Bộ hàm dựng **`BlobEvent()`** trả về một đối tượng {{domxref("BlobEvent")}} mới được tạo, có liên kết với một {{domxref("Blob")}}.

## Cú pháp

```js-nolint
new BlobEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Chuỗi này phân biệt chữ hoa chữ thường và trình duyệt luôn đặt nó là `dataavailable`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `data`
      - : {{domxref("Blob")}} liên kết với sự kiện.
    - `timecode` {{optional_inline}}
      - : Một {{domxref("DOMHighResTimeStamp")}} sẽ được dùng để khởi tạo sự kiện blob.

### Giá trị trả về

Một đối tượng {{domxref("BlobEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("BlobEvent")}} mà nó thuộc về.
