---
title: RestrictionTarget
slug: Web/API/RestrictionTarget
page-type: web-api-interface
status:
  - experimental
browser-compat: api.RestrictionTarget
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}

Giao diện **`RestrictionTarget`** của {{domxref("Screen Capture API", "Screen Capture API", "", "nocode")}} cung cấp phương thức tĩnh {{domxref("RestrictionTarget.fromElement_static", "fromElement()")}}, trả về một phiên bản `RestrictionTarget` có thể được sử dụng để giới hạn track video bị capture vào một phần tử DOM cụ thể.

{{InheritanceDiagram}}

## Phương thức tĩnh

- {{domxref("RestrictionTarget.fromElement_static", "fromElement()")}} {{Experimental_Inline}}
  - : Trả về phiên bản `RestrictionTarget` có thể được sử dụng để giới hạn track video bị capture vào một phần tử DOM cụ thể (cùng với các phần tử con của nó).

## Ví dụ

```js
// Tùy chọn cho getDisplayMedia()
const displayMediaOptions = {
  preferCurrentTab: true,
};

// Tạo restriction target từ phần tử DOM
const demoElem = document.querySelector("#demo");
const restrictionTarget = await RestrictionTarget.fromElement(demoElem);

// Capture luồng video từ webcam của người dùng và tách track video
const stream =
  await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);
const [track] = stream.getVideoTracks();

// Giới hạn track video
await track.restrictTo(restrictionTarget);

// Phát luồng bị giới hạn trong phần tử <video>
videoElem.srcObject = stream;
```

Xem [Using the Element Capture and Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture) để biết ví dụ mã trong ngữ cảnh.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- [Using the Element Capture and Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture)
