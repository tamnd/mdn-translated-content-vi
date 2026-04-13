---
title: "SpeechSynthesisErrorEvent: thuộc tính error"
short-title: error
slug: Web/API/SpeechSynthesisErrorEvent/error
page-type: web-api-instance-property
browser-compat: api.SpeechSynthesisErrorEvent.error
---

{{APIRef("Web Speech API")}}

Thuộc tính **`error`** của giao diện
{{domxref("SpeechSynthesisErrorEvent")}} trả về mã lỗi cho biết điều gì đã xảy ra không ổn với một lần thử tổng hợp giọng nói.

## Giá trị

Một chuỗi chứa lý do lỗi. Các giá trị có thể là:

- `canceled`
  - : Lệnh gọi phương thức {{domxref("SpeechSynthesis.cancel")}} đã khiến
    {{domxref("SpeechSynthesisUtterance")}} bị xóa khỏi hàng đợi trước khi
    nó bắt đầu được nói.
- `interrupted`
  - : Lệnh gọi phương thức {{domxref("SpeechSynthesis.cancel")}} đã khiến
    {{domxref("SpeechSynthesisUtterance")}} bị ngắt sau khi nó bắt đầu được
    nói và trước khi hoàn thành.
- `audio-busy`
  - : Hoạt động không thể hoàn thành lúc này vì tác nhân người dùng không thể
    truy cập thiết bị đầu ra âm thanh (ví dụ: người dùng có thể cần sửa điều này bằng cách
    đóng ứng dụng khác).
- `audio-hardware`
  - : Hoạt động không thể hoàn thành lúc này vì tác nhân người dùng không thể
    xác định thiết bị đầu ra âm thanh (ví dụ: người dùng có thể cần kết nối loa
    hoặc cấu hình cài đặt hệ thống).
- `network`
  - : Hoạt động không thể hoàn thành lúc này vì một số giao tiếp mạng
    cần thiết đã thất bại.
- `synthesis-unavailable`
  - : Hoạt động không thể hoàn thành lúc này vì không có engine tổng hợp
    nào khả dụng (ví dụ: người dùng có thể cần cài đặt hoặc cấu hình engine tổng hợp).
- `synthesis-failed`
  - : Hoạt động thất bại vì engine tổng hợp đã đưa ra lỗi.
- `language-unavailable`
  - : Không có giọng nói phù hợp nào khả dụng cho ngôn ngữ được đặt trong
    {{domxref("SpeechSynthesisUtterance.lang")}}. Bạn có thể sử dụng phương thức [`window.speechSynthesis.getVoices()`](/en-US/docs/Web/API/SpeechSynthesis/getVoices) để xác định giọng nói và ngôn ngữ nào được hỗ trợ trong trình duyệt của người dùng.
- `voice-unavailable`
  - : Giọng nói được đặt trong {{domxref("SpeechSynthesisUtterance.voice")}} không khả dụng.
- `text-too-long`
  - : Nội dung của thuộc tính {{domxref("SpeechSynthesisUtterance.text")}} quá
    dài để tổng hợp.
- `invalid-argument`
  - : Nội dung của thuộc tính {{domxref("SpeechSynthesisUtterance.rate")}},
    {{domxref("SpeechSynthesisUtterance.pitch")}} hoặc
    {{domxref("SpeechSynthesisUtterance.volume")}} không hợp lệ.
- `not-allowed`
  - : Việc bắt đầu hoạt động không được phép.

## Ví dụ

```js
const synth = window.speechSynthesis;

const inputForm = document.querySelector("form");
const inputTxt = document.querySelector("input");
const voiceSelect = document.querySelector("select");

const voices = synth.getVoices();

// …

inputForm.onsubmit = (event) => {
  event.preventDefault();

  const utterThis = new SpeechSynthesisUtterance(inputTxt.value);
  const selectedOption =
    voiceSelect.selectedOptions[0].getAttribute("data-name");
  for (const voice of voices) {
    if (voice.name === selectedOption) {
      utterThis.voice = voice;
    }
  }

  synth.speak(utterThis);

  utterThis.onerror = (event) => {
    console.error(`Đã xảy ra lỗi với tổng hợp giọng nói: ${event.error}`);
  };

  inputTxt.blur();
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
