---
title: "RTCDTMFToneChangeEvent: hàm khởi tạo RTCDTMFToneChangeEvent()"
short-title: RTCDTMFToneChangeEvent()
slug: Web/API/RTCDTMFToneChangeEvent/RTCDTMFToneChangeEvent
page-type: web-api-constructor
browser-compat: api.RTCDTMFToneChangeEvent.RTCDTMFToneChangeEvent
---

{{APIRef("WebRTC")}}

Hàm khởi tạo **`RTCDTMFToneChangeEvent()`** tạo một đối tượng {{domxref("RTCDTMFToneChangeEvent")}} mới.

## Cú pháp

```js-nolint
new RTCDTMFToneChangeEvent(type)
new RTCDTMFToneChangeEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt là `tonechange`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `tone` {{optional_inline}}
      - : Một chuỗi chứa một ký tự âm DTMF duy nhất vừa mới bắt đầu phát, hoặc một chuỗi rỗng (`""`) để chỉ ra rằng âm trước đó đã dừng phát. Mặc định là `""`.
        Xem [Ký tự âm](/en-US/docs/Web/API/RTCDTMFSender/toneBuffer#tone_buffer_format) để biết chi tiết về các ký tự được phép.

### Giá trị trả về

Một đối tượng {{domxref("RTCDTMFToneChangeEvent")}} mới, được cấu hình như được chỉ định trong các tùy chọn đã cung cấp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Sử dụng DTMF với WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_DTMF)
- Mục tiêu thường gặp của nó: {{domxref("RTCDTMFSender")}}.
