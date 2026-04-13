---
title: "Navigator: thuộc tính audioSession"
short-title: audioSession
slug: Web/API/Navigator/audioSession
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Navigator.audioSession
---

{{APIRef("Audio Session API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`audioSession`** của giao diện {{domxref("Navigator")}} trả về đối tượng {{domxref("AudioSession")}} cho tài liệu hiện tại.

Giao diện {{domxref("AudioSession")}} có thể được sử dụng để kiểm soát cách âm thanh từ ứng dụng web tương tác với âm thanh khác đang phát trên thiết bị, chẳng hạn như cho phép nhà phát triển chỉ định liệu âm thanh của ứng dụng của họ sẽ tự phát hay cùng với âm thanh thiết bị khác.

## Giá trị

Một đối tượng {{domxref("AudioSession")}}.

## Ví dụ

### Đặt loại phiên âm thanh

Ví dụ sau đặt loại phiên âm thanh thành `"play-and-record"` trước khi bắt đầu cuộc gọi điện video:

```js
navigator.audioSession.type = "play-and-record";

// Start video call
const stream = await navigator.mediaDevices.getUserMedia({
  audio: true,
  video: true,
});
localVideo.srcObject = stream;
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("AudioSession")}}
- {{domxref("AudioSession.type")}}
- [Audio Session API](/en-US/docs/Web/API/Audio_Session_API)
