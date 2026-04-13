---
title: "MediaStreamAudioSourceNode: thuộc tính mediaStream"
short-title: mediaStream
slug: Web/API/MediaStreamAudioSourceNode/mediaStream
page-type: web-api-instance-property
browser-compat: api.MediaStreamAudioSourceNode.mediaStream
---

{{APIRef("Web Audio API")}}

Thuộc tính chỉ đọc **`mediaStream`** của giao diện {{domxref("MediaStreamAudioSourceNode")}} cho biết {{domxref("MediaStream")}} chứa track âm thanh mà nút đang nhận âm thanh từ đó.

Luồng này được chỉ định khi nút được tạo lần đầu, sử dụng hàm khởi tạo {{domxref("MediaStreamAudioSourceNode.MediaStreamAudioSourceNode", "MediaStreamAudioSourceNode()")}} hoặc phương thức {{domxref("AudioContext.createMediaStreamSource()")}}.

## Giá trị

Một {{domxref("MediaStream")}} đại diện cho luồng chứa {{domxref("MediaStreamTrack")}} phục vụ làm nguồn âm thanh cho nút.

{{Glossary("user agent")}} sử dụng track âm thanh đầu tiên nó tìm thấy trên luồng được chỉ định làm nguồn âm thanh cho nút này. Tuy nhiên, không có cách nào để chắc chắn track nào sẽ được sử dụng trên các luồng có nhiều track. Nếu track cụ thể quan trọng với bạn hoặc bạn cần quyền truy cập vào track đó, hãy sử dụng {{domxref("MediaStreamTrackAudioSourceNode")}} thay thế.

## Ví dụ

```js
const audioCtx = new window.AudioContext();
let options = {
  mediaStream: stream,
};

let source = new MediaStreamAudioSourceNode(audioCtx, options);
console.log(source.mediaStream);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
