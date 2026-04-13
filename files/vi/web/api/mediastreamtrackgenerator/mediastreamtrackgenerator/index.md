---
title: "MediaStreamTrackGenerator: hàm khởi tạo MediaStreamTrackGenerator()"
short-title: MediaStreamTrackGenerator()
slug: Web/API/MediaStreamTrackGenerator/MediaStreamTrackGenerator
page-type: web-api-constructor
status:
  - experimental
  - non-standard
browser-compat: api.MediaStreamTrackGenerator.MediaStreamTrackGenerator
---

{{APIRef("Insertable Streams for MediaStreamTrack API")}}{{SeeCompatTable}}{{Non-standard_Header}}

Hàm khởi tạo **`MediaStreamTrackGenerator()`** tạo một đối tượng {{domxref("MediaStreamTrackGenerator")}} mới, tiêu thụ một luồng các khung phương tiện và hiển thị một {{domxref("MediaStreamTrack")}}.

## Cú pháp

```js-nolint
new MediaStreamTrackGenerator(options)
```

### Tham số

- `options` {{Experimental_Inline}} {{Non-standard_Inline}}
  - : Đối tượng chứa thuộc tính `kind`, là một trong các chuỗi sau:
    - `"audio"`
      - : Xác định rằng luồng chấp nhận các đối tượng {{domxref("AudioTrack")}}.
    - `"video"`
      - : Xác định rằng luồng chấp nhận các đối tượng {{domxref("VideoTrack")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `init.kind` không phải là `"video"` hoặc `"audio"`.

## Ví dụ

Trong ví dụ sau, một `MediaStreamTrackGenerator` video mới được tạo.

```js
const trackGenerator = new MediaStreamTrackGenerator({ kind: "video" });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Insertable streams for MediaStreamTrack](https://developer.chrome.com/docs/capabilities/web-apis/mediastreamtrack-insertable-media-processing)
