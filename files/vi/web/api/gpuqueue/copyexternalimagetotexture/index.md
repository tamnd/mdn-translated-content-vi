---
title: "GPUQueue: copyExternalImageToTexture() method"
short-title: copyExternalImageToTexture()
slug: Web/API/GPUQueue/copyExternalImageToTexture
page-type: web-api-instance-method
browser-compat: api.GPUQueue.copyExternalImageToTexture
---

{{APIRef("WebGPU API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`copyExternalImageToTexture()`** của giao diện {{domxref("GPUQueue")}} sao chép một ảnh chụp từ ảnh nguồn, video hoặc canvas vào một {{domxref("GPUTexture")}} được chỉ định.

Sử dụng hàm này cho phép tác nhân người dùng xác định cách sao chép dữ liệu hiệu quả nhất cho từng loại nguồn.

## Cú pháp

```js-nolint
copyExternalImageToTexture(source, destination, copySize)
```

### Tham số

- `source`
  - : Một đối tượng đại diện cho nguồn cần ghi vào đích, và gốc của nó. Có thể có các thuộc tính sau:
    - `source`
      - : Đối tượng cung cấp nguồn của ảnh chụp cần sao chép. Có thể là {{domxref("HTMLCanvasElement")}}, {{domxref("HTMLImageElement")}}, {{domxref("HTMLVideoElement")}}, {{domxref("ImageBitmap")}}, {{domxref("ImageData")}}, {{domxref("OffscreenCanvas")}}, hoặc {{domxref("VideoFrame")}}.
    - `origin` {{optional_inline}}
      - : Gốc của việc sao chép, tức là góc trên bên trái của vùng nguồn phụ cần sao chép từ đó. Mặc định là 0.
    - `flipY` {{optional_inline}}
      - : Giá trị boolean. Nếu đặt là `true`, ảnh chụp bị lật dọc. Nếu bỏ qua, `flipY` mặc định là `false`.
- `destination`
  - : Một đối tượng xác định subresource texture và gốc để ghi ảnh chụp vào, cùng metadata mã hóa.
- `copySize`
  - : Một đối tượng hoặc mảng chỉ định `width`, `height`, và `depthOrArrayLayers` của vùng cần sao chép từ/đến.

### Giá trị trả về

Không có ({{jsxref("Undefined")}}).

### Ngoại lệ

- `OperationError` {{domxref("DOMException")}}
  - : Được ném ra nếu các tiêu chí nhất định không được đáp ứng.
- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu dữ liệu ảnh nguồn có nguồn gốc chéo (cross-origin).

## Ví dụ

Trong WebGPU Samples [Textured Cube example](https://webgpu.github.io/webgpu-samples/samples/texturedCube/), đoạn mã sau được dùng để tải một ảnh và tải lên {{domxref("GPUTexture")}}:

```js
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
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGPU API](/en-US/docs/Web/API/WebGPU_API)
