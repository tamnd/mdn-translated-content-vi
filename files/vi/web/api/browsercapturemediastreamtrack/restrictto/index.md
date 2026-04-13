---
title: "BrowserCaptureMediaStreamTrack: phương thức restrictTo()"
short-title: restrictTo()
slug: Web/API/BrowserCaptureMediaStreamTrack/restrictTo
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BrowserCaptureMediaStreamTrack.restrictTo
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức **`restrictTo()`** của giao diện {{domxref("BrowserCaptureMediaStreamTrack")}} giới hạn một luồng tự quay vào một phần tử DOM cụ thể (và các phần tử con của nó).

## Syntax

```js-nolint
restrictTo(restrictionTarget)
```

### Parameters

- `restrictionTarget`
  - : Một thực thể {{domxref("RestrictionTarget")}} biểu diễn phần tử mà luồng cần được giới hạn vào, hoặc `null`/`undefined`, trong trường hợp đó mọi giới hạn đã đặt trước đó sẽ được gỡ khỏi track.

### Return value

Một {{jsxref("Promise")}} hoàn tất với {{jsxref("undefined")}}.

Promise sẽ bị từ chối nếu:

- Track [`kind`](/en-US/docs/Web/API/MediaStreamTrack/kind) không phải là `"video"`, hoặc [`readyState`](/en-US/docs/Web/API/MediaStreamTrack/readyState) của nó không phải là `"live"`.
- Phần tử restriction target không còn tồn tại.
- Track đang bị giới hạn không phải là track được ghi lại từ màn hình của người dùng.
- `restrictionTarget` không phải là một thực thể {{domxref("RestrictionTarget")}}, `null`, hoặc `undefined`.
- `restrictionTarget` được tạo trong một tab khác với tab đang được ghi lại.

> [!NOTE]
> Trong Chromium, nếu một track có các bản sao, `restrictTo()` sẽ bị từ chối (xem [Chrome issue 41482026](https://crbug.com/41482026)).

## Examples

### Ví dụ giới hạn cơ bản

```js
// Options for getDisplayMedia()
const displayMediaOptions = {
  preferCurrentTab: true,
};

// Create restriction target from DOM element
const demoElem = document.querySelector("#demo");
const restrictionTarget = await RestrictionTarget.fromElement(demoElem);

// Capture video stream from user's webcam and isolate video track
const stream =
  await navigator.mediaDevices.getDisplayMedia(displayMediaOptions);
const [track] = stream.getVideoTracks();

// Restrict video track
await track.restrictTo(restrictionTarget);

// Broadcast restricted stream in <video> element
videoElem.srcObject = stream;
```

Xem [Using the Element Capture and Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture) để biết mã ví dụ trong ngữ cảnh thực tế.

### Dừng giới hạn

Bạn có thể dừng việc giới hạn bằng cách gọi `restrictTo()` trên chính track đó và truyền đối số `null`:

```js
// Stop restricting
await track.restrictTo(null);
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- [Using the Element Capture and Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture)
