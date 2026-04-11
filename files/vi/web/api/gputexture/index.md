---
title: GPUTexture
slug: Web/API/GPUTexture
page-type: web-api-interface
browser-compat: api.GPUTexture
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`GPUTexture`** thuộc {{domxref("WebGPU API", "WebGPU API", "", "nocode")}} đại diện cho một container dùng để lưu trữ các mảng dữ liệu 1D, 2D hoặc 3D, chẳng hạn như hình ảnh, để sử dụng trong các thao tác kết xuất GPU.

Một thực thể đối tượng `GPUTexture` được tạo bằng phương thức {{domxref("GPUDevice.createTexture()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("GPUTexture.depthOrArrayLayers", "depthOrArrayLayers")}} {{ReadOnlyInline}}
  - : Một số đại diện cho chiều sâu hoặc số lớp của `GPUTexture` (pixel hoặc số lớp).
- {{domxref("GPUTexture.dimension", "dimension")}} {{ReadOnlyInline}}
  - : Một giá trị liệt kê đại diện cho kích thước của tập hợp texel cho mỗi subresource của `GPUTexture`.
- {{domxref("GPUTexture.format", "format")}} {{ReadOnlyInline}}
  - : Một giá trị liệt kê đại diện cho định dạng của `GPUTexture`. Xem phần [Texture formats](https://gpuweb.github.io/gpuweb/#enumdef-gputextureformat) của thông số kỹ thuật để biết tất cả các giá trị có thể. Xem thêm [Tier 1 and Tier 2 texture formats](/en-US/docs/Web/API/GPUDevice/createTexture#tier_1_and_tier_2_texture_formats).
- {{domxref("GPUTexture.height", "height")}} {{ReadOnlyInline}}
  - : Một số đại diện cho chiều cao của `GPUTexture` tính bằng pixel.
- {{domxref("GPUTexture.label", "label")}}
  - : Một chuỗi cung cấp nhãn có thể dùng để nhận diện đối tượng, ví dụ trong thông báo {{domxref("GPUError")}} hoặc cảnh báo console.
- {{domxref("GPUTexture.mipLevelCount", "mipLevelCount")}} {{ReadOnlyInline}}
  - : Một số đại diện cho số lượng mip level của `GPUTexture`.
- {{domxref("GPUTexture.sampleCount", "sampleCount")}} {{ReadOnlyInline}}
  - : Một số đại diện cho số mẫu (sample count) của `GPUTexture`.
- {{domxref("GPUTexture.usage", "usage")}} {{ReadOnlyInline}}
  - : Các {{glossary("bitwise flags")}} đại diện cho các cách sử dụng được phép của `GPUTexture`.
- {{domxref("GPUTexture.width", "width")}} {{ReadOnlyInline}}
  - : Một số đại diện cho chiều rộng của `GPUTexture` tính bằng pixel.

## Phương thức phiên bản

- {{domxref("GPUTexture.createView", "createView()")}}
  - : Tạo một {{domxref("GPUTextureView")}} đại diện cho một view cụ thể của `GPUTexture`.
- {{domxref("GPUTexture.destroy", "destroy()")}}
  - : Hủy `GPUTexture`.

## Ví dụ

Trong mẫu WebGPU [Textured Cube sample](https://webgpu.github.io/webgpu-samples/samples/texturedCube/), một kết cấu dùng cho các mặt của hình khối lập phương được tạo bằng cách:

- Tải hình ảnh vào {{domxref("HTMLImageElement")}} và tạo image bitmap bằng {{domxref("Window.createImageBitmap", "createImageBitmap()")}}.
- Tạo `GPUTexture` mới bằng `createTexture()`.
- Sao chép image bitmap vào kết cấu bằng {{domxref("GPUQueue.copyExternalImageToTexture()")}}.

```js
// …
let cubeTexture;
{
  const img = document.createElement("img");

  img.src = new URL(
    "../../../assets/img/Di-3d.png",
    import.meta.url,
  ).toString();

  await img.decode();

  const imageBitmap = await createImageBitmap(img);

  cubeTexture = device.createTexture({
    size: [imageBitmap.width, imageBitmap.height, 1],
    format: "rgba8unorm",
    usage:
      GPUTextureUsage.TEXTURE_BINDING |
      GPUTextureUsage.COPY_DST |
      GPUTextureUsage.RENDER_ATTACHMENT,
  });

  device.queue.copyExternalImageToTexture(
    { source: imageBitmap },
    { texture: cubeTexture },
    [imageBitmap.width, imageBitmap.height],
  );
}
// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
