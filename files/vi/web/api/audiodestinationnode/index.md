---
title: AudioDestinationNode
slug: Web/API/AudioDestinationNode
page-type: web-api-interface
browser-compat: api.AudioDestinationNode
---

{{APIRef("Web Audio API")}}

`AudioDestinationNode` là giao diện đại diện cho điểm đích cuối cùng của một đồ thị âm thanh trong một ngữ cảnh nhất định - thường là loa của thiết bị. Nó cũng có thể là node sẽ "ghi" dữ liệu âm thanh khi được dùng cùng với `OfflineAudioContext`.

`AudioDestinationNode` không có đầu ra (vì chính nó _là_ đầu ra, không thể nối thêm `AudioNode` nào phía sau nó trong đồ thị âm thanh) và có một đầu vào. Số kênh trong đầu vào phải nằm trong khoảng từ `0` đến giá trị `maxChannelCount`, nếu không sẽ phát sinh ngoại lệ.

`AudioDestinationNode` của một `AudioContext` nhất định có thể được truy xuất bằng thuộc tính {{domxref("BaseAudioContext/destination", "AudioContext.destination")}}.

{{InheritanceDiagram}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Số đầu vào</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Số đầu ra</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Chế độ số kênh</th>
      <td><code>"explicit"</code></td>
    </tr>
    <tr>
      <th scope="row">Số kênh</th>
      <td><code>2</code></td>
    </tr>
    <tr>
      <th scope="row">Diễn giải kênh</th>
      <td><code>"speakers"</code></td>
    </tr>
  </tbody>
</table>

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ cha của nó, {{domxref("AudioNode")}}_.

- {{domxref("AudioDestinationNode.maxChannelCount")}}
  - : Một `unsigned long` xác định số kênh tối đa mà thiết bị vật lý có thể xử lý.

## Phương thức thể hiện

_Không có phương thức riêng; kế thừa các phương thức từ cha của nó, {{domxref("AudioNode")}}_.

## Ví dụ

Không có thiết lập phức tạp nào để dùng `AudioDestinationNode` - theo mặc định, nó biểu diễn đầu ra của hệ thống người dùng (ví dụ như loa), vì vậy bạn có thể nối nó vào trong một đồ thị âm thanh chỉ với vài dòng mã:

```js
const audioCtx = new AudioContext();
const source = audioCtx.createMediaElementSource(myMediaElement);
source.connect(gainNode);
gainNode.connect(audioCtx.destination);
```

Để xem một triển khai đầy đủ hơn, hãy xem một trong các ví dụ Web Audio của MDN, chẳng hạn như [Voice-change-o-matic](https://mdn.github.io/webaudio-examples/voice-change-o-matic/) hoặc [Violent Theremin](https://github.com/mdn/webaudio-examples/tree/main/violent-theremin).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
