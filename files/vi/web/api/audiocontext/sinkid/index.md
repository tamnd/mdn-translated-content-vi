---
title: "AudioContext: thuộc tính sinkId"
short-title: sinkId
slug: Web/API/AudioContext/sinkId
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.AudioContext.sinkId
---

{{APIRef("Web Audio API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`sinkId`** của giao diện {{domxref("AudioContext")}} trả về sink ID của thiết bị đầu ra âm thanh hiện tại.

## Giá trị

Thuộc tính này trả về một trong các giá trị sau, tùy thuộc vào cách sink ID được đặt:

- Một chuỗi rỗng
  - : Nếu sink ID chưa được đặt tường minh, thiết bị đầu ra âm thanh mặc định của hệ thống sẽ được dùng và `sinkId` sẽ trả về một chuỗi rỗng.
- Một chuỗi
  - : Nếu sink ID được đặt dưới dạng giá trị chuỗi (bằng {{domxref("AudioContext.setSinkId", "setSinkId()")}} hoặc tùy chọn `sinkId` của hàm tạo {{domxref("AudioContext.AudioContext", "AudioContext()")}}), `sinkId` sẽ trả về chính giá trị chuỗi đó.
- Một đối tượng {{domxref("AudioSinkInfo")}}
  - : Nếu sink ID được đặt dưới dạng đối tượng tùy chọn (bằng {{domxref("AudioContext.setSinkId", "setSinkId()")}} hoặc tùy chọn `sinkId` của hàm tạo {{domxref("AudioContext.AudioContext", "AudioContext()")}}), `sinkId` sẽ trả về một đối tượng {{domxref("AudioSinkInfo")}} phản ánh cùng các giá trị đã đặt trong đối tượng tùy chọn ban đầu.

## Ví dụ

Trong [ví dụ kiểm thử SetSinkId](https://mdn.github.io/dom-examples/audiocontext-setsinkid/) của chúng tôi (hãy xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/audiocontext-setsinkid)), chúng tôi tạo một đồ thị âm thanh sinh ra một đoạn white noise dài ba giây bằng {{domxref("AudioBufferSourceNode")}}, đồng thời cho nó đi qua một {{domxref("GainNode")}} để giảm âm lượng bớt. Chúng tôi cũng cung cấp cho người dùng một menu thả xuống để họ có thể thay đổi thiết bị đầu ra âm thanh.

Khi nút Play được nhấn, chúng tôi lắp ráp đồ thị âm thanh và bắt đầu phát, đồng thời ghi thông tin về thiết bị hiện tại ra console dựa trên giá trị của `sinkId`:

- Chuỗi rỗng nghĩa là thiết bị mặc định vẫn đang được dùng.
- Nếu giá trị là một đối tượng, âm thanh sẽ không phát trên thiết bị nào vì chúng tôi đã đặt một đối tượng tùy chọn chứa `type: 'none'`.
- Ngược lại, giá trị sẽ là một chuỗi sink ID, vì vậy chúng tôi ghi lại giá trị đó.

```js
playBtn.addEventListener("click", () => {
  const source = audioCtx.createBufferSource();
  source.buffer = myArrayBuffer;
  source.connect(gain);
  gain.connect(audioCtx.destination);
  source.start();

  if (audioCtx.sinkId === "") {
    console.log("Audio playing on default device");
  } else if (
    typeof audioCtx.sinkId === "object" &&
    audioCtx.sinkId.type === "none"
  ) {
    console.log("Audio not playing on any device");
  } else {
    console.log(`Audio playing on device ${audioCtx.sinkId}`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Change the destination output device in Web Audio](https://developer.chrome.com/blog/audiocontext-setsinkid/)
- {{domxref("AudioContext.setSinkId()")}}
- {{domxref("AudioContext/sinkchange_event", "sinkchange")}}
