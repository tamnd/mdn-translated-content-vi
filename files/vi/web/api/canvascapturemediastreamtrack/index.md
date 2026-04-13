---
title: CanvasCaptureMediaStreamTrack
slug: Web/API/CanvasCaptureMediaStreamTrack
page-type: web-api-interface
browser-compat: api.CanvasCaptureMediaStreamTrack
---

{{APIRef("Media Capture and Streams")}}

Giao diện **`CanvasCaptureMediaStreamTrack`** của {{domxref("Media Capture and Streams API", "", "", "nocode")}} biểu diễn track video có trong một {{domxref("MediaStream")}} đang được tạo từ một phần tử {{HTMLElement("canvas")}} sau khi gọi {{domxref("HTMLCanvasElement.captureStream()")}}.

{{InheritanceDiagram}}

## Instance properties

_Giao diện này kế thừa các thuộc tính từ interface cha của nó là {{domxref("MediaStreamTrack")}}._

- {{domxref("CanvasCaptureMediaStreamTrack.canvas")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("HTMLCanvasElement")}} có bề mặt đang được ghi lại theo thời gian thực.

## Instance methods

_Giao diện này kế thừa các phương thức từ interface cha của nó là {{domxref("MediaStreamTrack")}}._

- {{domxref("CanvasCaptureMediaStreamTrack.requestFrame()")}}
  - : Buộc chụp một khung hình theo cách thủ công và gửi nó tới luồng. Điều này cho phép các ứng dụng muốn tự chỉ định trực tiếp thời điểm chụp khung hình thực hiện được điều đó, nếu chúng đã chỉ định `frameRate` là `0` khi gọi {{domxref("HTMLCanvasElement.captureStream", "captureStream()")}}.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- {{domxref("HTMLCanvasElement.captureStream()")}} để bắt đầu ghi lại các khung hình từ một canvas
