---
title: MediaElementAudioSourceNode
slug: Web/API/MediaElementAudioSourceNode
page-type: web-api-interface
browser-compat: api.MediaElementAudioSourceNode
---

{{APIRef("Web Audio API")}}

Giao diện `MediaElementAudioSourceNode` đại diện cho một nguồn âm thanh bao gồm phần tử HTML {{ htmlelement("audio") }} hoặc {{ htmlelement("video") }}. Đây là {{domxref("AudioNode")}} hoạt động như một nguồn âm thanh.

`MediaElementAudioSourceNode` không có đầu vào và có đúng một đầu ra, được tạo bằng phương thức {{domxref("AudioContext.createMediaElementSource()")}}. Số kênh trong đầu ra bằng số kênh của âm thanh được tham chiếu bởi {{domxref("HTMLMediaElement")}} được sử dụng khi tạo nút, hoặc là 1 nếu {{domxref("HTMLMediaElement")}} không có âm thanh.

{{InheritanceDiagram}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Số đầu vào</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Số đầu ra</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Số kênh</th>
      <td>
        2 (lưu ý rằng {{domxref("AudioNode.channelCount")}} chỉ được sử dụng cho việc trộn lên và trộn xuống các đầu vào {{domxref("AudioNode")}}, và <code>MediaElementAudioSourceNode</code> không có đầu vào nào)
      </td>
    </tr>
  </tbody>
</table>

## Hàm khởi tạo

- {{domxref("MediaElementAudioSourceNode.MediaElementAudioSourceNode", "MediaElementAudioSourceNode()")}}
  - : Tạo một phiên bản đối tượng `MediaElementAudioSourceNode` mới.

## Thuộc tính phiên bản

_Kế thừa thuộc tính từ lớp cha, {{domxref("AudioNode")}}_.

- {{domxref("MediaElementAudioSourceNode.mediaElement", "mediaElement")}} {{ReadOnlyInline}}
  - : {{domxref("HTMLMediaElement")}} được sử dụng khi xây dựng `MediaStreamAudioSourceNode` này.

## Phương thức phiên bản

_Kế thừa phương thức từ lớp cha, {{domxref("AudioNode")}}_.

## Ví dụ

Xem [`AudioContext.createMediaElementSource()`](/en-US/docs/Web/API/AudioContext/createMediaElementSource#examples) để xem mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
