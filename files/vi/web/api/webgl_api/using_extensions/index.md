---
title: Sử dụng tiện ích mở rộng WebGL
slug: Web/API/WebGL_API/Using_Extensions
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}

WebGL, giống như các API chị em của nó (OpenGL và OpenGL ES), hỗ trợ các tiện ích mở rộng. Danh sách đầy đủ các tiện ích mở rộng có trong [khronos webgl extension registry](https://registry.khronos.org/webgl/extensions/).

> [!NOTE]
> Trong WebGL, khác với các API GL khác, tiện ích mở rộng chỉ khả dụng khi được yêu cầu một cách tường minh.

## Tên tiện ích mở rộng chuẩn, tiền tố nhà cung cấp và tùy chọn

Các tiện ích mở rộng có thể được các nhà cung cấp trình duyệt hỗ trợ trước khi chính thức được phê chuẩn (nhưng chỉ khi chúng đang ở giai đoạn bản nháp). Trong trường hợp đó, tên của chúng có thể được gắn tiền tố của nhà cung cấp (`MOZ_`, `WEBKIT_`, v.v.) hoặc tiện ích mở rộng chỉ khả dụng sau khi một tùy chọn của trình duyệt được bật.

Nếu bạn muốn làm việc với các tiện ích mở rộng ở mức tiên phong, và muốn tiếp tục làm việc sau khi chúng được phê chuẩn (giả sử, tất nhiên, là tiện ích mở rộng đó không thay đổi theo cách không tương thích), thì bạn nên truy vấn cả tên tiện ích mở rộng chuẩn lẫn tên tiện ích mở rộng theo tiền tố của nhà cung cấp. Ví dụ:

```js
const ext =
  gl.getExtension("OES_vertex_array_object") ||
  gl.getExtension("MOZ_OES_vertex_array_object") ||
  gl.getExtension("WEBKIT_OES_vertex_array_object");
```

Lưu ý rằng tiền tố của nhà cung cấp hiện không còn được khuyến khích, vì vậy hầu hết trình duyệt triển khai các tiện ích mở rộng thử nghiệm sau một cờ tính năng thay vì tiền tố nhà cung cấp.

Các cờ tính năng là:

- `webgl.enable-draft-extensions` trong Firefox
- `chrome://flags/#enable-webgl-draft-extensions` trong các trình duyệt dựa trên Chromium (Chrome, Opera).

## Quy ước đặt tên

Các tiện ích mở rộng WebGL được tiền tố bằng "ANGLE", "OES", "EXT" hoặc "WEBGL". Những tiền tố này phản ánh nguồn gốc và mục đích:

- `ANGLE_`: Các tiện ích mở rộng do tác giả của [thư viện ANGLE](https://en.wikipedia.org/wiki/ANGLE_%28software%29) viết.
- `OES_` và `KHR_`: Các tiện ích mở rộng mô phỏng chức năng từ OpenGL ES (OES) hoặc các tiện ích mở rộng OpenGL API được các hội đồng xem xét kiến trúc tương ứng (Khronos) phê duyệt.
- `OVR_`: Các tiện ích mở rộng tối ưu cho thực tế ảo.
- `EXT_`: Các tiện ích mở rộng mô phỏng các tiện ích mở rộng khác của OpenGL ES hoặc OpenGL API.
- `WEBGL_`: Các tiện ích mở rộng dành riêng cho WebGL và được thiết kế để tương thích với nhiều trình duyệt web. Tiền tố này cũng nên được dùng cho các tiện ích mở rộng có nguồn gốc từ OpenGL ES hoặc OpenGL API nhưng có hành vi đã được thay đổi đáng kể.

## Truy vấn các tiện ích mở rộng có sẵn

Ngữ cảnh WebGL hỗ trợ truy vấn xem những tiện ích mở rộng nào đang có sẵn.

```js
const availableExtensions = gl.getSupportedExtensions();
```

Phương thức {{domxref("WebGLRenderingContext.getSupportedExtensions()")}} trả về một mảng chuỗi, mỗi chuỗi tương ứng với một tiện ích mở rộng được hỗ trợ.

## Danh sách tiện ích mở rộng

Các tiện ích mở rộng hiện tại là:

- {{domxref("ANGLE_instanced_arrays")}}
- {{domxref("EXT_blend_minmax")}}
- {{domxref("EXT_color_buffer_float")}}
- {{domxref("EXT_color_buffer_half_float")}}
- {{domxref("EXT_disjoint_timer_query")}}
- {{domxref("EXT_float_blend")}}
- {{domxref("EXT_frag_depth")}}
- {{domxref("EXT_shader_texture_lod")}}
- {{domxref("EXT_sRGB")}}
- {{domxref("EXT_texture_compression_bptc")}}
- {{domxref("EXT_texture_compression_rgtc")}}
- {{domxref("EXT_texture_filter_anisotropic")}}
- {{domxref("EXT_texture_norm16")}}
- {{domxref("KHR_parallel_shader_compile")}}
- {{domxref("OES_draw_buffers_indexed")}}
- {{domxref("OES_element_index_uint")}}
- {{domxref("OES_fbo_render_mipmap")}}
- {{domxref("OES_standard_derivatives")}}
- {{domxref("OES_texture_float")}}
- {{domxref("OES_texture_float_linear")}}
- {{domxref("OES_texture_half_float")}}
- {{domxref("OES_texture_half_float_linear")}}
- {{domxref("OES_vertex_array_object")}}
- {{domxref("OVR_multiview2")}}
- {{domxref("WEBGL_color_buffer_float")}}
- {{domxref("WEBGL_compressed_texture_astc")}}
- {{domxref("WEBGL_compressed_texture_etc")}}
- {{domxref("WEBGL_compressed_texture_etc1")}}
- {{domxref("WEBGL_compressed_texture_pvrtc")}}
- {{domxref("WEBGL_compressed_texture_s3tc")}}
- {{domxref("WEBGL_compressed_texture_s3tc_srgb")}}
- {{domxref("WEBGL_debug_renderer_info")}}
- {{domxref("WEBGL_debug_shaders")}}
- {{domxref("WEBGL_depth_texture")}}
- {{domxref("WEBGL_draw_buffers")}}
- {{domxref("WEBGL_lose_context")}}
- {{domxref("WEBGL_multi_draw")}}

## Bật một tiện ích mở rộng

Trước khi một tiện ích mở rộng có thể được dùng, nó phải được bật bằng {{domxref("WebGLRenderingContext.getExtension()")}}. Ví dụ:

```js
const ext = gl.getExtension("OES_texture_float");
```

Giá trị trả về là `null` nếu tiện ích mở rộng không được hỗ trợ, còn nếu không thì là một đối tượng tiện ích mở rộng.

## Đối tượng tiện ích mở rộng

Nếu một tiện ích mở rộng định nghĩa các ký hiệu hoặc hàm cụ thể không có trong đặc tả lõi của WebGL, chúng sẽ có sẵn trên đối tượng tiện ích mở rộng được trả về bởi lời gọi `gl.getExtension()`.

## Xem thêm

- {{domxref("WebGLRenderingContext.getSupportedExtensions()")}}
- {{domxref("WebGLRenderingContext.getExtension()")}}
- [webglreport.com](https://webglreport.com/)
- [web3dsurvey.com - WebGL Extension Support Survey](https://web3dsurvey.com/)
