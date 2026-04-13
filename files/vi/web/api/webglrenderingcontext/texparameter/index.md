---
title: "WebGLRenderingContext: texParameter[fi]() method"
short-title: texParameter[fi]()
slug: Web/API/WebGLRenderingContext/texParameter
page-type: web-api-instance-method
browser-compat:
  - api.WebGLRenderingContext.texParameterf
  - api.WebGLRenderingContext.texParameteri
---

{{APIRef("WebGL")}}_TOK1__

Các phương thức **`WebGLRenderingContext.texParameter[fi]()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) đặt tham số kết cấu.

## Cú pháp

```js-nolint
texParameterf(target, pname, param)
texParameteri(target, pname, param)
```

### Thông số

- `target`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích). Các giá trị có thể:
    - `gl.TEXTURE_2D`: Kết cấu hai chiều.
    - `gl.TEXTURE_CUBE_MAP`: Kết cấu được ánh xạ hình khối.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây cũng có sẵn:
    - `gl.TEXTURE_3D`: Kết cấu ba chiều.
    - `gl.TEXTURE_2D_ARRAY`: Kết cấu mảng hai chiều.

- `param`
  - : Tham số `param` là {{domxref("WebGL_API/Types", "GLfloat")}} hoặc
{{domxref("WebGL_API/Types", "GLint")}} chỉ định giá trị cho tham số đã chỉ định

- `pname`
  - : Tham số `pname` là {{domxref("WebGL_API/Types", "GLenum")}} chỉ định kết cấu
tham số cần thiết lập.

<table class="standard-table"> <thead> <tr> <th scope="col"><code>pname</code></th> <th scope="col">Mô tả</th> <th scope="col"><code>param</code></th> </tr> </thead> <tbody> <tr> <th colspan="3">Có sẵn tại WebGL 1</th> </tr> <tr> <td><code>gl.TEXTURE_MAG_FILTER</code></td> <td>Bộ lọc phóng đại họa tiết</td> <td><code>gl.LINEAR</code> (giá trị mặc định), <code>gl.NEAREST</code>.</td> </tr> <tr> <td><code>gl.TEXTURE_MIN_FILTER</code></td> <td>Bộ lọc thu nhỏ kết cấu</td> <td> <code>gl.LINEAR</code>, <code>gl.NEAREST</code>, <code>gl.NEAREST_MIPMAP_NEAREST</code>, <code>gl.LINEAR_MIPMAP_NEAREST</code>, <code>gl.NEAREST_MIPMAP_LINEAR</code> (giá trị mặc định), <code>gl.LINEAR_MIPMAP_LINEAR</code>. </td> </tr> <tr> <td>_TOK60__gl.TEXTURE_WRAP_S</code></td> <td>Chức năng bao bọc cho tọa độ kết cấu <code>s</code></td> <td> <code>gl.REPEAT</code> (giá trị mặc định), <code>gl.CLAMP_TO_EDGE</code>, <code>gl.MIRRORED_REPEAT</code>. </td> </tr> <tr> <td>_TOK78__gl.TEXTURE_WRAP_T</code></td> <td>Chức năng bao bọc cho tọa độ kết cấu <code>t</code></td> <td> <code>gl.REPEAT</code> (giá trị mặc định), <code>gl.CLAMP_TO_EDGE</code>, <code>gl.MIRRORED_REPEAT</code>. </td> </tr> <tr> <th colspan="3"> Ngoài ra còn có khi sử dụng tiện ích mở rộng {{domxref("EXT_texture_filter_anisotropic")}} </th> </tr> <tr> <td><code>ext.TEXTURE_MAX_ANISOTROPY_EXT</code></td> <td>Tính bất đẳng hướng tối đa cho a kết cấu</td> <td>A giá trị {{domxref("WebGL_API/Types", "GLfloat")}}.</td> </tr> <tr> <th colspan="3">Có sẵn bổ sung khi sử dụng bối cảnh WebGL 2</th> </tr> <tr> <td><code>gl.TEXTURE_BASE_LEVEL</code></td> <td>Cấp độ mipmap kết cấu</td> <td>Bất kỳ giá trị int nào.</td> </tr> <tr> <td><code>gl.TEXTURE_COMPARE_FUNC</code></td> <td>Chức năng so sánh kết cấu</td> <td> <code>gl.LEQUAL</code> (giá trị mặc định), <code>gl.GEQUAL</code>, <code>gl.LESS</code>, <code>gl.GREATER</code>, <code>gl.EQUAL</code>, <code>gl.NOTEQUAL</code>, <code>gl.ALWAYS</code>, <code>gl.KHÔNG BAO GIỜ</code>. </td> </tr> <tr> <td><code>gl.TEXTURE_COMPARE_MODE</code></td> <td>Chế độ so sánh kết cấu</td> <td> <code>gl.NONE</code> (giá trị mặc định), <code>gl.COMPARE_REF_TO_TEXTURE</code>. </td> </tr> <tr> <td><code>gl.TEXTURE_MAX_LEVEL</code></td> <td>Mức mảng mipmap kết cấu tối đa</td> <td>Bất kỳ giá trị int nào.</td> </tr> <tr> <td><code>gl.TEXTURE_MAX_LOD</code></td> <td>Giá trị mức độ chi tiết tối đa của kết cấu</td> <td>Bất kỳ giá trị float nào.</td> </tr> <tr> <td><code>gl.TEXTURE_MIN_LOD</code></td> <td>Giá trị mức độ chi tiết tối thiểu của kết cấu</td> <td>Bất kỳ giá trị float nào.</td> </tr> <tr> <td><code>gl.TEXTURE_WRAP_R</code></td> <td>Chức năng bao bọc cho tọa độ kết cấu <code>r</code></td> <td> <code>gl.REPEAT</code> (giá trị mặc định), <code>gl.CLAMP_TO_EDGE</code>, <code>gl.MIRRORED_REPEAT</code>. </td> </tr> </tbody> </table>

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.texParameterf(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(
  gl.TEXTURE_2D,
  gl.TEXTURE_MIN_FILTER,
  gl.LINEAR_MIPMAP_NEAREST,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getTexParameter()")}}
- {{domxref("EXT_texture_filter_anisotropic")}}
