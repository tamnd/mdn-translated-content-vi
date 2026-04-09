---
title: "BrowserCaptureMediaStreamTrack: phương thức cropTo()"
short-title: cropTo()
slug: Web/API/BrowserCaptureMediaStreamTrack/cropTo
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BrowserCaptureMediaStreamTrack.cropTo
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`cropTo()`** của giao diện {{domxref("BrowserCaptureMediaStreamTrack")}} cắt một luồng tự quay thành vùng mà một phần tử DOM được chỉ định được hiển thị.

## Syntax

```js-nolint
cropTo(cropTarget)
```

### Parameters

- `cropTarget`
  - : Một thực thể {{domxref("CropTarget")}} biểu diễn vùng hiển thị của phần tử mà luồng cần được cắt theo, hoặc `null`/`undefined`, trong trường hợp đó mọi thao tác cắt đã đặt trước đó sẽ được gỡ khỏi track.

### Return value

Một {{jsxref("Promise")}} hoàn tất với {{jsxref("undefined")}}.

Promise sẽ bị từ chối nếu:

- Track [`kind`](/en-US/docs/Web/API/MediaStreamTrack/kind) không phải là `"video"`, hoặc [`readyState`](/en-US/docs/Web/API/MediaStreamTrack/readyState) của nó không phải là `"live"`.
- Phần tử crop target không còn tồn tại.
- Track đang bị cắt không phải là track được ghi lại từ màn hình của người dùng.
- `cropTarget` không phải là một thực thể {{domxref("CropTarget")}}, `null`, hoặc `undefined`.
- `cropTarget` được tạo trong một tab khác với tab đang được ghi lại.

> [!NOTE]
> Trong Chromium, nếu một track có các bản sao, `cropTo()` sẽ bị từ chối (xem [Chrome issue 41482026](https://crbug.com/41482026)).

## Examples

### Ví dụ cắt cơ bản

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

### Dừng cắt

Bạn có thể dừng thao tác cắt bằng cách gọi `cropTo()` trên một track đã bị cắt trước đó và truyền đối số `null`:

```js
// Stop cropping
await track.cropTo(null);
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- [Using the Element Capture and Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture)
