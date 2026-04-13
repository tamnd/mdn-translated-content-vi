---
title: WebGL2RenderingContext
slug: Web/API/WebGL2RenderingContext
page-type: web-api-interface
browser-compat: api.WebGL2RenderingContext
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **WebGL2RenderingContext** cung cấp ngữ cảnh kết xuất OpenGL ES 3.0 cho bề mặt vẽ của phần tử HTML {{HTMLElement("canvas")}}.

Để lấy một đối tượng của giao diện này, gọi {{domxref("HTMLCanvasElement.getContext()", "getContext()")}} trên phần tử `<canvas>`, cung cấp "webgl2" làm đối số:

```js
const canvas = document.getElementById("myCanvas");
const gl = canvas.getContext("webgl2");
```

> [!NOTE]
> WebGL 2 là phần mở rộng của WebGL 1. Giao diện `WebGL2RenderingContext` triển khai tất cả thành viên của giao diện {{domxref("WebGLRenderingContext")}}. Một số phương thức của ngữ cảnh WebGL 1 có thể nhận thêm giá trị khi được sử dụng trong ngữ cảnh WebGL 2. Bạn sẽ tìm thấy thông tin này trong các trang tham chiếu WebGL 1.

[Hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial) có thêm thông tin, ví dụ và tài nguyên về cách bắt đầu với WebGL.

## Hằng số

Xem trang [hằng số WebGL](/en-US/docs/Web/API/WebGL_API/Constants).

## Thông tin trạng thái

- {{domxref("WebGL2RenderingContext.getIndexedParameter()")}}
  - : Trả về giá trị được lập chỉ mục cho `target` đã cho.

## Bộ đệm

- {{domxref("WebGL2RenderingContext.bufferData()")}}
  - : Khởi tạo và tạo kho dữ liệu của đối tượng bộ đệm.
- {{domxref("WebGL2RenderingContext.bufferSubData()")}}
  - : Cập nhật một tập hợp con của kho dữ liệu đối tượng bộ đệm.
- {{domxref("WebGL2RenderingContext.copyBufferSubData()")}}
  - : Sao chép một phần dữ liệu từ bộ đệm này sang bộ đệm khác.
- {{domxref("WebGL2RenderingContext.getBufferSubData()")}}
  - : Đọc dữ liệu từ bộ đệm và ghi chúng vào {{jsxref("ArrayBuffer")}} hoặc {{jsxref("SharedArrayBuffer")}}.

## Framebuffer

- {{domxref("WebGL2RenderingContext.blitFramebuffer()")}}
  - : Truyền một khối pixel từ framebuffer đọc sang framebuffer vẽ.
- {{domxref("WebGL2RenderingContext.framebufferTextureLayer()")}}
  - : Gắn một lớp duy nhất của texture vào framebuffer.
- {{domxref("WebGL2RenderingContext.invalidateFramebuffer()")}}
  - : Vô hiệu hóa nội dung của các điểm gắn trong framebuffer.
- {{domxref("WebGL2RenderingContext.invalidateSubFramebuffer()")}}
  - : Vô hiệu hóa các phần nội dung của các điểm gắn trong framebuffer.
- {{domxref("WebGL2RenderingContext.readBuffer()")}}
  - : Chọn một bộ đệm màu làm nguồn cho pixel.

## Renderbuffer

- {{domxref("WebGL2RenderingContext.getInternalformatParameter()")}}
  - : Trả về thông tin về hỗ trợ phụ thuộc vào triển khai cho các định dạng nội bộ.
- {{domxref("WebGL2RenderingContext.renderbufferStorageMultisample()")}}
  - : Tạo và khởi tạo kho dữ liệu của đối tượng renderbuffer và cho phép chỉ định số lượng mẫu được sử dụng.

## Texture

- {{domxref("WebGL2RenderingContext.texStorage2D()")}}
  - : Chỉ định tất cả các mức của lưu trữ texture hai chiều.
