---
title: "BrowserCaptureMediaStreamTrack: phương thức clone()"
short-title: clone()
slug: Web/API/BrowserCaptureMediaStreamTrack/clone
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BrowserCaptureMediaStreamTrack.clone
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`clone()`** của giao diện {{domxref("BrowserCaptureMediaStreamTrack")}} trả về một bản sao của `BrowserCaptureMediaStreamTrack` gốc.

Phương thức này giống hệt về mặt chức năng với {{domxref("MediaStreamTrack.clone()")}}, ngoại trừ việc nó xử lý các trường hợp track đã được áp dụng cắt hoặc giới hạn. Bản sao được trả về giống hệt `BrowserCaptureMediaStreamTrack` gốc, nhưng mọi thao tác cắt hoặc giới hạn đều bị loại bỏ.

> [!NOTE]
> Trong Chromium, nếu một track có các bản sao, các phương thức {{domxref("BrowserCaptureMediaStreamTrack.cropTo", "cropTo()")}} và {{domxref("BrowserCaptureMediaStreamTrack.restrictTo", "restrictTo()")}} của nó sẽ bị từ chối (xem [Chrome issue 41482026](https://crbug.com/41482026)).

## Syntax

```js-nolint
clone()
```

### Parameters

Không có.

### Return value

Một thực thể {{domxref("BrowserCaptureMediaStreamTrack")}}.

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

// Create uncropped clone of the track
const clonedTrack = track.clone();
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- [Using the Element Capture and Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture)
