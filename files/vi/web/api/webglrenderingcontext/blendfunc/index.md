---
title: "WebGLRenderingContext: blendFunc() method"
short-title: blendFunc()
slug: Web/API/WebGLRenderingContext/blendFunc
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.blendFunc
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.blendFunc()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) xác định hàm nào được sử dụng để trộn số học pixel.

## Cú pháp

```js-nolint
blendFunc(sfactor, dfactor)
```

### Thông số

- `sfactor`
  - : Một {{domxref("WebGL_API.Types", "GLenum")}} chỉ định hệ số nhân cho các hệ số hòa trộn nguồn. các
giá trị mặc định là `gl.ONE`. Để biết các giá trị có thể, hãy xem bên dưới.
- `dfactor`
  - : Một {{domxref("WebGL_API.Types", "GLenum")}} chỉ định một hệ số nhân cho việc trộn đích
các yếu tố. Giá trị mặc định là `gl.ZERO`. Để biết các giá trị có thể, hãy xem bên dưới.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu _sfactor_ hoặc _dfactor_ không phải là một trong các giá trị có thể được liệt kê, thì
Lỗi `gl.INVALID_ENUM` được đưa ra.
- Nếu một màu không đổi và một giá trị alpha không đổi được sử dụng cùng nhau làm nguồn và
các yếu tố đích, lỗi `gl.INVALID_ENUM` sẽ được đưa ra.

## Hằng số

Các hằng số sau đây có thể được sử dụng cho _sfactor_ và _dfactor_.

Công thức pha trộn màu có thể được mô tả như sau: color(RGBA) = (sourceColor \* _sfactor_) + (destinationColor \* _dfactor_). Các giá trị RGBA nằm trong khoảng từ 0 đến 1.

Trong bảng sau, R<sub>S</sub>, G<sub>S</sub>, B<sub>S</sub>, A<sub>S</sub> đại diện tương ứng cho thành phần _red_, _green_, _blue_ và _alpha_ của nguồn, trong khi R<sub>D</sub>, G<sub>D</sub>, B<sub>D</sub>, A<sub>D</sub> đại diện tương ứng cho thành phần _red_, _green_, _blue_ và _alpha_ của đích đến. Tương tự, R<sub>C</sub>, G<sub>C</sub>, B<sub>C</sub>, A<sub>C</sub> đại diện tương ứng cho thành phần _red_, _green_, _blue_ và _alpha_ của một hằng số màu sắc. Chúng bao gồm tất cả các giá trị từ 0 đến 1.

