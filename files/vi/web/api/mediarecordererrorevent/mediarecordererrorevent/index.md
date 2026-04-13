---
title: "MediaRecorderErrorEvent: hàm khởi tạo MediaRecorderErrorEvent()"
short-title: MediaRecorderErrorEvent()
slug: Web/API/MediaRecorderErrorEvent/MediaRecorderErrorEvent
page-type: web-api-constructor
status:
  - deprecated
  - non-standard
browser-compat: api.MediaRecorderErrorEvent.MediaRecorderErrorEvent
---

{{APIRef("MediaStream Recording")}}{{Deprecated_Header}}{{Non-standard_Header}}

Hàm khởi tạo **`MediaRecorderErrorEvent()`** tạo đối tượng {{domxref("MediaRecorderErrorEvent")}} mới đại diện cho lỗi đã xảy ra trong quá trình ghi phương tiện bởi [MediaStream Recording API](/en-US/docs/Web/API/MediaStream_Recording_API).

> [!NOTE]
> Nói chung, bạn sẽ không tự tạo chúng; chúng được gửi đến triển khai {{domxref("MediaRecorder.error_event", "onerror")}} của bạn khi có lỗi xảy ra trong khi ghi phương tiện.

## Cú pháp

```js-nolint
new MediaRecorderErrorEvent(type, options)
```

### Tham số

- `type`
  - : Chuỗi chứa tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt luôn đặt nó thành `error`.
- `options`
  - : Một đối tượng, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `error`
      - : {{domxref("DOMException")}} mô tả lỗi đã xảy ra. Thuộc tính {{domxref("DOMException.name", "name")}} của đối tượng này nên cho biết tên của lỗi đã xảy ra. Các trường khác có thể có hoặc không có.

> [!NOTE]
> Một số {{Glossary("user agent", "user agents")}} thêm vào đối tượng `error` các thuộc tính khác cung cấp thông tin như stack dump, tên tệp JavaScript và số dòng nơi lỗi xảy ra, và các hỗ trợ debug khác, nhưng bạn không nên dựa vào thông tin này trong môi trường sản xuất.

### Giá trị trả về

Đối tượng {{domxref("MediaRecorderErrorEvent")}} mới.

## Thông số kỹ thuật

Tính năng này không còn là một phần của bất kỳ đặc tả nào và không còn theo hướng trở thành tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}
