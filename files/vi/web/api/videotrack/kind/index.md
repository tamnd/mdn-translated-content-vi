---
title: "VideoTrack: kind property"
short-title: kind
slug: Web/API/VideoTrack/kind
page-type: web-api-instance-property
browser-compat: api.VideoTrack.kind
---

{{APIRef("HTML DOM")}}

Thuộc tính **`kind`** chứa chuỗi chỉ định danh mục video có trong **{{domxref("VideoTrack")}}**.

`kind` có thể được dùng để xác định các tình huống trong đó các track cụ thể nên được bật hoặc tắt. Xem [Các chuỗi kind của video track](#video_track_kind_strings) để biết danh sách các loại có sẵn cho video track.

## Giá trị

Chuỗi chỉ định loại nội dung mà media đại diện. Chuỗi là một trong những chuỗi được tìm thấy trong [Các chuỗi kind của video track](#video_track_kind_strings) dưới đây.

## Các chuỗi kind của video track

Các loại có sẵn cho video track là:

- `"alternative"`
  - : Một thay thế tiềm năng cho track chính, chẳng hạn như một cảnh quay video khác hoặc phiên bản của nhạc nền chỉ có âm nhạc mà không có hội thoại.
- `"captions"`
  - : Phiên bản của video track chính với phụ đề đã được đốt vào.
- `"main"`
  - : Video track chính.
- `"sign"`
  - : Bản diễn giải ngôn ngữ ký hiệu của một audio track.
- `"subtitles"`
  - : Phiên bản của video track chính với phụ đề đã được đốt vào.
- `"commentary"`
  - : Video track chứa bình luận. Ví dụ có thể dùng để chứa track bình luận của đạo diễn trong một bộ phim.
- `""` (chuỗi rỗng)
  - : Track không có loại rõ ràng, hoặc loại được cung cấp bởi metadata của track không được {{Glossary("user agent")}} nhận ra.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
