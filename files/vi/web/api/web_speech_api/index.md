---
title: Web Speech API
slug: Web/API/Web_Speech_API
page-type: web-api-overview
browser-compat:
  - api.SpeechRecognition
  - api.SpeechSynthesis
---

{{DefaultAPISidebar("Web Speech API")}}

**Web Speech API** cho phép bạn kết hợp dữ liệu giọng nói vào các ứng dụng web. Web Speech API có hai phần: `SpeechSynthesis` (Chuyển văn bản thành giọng nói) và `SpeechRecognition` (Nhận dạng giọng nói không đồng bộ.)

## Khái niệm và cách sử dụng bài phát biểu trên web

Web Speech API cho phép các ứng dụng web xử lý dữ liệu giọng nói. Nó có hai thành phần:

- Tính năng nhận dạng giọng nói được truy cập thông qua giao diện {{domxref("SpeechRecognition")}}, cung cấp khả năng nhận dạng ngữ cảnh giọng nói từ nguồn âm thanh và cho phép ứng dụng của bạn phản hồi phù hợp.
  Nói chung, bạn sử dụng hàm tạo của giao diện để tạo một đối tượng {{domxref("SpeechRecognition")}} mới. Đối tượng này cung cấp một số trình xử lý sự kiện để phát hiện khi có giọng nói đến từ micrô của thiết bị (hoặc từ rãnh âm thanh). Bạn có thể chỉ định xem bạn muốn nhận dạng giọng nói sử dụng dịch vụ được cung cấp bởi nền tảng của người dùng (mặc định) hay được thực hiện [cục bộ trong trình duyệt](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#on-device_speech_recognition).
- Việc tổng hợp giọng nói được truy cập thông qua giao diện {{domxref("SpeechSynthesis")}}, một thành phần chuyển văn bản thành giọng nói cho phép các chương trình đọc nội dung văn bản của chúng (thông thường thông qua bộ tổng hợp giọng nói mặc định của thiết bị.) Các loại giọng nói khác nhau được thể hiện bằng các đối tượng {{domxref("SpeechSynthesisVoice")}} và các phần khác nhau của văn bản mà bạn muốn được nói sẽ được thể hiện bằng các đối tượng {{domxref("SpeechSynthesisUtterance")}}.
  Bạn có thể đọc những điều này bằng cách chuyển chúng tới phương thức {{domxref("SpeechSynthesis.speak()")}}.

Để biết thêm chi tiết về cách sử dụng các tính năng này, hãy xem [Sử dụng Web Speech API](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API).

## Web Speech API Giao diện

### Nhận dạng giọng nói

- {{domxref("SpeechRecognition")}}
  - : Giao diện điều khiển cho dịch vụ nhận dạng; việc này cũng xử lý {{domxref("SpeechRecognitionEvent")}} được gửi từ dịch vụ nhận dạng.
- {{domxref("SpeechRecognitionAlternative")}}
  - : Đại diện cho một từ duy nhất đã được dịch vụ nhận dạng giọng nói nhận dạng.
- {{domxref("SpeechRecognitionErrorEvent")}}
  - : Thể hiện các thông báo lỗi từ dịch vụ nhận dạng.
- {{domxref("SpeechRecognitionEvent")}}
  - : Đối tượng sự kiện cho các sự kiện {{domxref("SpeechRecognition.result_event", "result")}} và {{domxref("SpeechRecognition.nomatch_event", "nomatch")}} và chứa tất cả dữ liệu liên quan đến kết quả nhận dạng giọng nói tạm thời hoặc cuối cùng.
- {{domxref("SpeechRecognitionPhrase")}}
  - : Biểu thị một cụm từ có thể được chuyển vào công cụ nhận dạng giọng nói để sử dụng cho [xu hướng theo ngữ cảnh](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#contextual_biasing_in_speech_recognition).
- {{domxref("SpeechRecognitionResult")}}
  - : Biểu thị một kết quả nhận dạng phù hợp duy nhất, có thể chứa nhiều đối tượng {{domxref("SpeechRecognitionAlternative")}}.
- {{domxref("SpeechRecognitionResultList")}}
  - : Đại diện cho một danh sách các đối tượng {{domxref("SpeechRecognitionResult")}}, hoặc một đối tượng duy nhất nếu kết quả được ghi lại ở chế độ {{domxref("SpeechRecognition.continuous","continuous")}}.

### Tổng hợp giọng nói

- {{domxref("SpeechSynthesis")}}
  - : Giao diện điều khiển cho dịch vụ thoại; điều này có thể được sử dụng để truy xuất thông tin về giọng nói tổng hợp có sẵn trên thiết bị, bắt đầu và tạm dừng giọng nói cũng như các lệnh khác.
- {{domxref("SpeechSynthesisErrorEvent")}}
  - : Chứa thông tin về bất kỳ lỗi nào xảy ra trong khi xử lý các đối tượng {{domxref("SpeechSynthesisUtterance")}} trong dịch vụ giọng nói.
- {{domxref("SpeechSynthesisEvent")}}
  - : Chứa thông tin về trạng thái hiện tại của các đối tượng {{domxref("SpeechSynthesisUtterance")}} đã được xử lý trong dịch vụ giọng nói.
- {{domxref("SpeechSynthesisUtterance")}}
  - : Thể hiện yêu cầu phát biểu.
    Nó chứa nội dung mà dịch vụ giọng nói nên đọc và thông tin về cách đọc nội dung đó (ví dụ: ngôn ngữ, cao độ và âm lượng.)
- {{domxref("SpeechSynthesisVoice")}}
  - : Thể hiện giọng nói mà hệ thống hỗ trợ.
    Mỗi `SpeechSynthesisVoice` có dịch vụ giọng nói tương ứng riêng bao gồm thông tin về ngôn ngữ, tên và URI.
- {{domxref("Window.speechSynthesis")}}
  - : Được chỉ định như một phần của giao diện `[NoInterfaceObject]` có tên là `SpeechSynthesisGetter`, và được triển khai bởi đối tượng `Window`, thuộc tính `speechSynthesis` cung cấp quyền truy cập vào bộ điều khiển {{domxref("SpeechSynthesis")}} và do đó là điểm khởi đầu cho chức năng tổng hợp giọng nói.

### Giao diện không dùng nữa

Khái niệm ngữ pháp đã bị loại bỏ khỏi Web Speech API. Các tính năng liên quan vẫn còn trong thông số kỹ thuật và vẫn được các trình duyệt hỗ trợ công nhận về khả năng tương thích ngược nhưng chúng không ảnh hưởng đến các dịch vụ nhận dạng giọng nói.

- {{domxref("SpeechGrammar")}} {{deprecated_inline}}
  - : Biểu thị các từ hoặc mẫu từ để dịch vụ nhận dạng nhận dạng.
- {{domxref("SpeechGrammarList")}} {{deprecated_inline}}
  - : Đại diện cho danh sách các đối tượng {{domxref("SpeechGrammar")}}.

## Lỗi

Để biết thông tin về các lỗi được báo cáo bởi Speech API (ví dụ: `"language-not-supported"` và `"language-unavailable"`), hãy xem tài liệu sau:

- [Thuộc tính `error` của đối tượng `SpeechRecognitionErrorEvent`](/en-US/docs/Web/API/SpeechRecognitionErrorEvent/error)
- [Thuộc tính `error` của đối tượng `SpeechSynthesisErrorEvent`](/en-US/docs/Web/API/SpeechSynthesisErrorEvent/error)

## Cân nhắc về bảo mật

Việc truy cập vào chức năng [nhận dạng giọng nói trên thiết bị](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#on-device_speech_recognition) của Web Speech API được kiểm soát bởi chỉ thị {{httpheader("Permissions-Policy/on-device-speech-recognition", "on-device-speech-recognition")}} {{httpheader("Permissions-Policy")}}.

Cụ thể, khi một chính sách được xác định chặn việc sử dụng, mọi cố gắng gọi các phương thức {{domxref("SpeechRecognition.available_static", "SpeechRecognition.available()")}} hoặc {{domxref("SpeechRecognition.install_static", "SpeechRecognition.install()")}} của API sẽ thất bại.

## Ví dụ

[Web Speech API ví dụ](https://mdn.github.io/dom-examples/web-speech-api/) của chúng tôi minh họa việc nhận dạng và tổng hợp giọng nói.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Speech API](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API)
