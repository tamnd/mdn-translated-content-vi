---
title: BrowserCaptureMediaStreamTrack
slug: Web/API/BrowserCaptureMediaStreamTrack
page-type: web-api-interface
status:
  - experimental
browser-compat: api.BrowserCaptureMediaStreamTrack
---

{{APIRef("Screen Capture API")}}{{SeeCompatTable}}

Giao diện **`BrowserCaptureMediaStreamTrack`** của {{domxref("Screen Capture API", "Screen Capture API", "", "nocode")}} biểu diễn một track video đơn lẻ. Nó mở rộng lớp {{domxref("MediaStreamTrack")}} bằng các phương thức để giới hạn phần của một luồng tự quay (ví dụ: màn hình hoặc cửa sổ của người dùng) được ghi lại.

{{InheritanceDiagram}}

## Instance methods

- {{domxref("BrowserCaptureMediaStreamTrack.clone", "clone()")}} {{Experimental_Inline}}
  - : Trả về một bản sao không bị cắt và không bị giới hạn của `BrowserCaptureMediaStreamTrack` gốc.
- {{domxref("BrowserCaptureMediaStreamTrack.cropTo", "cropTo()")}} {{Experimental_Inline}}
  - : Cắt một luồng tự quay thành vùng mà một phần tử DOM được chỉ định được hiển thị.
- {{domxref("BrowserCaptureMediaStreamTrack.restrictTo", "restrictTo()")}} {{Experimental_Inline}}
  - : Giới hạn một luồng tự quay vào một phần tử DOM cụ thể.

## Examples

Xem [Using the Element Capture and Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture) để biết mã ví dụ trong ngữ cảnh thực tế.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API)
- [Using the Element Capture and Region Capture APIs](/en-US/docs/Web/API/Screen_Capture_API/Element_Region_Capture)