- {{domxref("WebGL2RenderingContext.texStorage3D()")}}
  - : Chỉ định tất cả các mức của lưu trữ texture ba chiều hoặc texture mảng hai chiều.
- {{domxref("WebGL2RenderingContext.texImage3D()")}}
  - : Chỉ định một ảnh texture ba chiều.
- {{domxref("WebGL2RenderingContext.texSubImage3D()")}}
  - : Chỉ định một hình chữ nhật con của texture 3D hiện tại.
- {{domxref("WebGL2RenderingContext.copyTexSubImage3D()")}}
  - : Sao chép pixel từ [`WebGLFramebuffer`](/en-US/docs/Web/API/WebGLFramebuffer) hiện tại vào một hình ảnh con của texture 3D.
- {{domxref("WebGL2RenderingContext.compressedTexImage3D")}}
  - : Chỉ định một ảnh texture ba chiều ở định dạng nén.
- {{domxref("WebGL2RenderingContext.compressedTexSubImage3D()")}}
  - : Chỉ định một hình chữ nhật con cho ảnh texture ba chiều ở định dạng nén.

## Chương trình và shader

- {{domxref("WebGL2RenderingContext.getFragDataLocation()")}}
  - : Trả về liên kết của số màu với các biến varying out do người dùng định nghĩa.

## Uniform và attribute

- [`WebGL2RenderingContext.uniform[1234][uif][v]()`](/en-US/docs/Web/API/WebGL2RenderingContext/uniform)
  - : Các phương thức chỉ định giá trị của biến uniform.
- {{domxref("WebGL2RenderingContext.uniformMatrix()", "WebGL2RenderingContext.uniformMatrix[234]x[234]fv()")}}
  - : Các phương thức chỉ định giá trị ma trận cho biến uniform.
- {{domxref("WebGL2RenderingContext.vertexAttribI()", "WebGL2RenderingContext.vertexAttribI4[u]i[v]()")}}
  - : Các phương thức chỉ định giá trị số nguyên cho thuộc tính đỉnh chung.
- {{domxref("WebGL2RenderingContext.vertexAttribIPointer()")}}
  - : Chỉ định định dạng dữ liệu số nguyên và vị trí của các thuộc tính đỉnh trong mảng thuộc tính đỉnh.

## Không gian màu

- {{domxref("WebGL2RenderingContext.drawingBufferColorSpace")}}
  - : Chỉ định không gian màu của bộ đệm vẽ WebGL.
- {{domxref("WebGL2RenderingContext.unpackColorSpace")}}
  - : Chỉ định không gian màu để chuyển đổi khi nhập texture.

## Bộ đệm vẽ

- {{domxref("WebGL2RenderingContext.vertexAttribDivisor()")}}
  - : Sửa đổi tốc độ mà các thuộc tính đỉnh chung tiến lên khi kết xuất nhiều phiên bản của hình nguyên với {{domxref("WebGL2RenderingContext.drawArraysInstanced()", "gl.drawArraysInstanced()")}} và {{domxref("WebGL2RenderingContext.drawElementsInstanced()", "gl.drawElementsInstanced()")}}.
- {{domxref("WebGL2RenderingContext.drawArraysInstanced()")}}
  - : Kết xuất hình nguyên từ dữ liệu mảng. Ngoài ra, nó có thể thực thi nhiều phiên bản của dải phần tử.
- {{domxref("WebGL2RenderingContext.drawElementsInstanced()")}}
  - : Kết xuất hình nguyên từ dữ liệu mảng. Ngoài ra, nó có thể thực thi nhiều phiên bản của một tập hợp phần tử.
- {{domxref("WebGL2RenderingContext.drawRangeElements()")}}
  - : Kết xuất hình nguyên từ dữ liệu mảng trong một dải đã cho.
- {{domxref("WebGL2RenderingContext.drawBuffers()")}}
  - : Chỉ định danh sách các bộ đệm màu sẽ được vẽ vào.
- {{domxref("WebGL2RenderingContext.clearBuffer()", "WebGL2RenderingContext.clearBuffer[fiuv]()")}}
  - : Xóa các bộ đệm từ framebuffer hiện đang được liên kết.

