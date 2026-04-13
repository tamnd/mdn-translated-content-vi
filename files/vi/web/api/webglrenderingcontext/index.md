---
title: WebGLRenderingContext
slug: Web/API/WebGLRenderingContext
page-type: web-api-interface
browser-compat: api.WebGLRenderingContext
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **`WebGLRenderingContext`** cung cấp một giao diện cho bối cảnh kết xuất đồ họa OpenGL ES 2.0 cho bề mặt vẽ của phần tử {{HTMLElement("canvas")}} HTML.

Để có quyền truy cập vào ngữ cảnh WebGL để hiển thị đồ họa 2D và/hoặc 3D, hãy gọi {{domxref("HTMLCanvasElement.getContext()", "getContext()")}} trên phần tử `<canvas>`, cung cấp "webgl" làm đối số:

```js
const canvas = document.getElementById("myCanvas");
const gl = canvas.getContext("webgl");
```

Khi bạn đã có ngữ cảnh kết xuất WebGL cho canvas, bạn có thể kết xuất bên trong nó. [WebGL hướng dẫn](/en-US/docs/Web/API/WebGL_API/Tutorial) có nhiều thông tin, ví dụ và tài nguyên hơn về cách bắt đầu với WebGL.

Nếu bạn yêu cầu ngữ cảnh WebGL 2.0, hãy xem {{domxref("WebGL2RenderingContext")}}; điều này cung cấp quyền truy cập vào việc triển khai đồ họa OpenGL ES 3.0.

## Hằng số

Xem trang [hằng số WebGL](/en-US/docs/Web/API/WebGL_API/Constants).

## Bối cảnh WebGL

Các thuộc tính và phương thức sau đây cung cấp thông tin và chức năng chung để xử lý ngữ cảnh WebGL:

- {{domxref("WebGLRenderingContext.canvas")}}
  - : Một tham chiếu ngược chỉ đọc tới {{domxref("HTMLCanvasElement")}}. Có thể là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu nó không được liên kết với phần tử {{HTMLElement("canvas")}}.
- {{domxref("WebGLRenderingContext.drawingBufferWidth")}}
  - : Độ rộng chỉ đọc của bộ đệm bản vẽ hiện tại. Phải khớp với chiều rộng của phần tử canvas được liên kết với ngữ cảnh này.
- {{domxref("WebGLRenderingContext.drawingBufferHeight")}}
  - : Chiều cao chỉ đọc của vùng đệm vẽ hiện tại. Phải khớp với chiều cao của phần tử canvas được liên kết với ngữ cảnh này.
- {{domxref("WebGLRenderingContext.getContextAttributes()")}}
  - : Trả về một đối tượng `WebGLContextAttributes` có chứa các tham số ngữ cảnh thực tế. Có thể trả về [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), nếu ngữ cảnh bị mất.
- {{domxref("WebGLRenderingContext.isContextLost()")}}
  - : Trả về `true` nếu ngữ cảnh bị mất, nếu không thì trả về `false`.
- {{domxref("WebGLRenderingContext.makeXRCompatible()")}}
  - : Đảm bảo ngữ cảnh tương thích với phần cứng XR của người dùng, tạo lại ngữ cảnh nếu cần bằng cấu hình mới để làm như vậy. Điều này có thể được sử dụng để khởi động ứng dụng bằng cách sử dụng bản trình bày 2D tiêu chuẩn, sau đó chuyển sang sử dụng chế độ VR hoặc AR.

## Xem và cắt

- {{domxref("WebGLRenderingContext.scissor()")}}
  - : Xác định hộp cắt kéo.
- {{domxref("WebGLRenderingContext.viewport()")}}
  - : Đặt khung nhìn.

## Thông tin tiểu bang

- {{domxref("WebGLRenderingContext.activeTexture()")}}
  - : Chọn đơn vị kết cấu hoạt động.
- {{domxref("WebGLRenderingContext.blendColor()")}}
  - : Đặt hệ số hòa trộn nguồn và đích.
- {{domxref("WebGLRenderingContext.blendEquation()")}}
  - : Đặt cả phương trình hòa trộn RGB và phương trình hòa trộn alpha thành một phương trình duy nhất.
- {{domxref("WebGLRenderingContext.blendEquationSeparate()")}}
  - : Đặt riêng phương trình hòa trộn RGB và phương trình hòa trộn alpha.
