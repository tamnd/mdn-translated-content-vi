---
title: "GPUTexture: createView() method"
short-title: createView()
slug: Web/API/GPUTexture/createView
page-type: web-api-instance-method
browser-compat: api.GPUTexture.createView
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`createView()`** của giao diện {{domxref("GPUTexture")}} tạo một {{domxref("GPUTextureView")}} đại diện cho một view cụ thể của `GPUTexture`.

## Cú pháp

```js-nolint
createView()
createView(descriptor)
```

### Tham số

- `descriptor` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau:
    - `arrayLayerCount` {{optional_inline}}
      - : Một số xác định bao nhiêu lớp mảng có thể truy cập qua view, bắt đầu từ giá trị `baseArrayLayer`.

        Nếu `arrayLayerCount` bị bỏ qua, nó được gán giá trị như sau:
        - Nếu `dimension` là `"1d"`, `"2d"` hoặc `"3d"`, `arrayLayerCount` là 1.
        - Nếu `dimension` là `"cube"`, `arrayLayerCount` là 6.
        - Nếu `dimension` là `"2d-array"` hoặc `"cube-array"`, `arrayLayerCount` là {{domxref("GPUTexture.depthOrArrayLayers")}} - `baseArrayLayer`.

    - `aspect` {{optional_inline}}
      - : Một giá trị liệt kê chỉ định (các) khía cạnh của kết cấu có thể truy cập qua texture view. Các giá trị có thể là:
        - `"all"`
          - : Tất cả các khía cạnh có sẵn của định dạng kết cấu sẽ có thể truy cập qua view, có thể là tất cả hoặc bất kỳ trong số màu sắc, độ sâu và stencil, tùy thuộc vào loại định dạng đang sử dụng.
        - `"depth-only"`
          - : Chỉ khía cạnh độ sâu của [định dạng depth-or-stencil](https://gpuweb.github.io/gpuweb/#combined-depth-stencil-format) có thể truy cập qua view.
        - `"stencil-only"`
          - : Chỉ khía cạnh stencil của định dạng depth-or-stencil có thể truy cập qua view.

        Nếu bị bỏ qua, `aspect` nhận giá trị `"all"`.

    - `baseArrayLayer` {{optional_inline}}
      - : Một số xác định chỉ số của lớp mảng đầu tiên có thể truy cập qua view. Nếu bị bỏ qua, `baseArrayLayer` nhận giá trị 0.
    - `baseMipLevel` {{optional_inline}}
      - : Một số đại diện cho mipmap level đầu tiên (chi tiết nhất) có thể truy cập qua view. Nếu bị bỏ qua, `baseMipLevel` nhận giá trị 0.
    - `dimension` {{optional_inline}}
      - : Một giá trị liệt kê chỉ định định dạng để xem kết cấu. Các giá trị có thể là:
        - `"1d"`: Kết cấu được xem như hình ảnh một chiều.
        - `"2d"`: Kết cấu được xem như hình ảnh hai chiều đơn.
        - `"2d-array"`: Kết cấu được xem như mảng hình ảnh hai chiều.
        - `"cube"`: Kết cấu được xem như cubemap. View có 6 lớp mảng, tương ứng với các mặt `[+X, -X, +Y, -Y, +Z, -Z]` của hình khối. Lấy mẫu được thực hiện liền mạch qua các mặt của cubemap.
        - `"cube-array"`: Kết cấu được xem như mảng gói N cubemap, mỗi cubemap có 6 lớp mảng tương ứng với các mặt `[+X, -X, +Y, -Y, +Z, -Z]` của hình khối. Lấy mẫu được thực hiện liền mạch qua các mặt của cubemap.
        - `"3d"`: Kết cấu được xem như hình ảnh ba chiều.

        Nếu `dimension` bị bỏ qua, nó được gán giá trị như sau:
        - Nếu {{domxref("GPUTexture.dimension")}} là `"1d"`, `dimension` là `"1d"`.
        - Nếu {{domxref("GPUTexture.dimension")}} là `"2d"` và {{domxref("GPUTexture.depthOrArrayLayers")}} là 1, `dimension` là `"2d"`.
        - Nếu {{domxref("GPUTexture.dimension")}} là `"2d"` và {{domxref("GPUTexture.depthOrArrayLayers")}} lớn hơn 1, `dimension` là `"2d-array"`.
        - Nếu {{domxref("GPUTexture.dimension")}} là `"3d"`, `dimension` là `"3d"`.

    - `format` {{optional_inline}}
      - : Một giá trị liệt kê chỉ định định dạng của texture view. Xem phần [Texture formats](https://gpuweb.github.io/gpuweb/#enumdef-gputextureformat) của thông số kỹ thuật để biết tất cả các giá trị có thể.

        Nếu `format` bị bỏ qua, nó sẽ được gán giá trị như sau:
        - Nếu `aspect` là `"depth-only"` hoặc `"stencil-only"`, và {{domxref("GPUTexture.format")}} là [định dạng depth-or-stencil](https://gpuweb.github.io/gpuweb/#combined-depth-stencil-format), `format` sẽ được đặt bằng [định dạng dành riêng cho khía cạnh](https://gpuweb.github.io/gpuweb/#aspect-specific-format) tương ứng.
        - Nếu không, nó sẽ được đặt bằng {{domxref("GPUTexture.format")}}.

    - `label` {{optional_inline}}
      - : Một chuỗi cung cấp nhãn có thể dùng để nhận diện đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo console.
    - `mipLevelCount` {{optional_inline}}
      - : Một số xác định bao nhiêu mipmap level có thể truy cập qua view, bắt đầu từ giá trị `baseMipLevel`.

        Nếu `mipLevelCount` bị bỏ qua, nó sẽ được gán giá trị {{domxref("GPUTexture.mipLevelCount")}} - `baseMipLevel`.

    - `swizzle` {{optional_inline}}
      - : Một chuỗi chứa bốn ký tự. Vị trí của mỗi ký tự ánh xạ tương ứng với giá trị kênh đỏ, xanh lá, xanh dương và alpha của texture view. Giá trị của mỗi ký tự chỉ định giá trị mà mỗi kênh đó sẽ nhận khi view được truy cập bởi shader. Các giá trị có thể là:
        - `r`
          - : Giá trị kênh đỏ của kết cấu.
        - `g`
          - : Giá trị kênh xanh lá của kết cấu.
        - `b`
          - : Giá trị kênh xanh dương của kết cấu.
        - `a`
          - : Giá trị kênh alpha của kết cấu.
        - `0`
          - : Áp đặt giá trị `0`.
        - `1`
          - : Áp đặt giá trị `1`.

        Ví dụ, `swizzle: "grba"` sẽ khiến giá trị kênh đỏ và xanh lá của kết cấu bị hoán đổi khi shader truy cập view. Tính năng swizzle thành phần kết cấu cho phép nhà phát triển tối ưu hóa hiệu suất, sửa lỗi thứ tự thành phần và tái sử dụng code shader trên các định dạng kết cấu khác nhau khi lấy mẫu kết cấu.

        > [!NOTE]
        > Để sử dụng thuộc tính `swizzle`, bạn phải kích hoạt tính năng `texture-component-swizzle` [feature](/en-US/docs/Web/API/GPUSupportedFeatures) trong {{domxref("GPUDevice")}} bằng cách chỉ định nó trong mảng `requiredFeatures` của descriptor {{domxref("GPUAdapter.requestDevice()")}}. Nếu tính năng này không được kích hoạt, thuộc tính `swizzle` sẽ không có tác dụng.

    - `usage` {{optional_inline}}
      - : Một tập hợp {{glossary("bitwise flags")}} đại diện cho tập con các cờ sử dụng của kết cấu nguồn (có sẵn trong thuộc tính {{domxref("GPUTexture.usage")}}) tương thích với định dạng view đã chọn. Có thể dùng để giới hạn việc sử dụng view được phép trong các trường hợp định dạng view không tương thích với một số cách sử dụng nhất định. Các cờ sử dụng có sẵn được liệt kê trong [bảng giá trị `GPUTexture.usage`](/en-US/docs/Web/API/GPUTexture/usage#value).

        Giá trị mặc định là `0`, đại diện cho toàn bộ tập hợp cờ sử dụng của kết cấu nguồn. Nếu [`format`](#format) của view không hỗ trợ tất cả các cách sử dụng của kết cấu, giá trị mặc định sẽ thất bại và phải chỉ định rõ ràng cách sử dụng của view.

### Giá trị trả về

Một thực thể đối tượng {{domxref("GPUTextureView")}}.

### Xác thực

Các tiêu chí sau phải được đáp ứng khi gọi **`createView()`**, nếu không một {{domxref("GPUValidationError")}} sẽ được tạo ra và trả về một đối tượng {{domxref("GPUTextureView")}} không hợp lệ:

- Nếu `aspect` là `"all"`, `format` bằng {{domxref("GPUTexture.format")}} hoặc một trong các `viewFormats` được chỉ định trong đối tượng descriptor của lời gọi {{domxref("GPUDevice.createTexture()")}} ban đầu.
- Nếu `aspect` là `"depth-only"` hoặc `"stencil-only"`, `format` bằng [định dạng dành riêng cho khía cạnh](https://gpuweb.github.io/gpuweb/#aspect-specific-format) tương ứng của [định dạng depth-or-stencil](https://gpuweb.github.io/gpuweb/#combined-depth-stencil-format).
- `mipLevelCount` lớn hơn 0.
- `mipLevelCount` + `baseMipLevel` nhỏ hơn hoặc bằng {{domxref("GPUTexture.mipLevelCount")}}.
- `arrayLayerCount` lớn hơn 0.
- `arrayLayerCount` + `baseArrayLayer` nhỏ hơn hoặc bằng {{domxref("GPUTexture.depthOrArrayLayers")}} nếu {{domxref("GPUTexture.dimension")}} là `"2d"`, hoặc nhỏ hơn hoặc bằng 1 nếu {{domxref("GPUTexture.dimension")}} là `"1d"` hoặc `"3d"`.
- Nếu `sampleCount` lớn hơn 1, `dimension` là `"2d"`.
- Nếu `dimension` là:
  - `"1d"`
    - {{domxref("GPUTexture.dimension")}} là `"1d"`
    - `arrayLayerCount` là 1
  - `"2d"`
    - {{domxref("GPUTexture.dimension")}} là `"2d"`
    - `arrayLayerCount` là 1
  - `"2d-array"`
    - {{domxref("GPUTexture.dimension")}} là `"2d"`
  - `"cube"`
    - {{domxref("GPUTexture.dimension")}} là `"2d"`
    - `arrayLayerCount` là 6
    - {{domxref("GPUTexture.width")}} bằng {{domxref("GPUTexture.height")}}
  - `"cube-array"`
    - {{domxref("GPUTexture.dimension")}} là `"2d"`
    - `arrayLayerCount` là bội số của 6
    - {{domxref("GPUTexture.width")}} bằng {{domxref("GPUTexture.height")}}
  - `"3d"`
    - {{domxref("GPUTexture.dimension")}} là `"3d"`
    - `arrayLayerCount` là 1
- [`format`](#format) của view hỗ trợ tất cả các cách sử dụng được chỉ định trong thuộc tính [`usage`](#usage).

## Ví dụ

### Cách dùng `createView()` điển hình

Trong mẫu WebGPU Samples [Cubemap demo](https://webgpu.github.io/webgpu-samples/samples/cubemap/), bạn sẽ thấy nhiều ví dụ về cách `createView()` được sử dụng, cả để tạo `resource` view cho lời gọi {{domxref("GPUDevice.createBindGroup()")}}, và để cung cấp `view` trong đối tượng `depthStencilAttachment` của descriptor {{domxref("GPUCommandEncoder.beginRenderPass()")}}.

```js
const uniformBindGroup = device.createBindGroup({
  layout: pipeline.getBindGroupLayout(0),
  entries: [
    {
      binding: 0,
      resource: {
        buffer: uniformBuffer,
        offset: 0,
        size: uniformBufferSize,
      },
    },
    {
      binding: 1,
      resource: sampler,
    },
    {
      binding: 2,
      resource: cubemapTexture.createView({
        dimension: "cube",
      }),
    },
  ],
});

const renderPassDescriptor: GPURenderPassDescriptor = {
  colorAttachments: [
    {
      view: undefined, // Assigned later
      loadOp: "clear",
      storeOp: "store",
    },
  ],
  depthStencilAttachment: {
    view: depthTexture.createView(),

    depthClearValue: 1.0,
    depthLoadOp: "clear",
    depthStoreOp: "store",
  },
};

// …

const commandEncoder = device.createCommandEncoder();
const passEncoder = commandEncoder.beginRenderPass(renderPassDescriptor);

// …
```

### `createView()` với giới hạn usage

Trong đoạn code này, chúng ta tạo một kết cấu rồi tạo một view có usage bị giới hạn thông qua thuộc tính `usage`.

```js
const texture = myDevice.createTexture({
  size: [4, 4],
  format: "rgba8unorm",
  usage:
    GPUTextureUsage.RENDER_ATTACHMENT |
    GPUTextureUsage.TEXTURE_BINDING |
    GPUTextureUsage.STORAGE_BINDING,
  viewFormats: ["rgba8unorm-srgb"],
});

const view = texture.createView({
  format: "rgba8unorm-srgb",
  usage: GPUTextureUsage.RENDER_ATTACHMENT, // Restrict allowed usage
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
