---
title: HTMLCanvasElement
slug: Web/API/HTMLCanvasElement
page-type: web-api-interface
browser-compat: api.HTMLCanvasElement
---

{{APIRef("Canvas API")}}

**`HTMLCanvasElement`** cung cấp các thuộc tính và phương thức để thao tác với bố cục và cách hiển thị của các phần tử {{HtmlElement("canvas")}}. Giao diện `HTMLCanvasElement` cũng kế thừa các thuộc tính và phương thức của giao diện {{domxref("HTMLElement")}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ giao diện cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLCanvasElement.height")}}
  - : Thuộc tính HTML [`height`](/en-US/docs/Web/HTML/Reference/Elements/canvas#height) của phần tử {{HTMLElement("canvas")}} là một `integer` không âm, phản ánh số pixel logic (hoặc giá trị RGBA) đi xuống một cột của canvas. Khi thuộc tính không được chỉ định, hoặc được đặt thành giá trị không hợp lệ như số âm, giá trị mặc định `150` sẽ được dùng. Nếu không có CSS height riêng được gán cho {{HTMLElement("canvas")}}, giá trị này cũng sẽ được dùng làm chiều cao của canvas theo đơn vị CSS Pixel.
- {{domxref("HTMLCanvasElement.width")}}
  - : Thuộc tính HTML [`width`](/en-US/docs/Web/HTML/Reference/Elements/canvas#width) của phần tử {{HTMLElement("canvas")}} là một `integer` không âm, phản ánh số pixel logic (hoặc giá trị RGBA) đi ngang qua một hàng của canvas. Khi thuộc tính không được chỉ định, hoặc được đặt thành giá trị không hợp lệ như số âm, giá trị mặc định `300` sẽ được dùng. Nếu không có CSS width riêng được gán cho {{HTMLElement("canvas")}}, giá trị này cũng sẽ được dùng làm chiều rộng của canvas theo đơn vị CSS Pixel.
- {{domxref("HTMLCanvasElement.mozOpaque")}} {{non-standard_inline}} {{deprecated_inline}}
  - : Một giá trị boolean phản ánh thuộc tính HTML [`moz-opaque`](/en-US/docs/Web/HTML/Reference/Elements/canvas#moz-opaque) của phần tử {{HTMLElement("canvas")}}. Nó cho canvas biết liệu độ trong suốt có phải là yếu tố cần xét đến hay không. Nếu canvas biết rằng không có độ trong suốt, hiệu năng vẽ có thể được tối ưu. Thuộc tính này chỉ được hỗ trợ trong các trình duyệt dựa trên Mozilla; hãy dùng {{domxref("HTMLCanvasElement.getContext()", "canvas.getContext('2d', { alpha: false })")}} đã được chuẩn hóa thay thế.
- {{domxref("HTMLCanvasElement.mozPrintCallback")}} {{non-standard_inline}}
  - : Một `function` ban đầu có giá trị null. Nội dung web có thể đặt nó thành một hàm JavaScript sẽ được gọi khi canvas cần được vẽ lại trong lúc trang đang được in. Khi được gọi, callback sẽ nhận một đối tượng "printState" triển khai giao diện [MozCanvasPrintState](https://searchfox.org/firefox-main/search?q=interface%20MozCanvasPrintState&path=HTMLCanvasElement.webidl). Callback có thể lấy context để vẽ từ đối tượng printState, rồi phải gọi done() khi hoàn tất. Mục đích của `mozPrintCallback` là tạo bản kết xuất của canvas có độ phân giải cao hơn, tương ứng với độ phân giải của máy in đang dùng. [Xem bài đăng blog này.](https://blog.mozilla.org/labs/2012/09/a-new-way-to-control-printing-output/)

## Phương thức thể hiện

_Kế thừa các phương thức từ giao diện cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLCanvasElement.captureStream()")}}
  - : Trả về một {{domxref("CanvasCaptureMediaStreamTrack")}} là bản ghi video thời gian thực của bề mặt canvas.
- {{domxref("HTMLCanvasElement.getContext()")}}
  - : Trả về một context vẽ trên canvas, hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu mã định danh context không được hỗ trợ, hoặc canvas đã được đặt sang một chế độ context khác.
- {{domxref("HTMLCanvasElement.toDataURL()")}}
  - : Trả về một data URL chứa biểu diễn của hình ảnh theo định dạng được chỉ định bởi tham số `type` (mặc định là `png`). Hình ảnh trả về có độ phân giải 96dpi.
- {{domxref("HTMLCanvasElement.toBlob()")}}
  - : Tạo một đối tượng {{domxref("Blob")}} biểu diễn hình ảnh chứa trong canvas; tệp này có thể được lưu trong bộ nhớ đệm trên đĩa hoặc lưu trong bộ nhớ tùy theo trình duyệt.
- {{domxref("HTMLCanvasElement.transferControlToOffscreen()")}}
  - : Chuyển quyền điều khiển sang đối tượng {{domxref("OffscreenCanvas")}}, trên main thread hoặc trên worker.

## Sự kiện

_Kế thừa các sự kiện từ giao diện cha, {{domxref("HTMLElement")}}._

Nghe các sự kiện này bằng {{DOMxRef("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này.

- [`contextlost`](/en-US/docs/Web/API/HTMLCanvasElement/contextlost_event)
  - : Được kích hoạt nếu trình duyệt phát hiện context `CanvasRenderingContext2D` đã bị mất.
- [`contextrestored`](/en-US/docs/Web/API/HTMLCanvasElement/contextrestored_event)
  - : Được kích hoạt nếu trình duyệt khôi phục thành công một context `CanvasRenderingContext2D`.
- [`webglcontextcreationerror`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextcreationerror_event)
  - : Được kích hoạt nếu user agent không thể tạo context `WebGLRenderingContext` hoặc `WebGL2RenderingContext`.
- [`webglcontextlost`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextlost_event)
  - : Được kích hoạt nếu user agent phát hiện bộ đệm vẽ gắn với đối tượng `WebGLRenderingContext` hoặc `WebGL2RenderingContext` đã bị mất.
- [`webglcontextrestored`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextrestored_event)
  - : Được kích hoạt nếu user agent khôi phục bộ đệm vẽ cho đối tượng `WebGLRenderingContext` hoặc `WebGL2RenderingContext`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("canvas")}}
