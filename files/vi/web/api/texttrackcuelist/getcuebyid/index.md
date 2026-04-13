---
title: "TextTrackCueList: getCueById() method"
short-title: getCueById()
slug: Web/API/TextTrackCueList/getCueById
page-type: web-api-instance-method
browser-compat: api.TextTrackCueList.getCueById
---

{{APIRef("WebVTT")}}

Phương thức **`getCueById()`** của giao diện {{domxref("TextTrackCueList")}} trả về {{domxref("VTTCue")}} đầu tiên trong danh sách được đại diện bởi đối tượng `TextTrackCueList` có định danh khớp với giá trị của `id`.

## Cú pháp

```js-nolint
getCueById(id)
```

### Tham số

- `id`
  - : Một chuỗi là định danh của cue.

### Giá trị trả về

Một đối tượng {{domxref("VTTCue")}}.

## Ví dụ

Thuộc tính {{domxref("TextTrack.cues")}} trả về {{domxref("TextTrackCueList")}} chứa các cue hiện tại cho rãnh đó. Gọi `cues.getCueById("second")` trả về {{domxref("VTTCue")}} có ID là "second".

```plain
WEBVTT

first
00:00:00.000 --> 00:00:00.999 line:80%
Hildy!

second
00:00:01.000 --> 00:00:01.499 line:80%
How are you?
```

```js
const video = document.getElementById("video");
video.onplay = () => {
  console.log(video.textTracks[0].cues.getCueById("second")); // một đối tượng VTTCue;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