- {{domxref("WebGLRenderingContext.blendFunc()")}}
  - : Xác định hàm nào được sử dụng để trộn số học pixel.
- {{domxref("WebGLRenderingContext.blendFuncSeparate()")}}
  - : Xác định hàm nào được sử dụng để trộn số học pixel cho các thành phần RGB và alpha riêng biệt.
- {{domxref("WebGLRenderingContext.clearColor()")}}
  - : Chỉ định các giá trị màu được sử dụng khi xóa bộ đệm màu.
- {{domxref("WebGLRenderingContext.clearDepth()")}}
  - : Chỉ định giá trị độ sâu được sử dụng khi xóa bộ đệm độ sâu.
- {{domxref("WebGLRenderingContext.clearStencil()")}}
  - : Chỉ định giá trị stencil được sử dụng khi xóa bộ đệm stencil.
- {{domxref("WebGLRenderingContext.colorMask()")}}
  - : Đặt thành phần màu nào sẽ bật hoặc tắt khi vẽ hoặc hiển thị thành {{domxref("WebGLFramebuffer")}}.
- {{domxref("WebGLRenderingContext.cullFace()")}}
  - : Chỉ định xem có thể loại bỏ các đa giác mặt trước và/hoặc mặt sau hay không.
- {{domxref("WebGLRenderingContext.depthFunc()")}}
  - : Chỉ định hàm so sánh độ sâu pixel đến với giá trị bộ đệm độ sâu hiện tại.
- {{domxref("WebGLRenderingContext.depthMask()")}}
  - : Đặt xem việc ghi vào bộ đệm độ sâu được bật hay tắt.
- {{domxref("WebGLRenderingContext.depthRange()")}}
  - : Chỉ định ánh xạ phạm vi độ sâu từ tọa độ thiết bị được chuẩn hóa đến tọa độ cửa sổ hoặc khung nhìn.
- {{domxref("WebGLRenderingContext.disable()")}}
  - : Vô hiệu hóa các khả năng WebGL cụ thể cho bối cảnh này.
- {{domxref("WebGLRenderingContext.enable()")}}
  - : Kích hoạt các khả năng WebGL cụ thể cho bối cảnh này.
- {{domxref("WebGLRenderingContext.frontFace()")}}
  - : Chỉ định xem đa giác là mặt trước hay mặt sau bằng cách đặt hướng cuộn.
- {{domxref("WebGLRenderingContext.getParameter()")}}
  - : Trả về giá trị cho tên tham số đã truyền.
- {{domxref("WebGLRenderingContext.getError()")}}
  - : Trả về thông tin lỗi.
- {{domxref("WebGLRenderingContext.hint()")}}
  - : Chỉ định gợi ý cho một số hành vi nhất định. Việc giải thích những gợi ý này phụ thuộc vào việc thực hiện.
- {{domxref("WebGLRenderingContext.isEnabled()")}}
  - : Kiểm tra xem một khả năng WebGL cụ thể có được bật hay không cho bối cảnh này.
- {{domxref("WebGLRenderingContext.lineWidth()")}}
  - : Đặt độ rộng đường của các đường rasterized.
- {{domxref("WebGLRenderingContext.pixelStorei()")}}
  - : Chỉ định chế độ lưu trữ pixel
- {{domxref("WebGLRenderingContext.polygonOffset()")}}
  - : Chỉ định các hệ số và đơn vị tỷ lệ để tính giá trị độ sâu.
- {{domxref("WebGLRenderingContext.sampleCoverage()")}}
  - : Chỉ định các tham số bao phủ nhiều mẫu cho hiệu ứng khử răng cưa.
- {{domxref("WebGLRenderingContext.stencilFunc()")}}
  - : Đặt cả chức năng trước và sau cũng như giá trị tham chiếu để kiểm tra stencil.
- {{domxref("WebGLRenderingContext.stencilFuncSeparate()")}}
  - : Đặt chức năng mặt trước và/hoặc mặt sau và giá trị tham chiếu để kiểm tra stencil.
- {{domxref("WebGLRenderingContext.stencilMask()")}}
  - : Kiểm soát việc bật và tắt cả chức năng ghi mặt trước và mặt sau của các bit riêng lẻ trong các mặt phẳng khuôn tô.
- {{domxref("WebGLRenderingContext.stencilMaskSeparate()")}}
  - : Điều khiển việc bật và tắt chức năng ghi mặt trước và/hoặc mặt sau của các bit riêng lẻ trong các mặt phẳng khuôn tô.
