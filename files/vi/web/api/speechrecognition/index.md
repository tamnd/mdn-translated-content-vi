---
title: SpeechRecognition
slug: Web/API/SpeechRecognition
page-type: web-api-interface
browser-compat: api.SpeechRecognition
---

{{APIRef("Web Speech API")}}

Giao diện **`SpeechRecognition`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) là giao diện bộ điều khiển cho dịch vụ nhận dạng giọng nói; giao diện này cũng xử lý {{domxref("SpeechRecognitionEvent")}} được gửi từ dịch vụ nhận dạng.

> [!NOTE]
> Trên một số trình duyệt, như Chrome, việc sử dụng Nhận dạng giọng nói trên một trang web liên quan đến công cụ nhận dạng dựa trên máy chủ. Audio của bạn được gửi đến một dịch vụ web để xử lý nhận dạng, do đó nó sẽ không hoạt động ngoại tuyến.

{{InheritanceDiagram}}

## Bộ khởi tạo

- {{domxref("SpeechRecognition.SpeechRecognition", "SpeechRecognition()")}}
  - : Tạo một đối tượng `SpeechRecognition` mới.

## Thuộc tính thể hiện

_`SpeechRecognition` cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("EventTarget")}}._

- {{domxref("SpeechRecognition.lang")}}
  - : Trả về và thiết lập ngôn ngữ của `SpeechRecognition` hiện tại. Nếu không được chỉ định, giá trị mặc định là thuộc tính HTML [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang), hoặc cài đặt ngôn ngữ của tác nhân người dùng nếu thuộc tính đó cũng không được thiết lập.
- {{domxref("SpeechRecognition.continuous")}}
  - : Kiểm soát việc trả về kết quả liên tục cho mỗi lần nhận dạng, hay chỉ một kết quả duy nhất. Mặc định là một kết quả duy nhất (`false`).
- {{domxref("SpeechRecognition.interimResults")}}
  - : Kiểm soát việc có trả về các kết quả trung gian hay không (`true`) hoặc không (`false`). Kết quả trung gian là các kết quả chưa phải là kết quả cuối cùng (ví dụ: thuộc tính {{domxref("SpeechRecognitionResult.isFinal")}} là `false`).
- {{domxref("SpeechRecognition.maxAlternatives")}}
  - : Thiết lập số lượng tối đa {{domxref("SpeechRecognitionAlternative")}} được cung cấp cho mỗi kết quả. Giá trị mặc định là 1.
- {{domxref("SpeechRecognition.phrases")}} {{experimental_inline}}
  - : Thiết lập một mảng các đối tượng {{domxref("SpeechRecognitionPhrase")}} để sử dụng cho [thiên vị ngữ cảnh](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#contextual_biasing_in_speech_recognition).
- {{domxref("SpeechRecognition.processLocally")}} {{experimental_inline}}
  - : Chỉ định việc nhận dạng giọng nói phải được thực hiện cục bộ trên thiết bị của người dùng.

### Thuộc tính đã lỗi thời

Khái niệm grammar đã bị loại bỏ khỏi Web Speech API. Các tính năng liên quan vẫn còn trong đặc tả và vẫn được các trình duyệt hỗ trợ nhận diện để tương thích ngược, nhưng chúng không có tác dụng đối với các dịch vụ nhận dạng giọng nói.

- {{domxref("SpeechRecognition.grammars")}}
  - : Trả về và thiết lập một tập hợp các đối tượng {{domxref("SpeechGrammar")}} biểu diễn các grammar mà `SpeechRecognition` hiện tại hiểu được.

## Phương thức tĩnh

- {{domxref("SpeechRecognition.available_static", "SpeechRecognition.available()")}} {{experimental_inline}}
  - : Kiểm tra xem các ngôn ngữ được chỉ định có khả dụng cho nhận dạng giọng nói hay không.
- {{domxref("SpeechRecognition.install_static", "SpeechRecognition.install()")}} {{experimental_inline}}
  - : Cài đặt các gói ngôn ngữ cần thiết cho nhận dạng giọng nói trên thiết bị theo các ngôn ngữ được chỉ định.

## Phương thức thể hiện

_`SpeechRecognition` cũng kế thừa các phương thức từ giao diện cha của nó, {{domxref("EventTarget")}}._

- {{domxref("SpeechRecognition.abort()")}}
  - : Dừng dịch vụ nhận dạng giọng nói không nghe audio đến, và không cố gắng trả về {{domxref("SpeechRecognitionResult")}}.
- {{domxref("SpeechRecognition.start()")}}
  - : Khởi động dịch vụ nhận dạng giọng nói để nghe audio đến (từ micro hoặc track audio) và trả về kết quả của việc nhận dạng đó.
- {{domxref("SpeechRecognition.stop()")}}
  - : Dừng dịch vụ nhận dạng giọng nói không nghe audio đến và cố gắng trả về {{domxref("SpeechRecognitionResult")}} dựa trên các kết quả đã ghi nhận được cho đến thời điểm đó.

## Sự kiện

Lắng nghe các sự kiện này bằng cách sử dụng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) hoặc bằng cách gán trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này.

