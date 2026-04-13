---
title: "MediaStream: phương thức removeTrack()"
short-title: removeTrack()
slug: Web/API/MediaStream/removeTrack
page-type: web-api-instance-method
browser-compat: api.MediaStream.removeTrack
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`removeTrack()`** của giao diện {{domxref("MediaStream")}} xóa một {{domxref("MediaStreamTrack")}} khỏi luồng.

## Cú pháp

```js-nolint
removeTrack(track)
```

### Tham số

- `track`
  - : Một {{domxref("MediaStreamTrack")}} sẽ bị xóa khỏi luồng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ sau minh họa cách xóa các track audio và video khỏi một {{domxref("MediaStream")}}.
`fetchStreamFunction` là một trình xử lý sự kiện cho `fetchStreamButton`. Khi nút được nhấp, audio và video được lấy từ các thiết bị của hệ thống. `removeTracksFunction` là trình xử lý sự kiện cho `removeTracksButton`.
Khi nút này được nhấp, các track audio và video bị xóa khỏi {{domxref("MediaStream")}}.

```js
let initialStream = null;
let newStream = null;

let fetchStreamButton = document.getElementById("fetchStream");
let removeTracksButton = document.getElementById("removeTracks");

async function fetchStreamFunction() {
  initialStream = await navigator.mediaDevices.getUserMedia({
    video: { width: 620, height: 310 },
    audio: true,
  });
  if (initialStream) {
    await attachToDOM(initialStream);
  }
}

async function attachToDOM(stream) {
  newStream = new MediaStream(stream.getTracks());
  document.querySelector("video").srcObject = newStream;
}

async function removeTracksFunction() {
  let videoTrack = newStream.getVideoTracks()[0];
  let audioTrack = newStream.getAudioTracks()[0];

  newStream.removeTrack(videoTrack);
  newStream.removeTrack(audioTrack);

  // Luồng sẽ trống
  console.log(newStream.getTracks());
}

fetchStreamButton.addEventListener("click", fetchStreamFunction);
removeTracksButton.addEventListener("click", removeTracksFunction);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
