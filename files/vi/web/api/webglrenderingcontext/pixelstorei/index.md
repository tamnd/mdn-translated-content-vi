---
title: "WebGLRenderingContext: pixelStorei() method"
short-title: pixelStorei()
slug: Web/API/WebGLRenderingContext/pixelStorei
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.pixelStorei
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.pixelStorei()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định các chế độ lưu trữ pixel.

## Cú pháp

```js-nolint
pixelStorei(pname, param)
```

### Thông số

- `pname`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định tham số nào cần thiết lập. Xem bên dưới để có thể
các giá trị.
- `param`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định giá trị để thiết lập `pname`
tham số tới. Xem bên dưới để biết các giá trị có thể.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số lưu trữ pixel

<table class="no-markdown"> <thead> <tr> <th scope="col">Tên thông số (đối với <code>pname</code>)</th> <th scope="col">Mô tả</th> <th scope="col">Loại</th> <th scope="col">Giá trị mặc định</th> <th scope="col">Các giá trị được phép (đối với <code>param</code>)</th> <th scope="col">Được chỉ định in</th> </tr> </thead> <tbody> <tr> <td><code>gl.PACK_ALIGNMENT</code></td> <td>Đóng gói dữ liệu pixel vào bộ nhớ</td> <td>{{domxref("WebGL_API/Types", "GLint")}}</td> <td>4</td> <td>1, 2, 4, 8</td> <td>OpenGL ES 2.0</td> </tr> <tr> <td><code>gl.UNPACK_ALIGNMENT</code></td> <td>Giải nén dữ liệu pixel khỏi bộ nhớ.</td> <td>{{domxref("WebGL_API/Types", "GLint")}}</td> <td>4</td> <td>1, 2, 4, 8</td> <td>OpenGL ES 2.0</td> </tr> <tr> <td><code>gl.UNPACK_FLIP_Y_WEBGL</code></td> <td>Lật dữ liệu nguồn dọc theo trục tung của nó nếu đúng.</td> <td>{{domxref("WebGL_API/Types", "GLboolean")}}</td> <td>falset</td> <td>true, false</td> <td>WebGL</td> </tr> <tr> <td><code>gl.UNPACK_PREMULTIPLY_ALPHA_WEBGL</code></td> <td>Nhân kênh alpha thành các kênh màu khác</td> <td>{{domxref("WebGL_API/Types", "GLboolean")}}</td> <td>false</td> <td>true, false</td> <td>WebGL</td> </tr> <tr> <td><code>gl.UNPACK_COLORSPACE_CONVERSION_WEBGL</code></td> <td>Chuyển đổi không gian màu mặc định hoặc không chuyển đổi không gian màu.</td> <td>{{domxref("WebGL_API/Types", "GLenum")}}</td> <td><code>gl.BROWSER_DEFAULT_WEBGL</code></td> <td><code>gl.BROWSER_DEFAULT_WEBGL</code>, <code>gl.NONE</code></td> <td>WebGL</td> </tr> </tbody> </table>

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:

<table class="no-markdown"> <thead> <tr> <th scope="col">Không đổi</th> <th scope="col">Mô tả</th> <th scope="col">Loại</th> <th scope="col">Mặc định value</th> <th scope="col">Các giá trị được phép (cho <code>param</code>)</th> <th scope="col">Được chỉ định trong</th> </tr> </thead> <tbody> <tr> <td><code>gl.PACK_ROW_LENGTH</code></td> <td>Số pixel trên một hàng.</td> <td>{{domxref("WebGL_API/Types", "GLint")}}</td> <td>0</td> <td>0 đến <code>Vô cực</code></td> <td>OpenGL ES 3.0</td> </tr> <tr> <td><code>gl.PACK_SKIP_PIXELS</code></td> <td> Số vị trí pixel bị bỏ qua trước khi pixel đầu tiên được ghi vào bộ nhớ. </td> <td>{{domxref("WebGL_API/Types", "GLint")}}</td> <td>0</td> <td>0 đến <code>Vô cực</code></td> <td>OpenGL ES 3.0</td> </tr> <tr> <td><code>gl.PACK_SKIP_ROWS</code></td> <td> Số lượng các hàng vị trí pixel bị bỏ qua trước khi pixel đầu tiên được ghi vào bộ nhớ <code>Vô cực</code></td> <td>OpenGL ES 3.0</td> </tr> <tr> <td><code>gl.UNPACK_ROW_LENGTH</code></td> <td>Số pixel trên một hàng.</td> <td>{{domxref("WebGL_API/Types", "GLint")}}</td> <td>0</td> <td>0 đến <code>Vô cực</code></td> <td>OpenGL ES 3.0</td> </tr> <tr> <td><code>gl.UNPACK_IMAGE_HEIGHT</code></td> <td>Chiều cao hình ảnh được sử dụng để đọc dữ liệu pixel từ bộ nhớ</td> <td>{{domxref("WebGL_API/Types", "GLint")}}</td> <td>0</td> <td>0 đến <code>Vô cực</code></td> <td>OpenGL ES 3.0</td> </tr> <tr> <td><code>gl.UNPACK_SKIP_PIXELS</code></td> <td> Số lượng ảnh pixel bị bỏ qua trước khi pixel đầu tiên được đọc từ bộ nhớ </td> <td>{{domxref("WebGL_API/Types", "GLint")}}</td> <td>0</td> <td>0 đến <code>Vô cực</code></td> <td>OpenGL ES 3.0</td> </tr> <tr> <td><code>gl.UNPACK_SKIP_ROWS</code></td> <td> Số hàng vị trí pixel bị bỏ qua trước khi pixel đầu tiên được đọc từ bộ nhớ </td> <td>{{domxref("WebGL_API/Types", "GLint")}}</td> <td>0</td> <td>0 tới <code>Vô cực</code></td> <td>OpenGL ES 3.0</td> </tr> <tr> <td><code>gl.UNPACK_SKIP_IMAGES</code></td> <td> Số lượng ảnh pixel bị bỏ qua trước khi pixel đầu tiên được đọc từ bộ nhớ </td> <td>{{domxref("WebGL_API/Types", "GLint")}}</td> <td>0</td> <td>0 đến <code>Vô cực</code></td> <td>OpenGL ES 3.0</td> </tr> </tbody> </table>

## Ví dụ

Việc thiết lập chế độ lưu trữ pixel sẽ ảnh hưởng đến các hoạt động của {{domxref("WebGLRenderingContext.readPixels()")}}, cũng như việc giải nén các kết cấu bằng các phương pháp {{domxref("WebGLRenderingContext.texImage2D()")}} và {{domxref("WebGLRenderingContext.texSubImage2D()")}}.

```js
const tex = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, tex);
gl.pixelStorei(gl.PACK_ALIGNMENT, 4);
```

Để kiểm tra các giá trị đóng gói và giải nén dữ liệu pixel, bạn có thể truy vấn các tham số lưu trữ pixel tương tự bằng {{domxref("WebGLRenderingContext.getParameter()")}}.

```js
gl.getParameter(gl.PACK_ALIGNMENT);
gl.getParameter(gl.UNPACK_ALIGNMENT);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.readPixels()")}}
- {{domxref("WebGLRenderingContext.texImage2D()")}}
- {{domxref("WebGLRenderingContext.texSubImage2D()")}}
