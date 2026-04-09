---
title: "BaseAudioContext: phương thức createChannelMerger()"
short-title: createChannelMerger()
slug: Web/API/BaseAudioContext/createChannelMerger
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createChannelMerger
---

{{ APIRef("Web Audio API") }}

Phương thức `createChannelMerger()` của giao diện {{domxref("BaseAudioContext")}} tạo một {{domxref("ChannelMergerNode")}},
node này kết hợp các kênh từ nhiều luồng âm thanh thành một luồng âm thanh duy nhất.

> [!NOTE]
> Hàm dựng {{domxref("ChannelMergerNode.ChannelMergerNode", "ChannelMergerNode()")}} là cách được
> khuyến nghị để tạo một {{domxref("ChannelMergerNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
createChannelMerger(numberOfInputs)
```

### Tham số

- `numberOfInputs`
  - : Số kênh trong các luồng âm thanh đầu vào mà luồng đầu ra sẽ chứa; mặc định là 6 nếu tham số này không được chỉ định.

### Giá trị trả về

Một {{domxref("ChannelMergerNode")}}.

## Ví dụ

Ví dụ sau cho thấy cách bạn có thể tách một track stereo (chẳng hạn một bản nhạc) và xử lý khác nhau cho kênh trái và kênh phải. Để dùng được chúng, bạn cần sử dụng tham số thứ hai và thứ ba của phương thức {{domxref("AudioNode/connect", "AudioNode.connect(AudioNode)")}}, cho phép bạn chỉ định cả chỉ mục của kênh nguồn để kết nối từ đó lẫn chỉ mục của kênh đích để kết nối tới đó.

```js
const ac = new AudioContext();
ac.decodeAudioData(someStereoBuffer, (data) => {
  const source = ac.createBufferSource();
  source.buffer = data;
  const splitter = ac.createChannelSplitter(2);
  source.connect(splitter);
  const merger = ac.createChannelMerger(2);

  // Chỉ giảm âm lượng của kênh trái
  const gainNode = ac.createGain();
  gainNode.gain.setValueAtTime(0.5, ac.currentTime);
  splitter.connect(gainNode, 0);

  // Kết nối splitter ngược lại vào đầu vào thứ hai của merger: ở đây
  // chúng ta thực chất đang hoán đổi các kênh, đảo ảnh stereo.
  gainNode.connect(merger, 0, 1);
  splitter.connect(merger, 1, 0);

  const dest = ac.createMediaStreamDestination();

  // Vì đã dùng ChannelMergerNode, giờ chúng ta có một MediaStream stereo
  // có thể dùng để đưa đồ thị Web Audio tới WebRTC,
  // MediaRecorder, v.v.
  merger.connect(dest);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
