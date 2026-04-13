---
title: "SpeechRecognitionErrorEvent: thuộc tính error"
short-title: error
slug: Web/API/SpeechRecognitionErrorEvent/error
page-type: web-api-instance-property
browser-compat: api.SpeechRecognitionErrorEvent.error
---

{{APIRef("Web Speech API")}}

Thuộc tính chỉ đọc **`error`** của giao diện {{domxref("SpeechRecognitionErrorEvent")}} trả về loại lỗi được phát sinh.

## Giá trị

Giá trị liệt kê đại diện cho loại lỗi. Các giá trị có thể bao gồm:

- `aborted`
  - : Đầu vào giọng nói đã bị hủy bỏ theo một cách nào đó, có thể do hành vi cụ thể của user-agent như nút người dùng có thể nhấn để hủy đầu vào giọng nói.
- `audio-capture`
  - : Capture âm thanh thất bại.
- `bad-grammar` {{deprecated_inline}} {{non-standard_inline}}
  - : Có lỗi trong ngữ pháp nhận dạng giọng nói hoặc thẻ ngữ nghĩa, hoặc định dạng ngữ pháp hoặc định dạng thẻ ngữ nghĩa được chọn không được hỗ trợ.
    > [!NOTE]
    > Lỗi này không còn là một phần của thông số kỹ thuật Web Speech API; khái niệm ngữ pháp đã bị xóa khỏi Web Speech API. Các tính năng liên quan vẫn còn trong thông số kỹ thuật và vẫn được nhận biết bởi các trình duyệt hỗ trợ để tương thích ngược, nhưng chúng không có tác dụng đối với dịch vụ nhận dạng giọng nói.
- `language-not-supported`
  - : User agent không hỗ trợ ngôn ngữ được chỉ định trong thuộc tính [`lang`](/en-US/docs/Web/API/SpeechRecognition/lang) của đối tượng {{domxref("SpeechRecognition")}}.
- `network`
  - : Kết nối mạng cần thiết để hoàn thành nhận dạng thất bại.
- `no-speech`
  - : Không phát hiện giọng nói.
- `not-allowed`
  - : User agent không cho phép bất kỳ đầu vào giọng nói nào vì lý do bảo mật, quyền riêng tư hoặc sở thích người dùng.
- `phrases-not-supported`
  - : Mô hình nhận dạng giọng nói không hỗ trợ {{domxref("SpeechRecognition.phrases", "phrases")}} cho [contextual biasing](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#contextual_biasing_in_speech_recognition).
- `service-not-allowed`
  - : User agent không cho phép dịch vụ nhận dạng giọng nói được yêu cầu, vì user agent không hỗ trợ nó hoặc vì lý do bảo mật, quyền riêng tư hoặc sở thích người dùng.

## Ví dụ

```js
const recognition = new SpeechRecognition();

recognition.onerror = (event) => {
  console.log(`Speech recognition error detected: ${event.error}`);
  console.log(`Additional information: ${event.message}`);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
