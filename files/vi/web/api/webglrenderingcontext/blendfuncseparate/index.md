---
title: "WebGLRenderingContext: blendFuncSeparate() method"
short-title: blendFuncSeparate()
slug: Web/API/WebGLRenderingContext/blendFuncSeparate
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.blendFuncSeparate
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.blendFuncSeparate()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) xác định hàm nào được sử dụng để trộn số học pixel cho các thành phần RGB và alpha một cách riêng biệt.

## Cú pháp

```js-nolint
blendFuncSeparate(srcRGB, dstRGB, srcAlpha, dstAlpha)
```

### Thông số

- `srcRGB`
  - : Một {{domxref("WebGL_API.Types", "GLenum")}} chỉ định hệ số nhân cho màu đỏ, lục và lam (RGB)
yếu tố pha trộn nguồn. Giá trị mặc định là `gl.ONE`. Để biết các giá trị có thể, hãy xem bên dưới.
- `dstRGB`
  - : Một {{domxref("WebGL_API.Types", "GLenum")}} chỉ định hệ số nhân cho màu đỏ, lục và lam (RGB)
các yếu tố kết hợp điểm đến Giá trị mặc định là `gl.ZERO`. Để biết các giá trị có thể, hãy xem bên dưới.
- `srcAlpha`
  - : Một {{domxref("WebGL_API.Types", "GLenum")}} chỉ định một hệ số nhân cho việc trộn nguồn alpha
nhân tố. Giá trị mặc định là `gl.ONE`. Để biết các giá trị có thể, hãy xem bên dưới.
- `dstAlpha`
  - : Một {{domxref("WebGL_API.Types", "GLenum")}} chỉ định một hệ số nhân cho việc trộn đích alpha
nhân tố. Giá trị mặc định là `gl.ZERO`. Để biết các giá trị có thể, hãy xem bên dưới.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu _srcRGB_, _dstRGB_, _srcAlpha_ hoặc _dstAlpha_ không
một trong các giá trị có thể được liệt kê, lỗi `gl.INVALID_ENUM` sẽ được đưa ra.
- Nếu một màu không đổi và một giá trị alpha không đổi được sử dụng cùng nhau làm nguồn
(`srcRGB`) và đích (`dstRGB`), lỗi `gl.INVALID_ENUM` sẽ được đưa ra.

## Hằng số

Các hằng số sau có thể được sử dụng cho _srcRGB_, _dstRGB_, _srcAlpha_ và _dstAlpha_

Công thức cho các hệ số hòa trộn có thể được mô tả như thế này (tất cả các giá trị RGBA nằm trong khoảng từ 0 đến 1):

- màu(RGB) = (sourceColor \* _srcRGB_) + (destinationColor \* _dstRGB_)
- color(A) = (sourceAlpha \* _srcAlpha_) + (destinationAlpha \*
_dstAlpha_)

Trong bảng sau, R<sub>S</sub>, G<sub>S</sub>, B<sub>S</sub>, A<sub>S</sub> đại diện tương ứng cho thành phần _red_, _green_, _blue_ và _alpha_ của nguồn, trong khi R<sub>D</sub>, G<sub>D</sub>, B<sub>D</sub>, A<sub>D</sub> đại diện tương ứng cho thành phần _red_, _green_, _blue_ và _alpha_ của đích đến. Tương tự, R<sub>C</sub>, G<sub>C</sub>, B<sub>C</sub>, A<sub>C</sub> đại diện tương ứng cho thành phần _red_, _green_, _blue_ và _alpha_ của một hằng số màu sắc. Chúng bao gồm tất cả các giá trị từ 0 đến 1.

