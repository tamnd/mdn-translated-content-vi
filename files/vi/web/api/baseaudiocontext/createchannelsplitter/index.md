---
title: "BaseAudioContext: phương thức createChannelSplitter()"
short-title: createChannelSplitter()
slug: Web/API/BaseAudioContext/createChannelSplitter
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createChannelSplitter
---

{{ APIRef("Web Audio API") }}

Phương thức `createChannelSplitter()` của giao diện {{domxref("BaseAudioContext")}} được dùng để tạo một {{domxref("ChannelSplitterNode")}},
node này được dùng để truy cập từng kênh riêng lẻ của một luồng âm thanh và xử lý chúng riêng biệt.

> [!NOTE]
> Hàm dựng {{domxref("ChannelSplitterNode.ChannelSplitterNode", "ChannelSplitterNode()")}}
> là cách được khuyến nghị để tạo một {{domxref("ChannelSplitterNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
createChannelSplitter(numberOfOutputs)
```

### Tham số

- `numberOfOutputs`
  - : Số kênh trong luồng âm thanh đầu vào mà bạn muốn xuất riêng rẽ; mặc định là 6 nếu tham số này không được chỉ định.

### Giá trị trả về

Một {{domxref("ChannelSplitterNode")}}.

## Ví dụ

Ví dụ đơn giản sau cho thấy cách bạn có thể tách một track stereo (chẳng hạn một bản nhạc) và xử lý khác nhau cho kênh trái và kênh phải. Để dùng được chúng, bạn cần sử dụng tham số thứ hai và thứ ba của phương thức {{domxref("AudioNode/connect", "AudioNode.connect(AudioNode)")}}, cho phép bạn chỉ định chỉ mục của kênh nguồn để kết nối từ đó và chỉ mục của kênh đích để kết nối tới đó.

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
