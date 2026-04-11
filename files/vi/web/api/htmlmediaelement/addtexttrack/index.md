---
title: "HTMLMediaElement: phương thức addTextTrack()"
short-title: addTextTrack()
slug: Web/API/HTMLMediaElement/addTextTrack
page-type: web-api-instance-method
browser-compat: api.HTMLMediaElement.addTextTrack
---

{{APIRef("HTML DOM")}}

Phương thức **`addTextTrack()`** của giao diện {{domxref("HTMLMediaElement")}} tạo một đối tượng {{domxref("TextTrack")}} mới và thêm nó vào thành phần media. Nó kích hoạt một sự kiện {{domxref("TextTrackList/addtrack_event", "addtrack")}} trên {{domxref("HTMLMediaElement/textTracks", "textTracks")}} của thành phần truyền thông này. Không thể sử dụng phương pháp này trên giao diện {{domxref("TextTrackList")}}, chỉ có thể sử dụng {{domxref("HTMLMediaElement")}}.

## Cú pháp

```js-nolint
addTextTrack(kind)
addTextTrack(kind, label)
addTextTrack(kind, label, language)
```

### Tham số

- `kind`
- : Một chuỗi đại diện cho thuộc tính {{domxref("TextTrack.kind")}} (`subtitles`, `captions`, `descriptions`, `chapters`, hoặc `metadata`.
- `label`
- : Một chuỗi đại diện cho thuộc tính {{domxref("TextTrack.label")}}.
- `language`
- : Một chuỗi đại diện cho thuộc tính {{domxref("TextTrack.language")}}.

### Giá trị trả về

Đối tượng {{domxref("TextTrack")}} mới được tạo.

### Ngoại lệ

Không có.

## Ví dụ

Ví dụ này thêm {{domxref("TextTrack")}} mới với `kind` được đặt thành `"subtitles"` và thêm {{domxref("VTTCue")}} mới vào đó.

```js
const video = document.querySelector("video");
const newTrack = video.addTextTrack("subtitles");
newTrack.addCue(new VTTCue(3, 6, "Hello world!"));
console.log(newTrack.cues[0].text);
// "Hello world!"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TextTrack")}}
- [WebVTT API](/en-US/docs/Web/API/WebVTT_API)
- [Web media technologies](/en-US/docs/Web/Media)
- Học tập: [Video and audio content](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio)
- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
