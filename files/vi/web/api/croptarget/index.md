---
title: CropTarget
slug: Web/API/CropTarget
page-type: web-api-interface
status:
  - experimental
browser-compat: api.CropTarget
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}

Giao diện **`CropTarget`** của {{domxref("Screen Capture API", "Screen Capture API", "", "nocode")}} cung cấp một phương thức tĩnh, {{domxref("CropTarget.fromElement_static", "fromElement()")}}, trả về một thực thể `CropTarget` có thể dùng để cắt một track video được ghi lại theo vùng mà một phần tử chỉ định được hiển thị.

{{InheritanceDiagram}}

## Static methods

- {{domxref("CropTarget.fromElement_static", "fromElement()")}} {{Experimental_Inline}}
  - : Trả về một thực thể `CropTarget` có thể dùng để cắt một track video được ghi lại theo vùng mà một phần tử chỉ định được hiển thị.

## Examples

```js
// Options for getDisplayMedia()
const displayMediaOptions = {
  preferCurrentTab: true,
};

// Create crop target from DOM element
const demoElem = document.querySelector("#demo");
const cropTarget = await CropTarget.fromElement(demoElem);

// Capture video stream from user's webcam and isolate video track
const stream =
  await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);
const [track] = stream.getVideoTracks();

// Crop video track
await track.cropTo(cropTarget);

// Broadcast cropped stream in <video> element
videoElem.srcObject = stream;
```

Xem [Using the Element Capture and Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture) để biết mã ví dụ trong ngữ cảnh thực tế.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- [Using the Element Capture and Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture)
