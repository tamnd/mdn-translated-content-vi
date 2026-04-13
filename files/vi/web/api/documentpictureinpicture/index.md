---
title: DocumentPictureInPicture
slug: Web/API/DocumentPictureInPicture
page-type: web-api-interface
status:
  - experimental
browser-compat: api.DocumentPictureInPicture
---

{{APIRef("Document Picture-in-Picture API")}}{{SeeCompatTable}}{{securecontext_header}}

Giao diện **`DocumentPictureInPicture`** của {{domxref("Document Picture-in-Picture API", "Document Picture-in-Picture API", "", "nocode")}} là điểm khởi đầu để tạo và xử lý các cửa sổ picture-in-picture tài liệu.

Nó được truy cập thông qua thuộc tính {{domxref("Window.documentPictureInPicture")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{DOMxRef("EventTarget")}}._

- {{domxref("DocumentPictureInPicture.window", "window")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về phiên bản {{domxref("Window")}} đại diện cho ngữ cảnh duyệt web bên trong cửa sổ Picture-in-Picture.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha, {{DOMxRef("EventTarget")}}._

- {{domxref("DocumentPictureInPicture.requestWindow", "requestWindow()")}} {{Experimental_Inline}}
  - : Mở cửa sổ Picture-in-Picture cho ngữ cảnh duyệt web chính hiện tại. Trả về {{jsxref("Promise")}} hoàn thành với phiên bản {{domxref("Window")}} đại diện cho ngữ cảnh duyệt web bên trong cửa sổ Picture-in-Picture.

## Sự kiện

_Kế thừa các sự kiện từ lớp cha, {{DOMxRef("EventTarget")}}._

- {{domxref("DocumentPictureInPicture/enter_event", "enter")}} {{Experimental_Inline}}
  - : Được kích hoạt khi cửa sổ Picture-in-Picture được mở thành công.

## Ví dụ

```js
const videoPlayer = document.getElementById("player");

// …

// Open a Picture-in-Picture window.
const pipWindow = await window.documentPictureInPicture.requestWindow({
  width: videoPlayer.clientWidth,
  height: videoPlayer.clientHeight,
});

// …
```

Xem [Document Picture-in-Picture API Example](https://mdn.github.io/dom-examples/document-picture-in-picture/) để xem bản demo hoạt động đầy đủ (xem thêm [mã nguồn](https://github.com/mdn/dom-examples/tree/main/document-picture-in-picture)).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document Picture-in-Picture API", "Document Picture-in-Picture API", "", "nocode")}}
- [Sử dụng Document Picture-in-Picture API](/en-US/docs/Web/API/Document_Picture-in-Picture_API/Using)
