---
title: "AudioContext: phương thức getOutputTimestamp()"
short-title: getOutputTimestamp()
slug: Web/API/AudioContext/getOutputTimestamp
page-type: web-api-instance-method
browser-compat: api.AudioContext.getOutputTimestamp
---

{{APIRef("Web Audio API")}}

Phương thức **`getOutputTimestamp()`** của giao diện {{domxref("AudioContext")}} trả về một đối tượng `AudioTimestamp` mới chứa hai giá trị dấu thời gian âm thanh liên quan đến ngữ cảnh âm thanh hiện tại.

Hai giá trị đó là:

- `AudioTimestamp.contextTime`: Thời gian của frame mẫu hiện đang được thiết bị đầu ra âm thanh render (tức vị trí luồng âm thanh đầu ra), theo cùng đơn vị và cùng gốc thời gian với {{domxref("BaseAudioContext/currentTime", "AudioContext.currentTime")}} của ngữ cảnh.
  Về cơ bản, đây là thời gian tính từ khi audio context được tạo lần đầu.
- `AudioTimestamp.performanceTime`: Giá trị ước tính của thời điểm frame mẫu tương ứng với giá trị `contextTime` được lưu đã được render bởi thiết bị đầu ra âm thanh, theo cùng đơn vị và cùng gốc thời gian với {{domxref("performance.now()")}}. Đây là thời gian tính từ khi tài liệu chứa audio context được render lần đầu.

## Cú pháp

```js-nolint
getOutputTimestamp()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng `AudioTimestamp`, có các thuộc tính sau.

- `contextTime`: Một thời điểm trong hệ tọa độ thời gian của {{domxref("BaseAudioContext/currentTime","currentTime")}} đối với `BaseAudioContext`; tức là thời gian sau khi audio context được tạo lần đầu.
- `performanceTime`: Một thời điểm trong hệ tọa độ thời gian của giao diện `Performance`; tức là thời gian sau khi tài liệu chứa audio context được render lần đầu.

## Ví dụ

Trong đoạn mã sau, chúng ta bắt đầu phát một tệp âm thanh sau khi người dùng nhấn nút phát, và đồng thời khởi động một vòng lặp `requestAnimationFrame` liên tục xuất `contextTime` và `performanceTime`.

Bạn có thể xem toàn bộ mã của [ví dụ tại output-timestamp](https://github.com/mdn/webaudio-examples/blob/main/output-timestamp/index.html) ([xem trực tiếp](https://mdn.github.io/webaudio-examples/output-timestamp/)).

```js
// Press the play button
playBtn.addEventListener("click", () => {
  // We can create the audioCtx as there has been some user action
  audioCtx ??= new AudioContext();
  source = new AudioBufferSourceNode(audioCtx);
  getData();
  source.start(0);
  playBtn.disabled = true;
  stopBtn.disabled = false;
  rAF = requestAnimationFrame(outputTimestamps);
});

// Press the stop button
stopBtn.addEventListener("click", () => {
  source.stop(0);
  playBtn.disabled = false;
  stopBtn.disabled = true;
  cancelAnimationFrame(rAF);
});

// Helper function to output timestamps
function outputTimestamps() {
  const ts = audioCtx.getOutputTimestamp();
  output.textContent = `Context time: ${ts.contextTime} | Performance time: ${ts.performanceTime}`;
  rAF = requestAnimationFrame(outputTimestamps); // Reregister itself
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