## Đối tượng truy vấn

Các phương thức làm việc với đối tượng {{domxref("WebGLQuery")}}.

- {{domxref("WebGL2RenderingContext.createQuery()")}}
  - : Tạo một đối tượng {{domxref("WebGLQuery")}} mới.
- {{domxref("WebGL2RenderingContext.deleteQuery()")}}
  - : Xóa một đối tượng {{domxref("WebGLQuery")}} đã cho.
- {{domxref("WebGL2RenderingContext.isQuery()")}}
  - : Trả về `true` nếu một đối tượng đã cho là đối tượng {{domxref("WebGLQuery")}} hợp lệ.
- {{domxref("WebGL2RenderingContext.beginQuery()")}}
  - : Bắt đầu một truy vấn không đồng bộ.
- {{domxref("WebGL2RenderingContext.endQuery()")}}
  - : Đánh dấu kết thúc của một truy vấn không đồng bộ.
- {{domxref("WebGL2RenderingContext.getQuery()")}}
  - : Trả về một đối tượng {{domxref("WebGLQuery")}} cho một target đã cho.
- {{domxref("WebGL2RenderingContext.getQueryParameter()")}}
  - : Trả về thông tin về một truy vấn.

## Đối tượng sampler

- {{domxref("WebGL2RenderingContext.createSampler()")}}
  - : Tạo một đối tượng {{domxref("WebGLSampler")}} mới.
- {{domxref("WebGL2RenderingContext.deleteSampler()")}}
  - : Xóa một đối tượng {{domxref("WebGLSampler")}} đã cho.
- {{domxref("WebGL2RenderingContext.bindSampler()")}}
  - : Liên kết một {{domxref("WebGLSampler")}} đã cho với một đơn vị texture.
- {{domxref("WebGL2RenderingContext.isSampler()")}}
  - : Trả về `true` nếu một đối tượng đã cho là đối tượng {{domxref("WebGLSampler")}} hợp lệ.
- {{domxref("WebGL2RenderingContext.samplerParameter()", "WebGL2RenderingContext.samplerParameter[if]()")}}
  - : Đặt các tham số sampler.
- {{domxref("WebGL2RenderingContext.getSamplerParameter()")}}
  - : Trả về thông tin tham số sampler.

## Đối tượng đồng bộ

- {{domxref("WebGL2RenderingContext.fenceSync()")}}
  - : Tạo một đối tượng {{domxref("WebGLSync")}} mới và chèn nó vào luồng lệnh GL.
- {{domxref("WebGL2RenderingContext.isSync()")}}
  - : Trả về `true` nếu đối tượng được truyền là đối tượng {{domxref("WebGLSync")}} hợp lệ.
- {{domxref("WebGL2RenderingContext.deleteSync()")}}
  - : Xóa một đối tượng {{domxref("WebGLSync")}} đã cho.
- {{domxref("WebGL2RenderingContext.clientWaitSync()")}}
  - : Chặn và chờ một đối tượng {{domxref("WebGLSync")}} trở thành signaled hoặc một thời gian chờ đã cho trôi qua.
- {{domxref("WebGL2RenderingContext.waitSync()")}}
  - : Trả về ngay lập tức, nhưng chờ trên máy chủ GL cho đến khi đối tượng {{domxref("WebGLSync")}} đã cho được signaled.
- {{domxref("WebGL2RenderingContext.getSyncParameter()")}}
  - : Trả về thông tin tham số của một đối tượng {{domxref("WebGLSync")}}.

## Transform feedback

- {{domxref("WebGL2RenderingContext.createTransformFeedback()")}}
  - : Tạo và khởi tạo các đối tượng {{domxref("WebGLTransformFeedback")}}.
- {{domxref("WebGL2RenderingContext.deleteTransformFeedback()")}}
  - : Xóa một đối tượng {{domxref("WebGLTransformFeedback")}} đã cho.