- [`audiostart`](/en-US/docs/Web/API/SpeechRecognition/audiostart_event)
  - : Được kích hoạt khi tác nhân người dùng bắt đầu ghi âm thanh.
- [`audioend`](/en-US/docs/Web/API/SpeechRecognition/audioend_event)
  - : Được kích hoạt khi tác nhân người dùng kết thúc ghi âm thanh.
- [`end`](/en-US/docs/Web/API/SpeechRecognition/end_event)
  - : Được kích hoạt khi dịch vụ nhận dạng giọng nói đã ngắt kết nối.
- [`error`](/en-US/docs/Web/API/SpeechRecognition/error_event)
  - : Được kích hoạt khi xảy ra lỗi nhận dạng giọng nói.
- [`nomatch`](/en-US/docs/Web/API/SpeechRecognition/nomatch_event)
  - : Được kích hoạt khi dịch vụ nhận dạng giọng nói trả về kết quả cuối cùng nhưng không có nhận dạng đáng kể. Điều này có thể bao gồm một mức độ nhận dạng nào đó, nhưng không đạt hoặc vượt ngưỡng {{domxref("SpeechRecognitionAlternative.confidence","confidence")}}.
- [`result`](/en-US/docs/Web/API/SpeechRecognition/result_event)
  - : Được kích hoạt khi dịch vụ nhận dạng giọng nói trả về một kết quả — một từ hoặc cụm từ đã được nhận dạng thành công và điều này đã được thông báo lại cho ứng dụng.
- [`soundstart`](/en-US/docs/Web/API/SpeechRecognition/soundstart_event)
  - : Được kích hoạt khi bất kỳ âm thanh nào — giọng nói có thể nhận dạng hay không — được phát hiện.
- [`soundend`](/en-US/docs/Web/API/SpeechRecognition/soundend_event)
  - : Được kích hoạt khi bất kỳ âm thanh nào — giọng nói có thể nhận dạng hay không — ngừng được phát hiện.
- [`speechstart`](/en-US/docs/Web/API/SpeechRecognition/speechstart_event)
  - : Được kích hoạt khi âm thanh được dịch vụ nhận dạng giọng nói nhận diện là giọng nói đã được phát hiện.
- [`speechend`](/en-US/docs/Web/API/SpeechRecognition/speechend_event)
  - : Được kích hoạt khi giọng nói được dịch vụ nhận dạng giọng nói nhận diện ngừng được phát hiện.
- [`start`](/en-US/docs/Web/API/SpeechRecognition/start_event)
  - : Được kích hoạt khi dịch vụ nhận dạng giọng nói bắt đầu nghe audio để nhận dạng.

## Ví dụ

Trong ví dụ [Speech color changer](https://mdn.github.io/dom-examples/web-speech-api/speech-color-changer/) của chúng ta, chúng ta tạo một thể hiện đối tượng `SpeechRecognition` mới bằng cách sử dụng bộ khởi tạo {{domxref("SpeechRecognition.SpeechRecognition", "SpeechRecognition()")}}.

Sau khi một số giá trị khác đã được xác định, chúng ta thiết lập để dịch vụ nhận dạng bắt đầu khi một nút được nhấp (xem {{domxref("SpeechRecognition.start()")}}). Khi một kết quả đã được nhận dạng thành công, sự kiện {{domxref("SpeechRecognition.result_event", "result")}} được kích hoạt, chúng ta trích xuất màu đã được đọc từ đối tượng sự kiện, và sau đó thiết lập màu nền cho phần tử {{htmlelement("html")}} thành màu đó.

```js
const recognition = new SpeechRecognition();
recognition.continuous = false;
recognition.lang = "en-US";
recognition.interimResults = false;
recognition.maxAlternatives = 1;

const diagnostic = document.querySelector(".output");
const bg = document.querySelector("html");
const startBtn = document.querySelector("button");

startBtn.onclick = () => {
  recognition.start();
  console.log("Ready to receive a color command.");
};

recognition.onresult = (event) => {
  const color = event.results[0][0].transcript;
  diagnostic.textContent = `Result received: ${color}`;
  bg.style.backgroundColor = color;
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
