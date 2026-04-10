---
title: "MediaStreamTrack: phương thức getSettings()"
short-title: getSettings()
slug: Web/API/MediaStreamTrack/getSettings
page-type: web-api-instance-method
browser-compat: api.MediaStreamTrack.getSettings
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`getSettings()`** của
giao diện {{domxref("MediaStreamTrack")}} trả về một đối tượng {{domxref("MediaTrackSettings")}}
chứa các giá trị hiện tại của mỗi thuộc tính có thể ràng buộc cho
`MediaStreamTrack` hiện tại.

Xem [Khả năng, ràng buộc và cài đặt](/vi/docs/Web/API/Media_Capture_and_Streams_API/Constraints) để biết chi tiết về cách làm việc với các thuộc tính có thể ràng buộc.

## Cú pháp

```js-nolint
getSettings()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("MediaTrackSettings")}} mô tả cấu hình hiện tại của
các thuộc tính có thể ràng buộc của track.

> [!NOTE]
> Đối tượng trả về xác định các giá trị hiện tại của mọi
> thuộc tính có thể ràng buộc, bao gồm những thuộc tính là mặc định của nền tảng thay vì
> được đặt rõ ràng bởi mã của trang web. Để lấy các ràng buộc được thiết lập gần đây nhất
> cho các thuộc tính của track, như được chỉ định bởi mã của trang web, hãy sử dụng
> {{domxref("MediaStreamTrack.getConstraints", "getConstraints()")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}
