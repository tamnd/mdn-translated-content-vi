---
title: Định dạng kết cấu nén
slug: Web/API/WebGL_API/Compressed_texture_formats
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}

API WebGL cung cấp các phương thức để sử dụng các định dạng kết cấu nén. Những điều này rất hữu ích để tăng chi tiết kết cấu đồng thời hạn chế bộ nhớ video bổ sung cần thiết. Theo mặc định, không có định dạng nén nào khả dụng: trước tiên, phần mở rộng định dạng kết cấu nén tương ứng phải được bật.

## Cách sử dụng

Trừ khi có quy định khác, bài viết này áp dụng cho cả ngữ cảnh WebGL 1 và 2.

Nếu được hỗ trợ, họa tiết có thể được lưu trữ ở định dạng nén trong bộ nhớ video. Điều này cho phép bổ sung thêm chi tiết đồng thời hạn chế bộ nhớ video bổ sung cần thiết. Hoạ tiết không bị nén khi đang được trình đổ bóng truy cập. Lưu ý rằng lợi thế này không chuyển sang băng thông mạng: mặc dù các định dạng này tốt hơn dữ liệu không nén nhưng nhìn chung chúng kém hơn nhiều so với các định dạng hình ảnh tiêu chuẩn như PNG và JPG.

Vì kết cấu nén yêu cầu hỗ trợ phần cứng nên WebGL không yêu cầu định dạng cụ thể nào; thay vào đó, một ngữ cảnh có thể cung cấp các định dạng khác nhau, tùy thuộc vào sự hỗ trợ của phần cứng. Trang web [Trình kiểm tra kết cấu WebGL](https://toji.github.io/texture-tester/) hiển thị những định dạng nào được hỗ trợ trong trình duyệt đã sử dụng.

Việc sử dụng các định dạng nén trước tiên yêu cầu kích hoạt tiện ích mở rộng tương ứng bằng {{domxref("WebGLRenderingContext.getExtension()")}}. Nếu được hỗ trợ, nó sẽ trả về một đối tượng mở rộng có các hằng số cho các định dạng đã thêm và các định dạng này cũng sẽ được trả về bằng lệnh gọi tới `gl.getParameter(gl.COMPRESSED_TEXTURE_FORMATS)`. (Ví dụ: `ext.COMPRESSED_RGBA_S3TC_DXT1_EXT` cho tiện ích mở rộng {{domxref("WEBGL_compressed_texture_s3tc")}}.) Sau đó, những tiện ích này có thể được sử dụng với {{domxref("WebGLRenderingContext.compressedTexImage2D()", "compressedTexImage[23]D")}} hoặc {{domxref("WebGLRenderingContext.compressedTexSubImage2D()", "compressedTexSubImage[23]D")}} thay vì lệnh gọi `texImage2D`.

Lưu ý rằng WebGL không cung cấp chức năng để nén hoặc giải nén kết cấu: chúng phải ở định dạng nén và sau đó có thể được tải trực tiếp lên bộ nhớ video.

Tất cả các định dạng đều hỗ trợ kết cấu 2D. Những định dạng nào hỗ trợ mục tiêu `TEXTURE_2D_ARRAY` và `TEXTURE_3D` (kết hợp với `compressionTexImage3D`) được ghi chú trong bảng sau.

| Gia hạn                             | Ghi chú                                                             | TEXTURE_2D_ARRAY | TEXTURE_3D |
| ----------------------------------- | ------------------------------------------------------------------- | ---------------- | ---------- |
| WEBGL_compression_texture_astc      |                                                                     | Có               | Có         |
| WEBGL_compression_texture_etc       |                                                                     | Có               | Không      |
| WEBGL_compression_texture_etc1\*    | Không thể sử dụng được với CompressTexSubImage2D/copyTexSubImage2D. | Không            | Không      |
| WEBGL_compression_texture_pvrtc     | Chiều rộng và chiều cao phải là lũy thừa của 2.                     | Không            | Không      |
| WEBGL_compression_texture_s3tc      | Chiều rộng và chiều cao phải là bội số của 4.                       | Có               | Không      |
| WEBGL_compression_texture_s3tc_srgb | Chiều rộng và chiều cao phải là bội số của 4.                       | ?                | Không      |

## Ví dụ

```js
async function getCompressedTextureIfAvailable(gl) {
  const texture = gl.createTexture();
  gl.bindTexture(gl.TEXTURE_2D, texture); // create texture object on GPU
  const ext = gl.getExtension("WEBGL_compressed_texture_s3tc"); // will be null if not supported
  if (ext) {
    // the file is already in the correct compressed format
    const dataArrayBuffer = await fetch(
      "/textures/foobar512x512.RGBA_S3TC_DXT1",
    ).then((response) => response.arrayBuffer());
    gl.compressedTexImage2D(
      gl.TEXTURE_2D,
      0, // set the base image level
      ext.COMPRESSED_RGBA_S3TC_DXT1_EXT, // the compressed format we are using
      512,
      512, // width, height of the image
      0, // border, always 0
      new DataView(dataArrayBuffer),
    );
    gl.generateMipMap(gl.TEXTURE_2D); // create mipmap levels, like we would for a standard image
    return texture;
  }
}
```