- {{domxref("WebGLRenderingContext.stencilOp()")}}
  - : Đặt cả hành động kiểm tra stencil mặt trước và mặt sau.
- {{domxref("WebGLRenderingContext.stencilOpSeparate()")}}
  - : Đặt các hành động kiểm tra stencil mặt trước và/hoặc mặt sau.

## Bộ đệm

- {{domxref("WebGLRenderingContext.bindBuffer()")}}
  - : Liên kết một đối tượng `WebGLBuffer` với một mục tiêu nhất định.
- {{domxref("WebGLRenderingContext.bufferData()")}}
  - : Cập nhật dữ liệu bộ đệm.
- {{domxref("WebGLRenderingContext.bufferSubData()")}}
  - : Cập nhật dữ liệu bộ đệm bắt đầu từ phần bù được chuyển.
- {{domxref("WebGLRenderingContext.createBuffer()")}}
  - : Tạo một đối tượng `WebGLBuffer`.
- {{domxref("WebGLRenderingContext.deleteBuffer()")}}
  - : Xóa một đối tượng `WebGLBuffer`.
- {{domxref("WebGLRenderingContext.getBufferParameter()")}}
  - : Trả về thông tin về bộ đệm.
- {{domxref("WebGLRenderingContext.isBuffer()")}}
  - : Trả về Boolean cho biết bộ đệm đã truyền có hợp lệ hay không.

## Bộ đệm khung

- {{domxref("WebGLRenderingContext.bindFramebuffer()")}}
  - : Liên kết một đối tượng `WebGLFrameBuffer` với một mục tiêu nhất định.
- {{domxref("WebGLRenderingContext.checkFramebufferStatus()")}}
  - : Trả về trạng thái của bộ đệm khung.
- {{domxref("WebGLRenderingContext.createFramebuffer()")}}
  - : Tạo một đối tượng `WebGLFrameBuffer`.
- {{domxref("WebGLRenderingContext.deleteFramebuffer()")}}
  - : Xóa một đối tượng `WebGLFrameBuffer`.
- {{domxref("WebGLRenderingContext.framebufferRenderbuffer()")}}
  - : Gắn một đối tượng `WebGLRenderingBuffer` vào một đối tượng `WebGLFrameBuffer`.
- {{domxref("WebGLRenderingContext.framebufferTexture2D()")}}
  - : Đính kèm một hình ảnh họa tiết vào đối tượng `WebGLFrameBuffer`.
- {{domxref("WebGLRenderingContext.getFramebufferAttachmentParameter()")}}
  - : Trả về thông tin về bộ đệm khung.
- {{domxref("WebGLRenderingContext.isFramebuffer()")}}
  - : Trả về một giá trị Boolean cho biết đối tượng `WebGLFrameBuffer` đã truyền có hợp lệ hay không.
- {{domxref("WebGLRenderingContext.readPixels()")}}
  - : Đọc một khối pixel từ `WebGLFrameBuffer`.

## Bộ đệm kết xuất

- {{domxref("WebGLRenderingContext.bindRenderbuffer()")}}
  - : Liên kết một đối tượng `WebGLRenderBuffer` với một mục tiêu nhất định.
- {{domxref("WebGLRenderingContext.createRenderbuffer()")}}
  - : Tạo một đối tượng `WebGLRenderBuffer`.
- {{domxref("WebGLRenderingContext.deleteRenderbuffer()")}}
  - : Xóa một đối tượng `WebGLRenderBuffer`.
- {{domxref("WebGLRenderingContext.getRenderbufferParameter()")}}
  - : Trả về thông tin về bộ đệm kết xuất.
- {{domxref("WebGLRenderingContext.isRenderbuffer()")}}
  - : Trả về một giá trị Boolean cho biết liệu `WebGLRenderingBuffer` đã được truyền có hợp lệ hay không.
- {{domxref("WebGLRenderingContext.renderbufferStorage()")}}
  - : Tạo kho dữ liệu bộ đệm kết xuất.

## Kết cấu

- {{domxref("WebGLRenderingContext.bindTexture()")}}
  - : Liên kết một đối tượng `WebGLTexture` với một mục tiêu nhất định.
- {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}
  - : Chỉ định hình ảnh kết cấu 2D ở định dạng nén.
- {{domxref("WebGLRenderingContext.compressedTexSubImage2D()")}}
  - : Chỉ định hình ảnh phụ kết cấu 2D ở định dạng nén.
