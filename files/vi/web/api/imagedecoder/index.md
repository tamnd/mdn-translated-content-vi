---
title: ImageDecoder
slug: Web/API/ImageDecoder
page-type: web-api-interface
browser-compat: api.ImageDecoder
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`ImageDecoder`** của {{domxref('WebCodecs API','','','true')}} cung cấp cách để giải nén và giải mã dữ liệu hình ảnh đã mã hóa.

## Hàm khởi tạo

- {{domxref("ImageDecoder.ImageDecoder", "ImageDecoder()")}}
  - : Tạo một đối tượng `ImageDecoder` mới.

## Thuộc tính phiên bản

- {{domxref("ImageDecoder.complete")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean cho biết dữ liệu đã mã hóa có được lưu vào bộ đệm hoàn toàn hay không.
- {{domxref("ImageDecoder.completed")}} {{ReadOnlyInline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết khi `complete` là true.
- {{domxref("ImageDecoder.tracks")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("ImageTrackList")}} liệt kê các track có sẵn và cung cấp phương thức để chọn một track cần giải mã.
- {{domxref("ImageDecoder.type")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi phản ánh [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) được cấu hình trong quá trình khởi tạo.

## Phương thức tĩnh

- {{domxref("ImageDecoder.isTypeSupported_static", "ImageDecoder.isTypeSupported()")}}
  - : Cho biết liệu [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) được cung cấp có được hỗ trợ để giải nén và giải mã không.

## Phương thức phiên bản

- {{domxref("ImageDecoder.close()")}}
  - : Kết thúc tất cả công việc đang chờ và giải phóng tài nguyên hệ thống.
- {{domxref("ImageDecoder.decode()")}}
  - : Thêm một thông điệp điều khiển vào hàng đợi để giải mã một khung của hình ảnh.
- {{domxref("ImageDecoder.reset()")}}
  - : Hủy tất cả các thao tác `decode()` đang chờ.

## Ví dụ

Với một phần tử {{HTMLElement("canvas")}}:

```html
<canvas></canvas>
```

đoạn code sau đây giải mã và hiển thị một hình ảnh động lên canvas đó:

```js
let imageDecoder = null;
let imageIndex = 0;

function renderImage(result) {
  const canvas = document.querySelector("canvas");
  const canvasContext = canvas.getContext("2d");

  canvasContext.drawImage(result.image, 0, 0);

  const track = imageDecoder.tracks.selectedTrack;

  // We check complete here since `frameCount` won't be stable until all
  // data has been received. This may cause us to receive a RangeError
  // during the decode() call below which needs to be handled.
  if (imageDecoder.complete) {
    if (track.frameCount === 1) return;

    if (imageIndex + 1 >= track.frameCount) imageIndex = 0;
  }

  // Decode the next frame ahead of display so it's ready in time.
  imageDecoder
    .decode({ frameIndex: ++imageIndex })
    .then((nextResult) =>
      setTimeout(() => {
        renderImage(nextResult);
      }, result.image.duration / 1000.0),
    )
    .catch((e) => {
      // We can end up requesting an imageIndex past the end since
      // we're using a ReadableStream from fetch(), when this happens
      // just wrap around.
      if (e instanceof RangeError) {
        imageIndex = 0;
        imageDecoder.decode({ frameIndex: imageIndex }).then(renderImage);
      } else {
        throw e;
      }
    });
}

function decodeImage(imageByteStream) {
  imageDecoder = new ImageDecoder({ data: imageByteStream, type: "image/gif" });
  imageDecoder.decode({ frameIndex: imageIndex }).then(renderImage);
}

fetch("fancy.gif").then((response) => decodeImage(response.body));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
