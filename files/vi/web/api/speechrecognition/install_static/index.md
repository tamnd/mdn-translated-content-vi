---
title: "SpeechRecognition: Phương thức tĩnh install()"
short-title: install()
slug: Web/API/SpeechRecognition/install_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.SpeechRecognition.install_static
---

{{APIRef("Web Speech API")}}{{SeeCompatTable}}

Phương thức tĩnh **`install()`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) cài đặt các gói ngôn ngữ cần thiết cho [nhận dạng giọng nói trên thiết bị](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#on-device_speech_recognition) theo các ngôn ngữ được chỉ định.

Để kiểm tra xem các gói ngôn ngữ đã khả dụng hay chưa, sử dụng phương thức {{domxref("SpeechRecognition.available_static", "SpeechRecognition.available()")}}.

Quyền truy cập vào phương thức `install()` được kiểm soát bởi chỉ thị {{httpheader("Permissions-Policy")}} {{httpheader("Permissions-Policy/on-device-speech-recognition", "on-device-speech-recognition")}}. Cụ thể, khi một chính sách được định nghĩa chặn việc sử dụng, mọi nỗ lực gọi phương thức sẽ thất bại.

## Cú pháp

```js-nolint
install(options)
```

### Tham số

- `options`
  - : Một đối tượng chỉ định các tùy chọn cho việc cài đặt. Các thuộc tính có thể bao gồm:
    - `langs`
      - : Một mảng chứa một hoặc nhiều chuỗi có {{glossary("BCP 47 language tag", "thẻ ngôn ngữ BCP 47")}}, mỗi chuỗi đại diện cho một ngôn ngữ mà bạn muốn cài đặt gói ngôn ngữ.

### Giá trị trả về

Một {{domxref("Promise")}} phân giải với một giá trị boolean cho biết gói ngôn ngữ đã được cài đặt thành công hay không. Các điều kiện dẫn đến mỗi giá trị trả về như sau:

- `true`
  - : Tất cả các nỗ lực cài đặt đã thành công cho các ngôn ngữ được yêu cầu, hoặc các ngôn ngữ đã được cài đặt sẵn.
- `false`
  - : Một hoặc nhiều ngôn ngữ được yêu cầu không được hỗ trợ, một gói ngôn ngữ được hỗ trợ không cài đặt được thành công, hoặc một mảng rỗng được truyền cho thuộc tính `langs`.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Tài liệu hiện tại không ở trạng thái hoạt động đầy đủ.
- `SyntaxError` {{domxref("DOMException")}}
  - : Một hoặc nhiều chuỗi được chỉ định trong `langs` không phải là thẻ ngôn ngữ BCP 47 hợp lệ.

## Ví dụ

### Kiểm tra khả dụng trên thiết bị và cài đặt các gói ngôn ngữ

Để nhận dạng giọng nói trên thiết bị hoạt động, trình duyệt phải có một gói ngôn ngữ được cài đặt cho ngôn ngữ bạn muốn nhận dạng. Nếu bạn chạy phương thức `start()` sau khi chỉ định `processLocally = true` nhưng gói ngôn ngữ chính xác chưa được cài đặt, lời gọi hàm sẽ thất bại với lỗi [`language-not-supported`](/en-US/docs/Web/API/SpeechRecognitionErrorEvent/error#language-not-supported).

Để cài đặt gói ngôn ngữ chính xác, đảm bảo bạn làm theo hai bước sau:

1. Kiểm tra xem gói ngôn ngữ có khả dụng trên máy tính của người dùng hay không bằng phương thức {{domxref("SpeechRecognition.available_static", "SpeechRecognition.available()")}}.
2. Cài đặt gói ngôn ngữ nếu nó không khả dụng bằng phương thức `install()`.

Các bước này được xử lý bằng đoạn mã sau:

```js
startBtn.addEventListener("click", () => {
  // check availability of target language
  SpeechRecognition.available({ langs: ["en-US"], processLocally: true }).then(
    (result) => {
      if (result === "unavailable") {
        diagnostic.textContent = `en-US not available to download at this time. Sorry!`;
      } else if (result === "available") {
        recognition.start();
        console.log("Ready to receive a color command.");
      } else {
        diagnostic.textContent = `en-US language pack downloading`;
        SpeechRecognition.install({
          langs: ["en-US"],
          processLocally: true,
        }).then((result) => {
          if (result) {
            diagnostic.textContent = `en-US language pack downloaded. Try again.`;
          } else {
            diagnostic.textContent = `en-US language pack failed to download. Try again later.`;
          }
        });
      }
    },
  );
});
```

Đầu tiên chúng ta chạy phương thức `available()`, chỉ định một ngôn ngữ (`langs: ["en-US"]`) để kiểm tra khả dụng, và `processLocally: true`. Chúng ta kiểm tra ba khả năng khác nhau của giá trị trả về:

- Nếu giá trị kết quả là `unavailable`, có nghĩa là không có gói ngôn ngữ phù hợp nào để tải xuống. Chúng ta cũng in một thông báo thích hợp ra đầu ra.
- Nếu giá trị kết quả là `available`, có nghĩa là gói ngôn ngữ khả dụng cục bộ, nên việc nhận dạng có thể bắt đầu. Trong trường hợp này, chúng ta chạy `start()` và ghi một thông báo vào console khi ứng dụng sẵn sàng nhận giọng nói.
- Nếu giá trị là một giá trị khác (`downloadable` hoặc `downloading`), chúng ta in một thông báo chẩn đoán để thông báo cho người dùng rằng việc tải xuống gói ngôn ngữ đang bắt đầu, sau đó chạy phương thức `install()` để xử lý việc tải xuống.

Phương thức `install()` hoạt động tương tự như phương thức `available()`, ngoại trừ đối tượng tùy chọn của nó chỉ nhận mảng `langs`. Khi chạy, nó bắt đầu tải xuống gói ngôn ngữ `en-US` và trả về một {{jsxref("Promise")}} phân giải với một boolean cho biết các gói ngôn ngữ được chỉ định đã được tải xuống và cài đặt thành công (`true`) hay không (`false`).

Đoạn mã này được trích từ ví dụ [on-device speech color changer](https://github.com/mdn/dom-examples/tree/main/web-speech-api/on-device-speech-color-changer) ([chạy demo trực tiếp](https://mdn.github.io/dom-examples/web-speech-api/on-device-speech-color-changer/)). Xem [Sử dụng Web Speech API](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API) để biết giải thích đầy đủ.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
- [Sử dụng Web Speech API](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API)
- {{domxref("SpeechRecognition.processLocally")}}
- {{domxref("SpeechRecognition.available_static", "SpeechRecognition.available()")}}
