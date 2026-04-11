---
title: "WebGL: đồ họa 2D và 3D cho web"
slug: Web/API/WebGL_API
page-type: web-api-overview
browser-compat:
  - api.WebGLRenderingContext
  - api.WebGL2RenderingContext
---

{{DefaultAPISidebar("WebGL")}}{{AvailableInWorkers}}

**WebGL** (Web Graphics Library) là một API JavaScript dùng để kết xuất đồ họa 3D và 2D tương tác hiệu năng cao trong bất kỳ trình duyệt web tương thích nào mà không cần dùng plug-in. WebGL làm được điều đó bằng cách giới thiệu một API tuân thủ chặt chẽ OpenGL ES 2.0, có thể dùng trong các phần tử HTML {{HTMLElement("canvas")}}. Sự tương thích này giúp API tận dụng được khả năng tăng tốc đồ họa phần cứng do thiết bị của người dùng cung cấp.

Hỗ trợ WebGL có sẵn trong tất cả các trình duyệt hiện đại (xem các [bảng tương thích](#browser_compatibility) bên dưới); tuy nhiên, thiết bị của người dùng cũng phải có phần cứng hỗ trợ các tính năng này.

API [WebGL 2](#webgl_2) giới thiệu hỗ trợ cho phần lớn bộ tính năng của OpenGL ES 3.0; nó được cung cấp thông qua giao diện {{domxref("WebGL2RenderingContext")}}.

Phần tử {{HTMLElement("canvas")}} cũng được [Canvas API](/en-US/docs/Web/API/Canvas_API) dùng để thực hiện đồ họa 2D trên trang web.

## Tham chiếu

### Giao diện chuẩn

- {{domxref("WebGLRenderingContext")}}
- {{domxref("WebGL2RenderingContext")}}
- {{domxref("WebGLActiveInfo")}}
- {{domxref("WebGLBuffer")}}
- {{domxref("WebGLContextEvent")}}
- {{domxref("WebGLFramebuffer")}}
- {{domxref("WebGLProgram")}}
- {{domxref("WebGLQuery")}}
- {{domxref("WebGLRenderbuffer")}}
- {{domxref("WebGLSampler")}}
- {{domxref("WebGLShader")}}
- {{domxref("WebGLShaderPrecisionFormat")}}
- {{domxref("WebGLSync")}}
- {{domxref("WebGLTexture")}}
- {{domxref("WebGLTransformFeedback")}}
- {{domxref("WebGLUniformLocation")}}
- {{domxref("WebGLVertexArrayObject")}}

### Tiện ích mở rộng

- {{domxref("ANGLE_instanced_arrays")}}
- {{domxref("EXT_blend_minmax")}}
- {{domxref("EXT_color_buffer_float")}}
- {{domxref("EXT_color_buffer_half_float")}}
- {{domxref("EXT_disjoint_timer_query")}}
- {{domxref("EXT_float_blend")}} {{experimental_inline}}
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

### Sự kiện

- {{domxref("HTMLCanvasElement/webglcontextlost_event", "webglcontextlost")}}
- {{domxref("HTMLCanvasElement/webglcontextrestored_event", "webglcontextrestored")}}
- {{domxref("HTMLCanvasElement/webglcontextcreationerror_event", "webglcontextcreationerror")}}

### Hằng số và kiểu

- [Hằng số WebGL](/en-US/docs/Web/API/WebGL_API/Constants)
- [Kiểu WebGL](/en-US/docs/Web/API/WebGL_API/Types)

### WebGL 2

WebGL 2 là một bản cập nhật lớn cho WebGL, được cung cấp thông qua giao diện {{domxref("WebGL2RenderingContext")}}. Nó dựa trên OpenGL ES 3.0 và các tính năng mới bao gồm:

- [texture 3D](/en-US/docs/Web/API/WebGL2RenderingContext/texImage3D),
- [đối tượng sampler](/en-US/docs/Web/API/WebGLSampler),
- [đối tượng Uniform Buffer](/en-US/docs/Web/API/WebGL2RenderingContext#uniform_buffer_objects),
- [đối tượng đồng bộ](/en-US/docs/Web/API/WebGLSync),
- [đối tượng truy vấn](/en-US/docs/Web/API/WebGLQuery),
- [đối tượng Transform Feedback](/en-US/docs/Web/API/WebGLTransformFeedback),
- Các tiện ích mở rộng đã được nâng lên thành lõi của WebGL 2: [đối tượng Vertex Array](/en-US/docs/Web/API/WebGLVertexArrayObject), [instancing](/en-US/docs/Web/API/WebGL2RenderingContext/drawArraysInstanced), [nhiều đích kết xuất](/en-US/docs/Web/API/WebGL2RenderingContext/drawBuffers), [fragment depth](/en-US/docs/Web/API/EXT_frag_depth).

Xem thêm bài viết blog ["WebGL 2 lands in Firefox"](https://hacks.mozilla.org/2017/01/webgl-2-lands-in-firefox/) và [webglsamples.org/WebGL2Samples](https://webglsamples.org/WebGL2Samples/) để xem một vài bản demo.

## Hướng dẫn và bài học

Dưới đây là một loạt hướng dẫn giúp bạn tìm hiểu các khái niệm WebGL và các bài học từng bước kèm ví dụ.

### Hướng dẫn

- [Dữ liệu trong WebGL](/en-US/docs/Web/API/WebGL_API/Data)
  - : Một hướng dẫn về biến, bộ đệm và các kiểu dữ liệu khác được dùng khi viết mã WebGL.
- [Các phương pháp hay nhất cho WebGL](/en-US/docs/Web/API/WebGL_API/WebGL_best_practices)
  - : Mẹo và gợi ý giúp bạn cải thiện chất lượng, hiệu năng và độ tin cậy của nội dung WebGL.
- [Sử dụng tiện ích mở rộng](/en-US/docs/Web/API/WebGL_API/Using_Extensions)
  - : Hướng dẫn cách dùng các tiện ích mở rộng WebGL.

### Bài học

- [Hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial)
  - : Hướng dẫn nhập môn các khái niệm cốt lõi của WebGL. Đây là nơi tốt để bắt đầu nếu bạn chưa có kinh nghiệm với WebGL.

### Ví dụ

- [Một ví dụ hoạt ảnh WebGL 2D cơ bản](/en-US/docs/Web/API/WebGL_API/Basic_2D_animation_example)
  - : Ví dụ này minh họa cách tạo hoạt ảnh đơn giản cho một hình đơn sắc. Các chủ đề được đề cập gồm thích ứng với khác biệt về {{glossary("aspect ratio")}}, hàm dựng chương trình shader từ nhiều shader, và các kiến thức cơ bản về vẽ trong WebGL.
- [WebGL qua ví dụ](/en-US/docs/Web/API/WebGL_API/By_example)
  - : Một chuỗi mẫu chạy trực tiếp kèm giải thích ngắn, trình bày các khái niệm và năng lực của WebGL. Các ví dụ được sắp xếp theo chủ đề và độ khó, bao gồm ngữ cảnh kết xuất WebGL, lập trình shader, texture, hình học, tương tác người dùng, và hơn thế nữa.

### Bài học nâng cao

- [Định dạng texture nén](/en-US/docs/Web/API/WebGL_API/Compressed_texture_formats)
  - : Cách bật và dùng các định dạng texture nén để cải thiện hiệu năng bộ nhớ.
- [Mô hình, khung nhìn, phép chiếu trong WebGL](/en-US/docs/Web/API/WebGL_API/WebGL_model_view_projection)
  - : Giải thích chi tiết ba ma trận cốt lõi thường được dùng để biểu diễn khung nhìn của một đối tượng 3D: các ma trận model, view và projection.
- [Phép toán ma trận cho web](/en-US/docs/Web/API/WebGL_API/Matrix_math_for_the_web)
  - : Một hướng dẫn hữu ích về cách hoạt động của các ma trận biến đổi 3D, và có thể được dùng trên web - cả cho các phép tính WebGL lẫn các phép biến đổi trong CSS.

## Tài nguyên

- [Trang WebGL của Khronos](https://www.khronos.org/webgl/) Trang web chính về WebGL của Khronos Group.
- [WebGL Fundamentals](https://web.dev/articles/webgl-fundamentals) Một bài hướng dẫn cơ bản với các nền tảng của WebGL.
- [Raw WebGL: An introduction to WebGL](https://www.youtube.com/embed/H4c8t6myAWU/?feature=player_detailpage) Bài nói của Nick Desaulniers giới thiệu các kiến thức cơ bản về WebGL.
- [WebGL Academy](https://www.webglacademy.com/) Một trình biên tập HTML/JavaScript kèm hướng dẫn để học lập trình WebGL cơ bản.
- [WebGL Stats](https://webglreport.com/) Trang web thống kê khả năng WebGL trong các trình duyệt trên các nền tảng khác nhau.

### Thư viện

- [three.js](https://threejs.org/) là một thư viện WebGL 3D mã nguồn mở, đầy đủ tính năng.
- [Babylon.js](https://www.babylonjs.com/) là một công cụ kết xuất 3D mạnh mẽ, đơn giản và mã nguồn mở, được đóng gói trong một framework JavaScript thân thiện.
- [Pixi.js](https://pixijs.com/) là một bộ kết xuất WebGL 2D nhanh, mã nguồn mở.
- [Phaser](https://phaser.io/) là một framework mã nguồn mở, nhanh, miễn phí và thú vị cho các trò chơi trình duyệt dùng Canvas và WebGL.
- [PlayCanvas](https://playcanvas.com/) là một công cụ game mã nguồn mở.
- [glMatrix](https://github.com/toji/gl-matrix) là một thư viện ma trận và vector JavaScript cho các ứng dụng WebGL hiệu năng cao.
- [twgl](https://twgljs.org/) là một thư viện giúp WebGL bớt rườm rà hơn.
- [RedGL](https://github.com/redcamel/RedGL2) là một thư viện WebGL 3D mã nguồn mở.
- [vtk.js](https://kitware.github.io/vtk-js/) là một thư viện JavaScript để trực quan hóa khoa học ngay trong trình duyệt của bạn.
- [webgl-lint](https://greggman.github.io/webgl-lint/) sẽ giúp tìm lỗi trong mã WebGL của bạn và cung cấp thông tin hữu ích.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

### Ghi chú tương thích

Ngoài trình duyệt, bản thân GPU cũng cần hỗ trợ tính năng này. Vì vậy, ví dụ như S3 Texture Compression (S3TC) chỉ có sẵn trên các máy tính bảng dựa trên Tegra. Hầu hết trình duyệt đều cung cấp ngữ cảnh WebGL thông qua tên ngữ cảnh `webgl`, nhưng các trình duyệt cũ hơn còn cần `experimental-webgl`. Ngoài ra, [WebGL 2](/en-US/docs/Web/API/WebGL2RenderingContext) sắp ra mắt hoàn toàn tương thích ngược và sẽ dùng tên ngữ cảnh `webgl2`.

### Ghi chú Gecko

#### Gỡ lỗi và kiểm thử WebGL

Firefox cung cấp hai tùy chọn mà bạn có thể dùng để kiểm soát khả năng của WebGL cho mục đích kiểm thử:

- `webgl.min_capability_mode`
  - : Một thuộc tính Boolean, khi đặt là `true`, sẽ bật chế độ năng lực tối thiểu. Trong chế độ này, WebGL được cấu hình để chỉ hỗ trợ tập tính năng và khả năng tối thiểu theo yêu cầu của đặc tả WebGL. Điều này giúp bạn đảm bảo mã WebGL của mình sẽ chạy trên bất kỳ thiết bị hoặc trình duyệt nào, bất kể năng lực của chúng. Mặc định là `false`.
- `webgl.disable_extensions`
  - : Một thuộc tính Boolean, khi đặt là `true`, sẽ vô hiệu hóa tất cả các tiện ích mở rộng WebGL. Mặc định là `false`.

## Xem thêm

- [Canvas API](/en-US/docs/Web/API/Canvas_API)
- [Thông tin tương thích về các tiện ích mở rộng WebGL](/en-US/docs/Web/API/WebGLRenderingContext/getSupportedExtensions#browser_compatibility)
