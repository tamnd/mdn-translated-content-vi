---
title: "WebGLRenderingContext: drawElements() method"
short-title: drawElements()
slug: Web/API/WebGLRenderingContext/drawElements
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.drawElements
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.drawElements()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) hiển thị các giá trị gốc từ dữ liệu mảng.

## Cú pháp

```js-nolint
drawElements(mode, count, type, offset)
```

### Thông số

- `mode`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định kiểu nguyên thủy cần hiển thị. Giá trị có thể
là:
    - `gl.POINTS`: Vẽ một dấu chấm đơn.
    - `gl.LINE_STRIP`: Vẽ một đường thẳng tới đỉnh tiếp theo.
    - `gl.LINE_LOOP`: Vẽ một đường thẳng tới đỉnh tiếp theo, và
nối đỉnh cuối cùng trở lại đỉnh đầu tiên.
    - `gl.LINES`: Vẽ một đường thẳng giữa một cặp đỉnh.
    - [`gl.TRIANGLE_STRIP`](https://en.wikipedia.org/wiki/Triangle_strip)
    - [`gl.TRIANGLE_FAN`](https://en.wikipedia.org/wiki/Triangle_fan)
    - `gl.TRIANGLES`: Vẽ một tam giác cho một nhóm ba đỉnh.

- `count`
  - : A {{domxref("WebGL_API/Types", "GLsizei")}} xác định số phần tử của mảng phần tử bị ràng buộc
bộ đệm được hiển thị. Ví dụ, để vẽ một tam giác khung dây với `gl.LINES` số lượng phải là 2 điểm cuối trên mỗi dòng × 3 dòng = 6 phần tử. Tuy nhiên, để vẽ cùng một tam giác wireframe với `gl.LINE_STRIP`, bộ đệm mảng phần tử không lặp lại các chỉ số ở cuối dòng đầu tiên/bắt đầu dòng thứ hai và cuối dòng thứ hai/bắt đầu dòng thứ ba, vì vậy `count` sẽ là bốn. Để vẽ cùng một hình tam giác bằng `gl.LINE_LOOP`, bộ đệm mảng phần tử cũng không lặp lại đỉnh đầu tiên/đỉnh cuối cùng nên `count` sẽ là ba.
- `type`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định loại giá trị trong mảng phần tử
bộ đệm. Các giá trị có thể là:
    - `gl.UNSIGNED_BYTE`
    - `gl.UNSIGNED_SHORT`

Khi sử dụng phần mở rộng {{domxref("OES_element_index_uint")}}:
    - `gl.UNSIGNED_INT`

- `offset`
  - : Một {{domxref("WebGL_API/Types", "GLintptr")}} chỉ định độ lệch byte trong bộ đệm mảng phần tử. Phải
là bội số hợp lệ của kích thước của `type` đã cho.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu `mode` không phải là một trong những giá trị được chấp nhận, thì
Lỗi `gl.INVALID_ENUM` được đưa ra.
- Nếu `offset` không phải là bội số hợp lệ của kích thước của loại đã cho, thì
Lỗi `gl.INVALID_OPERATION` được đưa ra.
- Nếu `count` âm, một lỗi `gl.INVALID_VALUE` sẽ được đưa ra.

## Ví dụ

```js
gl.drawElements(gl.POINTS, 8, gl.UNSIGNED_BYTE, 0);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.drawArrays()")}}
- {{domxref("OES_element_index_uint")}}
- {{domxref("WEBGL_multi_draw.multiDrawElementsWEBGL()")}}
