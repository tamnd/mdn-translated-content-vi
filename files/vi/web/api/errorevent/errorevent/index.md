---
title: "ErrorEvent: ErrorEvent() constructor"
short-title: ErrorEvent()
slug: Web/API/ErrorEvent/ErrorEvent
page-type: web-api-constructor
browser-compat: api.ErrorEvent.ErrorEvent
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Hàm khởi tạo **`ErrorEvent()`** tạo một đối tượng {{domxref("ErrorEvent")}} mới.

## Cú pháp

```js-nolint
new ErrorEvent(type)
new ErrorEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện. Phân biệt chữ hoa chữ thường.
- `options` {{optional_inline}}
  - : Một đối tượng, ngoài các thuộc tính được xác định trong {{domxref("Event/Event", "Event()")}}, có thể có các thuộc tính sau:
    - `message` {{optional_inline}}
      - : Một chuỗi chứa thông báo lỗi có thể đọc được mô tả sự cố.
    - `filename` {{optional_inline}}
      - : Một chuỗi chứa tên của tệp script trong đó xảy ra lỗi.
    - `lineno` {{optional_inline}}
      - : Một số nguyên chứa số dòng của tệp script nơi xảy ra lỗi.
    - `colno` {{optional_inline}}
      - : Một số nguyên chứa số cột của tệp script nơi xảy ra lỗi.
    - `error` {{optional_inline}}
      - : Một giá trị JavaScript, chẳng hạn {{jsxref("Error")}} hoặc {{domxref("DOMException")}}, đại diện cho lỗi liên kết với sự kiện này.

### Giá trị trả về

Một đối tượng {{domxref("ErrorEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
