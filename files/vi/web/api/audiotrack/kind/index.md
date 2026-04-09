---
title: "AudioTrack: thuộc tính kind"
short-title: kind
slug: Web/API/AudioTrack/kind
page-type: web-api-instance-property
browser-compat: api.AudioTrack.kind
---

{{APIRef("HTML DOM")}}

Thuộc tính **`kind`** chứa một chuỗi cho biết loại nội dung âm thanh có trong **{{domxref("AudioTrack")}}**.

`kind` có thể được dùng để xác định những trường hợp mà các rãnh cụ thể nên được bật hoặc tắt. Xem [Các chuỗi `kind` của rãnh âm thanh](#audio-track-kind-strings) để biết danh sách các loại có sẵn cho rãnh âm thanh.

## Giá trị

Một chuỗi chỉ định kiểu nội dung mà phương tiện biểu diễn. Chuỗi này là một trong các giá trị được liệt kê trong [Các chuỗi `kind` của rãnh âm thanh](#audio-track-kind-strings) bên dưới.

## Audio track kind strings

Các loại có sẵn cho rãnh âm thanh là:

- `"alternative"`
  - : Một lựa chọn thay thế tiềm năng cho rãnh chính, chẳng hạn như một bản thu âm khác hoặc một phiên bản nhạc nền chỉ có nhạc mà không có lời thoại.
- `"descriptions"`
  - : Một rãnh âm thanh cung cấp phần mô tả bằng âm thanh về hành động được thể hiện trong rãnh video.
- `"main"`
  - : Rãnh âm thanh chính.
- `"main-desc"`
  - : Rãnh âm thanh chính có trộn thêm phần mô tả bằng âm thanh.
- `"translation"`
  - : Một phiên bản đã được dịch của rãnh âm thanh chính.
- `"commentary"`
  - : Một rãnh âm thanh chứa phần bình luận. Ví dụ, có thể dùng để chứa rãnh bình luận của đạo diễn cho một bộ phim.
- `""` (chuỗi rỗng)
  - : Rãnh không có loại được chỉ định rõ ràng, hoặc loại được cung cấp bởi siêu dữ liệu của rãnh không được {{Glossary("user agent")}} nhận ra.

## Các đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
