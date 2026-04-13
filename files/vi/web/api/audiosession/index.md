---
title: AudioSession
slug: Web/API/AudioSession
page-type: web-api-interface
status:
  - experimental
browser-compat: api.AudioSession
---

{{APIRef("Audio Session API")}}{{SeeCompatTable}}

Giao diện **`AudioSession`** của [Audio Session API](/en-US/docs/Web/API/Audio_Session_API) cho phép nhà phát triển chỉ định cách âm thanh từ một ứng dụng web tương tác với âm thanh khác đang phát trên thiết bị.

Một phiên âm thanh đại diện cho đầu ra âm thanh được tổng hợp từ một trang web. Phiên này cho phép các trang web thể hiện tính chất chung của đầu ra âm thanh, chẳng hạn như phát lại, ghi âm, hoặc các âm thanh tạm thời như thông báo. Nền tảng sau đó có thể dùng thông tin này để xác định âm thanh dựa trên web nên tương tác như thế nào với các ứng dụng khác trên thiết bị, ví dụ liệu âm thanh web có nên tạm dừng âm thanh khác hay phát song song với nó.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

- {{domxref("AudioSession.type")}} {{Experimental_Inline}}
  - : Một chuỗi biểu thị kiểu của phiên âm thanh. Các giá trị có thể có gồm `"auto"`, `"playback"`, `"transient"`, `"transient-solo"`, `"ambient"` và `"play-and-record"`.

## Ví dụ

### Đặt kiểu phiên âm thanh cho ứng dụng hội nghị truyền hình

Ví dụ sau đặt kiểu phiên âm thanh thành `"play-and-record"` cho một ứng dụng hội nghị truyền hình. Trên các nền tảng hỗ trợ, điều này báo hiệu rằng trang cần phát lại và ghi âm đồng thời, điều này có thể khiến hệ thống định tuyến âm thanh qua đúng đầu ra (ví dụ: loa thoại thay vì loa ngoài trên thiết bị di động) và ngăn âm thanh từ các ứng dụng khác làm gián đoạn cuộc gọi.

```js
navigator.audioSession.type = "play-and-record";

// Bắt đầu phát phương tiện từ xa
remoteVideo.srcObject = remoteMediaStream;
remoteVideo.play();

// Bắt đầu thu phương tiện cục bộ
const stream = await navigator.mediaDevices.getUserMedia({
  audio: true,
  video: true,
});
localVideo.srcObject = stream;
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Navigator.audioSession")}}
- [Audio Session API](/en-US/docs/Web/API/Audio_Session_API)
