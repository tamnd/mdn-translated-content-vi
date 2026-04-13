---
title: "GPURenderPassEncoder: phương thức setBlendConstant()"
short-title: setBlendConstant()
slug: Web/API/GPURenderPassEncoder/setBlendConstant
page-type: web-api-instance-method
browser-compat: api.GPURenderPassEncoder.setBlendConstant
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`setBlendConstant()`** của giao diện {{domxref("GPURenderPassEncoder")}} đặt giá trị màu sắc và alpha pha trộn hằng số được dùng với các hệ số pha trộn `"constant"` và `"one-minus-constant"` (như được đặt trong descriptor của phương thức {{domxref("GPUDevice.createRenderPipeline()")}}, trong thuộc tính `blend`).

## Cú pháp

```js-nolint
setBlendConstant(color)
```

### Tham số

- `color`
  - : Một đối tượng hoặc mảng biểu diễn màu sắc để sử dụng khi pha trộn — các thành phần `r`, `g`, `b` và `a` được biểu diễn dưới dạng số dấu phẩy động trong khoảng từ 0.0 đến 1.0.

    Ví dụ về đối tượng:

    ```js
    const color = { r: 0.0, g: 0.5, b: 1.0, a: 1.0 };
    ```

    Tương đương dưới dạng mảng trông như sau:

    ```js
    const color = [0.0, 0.5, 1.0, 1.0];
    ```

> [!NOTE]
> Nếu không có lệnh gọi `setBlendConstant()` nào được thực hiện, giá trị màu sắc hằng số pha trộn mặc định là `(0, 0, 0, 0)` cho mỗi lần thực thi kết xuất.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

## Ví dụ

```js
// …

const passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);

passEncoder.setPipeline(renderPipeline);
passEncoder.setVertexBuffer(0, vertexBuffer);
passEncoder.setBlendConstant([1.0, 0.0, 0.0, 1.0]);
passEncoder.draw(3);

passEncoder.end();

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
