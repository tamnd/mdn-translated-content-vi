---
title: "OfflineAudioCompletionEvent: hàm khởi tạo OfflineAudioCompletionEvent()"
short-title: OfflineAudioCompletionEvent()
slug: Web/API/OfflineAudioCompletionEvent/OfflineAudioCompletionEvent
page-type: web-api-constructor
browser-compat: api.OfflineAudioCompletionEvent.OfflineAudioCompletionEvent
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`OfflineAudioCompletionEvent()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo một đối tượng {{domxref("OfflineAudioCompletionEvent")}} mới.

> [!NOTE]
> Bạn thường không cần sử dụng hàm khởi tạo này theo cách thủ công.
> Các sự kiện `OfflineAudioCompletionEvent` được phân phối đến các phiên bản {{domxref("OfflineAudioContext")}} vì lý do kế thừa.

## Cú pháp

```js-nolint
new OfflineAudioCompletionEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện. Phân biệt chữ hoa chữ thường và các trình duyệt đặt nó là `complete`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `renderedBuffer`
      - : {{domxref("AudioBuffer")}} đã kết xuất chứa dữ liệu âm thanh.

### Giá trị trả về

Một đối tượng {{domxref("OfflineAudioCompletionEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