- {{domxref("WebGLRenderingContext.copyTexImage2D()")}}
  - : Sao chép hình ảnh kết cấu 2D.
- {{domxref("WebGLRenderingContext.copyTexSubImage2D()")}}
  - : Sao chép hình ảnh phụ kết cấu 2D.
- {{domxref("WebGLRenderingContext.createTexture()")}}
  - : Tạo một đối tượng `WebGLTexture`.
- {{domxref("WebGLRenderingContext.deleteTexture()")}}
  - : Xóa một đối tượng `WebGLTexture`.
- {{domxref("WebGLRenderingContext.generateMipmap()")}}
  - : Tạo ra một tập hợp các bản đồ mipmap cho một đối tượng `WebGLTexture`.
- {{domxref("WebGLRenderingContext.getTexParameter()")}}
  - : Trả về thông tin về kết cấu.
- {{domxref("WebGLRenderingContext.isTexture()")}}
  - : Trả về một giá trị Boolean cho biết liệu `WebGLTexture` đã được truyền có hợp lệ hay không.
- {{domxref("WebGLRenderingContext.texImage2D()")}}
  - : Chỉ định hình ảnh kết cấu 2D.
- {{domxref("WebGLRenderingContext.texSubImage2D()")}}
  - : Cập nhật một hình chữ nhật phụ của `WebGLTexture` hiện tại.
- {{domxref("WebGLRenderingContext.texParameter", "WebGLRenderingContext.texParameterf()")}}
  - : Đặt tham số kết cấu.
- {{domxref("WebGLRenderingContext.texParameter", "WebGLRenderingContext.texParameteri()")}}
  - : Đặt tham số kết cấu.

## Chương trình và shader

- {{domxref("WebGLRenderingContext.attachShader()")}}
  - : Gắn `WebGLShader` vào `WebGLProgram`.
- {{domxref("WebGLRenderingContext.bindAttribLocation()")}}
  - : Liên kết một chỉ mục đỉnh chung với một biến thuộc tính được đặt tên.
- {{domxref("WebGLRenderingContext.compileShader()")}}
  - : Biên dịch một `WebGLShader`.
- {{domxref("WebGLRenderingContext.createProgram()")}}
  - : Tạo một `WebGLProgram`.
- {{domxref("WebGLRenderingContext.createShader()")}}
  - : Tạo một `WebGLShader`.
- {{domxref("WebGLRenderingContext.deleteProgram()")}}
  - : Xóa một `WebGLProgram`.
- {{domxref("WebGLRenderingContext.deleteShader()")}}
  - : Xóa một `WebGLShader`.
- {{domxref("WebGLRenderingContext.detachShader()")}}
  - : Tách một `WebGLShader`.
- {{domxref("WebGLRenderingContext.getAttachedShaders()")}}
  - : Trả về danh sách các đối tượng `WebGLShader` được gắn vào `WebGLProgram`.
- {{domxref("WebGLRenderingContext.getProgramParameter()")}}
  - : Trả về thông tin về chương trình.
- {{domxref("WebGLRenderingContext.getProgramInfoLog()")}}
  - : Trả về nhật ký thông tin cho đối tượng `WebGLProgram`.
- {{domxref("WebGLRenderingContext.getShaderParameter()")}}
  - : Trả về thông tin về shader.
- {{domxref("WebGLRenderingContext.getShaderPrecisionFormat()")}}
  - : Trả về một đối tượng `WebGLShaderPrecisionFormat` mô tả độ chính xác cho định dạng số của shader.
- {{domxref("WebGLRenderingContext.getShaderInfoLog()")}}
  - : Trả về nhật ký thông tin cho đối tượng `WebGLShader`.
- {{domxref("WebGLRenderingContext.getShaderSource()")}}
  - : Trả về mã nguồn của `WebGLShader` dưới dạng một chuỗi.
- {{domxref("WebGLRenderingContext.isProgram()")}}
  - : Trả về một giá trị Boolean cho biết liệu `WebGLProgram` đã được truyền có hợp lệ hay không.
- {{domxref("WebGLRenderingContext.isShader()")}}
  - : Trả về một giá trị Boolean cho biết liệu `WebGLShader` đã được truyền có hợp lệ hay không.
- {{domxref("WebGLRenderingContext.linkProgram()")}}
  - : Liên kết đối tượng `WebGLProgram` đã được truyền.
