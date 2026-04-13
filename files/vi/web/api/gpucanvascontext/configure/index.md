---
title: "GPUCanvasContext: configure() method"
short-title: configure()
slug: Web/API/GPUCanvasContext/configure
page-type: web-api-instance-method
browser-compat: api.GPUCanvasContext.configure
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`configure()`** của giao diện {{domxref("GPUCanvasContext")}} cấu hình ngữ cảnh để sử dụng cho kết xuất với {{domxref("GPUDevice")}} cho trước. Khi được gọi, canvas ban đầu sẽ bị xóa thành màu đen trong suốt.

## Cú pháp

```js-nolint
configure(configuration)
```

### Tham số

- `configuration`
  - : Đối tượng chứa các thuộc tính sau:
    - `alphaMode` {{optional_inline}}
      - : Giá trị được liệt kê xác định hiệu ứng mà các giá trị alpha sẽ có trên nội dung của các texture được trả về bởi {{domxref("GPUCanvasContext.getCurrentTexture()", "getCurrentTexture()")}} khi đọc, hiển thị hoặc sử dụng làm nguồn hình ảnh. Các giá trị có thể là:
        - `opaque`: Các giá trị alpha bị bỏ qua, nếu texture chưa đục thì kênh alpha sẽ được xóa thành 1.0 khi sử dụng làm nguồn hình ảnh hoặc hiển thị trên màn hình. Đây là giá trị mặc định.
        - `premultiplied`: Các giá trị màu được nhân trước với giá trị alpha của chúng. Ví dụ, màu đỏ 100% ở mức alpha 50% là `[0.5, 0, 0, 0.5]`.
    - `colorSpace` {{optional_inline}}
      - : Không gian màu mà các giá trị được ghi vào texture được trả về bởi `getCurrentTexture()` nên được hiển thị. Các giá trị có thể là `srgb` (mặc định) và `display-p3`.
    - `device`
      - : {{domxref("GPUDevice")}} mà thông tin kết xuất cho ngữ cảnh sẽ đến từ đó.
    - `format`
      - : Định dạng mà các texture được trả về bởi `getCurrentTexture()` sẽ có. Có thể là `bgra8unorm`, `rgba8unorm`, hoặc `rgba16float`. Định dạng texture canvas tối ưu cho hệ thống hiện tại có thể được trả về bởi {{domxref("GPU.getPreferredCanvasFormat()")}}. Khuyến nghị sử dụng cái này, nếu bạn không sử dụng định dạng ưa thích khi cấu hình ngữ cảnh canvas, bạn có thể gặp phải chi phí bổ sung, chẳng hạn như sao chép texture bổ sung, tùy thuộc vào nền tảng.

    - `toneMapping` {{optional_inline}}
      - : Đối tượng xác định các tham số định nghĩa tone mapping cho ngữ cảnh, cách nội dung của các texture liên quan sẽ được hiển thị. Điều này cho phép WebGPU vẽ màu sáng hơn `white` (`#FFFFFF`). Các thuộc tính có thể là:
        - `mode` {{optional_inline}}
          - : Giá trị được liệt kê xác định chế độ tone mapping cho canvas. Các giá trị có thể bao gồm:
            - `standard`
              - : Giá trị mặc định. Hạn chế nội dung được kết xuất trong Dải Động Tiêu Chuẩn (SDR) của màn hình.
            - `extended`
              - : Cho phép nội dung được kết xuất trong Dải Động Cao (HDR) đầy đủ của màn hình, khi có. Chế độ HDR cho phép hiển thị nhiều màu sắc và mức độ sáng hơn.

    - `usage` {{optional_inline}}
      - : {{glossary("Bitwise flags")}} xác định cách sử dụng cho phép cho các texture được trả về bởi `getCurrentTexture()`.
    - `viewFormats` {{optional_inline}}
      - : Mảng các định dạng mà các view được tạo từ các texture được trả về bởi `getCurrentTexture()` có thể sử dụng.

### Giá trị trả về

None (`undefined`).

## Ví dụ

### Sử dụng cơ bản

```js
const canvas = document.querySelector("#gpuCanvas");
const context = canvas.getContext("webgpu");

context.configure({
  device,
  format: navigator.gpu.getPreferredCanvasFormat(),
  alphaMode: "premultiplied",
});
```

### Demo HDR `toneMapping`

Xem [mẫu Particles (HDR)](https://webgpu.github.io/webgpu-samples/?sample=particles) và bài kiểm tra [hỗ trợ HDR](https://ccameron-chromium.github.io/webgpu-hdr/example.html).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
