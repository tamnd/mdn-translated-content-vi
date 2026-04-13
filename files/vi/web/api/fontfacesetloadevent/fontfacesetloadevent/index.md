---
title: "FontFaceSetLoadEvent: FontFaceSetLoadEvent() constructor"
short-title: FontFaceSetLoadEvent()
slug: Web/API/FontFaceSetLoadEvent/FontFaceSetLoadEvent
page-type: web-api-constructor
browser-compat: api.FontFaceSetLoadEvent.FontFaceSetLoadEvent
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Hàm khởi tạo **`FontFaceSetLoadEvent()`** tạo đối tượng {{domxref("FontFaceSetLoadEvent")}} mới, được kích hoạt bất cứ khi nào {{domxref("FontFaceSet")}} tải.

## Cú pháp

```js-nolint
new FontFaceSetLoadEvent(type)
new FontFaceSetLoadEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Nó phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt nó thành `loading`, `loadingdone`, hoặc `loadingerror`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được xác định trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `fontfaces` {{optional_inline}}
      - : Một mảng các phiên bản {{domxref("FontFace")}}. Mặc định là mảng rỗng.

### Giá trị trả về

Đối tượng {{domxref("FontFaceSetLoadEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
