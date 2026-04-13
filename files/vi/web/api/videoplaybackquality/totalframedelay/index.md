---
title: "VideoPlaybackQuality: totalFrameDelay property"
short-title: totalFrameDelay
slug: Web/API/VideoPlaybackQuality/totalFrameDelay
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VideoPlaybackQuality.totalFrameDelay
---

{{APIRef("Media Source Extensions")}}{{deprecated_header}}{{Non-standard_header}}

Thuộc tính chỉ đọc **`VideoPlaybackQuality.totalFrameDelay`** trả về một `double` chứa tổng độ trễ khung hình kể từ khi tạo {{domxref("HTMLVideoElement")}} liên quan. Độ trễ khung hình là hiệu giữa thời gian trình chiếu lý thuyết của khung hình và thời gian hiển thị thực tế của nó.

## Giá trị

Một số.

## Ví dụ

```js
const videoElt = document.getElementById("my_vid");
const quality = videoElt.getVideoPlaybackQuality();

alert(quality.totalFrameDelay);
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phương thức {{domxref("HTMLVideoElement.getVideoPlaybackQuality()")}} để xây dựng và trả về giao diện này.
- {{domxref("MediaSource")}}
- {{domxref("SourceBuffer")}}
