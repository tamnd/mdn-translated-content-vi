---
title: "TextTrack: removeCue() method"
short-title: removeCue()
slug: Web/API/TextTrack/removeCue
page-type: web-api-instance-method
browser-compat: api.TextTrack.removeCue
---

{{APIRef("WebVTT")}}

Phương thức **`removeCue()`** của giao diện {{domxref("TextTrack")}} xóa một cue khỏi danh sách các cue.

## Cú pháp

```js-nolint
removeCue(cue)
```

### Tham số

- `cue`
  - : Một {{domxref("TextTrackCue")}}.

### Giá trị trả về

Undefined.

### Ngoại lệ

- `NotFoundError` {{domxref("DOMException")}}
  - : Ném ra nếu cue đã cho không được tìm thấy trong danh sách các cue.

> [!NOTE]
> Giao diện {{domxref("TextTrackCue")}} là một lớp trừu tượng được dùng làm lớp cha cho các giao diện cue khác như {{domxref("VTTCue")}}. Do đó, khi xóa một cue, bạn sẽ truyền vào một trong các kiểu cue kế thừa từ `TextTrackCue`.

## Ví dụ

Trong ví dụ sau, một cue được thêm vào text track của video bằng `addCue()`, sau đó bị xóa bằng `removeCue`.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";
let cue = new VTTCue(0, 0.9, "Hildy!");
track.addCue(cue);
track.removeCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
