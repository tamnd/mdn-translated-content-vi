---
title: "SpeechSynthesisErrorEvent: hàm khởi tạo SpeechSynthesisErrorEvent()"
short-title: SpeechSynthesisErrorEvent()
slug: Web/API/SpeechSynthesisErrorEvent/SpeechSynthesisErrorEvent
page-type: web-api-constructor
browser-compat: api.SpeechSynthesisErrorEvent.SpeechSynthesisErrorEvent
---

{{APIRef("Web Speech API")}}

Hàm khởi tạo **`SpeechSynthesisErrorEvent()`** tạo đối tượng {{domxref("SpeechSynthesisErrorEvent")}} mới.

> [!NOTE]
> Nhà phát triển web thường không cần gọi hàm khởi tạo này, vì trình duyệt tự tạo các đối tượng này khi kích hoạt sự kiện.

## Cú pháp

```js-nolint
new SpeechSynthesisErrorEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và các trình duyệt đặt là `error`.
- `options`
  - : Một đối tượng, _ngoài các thuộc tính được định nghĩa trong {{domxref("SpeechSynthesisEvent/SpeechSynthesisEvent", "SpeechSynthesisEvent()")}}_, có các thuộc tính sau:
    - `error`
      - : Một chuỗi chứa lý do lỗi. Các giá trị có thể là:
        - `canceled`
          - : Lệnh gọi phương thức {{domxref("SpeechSynthesis.cancel")}} đã khiến {{domxref("SpeechSynthesisUtterance")}} bị xóa khỏi hàng đợi trước khi giọng nói bắt đầu.
        - `interrupted`
          - : Lệnh gọi phương thức {{domxref("SpeechSynthesis.cancel")}} đã khiến {{domxref("SpeechSynthesisUtterance")}} bị ngắt sau khi giọng nói bắt đầu nhưng trước khi hoàn thành.
        - `audio-busy`
          - : Hoạt động không thể hoàn thành lúc này vì tác nhân người dùng không thể truy cập thiết bị đầu ra âm thanh (ví dụ: người dùng có thể cần sửa điều này bằng cách đóng ứng dụng khác).
        - `audio-hardware`
          - : Hoạt động không thể hoàn thành lúc này vì tác nhân người dùng không thể xác định thiết bị đầu ra âm thanh (ví dụ: người dùng có thể cần kết nối loa hoặc cấu hình cài đặt hệ thống).
        - `network`
          - : Hoạt động không thể hoàn thành lúc này vì một số giao tiếp mạng cần thiết đã thất bại.
        - `synthesis-unavailable`
          - : Hoạt động không thể hoàn thành lúc này vì không có engine tổng hợp nào khả dụng (ví dụ: người dùng có thể cần cài đặt hoặc cấu hình engine tổng hợp).
        - `synthesis-failed`
          - : Hoạt động thất bại vì engine tổng hợp đã đưa ra lỗi.
        - `language-unavailable`
          - : Không có giọng nói phù hợp nào khả dụng cho ngôn ngữ được đặt trong {{domxref("SpeechSynthesisUtterance.lang")}}. Bạn có thể sử dụng phương thức [`window.speechSynthesis.getVoices()`](/en-US/docs/Web/API/SpeechSynthesis/getVoices) để xác định giọng nói và ngôn ngữ nào được hỗ trợ trong trình duyệt của người dùng.
        - `voice-unavailable`
          - : Giọng nói được đặt trong {{domxref("SpeechSynthesisUtterance.voice")}} không khả dụng.
        - `text-too-long`
          - : Nội dung của thuộc tính {{domxref("SpeechSynthesisUtterance.text")}} quá dài để tổng hợp.
        - `invalid-argument`
          - : Nội dung của thuộc tính {{domxref("SpeechSynthesisUtterance.rate")}}, {{domxref("SpeechSynthesisUtterance.pitch")}} hoặc {{domxref("SpeechSynthesisUtterance.volume")}} không hợp lệ.
        - `not-allowed`
          - : Việc bắt đầu hoạt động không được phép.

### Giá trị trả về

Một đối tượng {{domxref("SpeechSynthesisErrorEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SpeechSynthesisEvent")}}
