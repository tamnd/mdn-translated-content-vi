---
title: "PictureInPictureWindow: resize event"
short-title: resize
slug: Web/API/PictureInPictureWindow/resize_event
page-type: web-api-event
browser-compat: api.PictureInPictureWindow.resize_event
---

{{APIRef("Picture-in-Picture API")}}

Sự kiện **`resize`** kích hoạt khi cửa sổ video nổi đã được thay đổi kích thước.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("resize", (event) => { })

onresize = (event) => { }
```

## Loại sự kiện

Một {{domxref("PictureInPictureEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("PictureInPictureEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha, {{domxref("Event")}}, cũng có sẵn._

- {{domxref("PictureInPictureEvent.pictureInPictureWindow")}}
  - : Trả về {{domxref("PictureInPictureWindow")}} đang được thay đổi kích thước.

## Ví dụ

### Ghi log kích thước cửa sổ

```html
<p>Resize the floating video window to fire the <code>resize</code> event.</p>
<p>Window height: <span id="height"></span></p>
<p>Window width: <span id="width"></span></p>
<video id="video" src="" muted autoplay></video>
```

```js
const video = document.querySelector("#video");
const heightOutput = document.querySelector("#height");
const widthOutput = document.querySelector("#width");

function resize(evt) {
  heightOutput.textContent = evt.target.height;
  widthOutput.textContent = evt.target.width;
}

video.requestPictureInPicture().then((pictureInPictureWindow) => {
  pictureInPictureWindow.onresize = resize;
  // or
  pictureInPictureWindow.addEventListener("resize", resize);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
