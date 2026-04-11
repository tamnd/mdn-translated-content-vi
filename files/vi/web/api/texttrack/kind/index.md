---
title: "TextTrack: kind property"
short-title: kind
slug: Web/API/TextTrack/kind
page-type: web-api-instance-property
browser-compat: api.TextTrack.kind
---

{{APIRef("WebVTT")}}

Thuộc tính chỉ đọc **`kind`** của giao diện {{domxref("TextTrack")}} trả về loại text track mà đối tượng này đại diện. Điều này quyết định cách track sẽ được tác nhân người dùng xử lý.

## Giá trị

Một chuỗi. Một trong các giá trị sau:

- `"subtitles"`
  - : Các cue được phủ lên video. Vị trí của các cue được điều khiển bằng các thuộc tính của đối tượng kế thừa từ {{domxref("TextTrackCue")}}, ví dụ {{domxref("VTTCue")}}.
- `"captions"`
  - : Các cue được phủ lên video. Vị trí của các cue được điều khiển bằng các thuộc tính của đối tượng kế thừa từ {{domxref("TextTrackCue")}}, ví dụ {{domxref("VTTCue")}}.
- `"descriptions"`
  - : Các cue được cung cấp ở dạng phi thị giác.
- `"chapters"`
  - : Tác nhân người dùng sẽ cung cấp cơ chế để điều hướng bằng cách chọn một cue.
- `"metadata"`
  - : Dữ liệu bổ sung liên quan đến dữ liệu media, có thể được sử dụng cho các giao diện tương tác.

## Ví dụ

Trong ví dụ sau, giá trị của `kind` được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";
console.log(track.kind);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
