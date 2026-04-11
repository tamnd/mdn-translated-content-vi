---
title: "WebGLRenderingContext: enableVertexAttribArray() method"
short-title: enableVertexAttribArray()
slug: Web/API/WebGLRenderingContext/enableVertexAttribArray
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.enableVertexAttribArray
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức {{domxref("WebGLRenderingContext")}} **`enableVertexAttribArray()`**, một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API), bật mảng thuộc tính đỉnh chung tại chỉ mục đã chỉ định vào danh sách các mảng thuộc tính.

> [!GHI CHÚ]
> Bạn có thể vô hiệu hóa mảng thuộc tính bằng cách gọi
> {{domxref("WebGLRenderingContext.disableVertexAttribArray", "disableVertexAttribArray()")}}.

Trong WebGL, các giá trị áp dụng cho một đỉnh cụ thể được lưu trữ trong [thuộc tính](/en-US/docs/Web/API/WebGL_API/Data#attributes). Những thứ này chỉ có sẵn cho mã JavaScript và trình đổ bóng đỉnh. Các thuộc tính được tham chiếu bằng số chỉ mục trong danh sách các thuộc tính được GPU duy trì. Một số chỉ mục thuộc tính đỉnh có thể có mục đích được xác định trước, tùy thuộc vào nền tảng và/hoặc GPU. Những cái khác được gán bởi lớp WebGL khi bạn tạo các thuộc tính.

Dù bằng cách nào, vì các thuộc tính không thể được sử dụng trừ khi được bật và bị tắt theo mặc định, bạn cần gọi `enableVertexAttribArray()` để kích hoạt các thuộc tính riêng lẻ để chúng có thể được sử dụng. Khi điều đó đã được thực hiện, các phương pháp khác có thể được sử dụng để truy cập vào thuộc tính, bao gồm {{domxref("WebGLRenderingContext.vertexAttribPointer", "vertexAttribPointer()")}}, {{domxref("WebGLRenderingContext.vertexAttrib", "vertexAttrib*()")}}, và {{domxref("WebGLRenderingContext.getVertexAttrib", "getVertexAttrib()")}}.

## Cú pháp

```js-nolint
enableVertexAttribArray(index)
```

### Thông số

- `index`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} xác định số chỉ mục xác định duy nhất
thuộc tính đỉnh để kích hoạt. Nếu bạn biết tên thuộc tính nhưng không biết chỉ mục của nó, bạn có thể lấy chỉ mục bằng cách gọi {{domxref("WebGLRenderingContext.getAttribLocation", "getAttribLocation()")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Lỗi

Để kiểm tra lỗi sau khi gọi `enableVertexAttribArray()`, hãy gọi {{domxref("WebGLRenderingContext.getError", "getError()")}}.

- `WebGLRenderingContext.INVALID_VALUE`
  - : `index` được chỉ định không hợp lệ; nghĩa là nó lớn hơn hoặc bằng
số lượng mục nhập tối đa được phép trong danh sách thuộc tính đỉnh của ngữ cảnh, được biểu thị bằng giá trị của `WebGLRenderingContext.MAX_VERTEX_ATTRIBS`.

## Ví dụ

Mã này — một đoạn trích từ ví dụ đầy đủ [Một ví dụ hoạt hình WebGL 2D cơ bản](/en-US/docs/Web/API/WebGL_API/Basic_2D_animation_example) — cho thấy việc sử dụng `enableVertexArray()` để kích hoạt thuộc tính sẽ được lớp WebGL sử dụng để chuyển các đỉnh riêng lẻ từ bộ đệm đỉnh vào hàm đổ bóng đỉnh.

```js
gl.bindBuffer(gl.ARRAY_BUFFER, vertexBuffer);

aVertexPosition = gl.getAttribLocation(shaderProgram, "aVertexPosition");

gl.enableVertexAttribArray(aVertexPosition);
gl.vertexAttribPointer(
  aVertexPosition,
  vertexNumComponents,
  gl.FLOAT,
  false,
  0,
  0,
);

gl.drawArrays(gl.TRIANGLES, 0, vertexCount);
```

> [!GHI CHÚ]
> Đoạn mã này được lấy từ [hàm TOK0](/en-US/docs/Web/API/WebGL_API/Basic_2D_animation_example#drawing_and_animating_the_scene) trong "Ví dụ hoạt hình WebGL 2D cơ bản." Nhìn thấy
> bài viết đó để biết mẫu đầy đủ và xem hoạt ảnh thu được đang hoạt động.

Mã này thiết lập vùng đệm của các đỉnh sẽ được sử dụng để vẽ các hình tam giác bằng cách gọi {{domxref("WebGLRenderingContext.bindBuffer", "bindBuffer()")}}. Sau đó, chỉ số của thuộc tính vị trí đỉnh được lấy từ chương trình đổ bóng bằng cách gọi {{domxref("WebGLRenderingContext.getAttribLocation", "getAttribLocation()")}}.

Với chỉ mục của thuộc tính vị trí đỉnh hiện có sẵn trong `aVertexPosition`, chúng ta gọi `enableVertexAttribArray()` để kích hoạt thuộc tính vị trí để nó có thể được sử dụng bởi chương trình đổ bóng (đặc biệt là bởi trình đổ bóng đỉnh).

Sau đó, bộ đệm đỉnh được liên kết với thuộc tính `aVertexPosition` bằng cách gọi {{domxref("WebGLRenderingContext.vertexAttribPointer", "vertexAttribPointer()")}}. Bước này không rõ ràng vì ràng buộc này gần như là một tác dụng phụ. Nhưng kết quả là, việc truy cập `aVertexPosition` bây giờ lấy được dữ liệu từ bộ đệm đỉnh.

Với sự kết hợp giữa bộ đệm đỉnh cho hình dạng của chúng ta và thuộc tính `aVertexPosition` được sử dụng để phân phối từng đỉnh một vào trình đổ bóng đỉnh, chúng ta đã sẵn sàng vẽ hình bằng cách gọi {{domxref("WebGLRenderingContext.drawArrays", "drawArrays()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Dữ liệu trong WebGL](/en-US/docs/Web/API/WebGL_API/Data)
- [Thêm nội dung 2D vào ngữ cảnh WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context)
- [Mẫu hoạt hình 2D WebGL cơ bản](/en-US/docs/Web/API/WebGL_API/Basic_2D_animation_example)
- {{domxref("WebGLRenderingContext.disableVertexAttribArray", "disableVertexAttribArray()")}}
