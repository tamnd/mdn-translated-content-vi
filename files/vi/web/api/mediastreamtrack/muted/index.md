---
title: "MediaStreamTrack: thuộc tính muted"
short-title: muted
slug: Web/API/MediaStreamTrack/muted
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.muted
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính chỉ đọc **`muted`** của giao diện
{{domxref("MediaStreamTrack")}} trả về một giá trị boolean
cho biết liệu track hiện có không thể cung cấp đầu ra phương tiện hay không.

> [!NOTE]
> Để triển khai cách cho người dùng tắt và bật tiếng một track, hãy sử dụng
> thuộc tính {{domxref("MediaStreamTrack.enabled", "enabled")}}. Khi một track bị tắt
> bằng cách đặt `enabled` thành `false`, nó chỉ tạo ra các khung trống
> (các khung âm thanh trong đó mọi mẫu là 0, hoặc các khung video trong đó mọi pixel là
> màu đen).

## Giá trị

Một boolean là `true` nếu track hiện đang bị tắt tiếng, hoặc
`false` nếu track hiện đang bật tiếng.

> [!NOTE]
> Khi có thể, tránh thăm dò `muted` để theo dõi trạng thái tắt tiếng của track.
> Thay vào đó, hãy thêm trình lắng nghe sự kiện cho các sự kiện {{domxref("MediaStreamTrack.mute_event", "mute")}} và {{domxref("MediaStreamTrack.unmute_event", "unmute")}}.

## Ví dụ

Ví dụ này đếm số lượng track trong một mảng các đối tượng {{domxref("MediaStreamTrack")}}
hiện đang bị tắt tiếng.

```js
let mutedCount = 0;

trackList.forEach((track) => {
  if (track.muted) {
    mutedCount += 1;
  }
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}
