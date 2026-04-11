---
title: "WebGLRenderingContext: getTexParameter() method"
short-title: getTexParameter()
slug: Web/API/WebGLRenderingContext/getTexParameter
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getTexParameter
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getTexParameter()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về thông tin về kết cấu đã cho.

## Cú pháp

```js-nolint
getTexParameter(target, pname)
```

### Thông số

- `target`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích). Các giá trị có thể:
    - `gl.TEXTURE_2D`: Một kết cấu hai chiều.
    - `gl.TEXTURE_CUBE_MAP`: Một kết cấu được ánh xạ hình khối.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.TEXTURE_3D`: Một kết cấu ba chiều.
    - `gl.TEXTURE_2D_ARRAY`: Một kết cấu mảng hai chiều.

- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định thông tin cần truy vấn. Các giá trị có thể:

<table class="standard-table"> <thead> <tr> <th scope="col">tên</th> <th scope="col">Loại trả về</th> <th scope="col">Mô tả</th> <th scope="col">Có thể trả về các giá trị</th> </tr> </thead> <tbody> <tr> <th colspan="4">Có sẵn trong bối cảnh WebGL 1</th> </tr> <tr> <td><code>gl.TEXTURE_MAG_FILTER</code></td> <td>{{domxref("WebGL_API/Types", "GLenum")}}</td> <td>Bộ lọc phóng đại kết cấu</td> <td><code>gl.LINEART</code> (giá trị mặc định), <code>gl.NEAREST</code>.</td> </tr> <tr> <td><code>gl.TEXTURE_MIN_FILTER</code></td> <td>{{domxref("WebGL_API/Types", "GLenum")}}</td> <td>Bộ lọc thu nhỏ kết cấu</td> <td> <code>gl.LINEART</code>, <code>gl.NEAREST</code>, <code>gl.NEAREST_MIPMAP_NEAREST</code>, <code>gl.LINEAR_MIPMAP_NEAREST</code>, <code>gl.NEAREST_MIPMAP_LINEART</code> (giá trị mặc định), <code>gl.LINEAR_MIPMAP_LINEART</code>. </td> </tr> <tr> <td><code>gl.TEXTURE_WRAP_S</code></td> <td>{{domxref("WebGL_API/Types", "GLenum")}}</td> <td>Chức năng bao bọc cho tọa độ kết cấu <code>s</code></td> <td> <code>gl.REPEAT</code> (giá trị mặc định), <code>gl.CLAMP_TO_EDGE</code>, <code>gl.MIRRORED_REPEAT</code>. </td> </tr> <tr> <td><code>gl.TEXTURE_WRAP_T</code></td> <td>{{domxref("WebGL_API/Types", "GLenum")}}</td> <td>Chức năng bao bọc cho tọa độ kết cấu <code>t</code></td> <td> <code>gl.REPEAT</code> (giá trị mặc định), <code>gl.CLAMP_TO_EDGE</code>, <code>gl.MIRRORED_REPEAT</code>. </td> </tr> <tr> <th colspan="4"> Ngoài ra còn có sẵn khi sử dụng phần mở rộng {{domxref("EXT_texture_filter_anisotropic")}} </th> </tr> <tr> <td><code>ext.TEXTURE_MAX_ANISOTROPY_EXT</code></td> <td>{{domxref("WebGL_API/Types", "GLfloat")}}</td> <td>Tính bất đẳng hướng tối đa cho a kết cấu</td> <td>Bất kỳ giá trị float nào.</td> </tr> <tr> <th colspan="4">Có sẵn thêm khi sử dụng ngữ cảnh WebGL 2</th> </tr> <tr> <td><code>gl.TEXTURE_BASE_LEVEL</code></td> <td>{{domxref("WebGL_API/Types", "GLint")}}</td> <td>Kết cấu mipmap Level</td> <td>Bất kỳ giá trị int nào.</td> </tr> <tr> <td><code>gl.TEXTURE_COMPARE_FUNC</code></td> <td>{{domxref("WebGL_API/Types", "GLenum")}}</td> <td>Hàm so sánh</td> <td> <code>gl.LEQUAL</code> (giá trị mặc định), <code>gl.GEQUAL</code>, <code>gl.LESS</code>, <code>gl.GREATER</code>, <code>gl.EQUAL</code>, <code>gl.NOTEQUAL</code>, <code>gl.ALWAYS</code>, <code>gl.NEVER</code>. </td> </tr> <tr> <td><code>gl.TEXTURE_COMPARE_MODE</code></td> <td>{{domxref("WebGL_API/Types", "GLenum")}}</td> <td>Chế độ so sánh kết cấu</td> <td> <code>gl.NONE</code> (giá trị mặc định), <code>gl.COMPARE_REF_TO_TEXTURE</code>. </td> </tr> <tr> <td><code>gl.TEXTURE_IMMUTABLE_FORMAT</code></td> <td>{{domxref("WebGL_API/Types", "GLboolean")}}</td> <td>Tính bất biến của định dạng và kích thước kết cấu</td> <td>đúng hay sai.</td> </tr> <tr> <td><code>gl.TEXTURE_IMMUTABLE_LEVELS</code></td> <td>{{domxref("WebGL_API/Types", "GLuint")}}</td> <td>?</td> <td>Bất kỳ giá trị uint nào.</td> </tr> <tr> <td><code>gl.TEXTURE_MAX_LEVEL</code></td> <td>{{domxref("WebGL_API/Types", "GLint")}}</td> <td>Mức mảng mipmap kết cấu tối đa</td> <td>Bất kỳ giá trị int nào.</td> </tr> <tr> <td><code>gl.TEXTURE_MAX_LOD</code></td> <td>{{domxref("WebGL_API/Types", "GLfloat")}}</td> <td>Kết cấu mức độ chi tiết tối đa value</td> <td>Bất kỳ giá trị float nào.</td> </tr> <tr> <td><code>gl.TEXTURE_MIN_LOD</code></td> <td>{{domxref("WebGL_API/Types", "GLfloat")}}</td> <td>Giá trị mức độ chi tiết tối thiểu của kết cấu</td> <td>Bất kỳ giá trị float nào.</td> </tr> <tr> <td><code>gl.TEXTURE_WRAP_R</code></td> <td>{{domxref("WebGL_API/Types", "GLenum")}}</td> <td>Chức năng bao bọc tọa độ kết cấu <code>r</code></td> <td> <code>gl.REPEAT</code> (giá trị mặc định), <code>gl.CLAMP_TO_EDGE</code>, <code>gl.MIRRORED_REPEAT</code>. </td> </tr> </tbody> </table>

### Giá trị trả về

Trả về thông tin kết cấu được yêu cầu (như được chỉ định với `pname`). Nếu xảy ra lỗi, [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) sẽ được trả về.

## Ví dụ

```js
gl.getTexParameter(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.texParameter", "WebGLRenderingContext.texParameterf()")}}
- {{domxref("WebGLRenderingContext.texParameter", "WebGLRenderingContext.texParameteri()")}}
- {{domxref("EXT_texture_filter_anisotropic")}}
