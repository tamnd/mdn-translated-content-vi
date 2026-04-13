---
title: Hằng số WebGL
slug: Web/API/WebGL_API/Constants
page-type: guide
spec-urls:
  - https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.14
  - https://www.khronos.org/registry/webgl/specs/latest/2.0/#3.7
---

{{DefaultAPISidebar("WebGL")}}

[WebGL API](/en-US/docs/Web/API/WebGL_API) cung cấp một số hằng số được các hàm truyền vào hoặc trả về. Tất cả các hằng số đều thuộc loại {{domxref("WebGL_API/Types", "GLenum")}}.

Các hằng số WebGL tiêu chuẩn được cài đặt trên các đối tượng {{domxref("WebGLRenderingContext")}} và {{domxref("WebGL2RenderingContext")}} để bạn sử dụng chúng dưới dạng `gl.CONSTANT_NAME`:

```js
const canvas = document.getElementById("myCanvas");
const gl = canvas.getContext("webgl");

gl.getParameter(gl.LINE_WIDTH);
```

Một số hằng số cũng được cung cấp bởi [Tiện ích mở rộng WebGL](/en-US/docs/Web/API/WebGL_API/Using_Extensions). [danh sách](#constants_d xác định_in_webgl_extensions) được cung cấp bên dưới.

```js
const debugInfo = gl.getExtension("WEBGL_debug_renderer_info");
const vendor = gl.getParameter(debugInfo.UNMASKED_VENDOR_WEBGL);
```

[Hướng dẫn về WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial) có thêm thông tin, ví dụ và tài nguyên về cách bắt đầu với WebGL.

## Mục lục

- [Hằng số WebGL 1 tiêu chuẩn](#standard_webgl_1_constants)
- [Hằng số WebGL 2 tiêu chuẩn](#bổ sung_constants_d xác định_webgl_2)
- [Hằng số tiện ích mở rộng WebGL](#constants_d xác định_in_webgl_extensions)

## Hằng số WebGL 1 tiêu chuẩn

Các hằng số này được xác định trên giao diện {{domxref("WebGLRenderingContext")}}.

### Xóa bộ đệm

Các hằng số được truyền tới {{domxref("WebGLRenderingContext.clear()")}} để xóa mặt nạ đệm.

| Tên hằng             | Giá trị    | Mô tả                                                   |
| -------------------- | ---------- | ------------------------------------------------------- |
| `DEPTH_BUFFER_BIT`   | 0x00000100 | Được chuyển tới `clear` để xóa bộ đệm độ sâu hiện tại.  |
| `STENCIL_BUFFER_BIT` | 0x00000400 | Được chuyển tới `clear` để xóa bộ đệm stencil hiện tại. |
| `COLOR_BUFFER_BIT`   | 0x00004000 | Được chuyển tới `clear` để xóa bộ đệm màu hiện tại.     |

### Hiển thị nguyên thủy

Các hằng số được truyền tới {{domxref("WebGLRenderingContext.drawElements()")}} hoặc {{domxref("WebGLRenderingContext.drawArrays()")}} để chỉ định loại nguyên thủy cần hiển thị.

| Tên hằng         | Giá trị | Mô tả                                                                                                                                                        |
| ---------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ĐIỂM`           | 0x0000  | Được chuyển tới `drawElements` hoặc `drawArrays` để vẽ các điểm đơn lẻ.                                                                                      |
| `DÒNG`           | 0x0001  | Được chuyển tới `drawElements` hoặc `drawArrays` để vẽ đường. Mỗi đỉnh kết nối với đỉnh sau nó.                                                              |
| `LINE_LOOP`      | 0x0002  | Được chuyển tới `drawElements` hoặc `drawArrays` để vẽ đường. Mỗi tập hợp hai đỉnh được coi là một đoạn đường riêng biệt.                                    |
| `LINE_STRIP`     | 0x0003  | Được chuyển tới `drawElements` hoặc `drawArrays` để vẽ một nhóm các đoạn thẳng được kết nối từ đỉnh đầu tiên đến đỉnh cuối cùng.                             |
| `TAM GIÁC`       | 0x0004  | Được chuyển tới `drawElements` hoặc `drawArrays` để vẽ hình tam giác. Mỗi bộ ba đỉnh tạo thành một hình tam giác riêng biệt.                                 |
| `TRIANGLE_STRIP` | 0x0005  | Được chuyển tới `drawElements` hoặc `drawArrays` để vẽ một nhóm các hình tam giác được kết nối.                                                              |
| `TRIANGLE_FAN`   | 0x0006  | Được chuyển tới `drawElements` hoặc `drawArrays` để vẽ một nhóm các hình tam giác được kết nối. Mỗi đỉnh kết nối với đỉnh trước và đỉnh đầu tiên trong quạt. |

### Chế độ hòa trộn

Các hằng số được truyền tới {{domxref("WebGLRenderingContext.blendFunc()")}} hoặc {{domxref("WebGLRenderingContext.blendFuncSeparate()")}} để chỉ định chế độ hòa trộn (cho cả RGB và alpha hoặc riêng biệt).

| Tên hằng                   | Giá trị | Mô tả                                                                                                                                                 |
| -------------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `KHÔNG`                    | 0       | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để tắt một thành phần.                                                                           |
| `MỘT`                      | 1       | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để bật một thành phần.                                                                           |
| `SRC_COLOR`                | 0x0300  | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để nhân một thành phần với màu của phần tử nguồn.                                                |
| `ONE_MINUS_SRC_COLOR`      | 0x0301  | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để nhân một thành phần với một trừ đi màu của phần tử nguồn.                                     |
| `SRC_ALPHA`                | 0x0302  | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để nhân một thành phần với alpha của nguồn.                                                      |
| `ONE_MINUS_SRC_ALPHA`      | 0x0303  | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để nhân một thành phần với 1 trừ đi alpha của nguồn.                                             |
| `DST_ALPHA`                | 0x0304  | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để nhân một thành phần với alpha của đích.                                                       |
| `ONE_MINUS_DST_ALPHA`      | 0x0305  | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để nhân một thành phần với 1 trừ đi alpha của đích.                                              |
| `DST_COLOR`                | 0x0306  | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để nhân một thành phần với màu của đích.                                                         |
| `ONE_MINUS_DST_COLOR`      | 0x0307  | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để nhân một thành phần với một trừ đi màu của đích.                                              |
| `SRC_ALPHA_SATURATE`       | 0x0308  | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để nhân một thành phần với giá trị tối thiểu của alpha của nguồn hoặc một trừ đi alpha của đích. |
| `CONSTANT_COLOR`           | 0x8001  | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để chỉ định hàm hòa trộn màu không đổi.                                                          |
| `ONE_MINUS_CONSTANT_COLOR` | 0x8002  | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để chỉ định một hàm trừ hàm hòa trộn màu không đổi.                                              |
| `CONSTANT_ALPHA`           | 0x8003  | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để chỉ định hàm hòa trộn alpha không đổi.                                                        |
| `ONE_MINUS_CONSTANT_ALPHA` | 0x8004  | Được chuyển tới `blendFunc` hoặc `blendFuncSeparate` để chỉ định một điểm trừ hàm hòa trộn alpha không đổi.                                           |

### Trộn các phương trình

Các hằng số được chuyển đến {{domxref("WebGLRenderingContext.blendEquation()")}} hoặc {{domxref("WebGLRenderingContext.blendEquationSeparate()")}} để kiểm soát cách tính toán hòa trộn (cho cả RGB và alpha hoặc riêng biệt).

| Tên hằng                | Giá trị | Mô tả                                                                                                           |
| ----------------------- | ------- | --------------------------------------------------------------------------------------------------------------- |
| `FUNC_ADD`              | 0x8006  | Được chuyển tới `blendEquation` hoặc `blendEquationSeparate` để đặt hàm hòa trộn bổ sung.                       |
| `FUNC_SUBTRACT`         | 0x800A  | Được chuyển đến `blendEquation` hoặc `blendEquationSeparate` để chỉ định hàm hòa trộn trừ (nguồn - đích).       |
| `FUNC_REVERSE_SUBTRACT` | 0x800B  | Được chuyển tới `blendEquation` hoặc `blendEquationSeparate` để chỉ định hàm hòa trộn trừ ngược (đích - nguồn). |

### Lấy thông tin tham số GL

Các hằng số được truyền tới {{domxref("WebGLRenderingContext.getParameter()")}} để chỉ định thông tin nào cần trả về.

| Tên hằng                           | Giá trị | Mô tả                                                                                                                                                                                                                                               |
| ---------------------------------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `BLEND_EQUATION`                   | 0x8009  | Đã chuyển tới `getParameter` để nhận chức năng hòa trộn RGB hiện tại.                                                                                                                                                                               |
| `BLEND_EQUATION_RGB`               | 0x8009  | Đã chuyển tới `getParameter` để nhận chức năng hòa trộn RGB hiện tại. Tương tự như `BLEND_EQUATION`                                                                                                                                                 |
| `BLEND_EQUATION_ALPHA`             | 0x883D  | Được chuyển tới `getParameter` để nhận hàm hòa trộn alpha hiện tại.                                                                                                                                                                                 |
| `BLEND_DST_RGB`                    | 0x80C8  | Được chuyển đến `getParameter` để nhận chức năng hòa trộn RGB đích hiện tại.                                                                                                                                                                        |
| `BLEND_SRC_RGB`                    | 0x80C9  | Được chuyển tới `getParameter` để lấy hàm hòa trộn RGB nguồn hiện tại.                                                                                                                                                                              |
| `BLEND_DST_ALPHA`                  | 0x80CA  | Được chuyển tới `getParameter` để nhận hàm hòa trộn alpha đích hiện tại.                                                                                                                                                                            |
| `BLEND_SRC_ALPHA`                  | 0x80CB  | Được chuyển đến `getParameter` để nhận hàm pha trộn alpha nguồn hiện tại.                                                                                                                                                                           |
| `BLEND_COLOR`                      | 0x8005  | Được chuyển tới `getParameter` để trả về màu hòa trộn hiện tại.                                                                                                                                                                                     |
| `ARRAY_BUFFER_BINding`             | 0x8894  | Được chuyển tới `getParameter` để lấy liên kết bộ đệm mảng.                                                                                                                                                                                         |
| `ELEMENT_ARRAY_BUFFER_BINDING`     | 0x8895  | Được chuyển tới `getParameter` để lấy bộ đệm mảng phần tử hiện tại.                                                                                                                                                                                 |
| `LINE_WIDTH`                       | 0x0B21  | Được chuyển tới `getParameter` để lấy `lineWidth` hiện tại (được đặt theo phương thức `lineWidth`).                                                                                                                                                 |
| `ALIASED_POINT_SIZE_RANGE`         | 0x846D  | Được chuyển tới `getParameter` để lấy kích thước hiện tại của một điểm được vẽ bằng `gl.POINTS`                                                                                                                                                     |
| `ALIASED_LINE_WIDTH_RANGE`         | 0x846E  | Được chuyển đến `getParameter` để nhận phạm vi chiều rộng có sẵn cho một dòng. Sau đó, phương thức `getParameter` trả về một mảng có hai phần tử: phần tử đầu tiên là giá trị chiều rộng tối thiểu và phần tử thứ hai là giá trị chiều rộng tối đa. |
| `CULL_FACE_MODE`                   | 0x0B45  | Được chuyển đến `getParameter` để nhận giá trị hiện tại của `cullFace`. Nên trả về `FRONT`, `BACK` hoặc `FRONT_AND_BACK`                                                                                                                            |
| `MẶT TRƯỚC`                        | 0x0B46  | Được chuyển đến `getParameter` để xác định giá trị hiện tại của `frontFace`. Nên trả về `CW` hoặc `CCW`.                                                                                                                                            |
| `DEPTH_RANGE`                      | 0x0B70  | Được chuyển tới `getParameter` để trả về một mảng số float có độ dài-2 cho phạm vi độ sâu hiện tại.                                                                                                                                                 |
| `DEPTH_WRITEMASK`                  | 0x0B72  | Được chuyển tới `getParameter` để xác định xem mặt nạ ghi độ sâu có được bật hay không.                                                                                                                                                             |
| `DEPTH_CLEAR_VALUE`                | 0x0B73  | Được chuyển tới `getParameter` để xác định giá trị xóa độ sâu hiện tại.                                                                                                                                                                             |
| `DEPTH_FUNC`                       | 0x0B74  | Được chuyển đến `getParameter` để lấy hàm độ sâu hiện tại. Trả về `NEVER`, `ALWAYS`, `LESS`, `EQUAL`, `LEQUAL`, `GREATER`, `GEQUAL` hoặc `NOTEQUAL`.                                                                                                |
| `STENCIL_CLEAR_VALUE`              | 0x0B91  | Được chuyển đến `getParameter` để lấy giá trị mà stencil sẽ bị xóa.                                                                                                                                                                                 |
| `STENCIL_FUNC`                     | 0x0B92  | Được chuyển tới `getParameter` để lấy hàm stencil hiện tại. Trả về `NEVER`, `ALWAYS`, `LESS`, `EQUAL`, `LEQUAL`, `GREATER`, `GEQUAL` hoặc `NOTEQUAL`.                                                                                               |
| `STENCIL_FAIL`                     | 0x0B94  | Được chuyển tới `getParameter` để nhận hàm lỗi stencil hiện tại. Nên trả về `KEEP`, `REPLACE`, `INCR`, `DECR`, `INVERT`, `INCR_WRAP` hoặc `DECR_WRAP`.                                                                                              |
| `STENCIL_PASS_DEPTH_FAIL`          | 0x0B95  | Đã chuyển tới `getParameter` để nhận chức năng lỗi stencil hiện tại nếu kiểm tra bộ đệm độ sâu không thành công. Nên trả về `KEEP`, `REPLACE`, `INCR`, `DECR`, `INVERT`, `INCR_WRAP` hoặc `DECR_WRAP`.                                              |
| `STENCIL_PASS_DEPTH_PASS`          | 0x0B96  | Được chuyển tới `getParameter` để nhận chức năng lỗi stencil hiện tại nếu bài kiểm tra bộ đệm độ sâu vượt qua. Nên trả về `KEEP`, `REPLACE`, `INCR`, `DECR`, `INVERT`, `INCR_WRAP` hoặc `DECR_WRAP`.                                                |
| `STENCIL_REF`                      | 0x0B97  | Được chuyển tới `getParameter` để lấy giá trị tham chiếu dùng cho kiểm tra stencil.                                                                                                                                                                 |
| `STENCIL_VALUE_MASK`               | 0x0B93  |                                                                                                                                                                                                                                                     |
| `STENCIL_WRITEMASK`                | 0x0B98  |                                                                                                                                                                                                                                                     |
| `STENCIL_BACK_FUNC`                | 0x8800  |                                                                                                                                                                                                                                                     |
| `STENCIL_BACK_FAIL`                | 0x8801  |                                                                                                                                                                                                                                                     |
| `STENCIL_BACK_PASS_DEPTH_FAIL`     | 0x8802  |                                                                                                                                                                                                                                                     |
| `STENCIL_BACK_PASS_DEPTH_PASS`     | 0x8803  |                                                                                                                                                                                                                                                     |
| `STENCIL_BACK_REF`                 | 0x8CA3  |                                                                                                                                                                                                                                                     |
| `STENCIL_BACK_VALUE_MASK`          | 0x8CA4  |                                                                                                                                                                                                                                                     |
| `STENCIL_BACK_WRITEMASK`           | 0x8CA5  |                                                                                                                                                                                                                                                     |
| `CỔNG XEM`                         | 0x0BA2  | Trả về một {{jsxref("Int32Array")}} có bốn phần tử cho kích thước khung nhìn hiện tại.                                                                                                                                                              |
| `SCISSOR_BOX`                      | 0x0C10  | Trả về một {{jsxref("Int32Array")}} có bốn phần tử cho kích thước hộp cắt kéo hiện tại.                                                                                                                                                             |
| `COLOR_CLEAR_VALUE`                | 0x0C22  |                                                                                                                                                                                                                                                     |
| `COLOR_WRITEMASK`                  | 0x0C23  |                                                                                                                                                                                                                                                     |
| `UNPACK_ALIGNMENT`                 | 0x0CF5  |                                                                                                                                                                                                                                                     |
| `PACK_ALIGNMENT`                   | 0x0D05  |                                                                                                                                                                                                                                                     |
| `MAX_TEXTURE_SIZE`                 | 0x0D33  |                                                                                                                                                                                                                                                     |
| `MAX_VIEWPORT_DIMS`                | 0x0D3A  |                                                                                                                                                                                                                                                     |
| `SUBPIXEL_BITS`                    | 0x0D50  |                                                                                                                                                                                                                                                     |
| `RED_BITS`                         | 0x0D52  |                                                                                                                                                                                                                                                     |
| `GREEN_BITS`                       | 0x0D53  |                                                                                                                                                                                                                                                     |
| `BLUE_BITS`                        | 0x0D54  |                                                                                                                                                                                                                                                     |
| `ALPHA_BITS`                       | 0x0D55  |                                                                                                                                                                                                                                                     |
| `DEPTH_BITS`                       | 0x0D56  |                                                                                                                                                                                                                                                     |
| `STENCIL_BITS`                     | 0x0D57  |                                                                                                                                                                                                                                                     |
| `POLYGON_OFFSET_UNITS`             | 0x2A00  |                                                                                                                                                                                                                                                     |
| `POLYGON_OFFSET_FACTOR`            | 0x8038  |                                                                                                                                                                                                                                                     |
| `TEXTURE_BINDING_2D`               | 0x8069  |                                                                                                                                                                                                                                                     |
| `SAMPLE_BUFFERS`                   | 0x80A8  |                                                                                                                                                                                                                                                     |
| `MẪU`                              | 0x80A9  |                                                                                                                                                                                                                                                     |
| `SAMPLE_COVERAGE_VALUE`            | 0x80AA  |                                                                                                                                                                                                                                                     |
| `SAMPLE_COVERAGE_INVERT`           | 0x80AB  |                                                                                                                                                                                                                                                     |
| `COMPRESSED_TEXTURE_FORMATS`       | 0x86A3  |                                                                                                                                                                                                                                                     |
| `BÁN HÀNG`                         | 0x1F00  |                                                                                                                                                                                                                                                     |
| `RDERER`                           | 0x1F01  |                                                                                                                                                                                                                                                     |
| `PHIÊN BẢN`                        | 0x1F02  |                                                                                                                                                                                                                                                     |
| `IMPLEMENTATION_COLOR_READ_TYPE`   | 0x8B9A  |                                                                                                                                                                                                                                                     |
| `IMPLEMENTATION_COLOR_READ_FORMAT` | 0x8B9B  |                                                                                                                                                                                                                                                     |
| `BROWSER_DEFAULT_WEBGL`            | 0x9244  |                                                                                                                                                                                                                                                     |

### Bộ đệm

Các hằng số được chuyển đến {{domxref("WebGLRenderingContext.bufferData()")}}, {{domxref("WebGLRenderingContext.bufferSubData()")}}, {{domxref("WebGLRenderingContext.bindBuffer()")}} hoặc {{domxref("WebGLRenderingContext.getBufferParameter()")}}.

| Tên hằng               | Giá trị | Mô tả                                                                                                                                                |
| ---------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `STATIC_DRAW`          | 0x88E4  | Được chuyển tới `bufferData` dưới dạng gợi ý về việc liệu nội dung của bộ đệm có được sử dụng thường xuyên và không thay đổi thường xuyên hay không. |
| `STREAM_DRAW`          | 0x88E0  | Được chuyển tới `bufferData` dưới dạng gợi ý về việc liệu nội dung của bộ đệm có thể không được sử dụng thường xuyên hay không.                      |
| `DYNAMIC_DRAW`         | 0x88E8  | Được chuyển tới `bufferData` dưới dạng gợi ý về việc liệu nội dung của bộ đệm có được sử dụng thường xuyên và thay đổi thường xuyên hay không.       |
| `ARRAY_BUFFER`         | 0x8892  | Được chuyển đến `bindBuffer` hoặc `bufferData` để chỉ định loại bộ đệm đang được sử dụng.                                                            |
| `ELEMENT_ARRAY_BUFFER` | 0x8893  | Được chuyển đến `bindBuffer` hoặc `bufferData` để chỉ định loại bộ đệm đang được sử dụng.                                                            |
| `BUFFER_SIZE`          | 0x8764  | Được chuyển đến `getBufferParameter` để nhận kích thước của bộ đệm.                                                                                  |
| `BUFFER_USAGE`         | 0x8765  | Được chuyển tới `getBufferParameter` để nhận gợi ý về bộ đệm được chuyển vào khi nó được tạo.                                                        |

### Thuộc tính đỉnh

Các hằng số được truyền tới {{domxref("WebGLRenderingContext.getVertexAttrib()")}}.

| Tên hằng                             | Giá trị | Mô tả                                                                  |
| ------------------------------------ | ------- | ---------------------------------------------------------------------- |
| `CURRENT_VERTEX_ATTRIB`              | 0x8626  | Được chuyển tới `getVertexAttrib` để đọc lại thuộc tính đỉnh hiện tại. |
| `VERTEX_ATTRIB_ARRAY_ENABLED`        | 0x8622  |                                                                        |
| `VERTEX_ATTRIB_ARRAY_SIZE`           | 0x8623  |                                                                        |
| `VERTEX_ATTRIB_ARRAY_STRIDE`         | 0x8624  |                                                                        |
| `VERTEX_ATTRIB_ARRAY_TYPE`           | 0x8625  |                                                                        |
| `VERTEX_ATTRIB_ARRAY_NORMALIZED`     | 0x886A  |                                                                        |
| `VERTEX_ATTRIB_ARRAY_POINTER`        | 0x8645  |                                                                        |
| `VERTEX_ATTRIB_ARRAY_BUFFER_BINding` | 0x889F  |                                                                        |

### Loại bỏ

Các hằng số được chuyển tới {{domxref("WebGLRenderingContext.cullFace()")}}.

| Tên hằng         | Giá trị | Mô tả                                                                                                                                   |
| ---------------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `CULL_FACE`      | 0x0B44  | Được chuyển tới `enable`/`disable` để bật/tắt loại bỏ. Cũng có thể được sử dụng với `getParameter` để tìm phương pháp loại bỏ hiện tại. |
| `MẶT TRƯỚC`      | 0x0404  | Được chuyển tới `cullFace` để chỉ định rằng chỉ nên loại bỏ các mặt trước.                                                              |
| `TRỞ LẠI`        | 0x0405  | Được chuyển tới `cullFace` để chỉ định rằng chỉ nên loại bỏ các mặt sau.                                                                |
| `FRONT_AND_BACK` | 0x0408  | Được chuyển tới `cullFace` để chỉ định rằng mặt trước và mặt sau sẽ bị loại bỏ.                                                         |

### Kích hoạt và vô hiệu hóa

Các hằng số được truyền tới {{domxref("WebGLRenderingContext.enable()")}} hoặc {{domxref("WebGLRenderingContext.disable()")}}.

| Tên hằng                   | Giá trị | Mô tả                                                                                                                                                                                                                                 |
| -------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `HỖN HỢP`                  | 0x0BE2  | Chuyển tới `enable`/`disable` để bật/tắt tính năng trộn. Cũng có thể được sử dụng với `getParameter` để tìm phương pháp hòa trộn hiện tại.                                                                                            |
| `DEPTH_TEST`               | 0x0B71  | Đã chuyển sang `enable`/`disable` để bật/tắt kiểm tra độ sâu. Cũng có thể được sử dụng với `getParameter` để truy vấn bài kiểm tra độ sâu.                                                                                            |
| `DITHER`                   | 0x0BD0  | Được chuyển tới `enable`/`disable` để bật/tắt phối màu. Cũng có thể được sử dụng với `getParameter` để tìm phương pháp phối màu hiện tại.                                                                                             |
| `POLYGON_OFFSET_FILL`      | 0x8037  | Được chuyển tới `enable`/`disable` để bật/tắt phần bù đa giác. Hữu ích để hiển thị các hình ảnh, đề can và khối có đường ẩn với các cạnh được đánh dấu. Cũng có thể được sử dụng với `getParameter` để truy vấn bài kiểm tra cắt kéo. |
| `SAMPLE_ALPHA_TO_COVERAGE` | 0x809E  | Được chuyển tới `enable`/`disable` để bật/tắt alpha cho vùng phủ sóng. Được sử dụng trong các kênh alpha đa mẫu.                                                                                                                      |
| `SAMPLE_COVERAGE`          | 0x80A0  | Chuyển tới `enable`/`disable` để bật/tắt phạm vi mẫu. Được sử dụng trong nhiều mẫu.                                                                                                                                                   |
| `SCISSOR_TEST`             | 0x0C11  | Đã chuyển sang `enable`/`disable` để bật/tắt thử nghiệm cắt kéo. Cũng có thể được sử dụng với `getParameter` để truy vấn bài kiểm tra cắt kéo.                                                                                        |
| `STENCIL_TEST`             | 0x0B90  | Đã chuyển sang `enable`/`disable` để bật/tắt kiểm tra stencil. Cũng có thể được sử dụng với `getParameter` để truy vấn bài kiểm tra stencil.                                                                                          |

### Lỗi

Các hằng số được trả về từ {{domxref("WebGLRenderingContext.getError()")}}.

| Tên hằng             | Giá trị | Mô tả                      |
| -------------------- | ------- | -------------------------- |
| `KHÔNG_LỖI`          | 0       | Được trả về từ `getError`. |
| `INVALID_ENUM`       | 0x0500  | Được trả về từ `getError`. |
| `INVALID_VALUE`      | 0x0501  | Được trả về từ `getError`. |
| `INVALID_OPERATION`  | 0x0502  | Được trả về từ `getError`. |
| `OUT_OF_MEMORY`      | 0x0505  | Được trả về từ `getError`. |
| `CONTEXT_LOST_WEBGL` | 0x9242  | Được trả về từ `getError`. |

### Hướng mặt trước

Các hằng số được chuyển đến {{domxref("WebGLRenderingContext.frontFace()")}}.

| Tên hằng | Giá trị | Mô tả                                                                                                    |
| -------- | ------- | -------------------------------------------------------------------------------------------------------- |
| `CW`     | 0x0900  | Được chuyển tới `frontFace` để chỉ định mặt trước của đa giác được vẽ theo chiều kim đồng hồ             |
| `CCW`    | 0x0901  | Được chuyển tới `frontFace` để chỉ định mặt trước của đa giác được vẽ theo hướng ngược chiều kim đồng hồ |

### Gợi ý

Các hằng số được chuyển đến {{domxref("WebGLRenderingContext.hint()")}}

| Tên hằng               | Giá trị | Mô tả                                                                                                       |
| ---------------------- | ------- | ----------------------------------------------------------------------------------------------------------- |
| `ĐỪNG_CHĂM SÓC`        | 0x1100  | Không có ưu tiên cho hành vi này.                                                                           |
| `NHANH NHẤT`           | 0x1101  | Nên sử dụng hành vi hiệu quả nhất.                                                                          |
| `ĐẸP NHẤT`             | 0x1102  | Nên sử dụng tùy chọn chính xác nhất hoặc chất lượng cao nhất.                                               |
| `GENERATE_MIPMAP_HINT` | 0x8192  | Gợi ý về chất lượng lọc khi tạo hình ảnh mipmap bằng {{domxref("WebGLRenderingContext.generateMipmap()")}}. |

### Kiểu dữ liệu

| Tên hằng         | Giá trị | Mô tả |
| ---------------- | ------- | ----- |
| `BYTE`           | 0x1400  |       |
| `UNSIGNED_BYTE`  | 0x1401  |       |
| `NGẮN`           | 0x1402  |       |
| `UNSIGNED_SHORT` | 0x1403  |       |
| `INT`            | 0x1404  |       |
| `UNSIGNED_INT`   | 0x1405  |       |
| `FLOAT`          | 0x1406  |       |

### Định dạng pixel

| Tên hằng          | Giá trị | Mô tả |
| ----------------- | ------- | ----- |
| `DEPTH_COMPONENT` | 0x1902  |       |
| `ALPHA`           | 0x1906  |       |
| `RGB`             | 0x1907  |       |
| `RGBA`            | 0x1908  |       |
| `ĐỘ SÁNG`        | 0x1909  |       |
| `LUMINANCE_ALPHA` | 0x190A  |       |

### Các loại pixel

| Tên hằng                 | Giá trị | Mô tả |
| ------------------------ | ------- | ----- |
| `UNSIGNED_BYTE`          | 0x1401  |       |
| `UNSIGNED_SHORT_4_4_4_4` | 0x8033  |       |
| `UNSIGNED_SHORT_5_5_5_1` | 0x8034  |       |
| `UNSIGNED_SHORT_5_6_5`   | 0x8363  |       |

### Trình đổ bóng

Các hằng số được chuyển đến {{domxref("WebGLRenderingContext.createShader()")}} hoặc {{domxref("WebGLRenderingContext.getShaderParameter()")}}

| Tên hằng                           | Giá trị | Mô tả                                                                                                                                                                                                       |
| ---------------------------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `FRAGMENT_SHADER`                  | 0x8B30  | Được chuyển tới `createShader` để xác định trình đổ bóng phân đoạn.                                                                                                                                         |
| `VERTEX_SHADER`                    | 0x8B31  | Được chuyển tới `createShader` để xác định trình đổ bóng đỉnh                                                                                                                                               |
| `COMPILE_STATUS`                   | 0x8B81  | Đã chuyển tới `getShaderParameter` để biết trạng thái biên dịch. Trả về false nếu shader không được biên dịch. Sau đó, bạn có thể truy vấn `getShaderInfoLog` để tìm lỗi chính xác                          |
| `XÓA_TÌNH TRẠNG`                   | 0x8B80  | Được chuyển tới `getShaderParameter` để xác định xem trình đổ bóng có bị xóa thông qua `deleteShader` hay không. Trả về true nếu đúng, ngược lại trả về false.                                              |
| `LINK_STATUS`                      | 0x8B82  | Được chuyển đến `getProgramParameter` sau khi gọi `linkProgram` để xác định xem chương trình có được liên kết chính xác hay không. Trả về sai nếu có lỗi. Sử dụng `getProgramInfoLog` để tìm lỗi chính xác. |
| `VALIDATE_STATUS`                  | 0x8B83  | Được chuyển tới `getProgramParameter` sau khi gọi `validateProgram` để xác định xem nó có hợp lệ hay không. Trả về sai nếu tìm thấy lỗi.                                                                    |
| `ATTACHED_SHADERS`                 | 0x8B85  | Được chuyển tới `getProgramParameter` sau khi gọi `attachShader` để xác định xem trình đổ bóng có được đính kèm chính xác hay không. Trả về sai nếu xảy ra lỗi.                                             |
| `ACTIVE_ATTRIBUTES`                | 0x8B89  | Được chuyển tới `getProgramParameter` để lấy số lượng thuộc tính đang hoạt động trong một chương trình.                                                                                                     |
| `ACTIVE_UNIFORMS`                  | 0x8B86  | Được chuyển tới `getProgramParameter` để lấy số lượng đồng phục đang hoạt động trong một chương trình.                                                                                                      |
| `MAX_VERTEX_ATTRIBS`               | 0x8869  | Số mục tối đa có thể có trong danh sách thuộc tính đỉnh.                                                                                                                                                    |
| `MAX_VERTEX_UNIFORM_VECTORS`       | 0x8DFB  |                                                                                                                                                                                                             |
| `MAX_VARYING_VECTORS`              | 0x8DFC  |                                                                                                                                                                                                             |
| `MAX_COMBINED_TEXTURE_IMAGE_UNITS` | 0x8B4D  |                                                                                                                                                                                                             |
| `MAX_VERTEX_TEXTURE_IMAGE_UNITS`   | 0x8B4C  |                                                                                                                                                                                                             |
| `MAX_TEXTURE_IMAGE_UNITS`          | 0x8872  | Số lượng đơn vị kết cấu tối đa phụ thuộc vào việc triển khai. Ít nhất là 8.                                                                                                                                 |
| `MAX_FRAGMENT_UNIFORM_VECTORS`     | 0x8DFD  |                                                                                                                                                                                                             |
| `SHADER_TYPE`                      | 0x8B4F  |                                                                                                                                                                                                             |
| `SHADING_LANGUAGE_VERSION`         | 0x8B8C  |                                                                                                                                                                                                             |
| `CURRENT_PROGRAM`                  | 0x8B8D  |                                                                                                                                                                                                             |

### Kiểm tra độ sâu hoặc stencil

Các hằng số được truyền tới {{domxref("WebGLRenderingContext.depthFunc()")}} hoặc {{domxref("WebGLRenderingContext.stencilFunc()")}}.

| Tên hằng        | Giá trị | Mô tả                                                                                                                                                                               |
| --------------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `KHÔNG BAO GIỜ` | 0x0200  | Được chuyển đến `deepFunction` hoặc `stencilFunction` để chỉ định các bài kiểm tra độ sâu hoặc stencil sẽ không bao giờ vượt qua, tức là sẽ không có gì được rút ra.                |
| `ÍT`            | 0x0201  | Được chuyển đến `độ sâuFunction` hoặc `stencilFunction` để chỉ định độ sâu hoặc các bài kiểm tra stencil sẽ đạt nếu giá trị độ sâu mới nhỏ hơn giá trị được lưu trữ.                |
| `BẰNG`          | 0x0202  | Được chuyển tới `độ sâuFunction` hoặc `stencilFunction` để chỉ định độ sâu hoặc các bài kiểm tra stencil sẽ vượt qua nếu giá trị độ sâu mới bằng với giá trị được lưu trữ.          |
| `BÌNH ĐẲNG`     | 0x0203  | Được chuyển tới `độ sâuFunction` hoặc `stencilFunction` để chỉ định độ sâu hoặc kiểm tra stencil sẽ đạt nếu giá trị độ sâu mới nhỏ hơn hoặc bằng giá trị được lưu trữ.              |
| `TUYỆT VỜI`     | 0x0204  | Được chuyển đến `độ sâuFunction` hoặc `stencilFunction` để chỉ định độ sâu hoặc các bài kiểm tra stencil sẽ vượt qua nếu giá trị độ sâu mới lớn hơn giá trị được lưu trữ.           |
| `LƯU Ý`         | 0x0205  | Được chuyển tới `độ sâuFunction` hoặc `stencilFunction` để chỉ định độ sâu hoặc các bài kiểm tra stencil sẽ vượt qua nếu giá trị độ sâu mới không bằng giá trị được lưu trữ.        |
| `THEQUAL`       | 0x0206  | Được chuyển tới `độ sâuFunction` hoặc `stencilFunction` để chỉ định độ sâu hoặc các bài kiểm tra stencil sẽ vượt qua nếu giá trị độ sâu mới lớn hơn hoặc bằng giá trị được lưu trữ. |
| `LUÔN`          | 0x0207  | Được chuyển tới `độ sâuFunction` hoặc `stencilFunction` để chỉ định các bài kiểm tra độ sâu hoặc stencil sẽ luôn đạt, tức là các pixel sẽ được vẽ theo thứ tự chúng được vẽ.        |

### Hành động của stencil

Các hằng số được chuyển đến {{domxref("WebGLRenderingContext.stencilOp()")}}.

| Tên hằng    | Giá trị | Mô tả |
| ----------- | ------- | ----- |
| `GIỮ`       | 0x1E00  |       |
| `THAY THẾ`  | 0x1E01  |       |
| `INCR`      | 0x1E02  |       |
| `DECR`      | 0x1E03  |       |
| `ĐẢO NGƯỢC` | 0x150A  |       |
| `INCR_WRAP` | 0x8507  |       |
| `DECR_WRAP` | 0x8508  |       |

### Họa tiết

Các hằng số được chuyển đến {{domxref("WebGLRenderingContext.texParameter", "WebGLRenderingContext.texParameteri()")}}, {{domxref("WebGLRenderingContext.texParameter", "WebGLRenderingContext.texParameterf()")}}, {{domxref("WebGLRenderingContext.bindTexture()")}}, {{domxref("WebGLRenderingContext.texImage2D()")}} và những người khác.

| Constant name                 | Giá trị         | Mô tả                                   |
| ----------------------------- | --------------- | --------------------------------------- |
| `GẦN NHẤT`                    | 0x2600          |                                         |
| `TUYẾN TÍNH`                  | 0x2601          |                                         |
| `NEAREST_MIPMAP_NEAREST`      | 0x2700          |                                         |
| `LINEAR_MIPMAP_NEAREST`       | 0x2701          |                                         |
| `NEAREST_MIPMAP_LINEAR`       | 0x2702          |                                         |
| `LINEAR_MIPMAP_LINEAR`        | 0x2703          |                                         |
| `TEXTURE_MAG_FILTER`          | 0x2800          |                                         |
| `TEXTURE_MIN_FILTER`          | 0x2801          |                                         |
| `TEXTURE_WRAP_S`              | 0x2802          |                                         |
| `TEXTURE_WRAP_T`              | 0x2803          |                                         |
| `TEXTURE_2D`                  | 0x0DE1          |                                         |
| `KẾT CẤU`                     | 0x1702          |                                         |
| `TEXTURE_CUBE_MAP`            | 0x8513          |                                         |
| `TEXTURE_BINDING_CUBE_MAP`    | 0x8514          |                                         |
| `TEXTURE_CUBE_MAP_POSITIVE_X` | 0x8515          |                                         |
| `TEXTURE_CUBE_MAP_NEGATIVE_X` | 0x8516          |                                         |
| `TEXTURE_CUBE_MAP_POSITIVE_Y` | 0x8517          |                                         |
| `TEXTURE_CUBE_MAP_NEGATIVE_Y` | 0x8518          |                                         |
| `TEXTURE_CUBE_MAP_POSITIVE_Z` | 0x8519          |                                         |
| `TEXTURE_CUBE_MAP_NEGATIVE_Z` | 0x851A          |                                         |
| `MAX_CUBE_MAP_TEXTURE_SIZE`   | 0x851C          |                                         |
| `Kết cấu0 - 31`               | 0x84C0 - 0x84DF | Một đơn vị kết cấu.                     |
| `ACTIVE_TEXTURE`              | 0x84E0          | Đơn vị kết cấu đang hoạt động hiện tại. |
| `LẶP LẠI`                     | 0x2901          |                                         |
| `CLAMP_TO_EDGE`               | 0x812F          |                                         |
| `MIRRORED_REPEAT`             | 0x8370          |                                         |

### Các loại đồng phục

| Tên hằng       | Giá trị | Mô tả |
| -------------- | ------- | ----- |
| `FLOAT_VEC2`   | 0x8B50  |       |
| `FLOAT_VEC3`   | 0x8B51  |       |
| `FLOAT_VEC4`   | 0x8B52  |       |
| `INT_VEC2`     | 0x8B53  |       |
| `INT_VEC3`     | 0x8B54  |       |
| `INT_VEC4`     | 0x8B55  |       |
| `BOOL`         | 0x8B56  |       |
| `BOOL_VEC2`    | 0x8B57  |       |
| `BOOL_VEC3`    | 0x8B58  |       |
| `BOOL_VEC4`    | 0x8B59  |       |
| `FLOAT_MAT2`   | 0x8B5A  |       |
| `FLOAT_MAT3`   | 0x8B5B  |       |
| `FLOAT_MAT4`   | 0x8B5C  |       |
| `SAMPLER_2D`   | 0x8B5E  |       |
| `SAMPLER_CUBE` | 0x8B60  |       |

### Các loại Shader được chỉ định chính xác

| Tên hằng       | Giá trị | Mô tả |
| -------------- | ------- | ----- |
| `THẤP_FLOAT`   | 0x8DF0  |       |
| `MEDIUM_FLOAT` | 0x8DF1  |       |
| `CAO_FLOAT`    | 0x8DF2  |       |
| `THẤP_INT`     | 0x8DF3  |       |
| `MEDIUM_INT`   | 0x8DF4  |       |
| `CAO_INT`      | 0x8DF5  |       |

### Bộ đệm khung và bộ đệm kết xuất

| Tên hằng                                       | Giá trị | Mô tả |
| ---------------------------------------------- | ------- | ----- |
| `Bộ đệm khung`                                 | 0x8D40  |       |
| `RENDERBUFFER`                                 | 0x8D41  |       |
| `RGBA4`                                        | 0x8056  |       |
| `RGB5_A1`                                      | 0x8057  |       |
| `RGB565`                                       | 0x8D62  |       |
| `DEPTH_COMPONENT16`                            | 0x81A5  |       |
| `STENCIL_INDEX8`                               | 0x8D48  |       |
| `DEPTH_STENCIL`                                | 0x84F9  |       |
| `RENDERBUFFER_WIDTH`                           | 0x8D42  |       |
| `RENDERBUFFER_HEIGHT`                          | 0x8D43  |       |
| `RENDERBUFFER_INTERNAL_FORMAT`                 | 0x8D44  |       |
| `RENDERBUFFER_RED_SIZE`                        | 0x8D50  |       |
| `RENDERBUFFER_GREEN_SIZE`                      | 0x8D51  |       |
| `RENDERBUFFER_BLUE_SIZE`                       | 0x8D52  |       |
| `RENDERBUFFER_ALPHA_SIZE`                      | 0x8D53  |       |
| `RENDERBUFFER_DEPTH_SIZE`                      | 0x8D54  |       |
| `RENDERBUFFER_STENCIL_SIZE`                    | 0x8D55  |       |
| `FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE`           | 0x8CD0  |       |
| `FRAMEBUFFER_ATTACHMENT_OBJECT_NAME`           | 0x8CD1  |       |
| `FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL`         | 0x8CD2  |       |
| `FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE` | 0x8CD3  |       |
| `COLOR_ATTACHMENT0`                            | 0x8CE0  |       |
| `DEPTH_ATTACHMENT`                             | 0x8D00  |       |
| `STENCIL_ATTACHMENT`                           | 0x8D20  |       |
| `DEPTH_STENCIL_ATTACHMENT`                     | 0x821A  |       |
| `KHÔNG`                                        | 0       |       |
| `FRAMEBUFFER_COMPLETE`                         | 0x8CD5  |       |
| `FRAMEBUFFER_INCOMPLETE_ATTACHMENT`            | 0x8CD6  |       |
| `FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT`    | 0x8CD7  |       |
| `FRAMEBUFFER_INCOMPLETE_DIMENSIONS`            | 0x8CD9  |       |
| `FRAMEBUFFER_UNSUPPORTED`                      | 0x8CDD  |       |
| `FRAMEBUFFER_BINDING`                          | 0x8CA6  |       |
| `RENDERBUFFER_BINDING`                         | 0x8CA7  |       |
| `MAX_RENDERBUFFER_SIZE`                        | 0x84E8  |       |
| `INVALID_FRAMEBUFFER_OPERATION`                | 0x0506  |       |

### Chế độ lưu trữ pixel

Các hằng số được truyền tới {{domxref("WebGLRenderingContext.pixelStorei()")}}.

| Tên hằng                             | Giá trị | Mô tả |
| ------------------------------------ | ------- | ----- |
| `UNPACK_FLIP_Y_WEBGL`                | 0x9240  |       |
| `UNPACK_PREMULTIPLY_ALPHA_WEBGL`     | 0x9241  |       |
| `UNPACK_COLORSPACE_CONVERSION_WEBGL` | 0x9243  |       |

## Các hằng số bổ sung được xác định WebGL 2

Các hằng số này được xác định trên giao diện {{domxref("WebGL2RenderingContext")}}. Tất cả các hằng số WebGL 1 cũng có sẵn trong ngữ cảnh WebGL 2.

### Lấy thông tin tham số GL

Các hằng số được truyền tới {{domxref("WebGLRenderingContext.getParameter()")}} để chỉ định thông tin nào cần trả về.

| Tên hằng                          | Giá trị | Mô tả |
| --------------------------------- | ------- | ----- |
| `ĐỌC_BUFFER`                      | 0x0C02  |       |
| `UNPACK_ROW_LENGTH`               | 0x0CF2  |       |
| `UNPACK_SKIP_ROWS`                | 0x0CF3  |       |
| `UNPACK_SKIP_PIXELS`              | 0x0CF4  |       |
| `PACK_ROW_LENGTH`                 | 0x0D02  |       |
| `PACK_SKIP_ROWS`                  | 0x0D03  |       |
| `PACK_SKIP_PIXELS`                | 0x0D04  |       |
| `TEXTURE_BINDING_3D`              | 0x806A  |       |
| `UNPACK_SKIP_IMAGES`              | 0x806D  |       |
| `UNPACK_IMAGE_HEIGHT`             | 0x806E  |       |
| `MAX_3D_TEXTURE_SIZE`             | 0x8073  |       |
| `MAX_ELEMENTS_VERTICES`           | 0x80E8  |       |
| `MAX_ELEMENTS_INDICES`            | 0x80E9  |       |
| `MAX_TEXTURE_LOD_BIAS`            | 0x84FD  |       |
| `MAX_FRAGMENT_UNIFORM_COMPONENTS` | 0x8B49  |       |
| `MAX_VERTEX_UNIFORM_COMPONENTS`   | 0x8B4A  |       |
| `MAX_ARRAY_TEXTURE_LAYERS`        | 0x88FF  |       |
| `MIN_PROGRAM_TEXEL_OFFSET`        | 0x8904  |       |
| `MAX_PROGRAM_TEXEL_OFFSET`        | 0x8905  |       |
| `MAX_VARYING_COMPONENTS`          | 0x8B4B  |       |
| `FRAGMENT_SHADER_DERIVATIVE_HINT` | 0x8B8B  |       |
| `RASTERIZER_DISCARD`              | 0x8C89  |       |
| `VERTEX_ARRAY_BINDING`            | 0x85B5  |       |
| `MAX_VERTEX_OUTPUT_COMPONENTS`    | 0x9122  |       |
| `MAX_FRAGMENT_INPUT_COMPONENTS`   | 0x9125  |       |
| `MAX_SERVER_WAIT_TIMEOUT`         | 0x9111  |       |
| `MAX_ELEMENT_INDEX`               | 0x8D6B  |       |

### Họa tiết

Các hằng số được chuyển đến {{domxref("WebGLRenderingContext.texParameter", "WebGLRenderingContext.texParameteri()")}}, {{domxref("WebGLRenderingContext.texParameter", "WebGLRenderingContext.texParameterf()")}}, {{domxref("WebGLRenderingContext.bindTexture()")}}, {{domxref("WebGLRenderingContext.texImage2D()")}} và những người khác.

| Tên hằng                   | Giá trị | Mô tả |
| -------------------------- | ------- | ----- |
| `ĐỎ`                       | 0x1903  |       |
| `RGB8`                     | 0x8051  |       |
| `RGBA8`                    | 0x8058  |       |
| `RGB10_A2`                 | 0x8059  |       |
| `TEXTURE_3D`               | 0x806F  |       |
| `TEXTURE_WRAP_R`           | 0x8072  |       |
| `TEXTURE_MIN_LOD`          | 0x813A  |       |
| `TEXTURE_MAX_LOD`          | 0x813B  |       |
| `TEXTURE_BASE_LEVEL`       | 0x813C  |       |
| `TEXTURE_MAX_LEVEL`        | 0x813D  |       |
| `TEXTURE_COMPARE_MODE`     | 0x884C  |       |
| `TEXTURE_COMPARE_FUNC`     | 0x884D  |       |
| `SRGB`                     | 0x8C40  |       |
| `SRGB8`                    | 0x8C41  |       |
| `SRGB8_ALPHA8`             | 0x8C43  |       |
| `COMPARE_REF_TO_TEXTURE`   | 0x884E  |       |
| `RGBA32F`                  | 0x8814  |       |
| `RGB32F`                   | 0x8815  |       |
| `RGBA16F`                  | 0x881A  |       |
| `RGB16F`                   | 0x881B  |       |
| `TEXTURE_2D_ARRAY`         | 0x8C1A  |       |
| `TEXTURE_BINDING_2D_ARRAY` | 0x8C1D  |       |
| `R11F_G11F_B10F`           | 0x8C3A  |       |
| `RGB9_E5`                  | 0x8C3D  |       |
| `RGBA32UI`                 | 0x8D70  |       |
| `RGB32UI`                  | 0x8D71  |       |
| `RGBA16UI`                 | 0x8D76  |       |
| `RGB16UI`                  | 0x8D77  |       |
| `RGBA8UI`                  | 0x8D7C  |       |
| `RGB8UI`                   | 0x8D7D  |       |
| `RGBA32I`                  | 0x8D82  |       |
| `RGB32I`                   | 0x8D83  |       |
| `RGBA16I`                  | 0x8D88  |       |
| `RGB16I`                   | 0x8D89  |       |
| `RGBA8I`                   | 0x8D8E  |       |
| `RGB8I`                    | 0x8D8F  |       |
| `RED_INTEGER`              | 0x8D94  |       |
| `RGB_INTEGER`              | 0x8D98  |       |
| `RGBA_INTEGER`             | 0x8D99  |       |
| `R8`                       | 0x8229  |       |
| `RG8`                      | 0x822B  |       |
| R16F                       | 0x822D  |       |
| R32F                       | 0x822E  |       |
| RG16F                      | 0x822F  |       |
| RG32F                      | 0x8230  |       |
| R8I                        | 0x8231  |       |
| R8UI                       | 0x8232  |       |
| R16I                       | 0x8233  |       |
| R16UI                      | 0x8234  |       |
| R32I                       | 0x8235  |       |
| R32UI                      | 0x8236  |       |
| RG8I                       | 0x8237  |       |
| RG8UI                      | 0x8238  |       |
| RG16I                      | 0x8239  |       |
| RG16UI                     | 0x823A  |       |
| RG32I                      | 0x823B  |       |
| RG32UI                     | 0x823C  |       |
| R8_SNORM                   | 0x8F94  |       |
| RG8_SNORM                  | 0x8F95  |       |
| RGB8_SNORM                 | 0x8F96  |       |
| RGBA8_SNORM                | 0x8F97  |       |
| `RGB10_A2UI`               | 0x906F  |       |
| `TEXTURE_IMMUTABLE_FORMAT` | 0x912F  |       |
| `TEXTURE_IMMUTABLE_LEVELS` | 0x82DF  |       |

### Các loại pixel

| Tên hằng                         | Giá trị | Mô tả |
| -------------------------------- | ------- | ----- |
| `UNSIGNED_INT_2_10_10_10_REV`    | 0x8368  |       |
| `UNSIGNED_INT_10F_11F_11F_REV`   | 0x8C3B  |       |
| `UNSIGNED_INT_5_9_9_9_REV`       | 0x8C3E  |       |
| `FLOAT_32_UNSIGNED_INT_24_8_REV` | 0x8DAD  |       |
| UNSIGNED_INT_24_8                | 0x84FA  |       |
| `HALF_FLOAT`                     | 0x140B  |       |
| `RG`                             | 0x8227  |       |
| `RG_INTEGER`                     | 0x8228  |       |
| `INT_2_10_10_10_REV`             | 0x8D9F  |       |

### Truy vấn

| Tên hằng                          | Giá trị | Mô tả |
| --------------------------------- | ------- | ----- |
| `CURRENT_QUERY`                   | 0x8865  |       |
| `QUERY_RESULT`                    | 0x8866  |       |
| `QUERY_RESULT_AVAILABLE`          | 0x8867  |       |
| `ANY_SAMPLES_PASSED`              | 0x8C2F  |       |
| `ANY_SAMPLES_PASSED_CONSERVATIVE` | 0x8D6A  |       |

### Vẽ vùng đệm

| Tên hằng                | Giá trị | Mô tả |
| ----------------------- | ------- | ----- |
| `MAX_DRAW_BUFFERS`      | 0x8824  |       |
| `DRAW_BUFFER0`          | 0x8825  |       |
| `DRAW_BUFFER1`          | 0x8826  |       |
| `DRAW_BUFFER2`          | 0x8827  |       |
| `DRAW_BUFFER3`          | 0x8828  |       |
| `DRAW_BUFFER4`          | 0x8829  |       |
| `DRAW_BUFFER5`          | 0x882A  |       |
| `DRAW_BUFFER6`          | 0x882B  |       |
| `DRAW_BUFFER7`          | 0x882C  |       |
| `DRAW_BUFFER8`          | 0x882D  |       |
| `DRAW_BUFFER9`          | 0x882E  |       |
| `DRAW_BUFFER10`         | 0x882F  |       |
| `DRAW_BUFFER11`         | 0x8830  |       |
| `DRAW_BUFFER12`         | 0x8831  |       |
| `DRAW_BUFFER13`         | 0x8832  |       |
| `DRAW_BUFFER14`         | 0x8833  |       |
| `DRAW_BUFFER15`         | 0x8834  |       |
| `MAX_COLOR_ATTACHMENTS` | 0x8CDF  |       |
| `COLOR_ATTACHMENT1`     | 0x8CE1  |       |
| `COLOR_ATTACHMENT2`     | 0x8CE2  |       |
| `COLOR_ATTACHMENT3`     | 0x8CE3  |       |
| `COLOR_ATTACHMENT4`     | 0x8CE4  |       |
| `COLOR_ATTACHMENT5`     | 0x8CE5  |       |
| `COLOR_ATTACHMENT6`     | 0x8CE6  |       |
| `COLOR_ATTACHMENT7`     | 0x8CE7  |       |
| `COLOR_ATTACHMENT8`     | 0x8CE8  |       |
| `COLOR_ATTACHMENT9`     | 0x8CE9  |       |
| `COLOR_ATTACHMENT10`    | 0x8CEA  |       |
| `COLOR_ATTACHMENT11`    | 0x8CEB  |       |
| `COLOR_ATTACHMENT12`    | 0x8CEC  |       |
| `COLOR_ATTACHMENT13`    | 0x8CED  |       |
| `COLOR_ATTACHMENT14`    | 0x8CEE  |       |
| `COLOR_ATTACHMENT15`    | 0x8CEF  |       |

### Bộ lấy mẫu

| Tên hằng                        | Giá trị | Mô tả |
| ------------------------------- | ------- | ----- |
| `SAMPLER_3D`                    | 0x8B5F  |       |
| `SAMPLER_2D_SHADOW`             | 0x8B62  |       |
| `SAMPLER_2D_ARRAY`              | 0x8DC1  |       |
| `SAMPLER_2D_ARRAY_SHADOW`       | 0x8DC4  |       |
| `SAMPLER_CUBE_SHADOW`           | 0x8DC5  |       |
| `INT_SAMPLER_2D`                | 0x8DCA  |       |
| `INT_SAMPLER_3D`                | 0x8DCB  |       |
| `INT_SAMPLER_CUBE`              | 0x8DCC  |       |
| `INT_SAMPLER_2D_ARRAY`          | 0x8DCF  |       |
| `UNSIGNED_INT_SAMPLER_2D`       | 0x8DD2  |       |
| `UNSIGNED_INT_SAMPLER_3D`       | 0x8DD3  |       |
| `UNSIGNED_INT_SAMPLER_CUBE`     | 0x8DD4  |       |
| `UNSIGNED_INT_SAMPLER_2D_ARRAY` | 0x8DD7  |       |
| `MAX_SAMPLES`                   | 0x8D57  |       |
| `SAMPLER_BINDING`               | 0x8919  |       |

### Bộ đệm

| Tên hằng                      | Giá trị | Mô tả |
| ----------------------------- | ------- | ----- |
| `PIXEL_PACK_BUFFER`           | 0x88EB  |       |
| `PIXEL_UNPACK_BUFFER`         | 0x88EC  |       |
| `PIXEL_PACK_BUFFER_BINDING`   | 0x88ED  |       |
| `PIXEL_UNPACK_BUFFER_BINDING` | 0x88EF  |       |
| `COPY_READ_BUFFER`            | 0x8F36  |       |
| `COPY_WRITE_BUFFER`           | 0x8F37  |       |
| `COPY_READ_BUFFER_BINDING`    | 0x8F36  |       |
| `COPY_WRITE_BUFFER_BINDING`   | 0x8F37  |       |

### Kiểu dữ liệu

| Tên hằng              | Giá trị | Mô tả |
| --------------------- | ------- | ----- |
| `FLOAT_MAT2x3`        | 0x8B65  |       |
| `FLOAT_MAT2x4`        | 0x8B66  |       |
| `FLOAT_MAT3x2`        | 0x8B67  |       |
| `FLOAT_MAT3x4`        | 0x8B68  |       |
| `FLOAT_MAT4x2`        | 0x8B69  |       |
| `FLOAT_MAT4x3`        | 0x8B6A  |       |
| `UNSIGNED_INT_VEC2`   | 0x8DC6  |       |
| `UNSIGNED_INT_VEC3`   | 0x8DC7  |       |
| `UNSIGNED_INT_VEC4`   | 0x8DC8  |       |
| `UNSIGNED_NORMALIZED` | 0x8C17  |       |
| `ĐĂNG KÝ_BÌNH THƯỜNG` | 0x8F9C  |       |

### Thuộc tính đỉnh

| Tên hằng                      | Giá trị | Mô tả |
| ----------------------------- | ------- | ----- |
| `VERTEX_ATTRIB_ARRAY_INTEGER` | 0x88FD  |       |
| `VERTEX_ATTRIB_ARRAY_DIVISOR` | 0x88FE  |       |

### Chuyển đổi phản hồi

| Tên hằng                                        | Giá trị | Mô tả |
| ----------------------------------------------- | ------- | ----- |
| `TRANSFORM_FEEDBACK_BUFFER_MODE`                | 0x8C7F  |       |
| `MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS`    | 0x8C80  |       |
| `TRANSFORM_FEEDBACK_VARYINGS`                   | 0x8C83  |       |
| `TRANSFORM_FEEDBACK_BUFFER_START`               | 0x8C84  |       |
| `TRANSFORM_FEEDBACK_BUFFER_SIZE`                | 0x8C85  |       |
| `TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN`         | 0x8C88  |       |
| `MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS` | 0x8C8A  |       |
| `MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS`       | 0x8C8B  |       |
| `INTERLEAVED_ATTRIBS`                           | 0x8C8C  |       |
| `SEPARATE_ATTRIBS`                              | 0x8C8D  |       |
| `TRANSFORM_FEEDBACK_BUFFER`                     | 0x8C8E  |       |
| `TRANSFORM_FEEDBACK_BUFFER_BINDING`             | 0x8C8F  |       |
| `TRANSFORM_FEEDBACK`                            | 0x8E22  |       |
| `TRANSFORM_FEEDBACK_PAUSED`                     | 0x8E23  |       |
| `TRANSFORM_FEEDBACK_ACTIVE`                     | 0x8E24  |       |
| `TRANSFORM_FEEDBACK_BINDING`                    | 0x8E25  |       |

### Bộ đệm khung và bộ đệm kết xuất

| Tên hằng                                | Giá trị | Mô tả |
| --------------------------------------- | ------- | ----- |
| `FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING` | 0x8210  |       |
| `FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE` | 0x8211  |       |
| `FRAMEBUFFER_ATTACHMENT_RED_SIZE`       | 0x8212  |       |
| `FRAMEBUFFER_ATTACHMENT_GREEN_SIZE`     | 0x8213  |       |
| `FRAMEBUFFER_ATTACHMENT_BLUE_SIZE`      | 0x8214  |       |
| `FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE`     | 0x8215  |       |
| `FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE`     | 0x8216  |       |
| `FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE`   | 0x8217  |       |
| `FRAMEBUFFER_DEFAULT`                   | 0x8218  |       |
| `DEPTH_STENCIL_ATTACHMENT`              | 0x821A  |       |
| `DEPTH_STENCIL`                         | 0x84F9  |       |
| `DEPTH24_STENCIL8`                      | 0x88F0  |       |
| `DRAW_FRAMEBUFFER_BINDING`              | 0x8CA6  |       |
| `READ_FRAMEBUFFER`                      | 0x8CA8  |       |
| `DRAW_FRAMEBUFFER`                      | 0x8CA9  |       |
| `READ_FRAMEBUFFER_BINDING`              | 0x8CAA  |       |
| `RENDERBUFFER_SAMPLES`                  | 0x8CAB  |       |
| `FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER`  | 0x8CD4  |       |
| `FRAMEBUFFER_INCOMPLETE_MULTISAMPLE`    | 0x8D56  |       |

### Đồng phục

| Tên hằng                                      | Giá trị | Mô tả |
| --------------------------------------------- | ------- | ----- |
| `UNIFORM_BUFFER`                              | 0x8A11  |       |
| `UNIFORM_BUFFER_BINDING`                      | 0x8A28  |       |
| `UNIFORM_BUFFER_START`                        | 0x8A29  |       |
| `UNIFORM_BUFFER_SIZE`                         | 0x8A2A  |       |
| `MAX_VERTEX_UNIFORM_BLOCKS`                   | 0x8A2B  |       |
| `MAX_FRAGMENT_UNIFORM_BLOCKS`                 | 0x8A2D  |       |
| `MAX_COMBIND_UNIFORM_BLOCKS`                  | 0x8A2E  |       |
| `MAX_UNIFORM_BUFFER_BININGS`                  | 0x8A2F  |       |
| `MAX_UNIFORM_BLOCK_SIZE`                      | 0x8A30  |       |
| `MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS`      | 0x8A31  |       |
| `MAX_COMBIND_FRAGMENT_UNIFORM_COMPONENTS`     | 0x8A33  |       |
| `UNIFORM_BUFFER_OFFSET_ALIGNMENT`             | 0x8A34  |       |
| `ACTIVE_UNIFORM_BLOCKS`                       | 0x8A36  |       |
| `ĐỘNG VỊ_TYPE`                                | 0x8A37  |       |
| `UNIFORM_SIZE`                                | 0x8A38  |       |
| `UNIFORM_BLOCK_INDEX`                         | 0x8A3A  |       |
| `UNIFORM_OFFSET`                              | 0x8A3B  |       |
| `UNIFORM_ARRAY_STRIDE`                        | 0x8A3C  |       |
| `UNIFORM_MATRIX_STRIDE`                       | 0x8A3D  |       |
| `UNIFORM_IS_ROW_MAJOR`                        | 0x8A3E  |       |
| `UNIFORM_BLOCK_BINDING`                       | 0x8A3F  |       |
| `UNIFORM_BLOCK_DATA_SIZE`                     | 0x8A40  |       |
| `UNIFORM_BLOCK_ACTIVE_UNIFORMS`               | 0x8A42  |       |
| `UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES`        | 0x8A43  |       |
| `UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER`   | 0x8A44  |       |
| `UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER` | 0x8A46  |       |

### Đồng bộ hóa đối tượng

| Tên hằng                     | Giá trị    | Mô tả |
| ---------------------------- | ---------- | ----- |
| `ĐỐI TƯỢNG_TYPE`             | 0x9112     |       |
| `ĐỒNG BỘ_CONDITION`          | 0x9113     |       |
| `SYNC_STATUS`                | 0x9114     |       |
| `SYNC_FLAGS`                 | 0x9115     |       |
| `SYNC_FENCE`                 | 0x9116     |       |
| `SYNC_GPU_COMMANDS_COMPLETE` | 0x9117     |       |
| `KHÔNG ĐƯỢC TÍN HIỆU`        | 0x9118     |       |
| `TÍN HIỆU`                   | 0x9119     |       |
| `ALREADY_SIGNALED`           | 0x911A     |       |
| `TIMEOUT_EXPIRED`            | 0x911B     |       |
| `ĐIỀU KIỆN_THỎA MÃN`         | 0x911C     |       |
| `WAIT_FAILED`                | 0x911D     |       |
| `SYNC_FLUSH_COMMANDS_BIT`    | 0x00000001 |       |

### Các hằng số khác

| Tên hằng                        | Giá trị    | Mô tả |
| ------------------------------- | ---------- | ----- |
| `MÀU SẮC`                       | 0x1800     |       |
| SÂU                             | 0x1801     |       |
| `STENCIL`                       | 0x1802     |       |
| `MIN`                           | 0x8007     |       |
| TỐI ĐA                          | 0x8008     |       |
| `DEPTH_COMPONENT24`             | 0x81A6     |       |
| `STREAM_READ`                   | 0x88E1     |       |
| `STREAM_COPY`                   | 0x88E2     |       |
| `STATIC_READ`                   | 0x88E5     |       |
| `STATIC_COPY`                   | 0x88E6     |       |
| `DYNAMIC_READ`                  | 0x88E9     |       |
| `DYNAMIC_COPY`                  | 0x88EA     |       |
| `DEPTH_COMPONENT32F`            | 0x8CAC     |       |
| `DEPTH32F_STENCIL8`             | 0x8CAD     |       |
| `INVALID_INDEX`                 | 0xFFFFFFFF |       |
| `TIMEOUT_IGNORED`               | -1         |       |
| `MAX_CLIENT_WAIT_TIMEOUT_WEBGL` | 0x9247     |       |

## Các hằng số được xác định trong tiện ích mở rộng WebGL

### ANGLE_instanced_arrays

| Tên hằng                            | Giá trị | Mô tả                                                    |
| ----------------------------------- | ------- | -------------------------------------------------------- |
| `VERTEX_ATTRIB_ARRAY_DIVISOR_ANGLE` | 0x88FE  | Mô tả bộ chia tần số được sử dụng để hiển thị phiên bản. |

Để biết thêm thông tin, hãy xem {{domxref("ANGLE_instanced_arrays")}}.

### WEBGL_debug_renderer_info

| Tên hằng                  | Giá trị | Mô tả                                                                                 |
| ------------------------- | ------- | ------------------------------------------------------------------------------------- |
| `UNMASKED_VENDOR_WEBGL`   | 0x9245  | Được chuyển đến `getParameter` để lấy chuỗi nhà cung cấp trình điều khiển đồ họa.     |
| `UNMASKED_RENDERER_WEBGL` | 0x9246  | Đã chuyển tới `getParameter` để lấy chuỗi trình kết xuất của trình điều khiển đồ họa. |

Để biết thêm thông tin, hãy xem {{domxref("WEBGL_debug_renderer_info")}}.

### EXT_texture_filter_anisotropic

| Tên hằng                         | Giá trị | Mô tả                                                                                   |
| -------------------------------- | ------- | --------------------------------------------------------------------------------------- |
| `MAX_TEXTURE_MAX_ANISOTROPY_EXT` | 0x84FF  | Trả về tính dị hướng tối đa có sẵn.                                                     |
| `TEXTURE_MAX_ANISOTROPY_EXT`     | 0x84FE  | Được chuyển đến `texParameter` để đặt tính bất đẳng hướng tối đa mong muốn cho kết cấu. |

Để biết thêm thông tin, xem {{domxref("EXT_texture_filter_anisotropic")}}.

### WEBGL_compression_texture_s3tc

| Tên hằng                        | Giá trị | Mô tả                                                                                                                                    |
| ------------------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `COMPRESSED_RGB_S3TC_DXT1_EXT`  | 0x83F0  | Hình ảnh được nén DXT1 ở định dạng hình ảnh RGB.                                                                                         |
| `COMPRESSED_RGBA_S3TC_DXT1_EXT` | 0x83F1  | Hình ảnh được nén DXT1 ở định dạng hình ảnh RGB có giá trị alpha bật/tắt.                                                                |
| `COMPRESSED_RGBA_S3TC_DXT3_EXT` | 0x83F2  | Hình ảnh được nén DXT3 ở định dạng hình ảnh RGBA. So với kết cấu RGBA 32 bit, nó cung cấp khả năng nén 4:1.                              |
| `COMPRESSED_RGBA_S3TC_DXT5_EXT` | 0x83F3  | Hình ảnh được nén DXT5 ở định dạng hình ảnh RGBA. Nó cũng cung cấp khả năng nén 4:1, nhưng khác với nén DXT3 ở cách thực hiện nén alpha. |

Để biết thêm thông tin, hãy xem {{domxref("WEBGL_compressed_texture_s3tc")}}.

### WEBGL_compression_texture_etc

| Tên hằng                                   | Giá trị | Mô tả                                                                                                                   |
| ------------------------------------------ | ------- | ----------------------------------------------------------------------------------------------------------------------- |
| `COMPRESSED_R11_EAC`                       | 0x9270  | Nén định dạng không dấu một kênh (màu đỏ).                                                                              |
| `COMPRESSED_SIGNED_R11_EAC`                | 0x9271  | Nén định dạng có chữ ký một kênh (màu đỏ).                                                                              |
| `COMPRESSED_RG11_EAC`                      | 0x9272  | Nén định dạng không dấu hai kênh (đỏ và xanh).                                                                          |
| `COMPRESSED_SIGNED_RG11_EAC`               | 0x9273  | Nén định dạng có chữ ký hai kênh (đỏ và xanh lục).                                                                      |
| `COMPRESSED_RGB8_ETC2`                     | 0x9274  | Nén dữ liệu RGB8 không có kênh alpha.                                                                                   |
| `COMPRESSED_RGBA8_ETC2_EAC`                | 0x9275  | Nén dữ liệu RGBA8. Phần RGB được mã hóa giống như `RGB_ETC2`, nhưng phần alpha được mã hóa riêng.                       |
| `COMPRESSED_SRGB8_ETC2`                    | 0x9276  | Nén dữ liệu sRGB8 không có kênh alpha.                                                                                  |
| `COMPRESSED_SRGB8_ALPHA8_ETC2_EAC`         | 0x9277  | Nén dữ liệu sRGBA8. Phần sRGB được mã hóa giống như `SRGB_ETC2`, nhưng phần alpha được mã hóa riêng.                    |
| `COMPRESSED_RGB8_PUNCTHROUGH_ALPHA1_ETC2`  | 0x9278  | Tương tự như `RGB8_ETC`, nhưng có khả năng xuyên qua kênh alpha, nghĩa là làm cho nó hoàn toàn mờ đục hoặc trong suốt.  |
| `COMPRESSED_SRGB8_PUNCTHROUGH_ALPHA1_ETC2` | 0x9279  | Tương tự như `SRGB8_ETC`, nhưng có khả năng xuyên qua kênh alpha, nghĩa là làm cho nó hoàn toàn mờ đục hoặc trong suốt. |

Để biết thêm thông tin, hãy xem {{domxref("WEBGL_compressed_texture_etc")}}.

### WEBGL_compression_texture_pvrtc

| Tên hằng                           | Giá trị | Mô tả                                                  |
| ---------------------------------- | ------- | ------------------------------------------------------ |
| `COMPRESSED_RGB_PVRTC_4BPPV1_IMG`  | 0x8C00  | Nén RGB ở chế độ 4 bit. Một khối cho mỗi pixel 4×4.    |
| `COMPRESSED_RGBA_PVRTC_4BPPV1_IMG` | 0x8C02  | Nén RGBA ở chế độ 4 bit. Một khối cho mỗi pixel 4×4.   |
| `COMPRESSED_RGB_PVRTC_2BPPV1_IMG`  | 0x8C01  | Nén RGB ở chế độ 2 bit. Một khối cho mỗi pixel 8 × 4.  |
| `COMPRESSED_RGBA_PVRTC_2BPPV1_IMG` | 0x8C03  | Nén RGBA ở chế độ 2 bit. Một khối cho mỗi pixel 8 × 4. |

Để biết thêm thông tin, hãy xem {{domxref("WEBGL_compressed_texture_pvrtc")}}.

### WEBGL_compression_texture_etc1

| Tên hằng                    | Giá trị | Mô tả                                       |
| --------------------------- | ------- | ------------------------------------------- |
| `COMPRESSED_RGB_ETC1_WEBGL` | 0x8D64  | Nén dữ liệu RGB 24 bit không có kênh alpha. |

Để biết thêm thông tin, hãy xem {{domxref("WEBGL_compressed_texture_etc1")}}.

### WEBGL_deep_texture

| Tên hằng                  | Giá trị | Mô tả                                                          |
| ------------------------- | ------- | -------------------------------------------------------------- |
| `UNSIGNED_INT_24_8_WEBGL` | 0x84FA  | Loại số nguyên không dấu cho dữ liệu kết cấu có độ sâu 24 bit. |

Để biết thêm thông tin, hãy xem {{domxref("WEBGL_depth_texture")}}.

### OES_texture_half_float

| Tên hằng         | Giá trị | Mô tả                            |
| ---------------- | ------- | -------------------------------- |
| `HALF_FLOAT_OES` | 0x8D61  | Loại nửa dấu phẩy động (16-bit). |

Để biết thêm thông tin, xem {{domxref("OES_texture_half_float")}}.

### WEBGL_color_buffer_float

| Tên hằng                                    | Giá trị | Mô tả                                             |
| ------------------------------------------- | ------- | ------------------------------------------------- |
| `RGBA32F_EXT`                               | 0x8814  | Định dạng kết xuất màu dấu phẩy động RGBA 32 bit. |
| `RGB32F_EXT`                                | 0x8815  | Định dạng kết xuất màu dấu phẩy động RGB 32 bit.  |
| `FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE_EXT` | 0x8211  |                                                   |
| `UNSIGNED_NORMALIZED_EXT`                   | 0x8C17  |                                                   |

Để biết thêm thông tin, hãy xem {{domxref("WEBGL_color_buffer_float")}}.

### EXT_blend_minmax

| Tên hằng  | Giá trị | Mô tả                                                          |
| --------- | ------- | -------------------------------------------------------------- |
| `MIN_EXT` | 0x8007  | Tạo ra các thành phần màu tối thiểu của màu nguồn và màu đích. |
| `MAX_EXT` | 0x8008  | Tạo ra các thành phần màu tối đa của màu nguồn và màu đích.    |

Để biết thêm thông tin, hãy xem {{domxref("EXT_blend_minmax")}}.

### EXT_sRGB

| Tên hằng                                    | Giá trị | Mô tả                                                                                   |
| ------------------------------------------- | ------- | --------------------------------------------------------------------------------------- |
| `SRGB_EXT`                                  | 0x8C40  | Định dạng sRGB không được định cỡ, đảm bảo độ chính xác tùy thuộc vào trình điều khiển. |
| `SRGB_ALPHA_EXT`                            | 0x8C42  | Định dạng sRGB không được định cỡ với thành phần alpha không được định cỡ.              |
| `SRGB8_ALPHA8_EXT`                          | 0x8C43  | Các định dạng sRGB và alpha có kích thước (8 bit).                                      |
| `FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING_EXT` | 0x8210  | Trả về mã hóa màu của bộ đệm khung.                                                     |

Để biết thêm thông tin, hãy xem {{domxref("EXT_sRGB")}}.

### OES_standard_dẫn xuất

| Tên hằng                              | Giá trị | Mô tả                                                                                                  |
| ------------------------------------- | ------- | ------------------------------------------------------------------------------------------------------ |
| `FRAGMENT_SHADER_DERIVATIVE_HINT_OES` | 0x8B8B  | Cho biết độ chính xác của phép tính đạo hàm đối với các hàm dựng sẵn GLSL: `dFdx`, `dFdy` và `fwidth`. |

Để biết thêm thông tin, xem {{domxref("OES_standard_derivatives")}}.

### WEBGL_draw_buffers

| Tên hằng                      | Giá trị | Mô tả                                          |
| ----------------------------- | ------- | ---------------------------------------------- |
| `COLOR_ATTACHMENT0_WEBGL`     | 0x8CE0  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT1_WEBGL`     | 0x8CE1  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT2_WEBGL`     | 0x8CE2  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT3_WEBGL`     | 0x8CE3  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT4_WEBGL`     | 0x8CE4  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT5_WEBGL`     | 0x8CE5  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT6_WEBGL`     | 0x8CE6  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT7_WEBGL`     | 0x8CE7  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT8_WEBGL`     | 0x8CE8  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT9_WEBGL`     | 0x8CE9  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT10_WEBGL`    | 0x8CEA  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT11_WEBGL`    | 0x8CEB  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT12_WEBGL`    | 0x8CEC  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT13_WEBGL`    | 0x8CED  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT14_WEBGL`    | 0x8CEE  | Điểm đính kèm màu bộ đệm khung                 |
| `COLOR_ATTACHMENT15_WEBGL`    | 0x8CEF  | Điểm đính kèm màu bộ đệm khung                 |
| `DRAW_BUFFER0_WEBGL`          | 0x8825  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER1_WEBGL`          | 0x8826  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER2_WEBGL`          | 0x8827  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER3_WEBGL`          | 0x8828  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER4_WEBGL`          | 0x8829  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER5_WEBGL`          | 0x882A  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER6_WEBGL`          | 0x882B  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER7_WEBGL`          | 0x882C  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER8_WEBGL`          | 0x882D  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER9_WEBGL`          | 0x882E  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER10_WEBGL`         | 0x882F  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER11_WEBGL`         | 0x8830  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER12_WEBGL`         | 0x8831  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER13_WEBGL`         | 0x8832  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER14_WEBGL`         | 0x8833  | Vẽ bộ đệm                                      |
| `DRAW_BUFFER15_WEBGL`         | 0x8834  | Vẽ bộ đệm                                      |
| `MAX_COLOR_ATTACHMENTS_WEBGL` | 0x8CDF  | Số lượng điểm đính kèm màu bộ đệm khung tối đa |
| `MAX_DRAW_BUFFERS_WEBGL`      | 0x8824  | Số lượng bộ đệm vẽ tối đa                      |

Để biết thêm thông tin, hãy xem {{domxref("WEBGL_draw_buffers")}}.

### OES_vertex_array_object

| Tên hằng                   | Giá trị | Mô tả                                   |
| -------------------------- | ------- | --------------------------------------- |
| `VERTEX_ARRAY_BINDING_OES` | 0x85B5  | Đối tượng mảng đỉnh bị ràng buộc (VAO). |

Để biết thêm thông tin, hãy xem {{domxref("OES_vertex_array_object")}}.

### EXT_disjoint_timer_query

| Tên hằng                     | Giá trị | Mô tả                                                                    |
| ---------------------------- | ------- | ------------------------------------------------------------------------ |
| `QUERY_COUNTER_BITS_EXT`     | 0x8864  | Số bit được sử dụng để lưu giữ kết quả truy vấn cho mục tiêu đã cho.     |
| `CURRENT_QUERY_EXT`          | 0x8865  | Truy vấn hiện đang hoạt động.                                            |
| `QUERY_RESULT_EXT`           | 0x8866  | Kết quả truy vấn.                                                        |
| `QUERY_RESULT_AVAILABLE_EXT` | 0x8867  | Boolean cho biết liệu có kết quả truy vấn hay không.                     |
| `TIME_ELAPSED_EXT`           | 0x88BF  | Thời gian đã trôi qua (tính bằng nano giây).                             |
| `TIMESTAMP_EXT`              | 0x8E28  | Thời điểm hiện tại.                                                      |
| `GPU_DISJOINT_EXT`           | 0x8FBB  | Boolean cho biết GPU có thực hiện bất kỳ thao tác rời rạc nào hay không. |

Để biết thêm thông tin, hãy xem {{domxref("EXT_disjoint_timer_query")}}.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- {{domxref("WebGLRenderingContext")}}
