---
title: "TextTrack: addCue() method"
short-title: addCue()
slug: Web/API/TextTrack/addCue
page-type: web-api-instance-method
browser-compat: api.TextTrack.addCue
---

{{APIRef("WebVTT")}}

Phương thức **`addCue()`** của giao diện {{domxref("TextTrack")}} thêm một cue mới vào danh sách các cue.

## Cú pháp

```js-nolint
addCue(cue)
```

### Tham số

- `cue`
  - : Một {{domxref("TextTrackCue")}}.

> [!NOTE]
> Giao diện {{domxref("TextTrackCue")}} là một lớp trừu tượng được dùng làm lớp cha cho các giao diện cue khác như {{domxref("VTTCue")}}. Do đó, khi thêm một cue, bạn sẽ sử dụng một trong các kiểu cue kế thừa từ `TextTrackCue`.

### Giá trị trả về

Undefined.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu các quy tắc cho {{domxref("TextTrackList")}} này không khớp với những quy tắc phù hợp cho {{domxref("TextTrackCue")}} đến.

## Ví dụ

Trong ví dụ sau, hai cue được thêm vào text track của video bằng `addCue()`.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";
track.addCue(new VTTCue(0, 0.9, "Hildy!"));
track.addCue(new VTTCue(1, 1.4, "How are you?"));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