<table class="no-markdown"> <thead> <tr> <th scope="col">Không đổi</th> <th scope="col">Yếu tố</th> <th scope="col">Mô tả</th> </tr> </thead> <tbody> <tr> <td><code>gl.ZERO</code></td> <td>0,0,0,0</td> <td>Nhân tất cả các màu với 0.</td> </tr> <tr> <td><code>gl.ONE</code></td> <td>1,1,1,1</td> <td>Nhân tất cả các màu với 1.</td> </tr> <tr> <td><code>gl.SRC_COLOR</code></td> <td>R<sub>S</sub>, G<sub>S</sub>, B<sub>S</sub>, A<sub>S</sub></td> <td>Nhân tất cả các màu với màu nguồn.</td> </tr> <tr> <td><code>gl.ONE_MINUS_SRC_COLOR</code></td> <td> 1-R<sub>S</sub>, 1-G<sub>S</sub>, 1-B<sub>S</sub>, 1-A<sub>S</sub> </td> <td>Nhân tất cả các màu với 1 trừ mỗi màu nguồn.</td> </tr> <tr> <td><code>gl.DST_COLOR</code></td> <td>R<sub>D</sub>, G<sub>D</sub>, B<sub>D</sub>, A<sub>D</sub></td> <td>Nhân tất cả các màu với màu đích.</td> </tr> <tr> <td><code>gl.ONE_MINUS_DST_COLOR</code></td> <td> 1-R<sub>D</sub>, 1-G<sub>D</sub>, 1-B<sub>D</sub>, 1-A<sub>D</sub> </td> <td>Nhân tất cả các màu với 1 trừ đi mỗi màu đích.</td> </tr> <tr> <td><code>gl.SRC_ALPHA</code></td> <td>A<sub>S</sub>, A<sub>S</sub>, A<sub>S</sub>, A<sub>S</sub></td> <td>Nhân tất cả các màu với giá trị alpha nguồn.</td> </tr> <tr> <td><code>gl.ONE_MINUS_SRC_ALPHA</code></td> <td> 1-A<sub>S</sub>, 1-A<sub>S</sub>, 1-A<sub>S</sub>, 1-A<sub>S</sub> </td> <td>Nhân tất cả các màu với 1 trừ nguồn giá trị alpha.</td> </tr> <tr> ���TOK141<code>gl.DST_ALPHA</code></td> <td>A<sub>D</sub>, A<sub>D</sub>, A<sub>D</sub>, A<sub>D</sub></td> <td>Nhân tất cả các màu với giá trị alpha đích.</td> </tr> <tr> <td><code>gl.ONE_MINUS_DST_ALPHA</code></td> <td> 1-A<sub>D</sub>, 1-A<sub>D</sub>, 1-A<sub>D</sub>, 1-A<sub>D</sub> </td> <td>Nhân tất cả các màu với 1 trừ đi đích đến giá trị alpha.</td> </tr> <tr> <td><code>gl.CONSTANT_COLOR</code></td> <td>R<sub>C</sub>, G<sub>C</sub>, B<sub>C</sub>, A<sub>C</sub></td> <td>Nhân tất cả các màu với một màu không đổi.</td> </tr> <tr> <td><code>gl.ONE_MINUS_CONSTANT_COLOR</code></td> <td> 1-R<sub>C</sub>, 1-G<sub>C</sub>, 1-B<sub>C</sub>, 1-A<sub>C</sub> </td> <td>Nhân tất cả các màu với 1 trừ một hằng số color.</td> </tr> <tr> <td><code>gl.CONSTANT_ALPHA</code></td> <td>A<sub>C</sub>, A<sub>C</sub>, A<sub>C</sub>, A<sub>C</sub></td> <td>Nhân tất cả các màu với một giá trị alpha không đổi.</td> </tr> <tr> <td><code>gl.ONE_MINUS_CONSTANT_ALPHA</code></td> <td> 1-A<sub>C</sub>, 1-A<sub>C</sub>, 1-A<sub>C</sub>, 1-A<sub>C</sub> </td> <td>Nhân tất cả các màu với 1 trừ một hằng số giá trị alpha.</td> </tr> <tr> <td><code>gl.SRC_ALPHA_SATURATE</code></td> <td> min(A<sub>S</sub>, 1 - A<sub>D</sub>), min(A<sub>S</sub>, 1 – A<sub>D</sub>), min(A<sub>S</sub>, 1 - A<sub>D</sub>), 1 </td> <td> Nhân màu RGB với giá trị nhỏ hơn của giá trị alpha nguồn hoặc giá trị 1 trừ giá trị alpha đích. Giá trị alpha được nhân với 1. </td> </tr> </tbody> </table>

## Ví dụ

Để sử dụng chức năng hoà trộn, trước tiên bạn phải kích hoạt hoà trộn bằng {{domxref("WebGLRenderingContext.enable()")}} với đối số `gl.BLEND`.

```js
gl.enable(gl.BLEND);
gl.blendFunc(gl.SRC_COLOR, gl.DST_COLOR);
```

Để có được hàm hòa trộn hiện tại, hãy truy vấn các hằng số `BLEND_SRC_RGB`, `BLEND_SRC_ALPHA`, `BLEND_DST_RGB`, và `BLEND_DST_ALPHA` để trả về một trong các hằng số của hàm hòa trộn.

```js
gl.enable(gl.BLEND);
gl.blendFunc(gl.SRC_COLOR, gl.DST_COLOR);
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
