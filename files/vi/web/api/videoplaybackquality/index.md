---
title: VideoPlaybackQuality
slug: Web/API/VideoPlaybackQuality
page-type: web-api-interface
browser-compat: api.VideoPlaybackQuality
---

{{APIRef("HTML DOM")}}

Đối tượng **`VideoPlaybackQuality`** được trả về bởi phương thức {{domxref("HTMLVideoElement.getVideoPlaybackQuality()")}} và chứa các số liệu có thể được dùng để xác định chất lượng phát lại của video.

## Thuộc tính phiên bản

_Giao diện `VideoPlaybackQuality` không kế thừa thuộc tính từ bất kỳ giao diện nào khác._

- {{domxref("VideoPlaybackQuality.creationTime", "creationTime")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} chứa thời gian tính bằng mili giây giữa lúc bắt đầu điều hướng và lúc tạo đối tượng.
- {{domxref("VideoPlaybackQuality.droppedVideoFrames", "droppedVideoFrames")}} {{ReadOnlyInline}}
  - : Một `unsigned long` cho biết số khung hình video bị bỏ kể từ khi tạo {{domxref("HTMLVideoElement")}} liên quan.
- {{domxref("VideoPlaybackQuality.totalVideoFrames", "totalVideoFrames")}} {{ReadOnlyInline}}
  - : Một `unsigned long` cho biết số khung hình video được tạo ra và bị bỏ kể từ khi tạo {{domxref("HTMLVideoElement")}} liên quan.

### Các thuộc tính đã lỗi thời

- {{domxref("VideoPlaybackQuality.corruptedVideoFrames", "corruptedVideoFrames")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Một `unsigned long` cho biết số khung hình video bị hỏng kể từ khi tạo {{domxref("HTMLVideoElement")}} liên quan. Một khung hình bị hỏng có thể được tạo ra hoặc bị bỏ.
- {{domxref("VideoPlaybackQuality.totalFrameDelay", "totalFrameDelay")}} {{ReadOnlyInline}} {{deprecated_inline}} {{Non-standard_Inline}}
  - : Một `double` chứa tổng độ trễ khung hình kể từ khi tạo {{domxref("HTMLVideoElement")}} liên quan. Độ trễ khung hình là hiệu giữa thời gian trình chiếu lý thuyết của khung hình và thời gian hiển thị thực tế của nó.

## Phương thức phiên bản

_Giao diện `VideoPlaybackQuality` không có phương thức và không kế thừa bất kỳ phương thức nào._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phương thức {{domxref("HTMLVideoElement.getVideoPlaybackQuality()")}} để lấy đối tượng `VideoPlaybackQuality`
- {{domxref("MediaSource")}}
- {{domxref("SourceBuffer")}}
