---
title: "MediaStream: constructor MediaStream()"
short-title: MediaStream()
slug: Web/API/MediaStream/MediaStream
page-type: web-api-constructor
browser-compat: api.MediaStream.MediaStream
---

{{APIRef("Media Capture and Streams")}}

Constructor **`MediaStream()`** trả về một {{domxref("MediaStream")}} mới được tạo, đóng vai trò là tập hợp các track phương tiện, mỗi track được đại diện bởi một đối tượng {{domxref("MediaStreamTrack")}}.

Nếu bất kỳ tham số nào được truyền, các track được chỉ định sẽ được thêm vào luồng mới. Ngược lại, luồng không có track nào.

## Cú pháp

```js-nolint
new MediaStream()
new MediaStream(stream)
new MediaStream(tracks)
```

### Tham số

- `stream` {{optional_inline}}
  - : Một đối tượng {{domxref("MediaStream")}} khác có các track được tự động thêm vào luồng mới được tạo. Các track không bị xóa khỏi luồng gốc, vì vậy chúng được chia sẻ bởi hai luồng.
- `tracks` {{optional_inline}}
  - : Một {{jsxref("Array")}} các đối tượng {{domxref("MediaStreamTrack")}}, mỗi đối tượng cho một track cần thêm vào luồng.

### Giá trị trả về

Một đối tượng {{domxref("MediaStream")}} mới được tạo, trống hoặc chứa các track được cung cấp, nếu có.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaStream")}}
