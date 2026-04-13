---
title: "WebGLRenderingContext: sampleCoverage() method"
short-title: sampleCoverage()
slug: Web/API/WebGLRenderingContext/sampleCoverage
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.sampleCoverage
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.sampleCoverage()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định các tham số bao phủ nhiều mẫu cho các hiệu ứng khử răng cưa.

## Cú pháp

```js-nolint
sampleCoverage(value, invert)
```

### Thông số

- `value`
  - : Một {{domxref("WebGL_API/Types", "GLclampf")}} thiết lập một giá trị bao phủ dấu phẩy động duy nhất được kẹp
đến phạm vi \[0,1]. Giá trị mặc định là 1.0.
- `invert`
  - : Một {{domxref("WebGL_API/Types", "GLboolean")}} để thiết lập xem có nên sử dụng mặt nạ che phủ hay không
đảo ngược. Giá trị mặc định là `false`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Tính năng đa mẫu bị tắt theo mặc định. Để bật hoặc tắt tính năng đa mẫu, hãy sử dụng các phương thức {{domxref("WebGLRenderingContext.enable", "enable()")}} và {{domxref("WebGLRenderingContext.disable", "disable()")}} với đối số `gl.SAMPLE_COVERAGE` và `gl.SAMPLE_ALPHA_TO_COVERAGE`.

```js
gl.enable(gl.SAMPLE_COVERAGE);
gl.sampleCoverage(0.5, false);
```

Để kiểm tra các giá trị bao phủ mẫu, hãy truy vấn các hằng số `SAMPLE_COVERAGE_VALUE` và `SAMPLE_COVERAGE_INVERT`.

```js
gl.getParameter(gl.SAMPLE_COVERAGE_VALUE); // 0.5
gl.getParameter(gl.SAMPLE_COVERAGE_INVERT); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCanvasElement.getContext()")}} – `antialias` tham số cho
bối cảnh.