<table class="no-markdown"> <thead> <tr> <th scope="col">Không đổi</th> <th scope="col">Hệ số RGB</th> <th scope="col">Hệ số Alpha</th> <th scope="col">Mô tả</th> </tr> </thead> <tbody> <tr> <td><code>gl.ZERO</code></td> <td>0,0,0</td> <td>0</td> <td>Nhân tất cả các màu với 0.</td> </tr> <tr> <td><code>gl.ONE</code></td> <td>1,1,1,1</td> <td>1</td> <td>Nhân tất cả các màu với 1.</td> </tr> <tr> TOK39���<code>gl.SRC_COLOR</code></td> <td>R<sub>S</sub>, G<sub>S</sub>, B<sub>S</sub></td> <td>A<sub>S</sub></td> <td>Nhân tất cả các màu theo nguồn màu sắc.</td> </tr> <tr> <td><code>gl.ONE_MINUS_SRC_COLOR</code></td> <td>1-R<sub>S</sub>, 1-G<sub>S</sub>, 1-B<sub>S</sub></td> <td>1-A<sub>S</sub></td> <td>Nhân tất cả các màu với 1 trừ mỗi màu nguồn.</td> </tr> <tr> <td><code>gl.DST_COLOR</code></td> <td>R<sub>D</sub>, G<sub>D</sub>, B<sub>D</sub></td> <td>A<sub>D</sub></td> <td>Nhân tất cả các màu với màu đích.</td> </tr> <tr> <td><code>gl.ONE_MINUS_DST_COLOR</code></td> <td>1-R<sub>D</sub>, 1-G<sub>D</sub>, 1-B<sub>D</sub></td> <td>1-A<sub>D</sub></td> <td>Nhân tất cả các màu với 1 trừ mỗi màu đích.</td> </tr> <tr> <td><code>gl.SRC_ALPHA</code></td> <td>A<sub>S</sub>, A<sub>S</sub>, A<sub>S</sub></td> <td>A<sub>S</sub></td> <td>Nhân tất cả các màu với màu alpha nguồn.</td> </tr> <tr> <td><code>gl.ONE_MINUS_SRC_ALPHA</code></td> <td>1-A<sub>S</sub>, 1-A<sub>S</sub>, 1-A<sub>S</sub></td> <td>1-A<sub>S</sub></td> <td>Nhân tất cả các màu với 1 trừ đi màu alpha nguồn.</td> </tr> <tr> <td><code>gl.DST_ALPHA</code></td> <td>A<sub>D</sub>, A<sub>D</sub>, A<sub>D</sub></td> <td>A<sub>D</sub></td> <td>Nhân tất cả các màu với màu alpha đích.</td> </tr> <tr> <td><code>gl.ONE_MINUS_DST_ALPHA</code></td> <td>1-A<sub>D</sub>, 1-A<sub>D</sub>, 1-A<sub>D</sub></td> <td>1-A<sub>D</sub></td> <td>Nhân tất cả các màu với 1 trừ đi màu alpha đích.</td> </tr> <tr> <td><code>gl.CONSTANT_COLOR</code></td> <td>R<sub>C</sub>, G<sub>C</sub>, B<sub>C</sub></td> <td>A<sub>C</sub></td> <td>Nhân tất cả các màu với một màu không đổi.</td> </tr> <tr> <td><code>gl.ONE_MINUS_CONSTANT_COLOR</code></td> <td>1-R<sub>C</sub>, 1-G<sub>C</sub>, 1-B<sub>C</sub></td> <td>1-A<sub>C</sub></td> <td>Nhân tất cả các màu với 1 trừ một màu không đổi.</td> </tr> <tr> <td><code>gl.CONSTANT_ALPHA</code></td> <td>A<sub>C</sub>, A<sub>C</sub>, A<sub>C</sub></td> <td>A<sub>C</sub></td> <td>Nhân tất cả các màu với một giá trị alpha không đổi.</td> </tr> <tr> <td><code>gl.ONE_MINUS_CONSTANT_ALPHA</code></td> <td>1-A<sub>C</sub>, 1-A<sub>C</sub>, 1-A<sub>C</sub></td> <td>1-A<sub>C</sub></td> <td>Nhân tất cả các màu với 1 trừ đi một giá trị alpha không đổi.���TOK276 </tr> <tr> <td><code>gl.SRC_ALPHA_SATURATE</code></td> <td> phút(A<sub>S</sub>, 1 - A<sub>D</sub>), phút(A<sub>S</sub>, 1 - A<sub>D</sub>), phút(A<sub>S</sub>, 1 - A<sub>D</sub>) </td> <td>1</td> <td> Nhân các màu RGB với giá trị nhỏ hơn của màu alpha nguồn hoặc giá trị 1 trừ đi màu alpha đích. Giá trị alpha được nhân với 1. </td> </tr> </tbody> </table>

## Ví dụ

Để sử dụng chức năng hoà trộn, trước tiên bạn phải kích hoạt hoà trộn bằng {{domxref("WebGLRenderingContext.enable()")}} với đối số `gl.BLEND`.

```js
gl.enable(gl.BLEND);
gl.blendFuncSeparate(gl.SRC_COLOR, gl.DST_COLOR, gl.ONE, gl.ZERO);
```

Để có được hàm hòa trộn hiện tại, hãy truy vấn các hằng số `BLEND_SRC_RGB`, `BLEND_SRC_ALPHA`, `BLEND_DST_RGB`, và `BLEND_DST_ALPHA` để trả về một trong các hằng số của hàm hòa trộn.

```js
gl.enable(gl.BLEND);
gl.blendFuncSeparate(gl.SRC_COLOR, gl.DST_COLOR, gl.ONE, gl.ZERO);
gl.getParameter(gl.BLEND_SRC_RGB) === gl.SRC_COLOR;
// true
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.blendColor()")}}
- {{domxref("WebGLRenderingContext.blendEquation()")}}
