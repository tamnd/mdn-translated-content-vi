---
title: "MediaElementAudioSourceNode: thuộc tính mediaElement"
short-title: mediaElement
slug: Web/API/MediaElementAudioSourceNode/mediaElement
page-type: web-api-instance-property
browser-compat: api.MediaElementAudioSourceNode.mediaElement
---

{{APIRef("Web Audio API")}}

Thuộc tính chỉ đọc **`mediaElement`** của giao diện {{domxref("MediaElementAudioSourceNode")}} cho biết {{domxref("HTMLMediaElement")}} chứa track âm thanh mà nút đang nhận âm thanh từ đó.

Luồng này được chỉ định khi nút được tạo lần đầu, sử dụng hàm khởi tạo {{domxref("MediaElementAudioSourceNode.MediaElementAudioSourceNode", "MediaElementAudioSourceNode()")}} hoặc phương thức {{domxref("AudioContext.createMediaElementSource()")}}.

## Giá trị

Một {{domxref("HTMLMediaElement")}} đại diện cho phần tử chứa nguồn âm thanh cho nút.

## Ví dụ

```js
const audioCtx = new window.AudioContext();
const audioElem = document.querySelector("audio");

let options = {
  mediaElement: audioElem,
};

let source = new MediaElementAudioSourceNode(audioCtx, options);
console.log(source.mediaElement);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
