---
title: AudioDestinationNode
slug: Web/API/AudioDestinationNode
page-type: web-api-interface
browser-compat: api.AudioDestinationNode
---

{{APIRef("Web Audio API")}}

Giao diện `AudioDestinationNode` biểu diễn đích cuối cùng của một đồ thị âm thanh trong một ngữ cảnh nhất định, thường là loa của thiết bị. Nó cũng có thể là nút sẽ "ghi" dữ liệu âm thanh khi được dùng với `OfflineAudioContext`.

`AudioDestinationNode` không có đầu ra nào (vì chính nó _là_ đầu ra, nên không thể liên kết thêm `AudioNode` nào sau nó trong đồ thị âm thanh) và có một đầu vào. Số lượng kênh ở đầu vào phải nằm trong khoảng từ `0` đến giá trị `maxChannelCount`, nếu không một ngoại lệ sẽ được ném ra.

`AudioDestinationNode` của một `AudioContext` nhất định có thể được lấy qua thuộc tính {{domxref("BaseAudioContext/destination", "AudioContext.destination")}}.

{{InheritanceDiagram}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Số lượng đầu vào</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Số lượng đầu ra</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Chế độ số lượng kênh</th>
      <td><code>"explicit"</code></td>
    </tr>
    <tr>
      <th scope="row">Số lượng kênh</th>
      <td><code>2</code></td>
    </tr>
    <tr>
      <th scope="row">Diễn giải kênh</th>
      <td><code>"speakers"</code></td>
    </tr>
  </tbody>
</table>

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ đối tượng cha của nó, {{domxref("AudioNode")}}_.

- {{domxref("AudioDestinationNode.maxChannelCount")}}
  - : Một `unsigned long` xác định số lượng kênh tối đa mà thiết bị vật lý có thể xử lý.

## Phương thức thể hiện

_Không có phương thức riêng; kế thừa các phương thức từ đối tượng cha của nó, {{domxref("AudioNode")}}_.

## Ví dụ

Không cần thiết lập phức tạp để dùng `AudioDestinationNode` vì theo mặc định, nó biểu diễn đầu ra của hệ thống người dùng (ví dụ: loa của họ), nên bạn có thể nối nó vào đồ thị âm thanh chỉ với vài dòng mã:

```js
const audioCtx = new AudioContext();
const source = audioCtx.createMediaElementSource(myMediaElement);
source.connect(gainNode);
gainNode.connect(audioCtx.destination);
```

Để xem một cách triển khai đầy đủ hơn, hãy xem một trong các ví dụ Web Audio của MDN, như [Voice-change-o-matic](https://mdn.github.io/webaudio-examples/voice-change-o-matic/) hoặc [Violent Theremin](https://github.com/mdn/webaudio-examples/tree/main/violent-theremin).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
