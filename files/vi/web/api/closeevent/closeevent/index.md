---
title: "CloseEvent: hàm tạo CloseEvent()"
short-title: CloseEvent()
slug: Web/API/CloseEvent/CloseEvent
page-type: web-api-constructor
browser-compat: api.CloseEvent.CloseEvent
---

{{APIRef("Websockets API")}}{{AvailableInWorkers}}

Hàm tạo **`CloseEvent()`** tạo một đối tượng {{domxref("CloseEvent")}} mới.

## Cú pháp

```js-nolint
new CloseEvent(type)
new CloseEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên sự kiện.
    Giá trị này phân biệt chữ hoa chữ thường và trình duyệt luôn đặt nó thành `close`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, còn có các thuộc tính sau:
    - `wasClean` {{optional_inline}}
      - : Một giá trị boolean cho biết kết nối có được đóng sạch sẽ hay không. Mặc định là `false`.
    - `code` {{optional_inline}}
      - : Một số nguyên biểu diễn _mã đóng kết nối_ do máy chủ gửi. Mặc định là `0`.
    - `reason` {{optional_inline}}
      - : Một chuỗi chứa lý do dễ đọc cho con người mô tả tại sao máy chủ đóng kết nối. Mặc định là `''`

### Giá trị trả về

Một đối tượng {{domxref("CloseEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CloseEvent")}}, giao diện của các đối tượng mà hàm tạo này tạo ra.
