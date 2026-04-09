---
title: "CropTarget: phương thức tĩnh fromElement()"
short-title: fromElement()
slug: Web/API/CropTarget/fromElement_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.CropTarget.fromElement_static
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}{{securecontext_header}}

Phương thức tĩnh **`fromElement()`** của giao diện {{domxref("CropTarget")}} trả về một thực thể `CropTarget` có thể dùng để cắt một track video được ghi lại theo vùng mà một phần tử chỉ định được hiển thị.

Vì Region Capture API cắt theo một vùng của tab trình duyệt hiện tại thay vì ghi lại một phần tử cụ thể, bất kỳ nội dung nào được vẽ chồng lên vùng đã cắt sẽ xuất hiện trong phần ghi lại.

## Syntax

```js-nolint
CropTarget.fromElement(element)
```

### Parameters

- `element`
  - : Một tham chiếu tới {{domxref("Element")}} mà bạn muốn dùng làm crop target. Để một phần tử có thể được dùng làm crop target, nó phải:
    - Ở trên màn hình
    - Hiển thị được, tức là không bị ẩn, chẳng hạn qua `display: none`.

    Ngoài ra, phần tử sẽ không được ghi lại nếu track đang bị giới hạn có các bản sao (tức là được tạo bằng {{domxref("BrowserCaptureMediaStreamTrack.clone()")}}) hoặc được ghi lại từ một tab khác với tab hiện tại của người dùng (ví dụ, được truyền qua {{domxref("Window.postMessage()")}}).

### Return value

Một {{jsxref("Promise")}} phân giải thành một thực thể đối tượng {{domxref("CropTarget")}}, sau đó có thể được truyền tới {{domxref("BrowserCaptureMediaStreamTrack.CropTo()")}} để cắt video được ghi lại trong track chỉ còn vùng mà phần tử DOM được chỉ định được hiển thị.

Các đối tượng `CropTarget` có thể tuần tự hóa. Chúng có thể được truyền sang tài liệu khác bằng các cơ chế như {{domxref("Window.postMessage()")}}.

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
