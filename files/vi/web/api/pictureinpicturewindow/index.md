---
title: PictureInPictureWindow
slug: Web/API/PictureInPictureWindow
page-type: web-api-interface
browser-compat: api.PictureInPictureWindow
---

{{APIRef("Picture-in-Picture API")}}

Giao diện **`PictureInPictureWindow`** đại diện cho một đối tượng có khả năng lấy **`width`** và **`height`** theo cách lập trình, và **`resize event`** của cửa sổ video nổi.

Một đối tượng với giao diện này được lấy thông qua giá trị trả về promise của {{domxref("HTMLVideoElement.requestPictureInPicture()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện `PictureInPictureWindow` không kế thừa bất kỳ thuộc tính nào._

- {{domxref("PictureInPictureWindow.width")}} {{ReadOnlyInline}}
  - : Xác định chiều rộng của cửa sổ video nổi.
- {{domxref("PictureInPictureWindow.height")}} {{ReadOnlyInline}}
  - : Xác định chiều cao của cửa sổ video nổi.

## Phương thức phiên bản

_Giao diện `PictureInPictureWindow` không kế thừa bất kỳ phương thức nào._

## Sự kiện

_Giao diện `PictureInPictureWindow` không kế thừa bất kỳ sự kiện nào._

- {{domxref("PictureInPictureWindow.resize_event", "resize")}}
  - : Được gửi đến `PictureInPictureWindow` khi cửa sổ video nổi được thay đổi kích thước.

## Ví dụ

Cho một `<button>` và một `<video>`, khi nhấp vào nút, video sẽ vào chế độ picture-in-picture; sau đó chúng ta gắn sự kiện để in kích thước cửa sổ video nổi vào console.

```js
const button = document.querySelector("button");
const video = document.querySelector("video");

function printPipWindowDimensions(evt) {
  const pipWindow = evt.target;
  console.log(
    `The floating window dimensions are: ${pipWindow.width}x${pipWindow.height}px`,
  );
  // will print:
  // The floating window dimensions are: 640x360px
}

button.onclick = () => {
  video.requestPictureInPicture().then((pictureInPictureWindow) => {
    pictureInPictureWindow.onresize = printPipWindowDimensions;
  });
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Picture-in-Picture API](/en-US/docs/Web/API/Picture-in-Picture_API)
