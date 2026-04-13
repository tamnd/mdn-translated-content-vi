---
title: "GPUQueue: writeTexture() method"
short-title: writeTexture()
slug: Web/API/GPUQueue/writeTexture
page-type: web-api-instance-method
browser-compat: api.GPUQueue.writeTexture
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`writeTexture()`** của giao diện {{domxref("GPUQueue")}} ghi một nguồn dữ liệu được cung cấp vào một {{domxref("GPUTexture")}} được chỉ định.

Đây là hàm tiện ích, cung cấp giải pháp thay thế cho việc thiết lập dữ liệu texture thông qua ánh xạ buffer và sao chép buffer sang texture. Nó cho phép tác nhân người dùng xác định cách sao chép dữ liệu hiệu quả nhất.

## Cú pháp

```js-nolint
writeTexture(destination, data, dataLayout, size)
```

### Tham số

- `destination`
  - : Một đối tượng xác định subresource texture và gốc để ghi nguồn dữ liệu vào, có thể có các thuộc tính sau:
    - `aspect` {{optional_inline}}
      - : Một giá trị liệt kê xác định các khía cạnh nào của texture sẽ được ghi dữ liệu vào. Các giá trị có thể:
        - `"all"`: Tất cả các khía cạnh có sẵn của định dạng texture sẽ được ghi vào.
        - `"depth-only"`: Chỉ khía cạnh depth của định dạng depth-or-stencil sẽ được ghi vào.
        - `"stencil-only"`: Chỉ khía cạnh stencil của định dạng depth-or-stencil sẽ được ghi vào.
          Nếu bỏ qua, `aspect` mặc định là `"all"`.
    - `mipLevel` {{optional_inline}}
      - : Một số đại diện cho mức mip-map của texture để ghi dữ liệu vào. Nếu bỏ qua, `mipLevel` mặc định là 0.
    - `origin` {{optional_inline}}
      - : Một đối tượng hoặc mảng chỉ định gốc của việc sao chép. Các giá trị `x`, `y`, và `z` mặc định là 0 nếu `origin` bị bỏ qua.
    - `texture`
      - : Một đối tượng {{domxref("GPUTexture")}} đại diện cho texture cần ghi dữ liệu vào.
- `data`
  - : Một đối tượng đại diện cho nguồn dữ liệu cần ghi vào {{domxref("GPUTexture")}}. Có thể là {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}}.
- `dataLayout`
  - : Một đối tượng xác định bố cục của nội dung chứa trong `data`. Các giá trị có thể:
    - `offset` {{optional_inline}}: Độ lệch tính bằng byte từ đầu `data` đến bắt đầu dữ liệu hình ảnh cần sao chép. Mặc định là 0.
    - `bytesPerRow` {{optional_inline}}: Một số đại diện cho stride tính bằng byte giữa bắt đầu mỗi hàng block và hàng block tiếp theo.
    - `rowsPerImage` {{optional_inline}}: Số hàng block trên mỗi ảnh đơn của texture.
- `size`
  - : Một đối tượng hoặc mảng chỉ định phạm vi của việc sao chép, tức là góc xa của vùng texture cần ghi dữ liệu vào.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`writeTexture()`**, nếu không sẽ tạo ra {{domxref("GPUValidationError")}} và {{domxref("GPUQueue")}} trở nên không hợp lệ.

## Ví dụ

Trong [Efficiently rendering glTF models](https://toji.github.io/webgpu-gltf-case-study/), một hàm được định nghĩa để tạo texture màu đồng nhất:

```js
function createSolidColorTexture(r, g, b, a) {
  const data = new Uint8Array([r * 255, g * 255, b * 255, a * 255]);
  const texture = device.createTexture({
    size: { width: 1, height: 1 },
    format: "rgba8unorm",
    usage: GPUTextureUsage.TEXTURE_BINDING | GPUTextureUsage.COPY_DST,
  });
  device.queue.writeTexture({ texture }, data, {}, { width: 1, height: 1 });
  return texture;
}
```

Hàm này có thể được dùng để định nghĩa các texture chuẩn cho thư viện vật liệu:

```js
const opaqueWhiteTexture = createSolidColorTexture(1, 1, 1, 1);
const transparentBlackTexture = createSolidColorTexture(0, 0, 0, 0);
const defaultNormalTexture = createSolidColorTexture(0.5, 0.5, 1, 1);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
