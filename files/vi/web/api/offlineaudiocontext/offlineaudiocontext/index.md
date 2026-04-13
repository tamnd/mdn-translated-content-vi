---
title: "OfflineAudioContext: hàm khởi tạo OfflineAudioContext()"
short-title: OfflineAudioContext()
slug: Web/API/OfflineAudioContext/OfflineAudioContext
page-type: web-api-constructor
browser-compat: api.OfflineAudioContext.OfflineAudioContext
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`OfflineAudioContext()`**, là một phần của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API), tạo và trả về một phiên bản đối tượng {{domxref("OfflineAudioContext")}} mới, sau đó có thể được dùng để render âm thanh vào {{domxref("AudioBuffer")}} thay vì ra thiết bị đầu ra âm thanh.

## Cú pháp

```js-nolint
new OfflineAudioContext(options)

new OfflineAudioContext(numberOfChannels, length, sampleRate)
```

### Tham số

Bạn có thể chỉ định các tham số cho hàm khởi tạo `OfflineAudioContext()` bằng cách sử dụng cùng một tập tham số là đầu vào cho phương thức {{domxref("BaseAudioContext.createBuffer")}}, hoặc bằng cách truyền các tham số đó trong một đối tượng `options`. Dù bằng cách nào, các tham số riêng lẻ đều giống nhau.

- `numberOfChannels`
  - : Một số nguyên chỉ định số kênh mà {{domxref("AudioBuffer")}} kết quả sẽ có.
- `length`
  - : Một số nguyên chỉ định kích thước của bộ đệm cần tạo cho audio context, tính bằng sample-frame, trong đó một sample-frame là một đơn vị có thể chứa một mẫu âm thanh duy nhất cho mỗi kênh trong dữ liệu âm thanh. Ví dụ, một bộ đệm 5 giây với `sampleRate` là 48000Hz sẽ có độ dài là `5 * 48000 = 240000` sample-frame.
- `sampleRate`
  - : Tần suất lấy mẫu của dữ liệu âm thanh tuyến tính tính bằng sample-frame mỗi giây. Tất cả user agent phải hỗ trợ phạm vi từ 8000Hz đến 96000Hz và có thể hỗ trợ phạm vi rộng hơn. Tần suất thường được sử dụng nhất là 44100Hz, là tần suất lấy mẫu được sử dụng bởi âm thanh CD.

Lưu ý rằng, trong khi bạn có thể tạo một {{domxref("AudioContext")}} mới bằng hàm khởi tạo {{domxref("AudioContext.AudioContext()", "AudioContext()")}} không có tham số, hàm khởi tạo `OfflineAudioContext()` yêu cầu ba tham số, vì nó cần tạo một `AudioBuffer`. Điều này hoạt động giống hệt như khi bạn tạo một {{domxref("AudioBuffer")}} mới bằng phương thức {{domxref("BaseAudioContext.createBuffer")}}. Để biết thêm chi tiết, đọc [Audio buffers: frames, samples and channels](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#audio_buffers_frames_samples_and_channels) từ hướng dẫn [Basic concepts](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API) của chúng tôi.

### Giá trị trả về

Một đối tượng {{domxref("OfflineAudioContext")}} mới có `AudioBuffer` liên quan được cấu hình theo yêu cầu.

Giống như một `AudioContext` thông thường, một `OfflineAudioContext` có thể là mục tiêu của các sự kiện, do đó nó triển khai giao diện {{domxref("EventTarget")}}.

## Ví dụ

```js
const offlineCtx = new OfflineAudioContext({
  numberOfChannels: 2,
  length: 44100 * 40,
  sampleRate: 44100,
});
const source = offlineCtx.createBufferSource();
// …
```

Để xem ví dụ đầy đủ, hãy xem kho GitHub [offline-audio-context-promise](https://mdn.github.io/webaudio-examples/offline-audio-context-promise/) của chúng tôi (xem cả [mã nguồn](https://github.com/mdn/webaudio-examples/blob/main/offline-audio-context-promise/index.html).)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
