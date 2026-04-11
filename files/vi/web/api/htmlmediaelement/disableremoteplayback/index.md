---
title: "HTMLMediaElement: thuộc tính disableRemotePlayback"
short-title: disableRemotePlayback
slug: Web/API/HTMLMediaElement/disableRemotePlayback
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.disableRemotePlayback
---

{{APIRef("Remote Playback API")}}

Thuộc tính **`disableRemotePlayback`** của giao diện {{domxref("HTMLMediaElement")}} xác định xem phần tử phương tiện có được phép có giao diện người dùng phát lại từ xa hay không.

## Giá trị

Giá trị boolean cho biết liệu phần tử phương tiện có thể phát lại từ xa hay không
Giao diện người dùng. (`false` có nghĩa là "không bị tắt", có nghĩa là "đã bật")

## Ví dụ

```js
const obj = document.createElement("audio");
obj.disableRemotePlayback = true;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [The `disableremoteplayback` attribute of the `<audio>` element](/en-US/docs/Web/HTML/Reference/Elements/audio#disableremoteplayback)
- [The `disableremoteplayback` attribute of the `<video>` element](/en-US/docs/Web/HTML/Reference/Elements/video#disableremoteplayback)
