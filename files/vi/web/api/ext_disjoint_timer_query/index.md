---
title: EXT_disjoint_timer_query extension
short-title: EXT_disjoint_timer_query
slug: Web/API/EXT_disjoint_timer_query
page-type: webgl-extension
browser-compat: api.EXT_disjoint_timer_query
---

{{APIRef("WebGL")}}

Tiện ích **EXT_disjoint_timer_query** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cung cấp cách đo thời gian thực hiện của một tập lệnh GL mà không làm dừng pipeline kết xuất.

Các tiện ích WebGL có thể được sử dụng thông qua phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Sử dụng Tiện ích](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Tiện ích này chỉ có thể dùng trong các ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}}. {{domxref("EXT_disjoint_timer_query_webgl2")}} có thể dùng trong các ngữ cảnh {{domxref("WebGL2RenderingContext", "WebGL 2", "", 1)}}.
>
> Trong WebGL 2, phương thức OpenGL `getQueryObject()` được đổi tên thành {{domxref("WebGL2RenderingContext.getQueryParameter")}}.
> Trong WebGL 2, các truy vấn khác (như truy vấn occlusion và truy vấn primitive) có thể được thực hiện bằng các đối tượng {{domxref("WebGLQuery")}}.

## Kiểu dữ liệu

Tiện ích này cung cấp một kiểu dữ liệu mới:

- `GLuint64EXT`
  - : Số nguyên 64-bit không dấu.

## Hằng số

Tiện ích này cung cấp bảy hằng số mới.

- `ext.QUERY_COUNTER_BITS_EXT`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} cho biết số bit được sử dụng để lưu kết quả truy vấn cho target đã cho.
- `ext.CURRENT_QUERY_EXT`
  - : Một đối tượng {{domxref("WebGLQuery")}}, là truy vấn đang hoạt động hiện tại cho target đã cho.
- `ext.QUERY_RESULT_EXT`
  - : Một {{domxref("WebGL_API/Types", "GLuint64EXT")}} chứa kết quả truy vấn.
- `ext.QUERY_RESULT_AVAILABLE_EXT`
  - : Một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết kết quả truy vấn có sẵn hay không.
- `ext.TIME_ELAPSED_EXT`
  - : Thời gian đã trôi qua (tính bằng nanosecond).
- `ext.TIMESTAMP_EXT`
  - : Thời gian hiện tại.
- `ext.GPU_DISJOINT_EXT`
  - : Một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết GPU có thực hiện bất kỳ thao tác rời rạc nào hay không.

## Phương thức phiên bản

Tiện ích này cung cấp tám phương thức mới.

- {{domxref("EXT_disjoint_timer_query.createQueryEXT()", "ext.createQueryEXT()")}}
  - : Tạo một {{domxref("WebGLQuery")}} mới.
- {{domxref("EXT_disjoint_timer_query.deleteQueryEXT()", "ext.deleteQueryEXT()")}}
  - : Xóa một {{domxref("WebGLQuery")}} đã cho.
- {{domxref("EXT_disjoint_timer_query.isQueryEXT()", "ext.isQueryEXT()")}}
  - : Trả về `true` nếu đối tượng đã cho là một {{domxref("WebGLQuery")}} hợp lệ.
- {{domxref("EXT_disjoint_timer_query.beginQueryEXT()", "ext.beginQueryEXT()")}}
  - : Bộ đếm thời gian bắt đầu khi tất cả các lệnh trước `beginQueryEXT` đã được thực thi hoàn toàn.
- {{domxref("EXT_disjoint_timer_query.endQueryEXT()", "ext.endQueryEXT()")}}
  - : Bộ đếm thời gian dừng khi tất cả các lệnh trước `endQueryEXT` đã được thực thi hoàn toàn.
- {{domxref("EXT_disjoint_timer_query.queryCounterEXT()", "ext.queryCounterEXT()")}}
  - : Ghi lại thời gian hiện tại vào đối tượng truy vấn tương ứng.
- {{domxref("EXT_disjoint_timer_query.getQueryEXT()", "ext.getQueryEXT()")}}
  - : Trả về thông tin về một target truy vấn.
- {{domxref("EXT_disjoint_timer_query.getQueryObjectEXT()", "ext.getQueryObjectEXT()")}}
  - : Trả về trạng thái của một đối tượng truy vấn.

## Ví dụ

```js
const ext = gl.getExtension("EXT_disjoint_timer_query");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