- {{domxref("WebGLRenderingContext.shaderSource()")}}
  - : Đặt mã nguồn trong `WebGLShader`.
- {{domxref("WebGLRenderingContext.useProgram()")}}
  - : Sử dụng `WebGLProgram` được chỉ định như một phần của trạng thái kết xuất hiện tại.
- {{domxref("WebGLRenderingContext.validateProgram()")}}
  - : Xác thực một `WebGLProgram`.

## Đồng phục và thuộc tính

- {{domxref("WebGLRenderingContext.disableVertexAttribArray()")}}
  - : Vô hiệu hóa mảng thuộc tính đỉnh tại một vị trí nhất định.
- {{domxref("WebGLRenderingContext.enableVertexAttribArray()")}}
  - : Cho phép mảng thuộc tính đỉnh tại một vị trí nhất định.
- {{domxref("WebGLRenderingContext.getActiveAttrib()")}}
  - : Trả về thông tin về một biến thuộc tính đang hoạt động.
- {{domxref("WebGLRenderingContext.getActiveUniform()")}}
  - : Trả về thông tin về một biến thống nhất đang hoạt động.
- {{domxref("WebGLRenderingContext.getAttribLocation()")}}
  - : Trả về vị trí của một biến thuộc tính.
- {{domxref("WebGLRenderingContext.getUniform()")}}
  - : Trả về giá trị của một biến thống nhất tại một vị trí nhất định.
- {{domxref("WebGLRenderingContext.getUniformLocation()")}}
  - : Trả về vị trí của một biến thống nhất.
- {{domxref("WebGLRenderingContext.getVertexAttrib()")}}
  - : Trả về thông tin về thuộc tính đỉnh tại một vị trí nhất định.
- {{domxref("WebGLRenderingContext.getVertexAttribOffset()")}}
  - : Trả về địa chỉ của một thuộc tính đỉnh đã cho.
- [`WebGLRenderingContext.uniform[1234][fi][v]()`](/en-US/docs/Web/API/WebGLRenderingContext/uniform)
  - : Chỉ định một giá trị cho một biến thống nhất.
- {{domxref("WebGLRenderingContext.uniformMatrix()", "WebGLRenderingContext.uniformMatrix[234]fv()")}}
  - : Chỉ định một giá trị ma trận cho một biến thống nhất.
- {{domxref("WebGLRenderingContext.vertexAttrib()", "WebGLRenderingContext.vertexAttrib[1234]f[v]()")}}
  - : Chỉ định giá trị cho thuộc tính đỉnh chung.
- {{domxref("WebGLRenderingContext.vertexAttribPointer()")}}
  - : Chỉ định định dạng dữ liệu và vị trí của các thuộc tính đỉnh trong mảng thuộc tính đỉnh.

## Vẽ bộ đệm

- {{domxref("WebGLRenderingContext.clear()")}}
  - : Xóa bộ đệm được chỉ định về giá trị đặt trước.
- {{domxref("WebGLRenderingContext.drawArrays()")}}
  - : Hiển thị các giá trị nguyên thủy từ dữ liệu mảng.
- {{domxref("WebGLRenderingContext.drawElements()")}}
  - : Hiển thị các giá trị nguyên thủy từ dữ liệu mảng phần tử.
- {{domxref("WebGLRenderingContext.finish()")}}
  - : Chặn thực thi cho đến khi tất cả các lệnh được gọi trước đó kết thúc.
- {{domxref("WebGLRenderingContext.flush()")}}
  - : Làm trống các lệnh đệm khác nhau, khiến tất cả các lệnh được thực thi nhanh nhất có thể.

## Không gian màu

- {{domxref("WebGLRenderingContext.drawingBufferColorSpace")}}
  - : Chỉ định không gian màu của vùng đệm vẽ WebGL.
- {{domxref("WebGLRenderingContext.unpackColorSpace")}}
  - : Chỉ định không gian màu cần chuyển đổi khi nhập họa tiết.

## Làm việc với tiện ích mở rộng

Các phương thức này quản lý các phần mở rộng WebGL:

- {{domxref("WebGLRenderingContext.getSupportedExtensions()")}}
  - : Trả về một chuỗi {{jsxref("Array")}} chứa tất cả các phần mở rộng WebGL được hỗ trợ.
- {{domxref("WebGLRenderingContext.getExtension()")}}
  - : Trả về một đối tượng mở rộng.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCanvasElement")}}