- {{domxref("WebGL2RenderingContext.isTransformFeedback()")}}
  - : Trả về `true` nếu đối tượng được truyền là đối tượng {{domxref("WebGLTransformFeedback")}} hợp lệ.
- {{domxref("WebGL2RenderingContext.bindTransformFeedback()")}}
  - : Liên kết một đối tượng {{domxref("WebGLTransformFeedback")}} đã cho với trạng thái GL hiện tại.
- {{domxref("WebGL2RenderingContext.beginTransformFeedback()")}}
  - : Bắt đầu một hoạt động transform feedback.
- {{domxref("WebGL2RenderingContext.endTransformFeedback()")}}
  - : Kết thúc một hoạt động transform feedback.
- {{domxref("WebGL2RenderingContext.transformFeedbackVaryings()")}}
  - : Chỉ định các giá trị sẽ ghi trong các bộ đệm {{domxref("WebGLTransformFeedback")}}.
- {{domxref("WebGL2RenderingContext.getTransformFeedbackVarying()")}}
  - : Trả về thông tin về các biến varying từ các bộ đệm {{domxref("WebGLTransformFeedback")}}.
- {{domxref("WebGL2RenderingContext.pauseTransformFeedback()")}}
  - : Tạm dừng một hoạt động transform feedback.
- {{domxref("WebGL2RenderingContext.resumeTransformFeedback()")}}
  - : Tiếp tục một hoạt động transform feedback.

## Đối tượng bộ đệm uniform

- {{domxref("WebGL2RenderingContext.bindBufferBase()")}}
  - : Liên kết một {{domxref("WebGLBuffer")}} đã cho với một điểm liên kết (`target`) đã cho tại một `index` đã cho.
- {{domxref("WebGL2RenderingContext.bindBufferRange()")}}
  - : Liên kết một dải của {{domxref("WebGLBuffer")}} đã cho với một điểm liên kết (`target`) đã cho tại một `index` đã cho.
- {{domxref("WebGL2RenderingContext.getUniformIndices()")}}
  - : Truy xuất các chỉ mục của một số uniform trong một {{domxref("WebGLProgram")}}.
- {{domxref("WebGL2RenderingContext.getActiveUniforms()")}}
  - : Truy xuất thông tin về các uniform đang hoạt động trong một {{domxref("WebGLProgram")}}.
- {{domxref("WebGL2RenderingContext.getUniformBlockIndex()")}}
  - : Truy xuất chỉ mục của một khối uniform trong một {{domxref("WebGLProgram")}}.
- {{domxref("WebGL2RenderingContext.getActiveUniformBlockParameter()")}}
  - : Truy xuất thông tin về một khối uniform đang hoạt động trong một {{domxref("WebGLProgram")}}.
- {{domxref("WebGL2RenderingContext.getActiveUniformBlockName()")}}
  - : Truy xuất tên của khối uniform đang hoạt động tại một chỉ mục đã cho trong một {{domxref("WebGLProgram")}}.
- {{domxref("WebGL2RenderingContext.uniformBlockBinding()")}}
  - : Gán các điểm liên kết cho các khối uniform đang hoạt động.

## Đối tượng mảng đỉnh

Các phương thức làm việc với đối tượng {{domxref("WebGLVertexArrayObject")}} (VAO).

- {{domxref("WebGL2RenderingContext.createVertexArray()")}}
  - : Tạo một {{domxref("WebGLVertexArrayObject")}} mới.
- {{domxref("WebGL2RenderingContext.deleteVertexArray()")}}
  - : Xóa một {{domxref("WebGLVertexArrayObject")}} đã cho.
- {{domxref("WebGL2RenderingContext.isVertexArray()")}}
  - : Trả về `true` nếu một đối tượng đã cho là {{domxref("WebGLVertexArrayObject")}} hợp lệ.
- {{domxref("WebGL2RenderingContext.bindVertexArray()")}}
  - : Liên kết một {{domxref("WebGLVertexArrayObject")}} đã cho với bộ đệm.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCanvasElement")}}
- {{domxref("WebGLRenderingContext")}}
