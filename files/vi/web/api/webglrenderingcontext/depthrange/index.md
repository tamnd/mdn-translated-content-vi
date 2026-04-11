---
title: "WebGLRenderingContext: depthRange() method"
short-title: depthRange()
slug: Web/API/WebGLRenderingContext/depthRange
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.depthRange
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.depthRange()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định ánh xạ phạm vi độ sâu từ tọa độ thiết bị chuẩn hóa tới tọa độ cửa sổ hoặc khung nhìn.

## Cú pháp

```js-nolint
depthRange(zNear, zFar)
```

### Thông số

- `zNear`
  - : A {{domxref("WebGL_API/Types", "GLclampf")}} chỉ định ánh xạ của mặt phẳng cắt gần tới
tọa độ cửa sổ hoặc khung nhìn. Được kẹp trong phạm vi từ 0 đến 1 và phải nhỏ hơn hoặc bằng `zFar`. Giá trị mặc định là 0.
- `zFar`
  - : A {{domxref("WebGL_API/Types", "GLclampf")}} xác định ánh xạ của mặt phẳng cắt xa tới cửa sổ
hoặc tọa độ khung nhìn. Được kẹp trong phạm vi từ 0 đến 1. Giá trị mặc định là 1.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.depthRange(0.2, 0.6);
```

Để kiểm tra phạm vi độ sâu hiện tại, hãy truy vấn hằng số `DEPTH_RANGE` trả về {{jsxref("Float32Array")}}

```js
gl.getParameter(gl.DEPTH_RANGE);
// Float32Array[0.2, 0.6]
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.viewport()")}}
- {{domxref("WebGLRenderingContext.depthFunc()")}}
