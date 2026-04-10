---
title: "SpeechRecognition: Phương thức tĩnh available()"
short-title: available()
slug: Web/API/SpeechRecognition/available_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.SpeechRecognition.available_static
---

{{APIRef("Web Speech API")}}{{SeeCompatTable}}

Phương thức tĩnh **`available()`** của [Web Speech API](/en-US/docs/Web/API/Web_Speech_API) kiểm tra xem các ngôn ngữ được chỉ định có khả dụng cho nhận dạng giọng nói hay không.

Để cài đặt gói ngôn ngữ cho nhận dạng giọng nói cục bộ, sử dụng phương thức {{domxref("SpeechRecognition.install_static", "SpeechRecognition.install()")}}.

Quyền truy cập vào phương thức `available()` được kiểm soát bởi {{httpheader("Permissions-Policy")}} {{httpheader("Permissions-Policy/on-device-speech-recognition", "on-device-speech-recognition")}}. Cụ thể, khi một chính sách được định nghĩa chặn việc sử dụng, mọi nỗ lực gọi phương thức sẽ thất bại.

## Cú pháp

```js-nolint
available(options)
```

### Tham số

- `options`
  - : Một đối tượng chỉ định các tùy chọn cho việc kiểm tra khả dụng. Các thuộc tính có thể bao gồm:
    - `langs`
      - : Một mảng chứa một hoặc nhiều chuỗi có {{glossary("BCP 47 language tag", "thẻ ngôn ngữ BCP 47")}}, mỗi chuỗi đại diện cho một ngôn ngữ cần kiểm tra khả dụng. Truyền một mảng `langs` rỗng sẽ không gây ra lỗi, nhưng giá trị trả về sẽ luôn phân giải thành `unavailable`.
    - `processLocally` {{optional_inline}}
      - : Một boolean chỉ định việc kiểm tra khả dụng của các ngôn ngữ chỉ cho [nhận dạng giọng nói trên thiết bị](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#on-device_speech_recognition) (`true`) hay cho nhận dạng giọng nói trên thiết bị _hoặc_ từ xa (`false`). Giá trị mặc định là `false`.
        > [!NOTE]
        > Không thể sử dụng `available()` để đảm bảo rằng một dịch vụ từ xa hỗ trợ các ngôn ngữ được chỉ định. Giá trị `false` có nghĩa là một trong hai dịch vụ nhận dạng giọng nói trên thiết bị _hoặc_ từ xa hỗ trợ chúng.

### Giá trị trả về

Một {{domxref("Promise")}} phân giải với một giá trị được liệt kê cho biết khả dụng của các ngôn ngữ được chỉ định cho nhận dạng giọng nói.

Các giá trị có thể bao gồm:

- `available`
  - : Cho biết rằng hỗ trợ cho tất cả các ngôn ngữ được chỉ định đều khả dụng.
    - Nếu `processLocally` được thiết lập thành `true`, `available` có nghĩa là nhận dạng giọng nói khả dụng cho các ngôn ngữ đó trên thiết bị (các gói ngôn ngữ cần thiết đã được tải xuống và cài đặt trên máy tính của người dùng).
    - Nếu `processLocally` được thiết lập thành `false`, `available` có nghĩa là nhận dạng giọng nói khả dụng cho các ngôn ngữ đó trên thiết bị hoặc từ xa.
- `downloading`
  - : Cho biết rằng hỗ trợ cho các ngôn ngữ được chỉ định khả dụng trên thiết bị, và gói ngôn ngữ liên quan cho ít nhất một ngôn ngữ đang trong quá trình tải xuống. Chỉ liên quan khi `processLocally` là `true`.
- `downloadable`
  - : Cho biết rằng hỗ trợ cho các ngôn ngữ được chỉ định khả dụng trên thiết bị, nhưng gói ngôn ngữ liên quan cho ít nhất một ngôn ngữ chưa được tải xuống. Chỉ liên quan khi `processLocally` là `true`.
- `unavailable`
  - : Cho biết rằng hỗ trợ cho ít nhất một trong các ngôn ngữ được chỉ định không khả dụng.
    - Nếu `processLocally` được thiết lập thành `true`, `unavailable` có nghĩa là nhận dạng giọng nói trên thiết bị không khả dụng cho ít nhất một trong các ngôn ngữ được chỉ định.
    - Nếu `processLocally` được thiết lập thành `false`, `unavailable` có nghĩa là nhận dạng giọng nói không khả dụng cho ít nhất một trong các ngôn ngữ được chỉ định trên thiết bị hoặc từ xa.

#### Giá trị trả về cuối cùng cho nhiều ngôn ngữ với các trạng thái khác nhau

Chỉ một giá trị trạng thái được trả về, ngay cả khi nhiều ngôn ngữ được chỉ định trong mảng `langs`. Nếu các ngôn ngữ được chỉ định khác nhau có các trạng thái khả dụng khác nhau, giá trị trả về cuối cùng là trạng thái "xa nhất" so với `available` cho bất kỳ ngôn ngữ nào, theo thứ tự được hiển thị trong các danh sách sau:

Nếu `processLocally` là `false`:

- Nếu tất cả ngôn ngữ là `available`, thì trả về `available`.
- Ngược lại, trả về `unavailable`.

Nếu `processLocally` là `true`:

- Nếu tất cả ngôn ngữ là `available`, trả về `available`.
- Nếu ít nhất một ngôn ngữ là `downloading`, trả về `downloading`.
- Nếu ít nhất một ngôn ngữ là `downloadable`, trả về `downloadable`.
- Nếu ít nhất một ngôn ngữ là `unavailable`, trả về `unavailable`.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Tài liệu hiện tại không ở trạng thái hoạt động đầy đủ.
- `SyntaxError` {{domxref("DOMException")}}
  - : Một hoặc nhiều chuỗi được chỉ định trong `langs` không phải là thẻ ngôn ngữ BCP 47 hợp lệ.

## Ví dụ

### Kiểm tra khả dụng trên thiết bị và cài đặt các gói ngôn ngữ

Để nhận dạng giọng nói trên thiết bị hoạt động, trình duyệt phải có một gói ngôn ngữ được cài đặt cho ngôn ngữ bạn muốn nhận dạng. Nếu bạn chạy phương thức `start()` sau khi chỉ định `processLocally = true` nhưng gói ngôn ngữ chính xác chưa được cài đặt, lời gọi hàm sẽ thất bại với lỗi [`language-not-supported`](/en-US/docs/Web/API/SpeechRecognitionErrorEvent/error#language-not-supported).

Để cài đặt gói ngôn ngữ chính xác, đảm bảo bạn làm theo hai bước sau:

1. Kiểm tra xem gói ngôn ngữ có khả dụng trên máy tính của người dùng hay không bằng phương thức `available()`.
2. Cài đặt gói ngôn ngữ nếu nó không khả dụng bằng phương thức {{domxref("SpeechRecognition.install_static", "SpeechRecognition.install()")}}.

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

Đoạn mã này được trích từ ví dụ [on-device speech color changer](https://github.com/mdn/dom-examples/tree/main/web-speech-api/on-device-speech-color-changer) ([chạy demo trực tiếp](https://mdn.github.io/dom-examples/web-speech-api/speech-color-changer/)). Xem [Sử dụng Web Speech API](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API) để biết giải thích đầy đủ.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Speech API](/en-US/docs/Web/API/Web_Speech_API)
- [Sử dụng Web Speech API](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API)
- {{domxref("SpeechRecognition.processLocally")}}
- {{domxref("SpeechRecognition.install_static", "SpeechRecognition.install()")}}
