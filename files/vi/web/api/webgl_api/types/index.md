---
title: Các loại WebGL
slug: Web/API/WebGL_API/Types
page-type: guide
spec-urls:
  - https://www.khronos.org/registry/webgl/specs/latest/1.0/#5.1
  - https://www.khronos.org/registry/webgl/specs/latest/2.0/#3.1
  - https://www.khronos.org/registry/webgl/extensions/EXT_disjoint_timer_query/
---

{{DefaultAPISidebar("WebGL")}}

Các loại sau đây được sử dụng trong giao diện [WebGL](/en-US/docs/Web/API/WebGL_API).

## WebGL 1

Những loại này được sử dụng trong {{domxref("WebGLRenderingContext")}}.

<table class="no-markdown">
<đầu>
<tr>
<th>Loại</th>
<th>Loại IDL web</th>
<th>Mô tả</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>GLenum</code></td>
<td><code>không dấu dài</code></td>
<td>
Được sử dụng cho enum. Xem thêm danh sách
<a href="/en-US/docs/Web/API/WebGL_API/Constants">hằng số</a>.
</td>
</tr>
<tr>
<td><code>GLboolean</code></td>
<td><code>boolean</code></td>
<td>Một giá trị boolean.</td>
</tr>
<tr>
<td><code>GLbitfield</code></td>
<td><code>không dấu dài</code></td>
<td>
Trường bit lưu trữ nhiều bit logic. Ví dụ được sử dụng trong
{{domxref("WebGLRenderingContext.clear()")}}.
</td>
</tr>
<tr>
<td><code>GLbyte</code></td>
<td><code>byte</code></td>
<td>Số 2 8 bit bổ sung cho số nguyên có dấu.</td>
</tr>
<tr>
<td><code>GLshort</code></td>
<td><code>ngắn</code></td>
<td>Số 2 16 bit bổ sung cho số nguyên có dấu.</td>
</tr>
<tr>
<td><code>GLint</code></td>
<td><code>dài</code></td>
<td>Số 2 32 bit bổ sung cho số nguyên có dấu.</td>
</tr>
<tr>
<td><code>GLsizei</code></td>
<td><code>dài</code></td>
<td>Được sử dụng cho các kích thước (ví dụ: chiều rộng và chiều cao của vùng đệm vẽ).</td>
</tr>
<tr>
<td><code>GLintptr</code></td>
<td><code>dài lắm</code></td>
<td>Loại đặc biệt cho số học con trỏ.</td>
</tr>
<tr>
<td><code>GLsizeiptr</code></td>
<td><code>dài lắm</code></td>
<td>Loại đặc biệt cho số học con trỏ.</td>
</tr>
<tr>
<td><code>GLubyte</code></td>
<td><code>octet</code></td>
<td>Số nguyên không dấu 8 bit.</td>
</tr>
<tr>
<td><code>GLushort</code></td>
<td><code>ngắn không dấu</code></td>
<td>Số nguyên không dấu 16-bit.</td>
</tr>
<tr>
<td><code>GLuint</code></td>
<td><code>không dấu dài</code></td>
<td>Số nguyên không dấu 32 bit.</td>
</tr>
<tr>
<td><code>GLfloat</code></td>
<td><code>thả nổi không giới hạn</code></td>
<td>Số dấu phẩy động IEEE 32-bit.</td>
</tr>
<tr>
<td><code>GLclampf</code></td>
<td><code>thả nổi không giới hạn</code></td>
<td>Số dấu phẩy động IEEE 32-bit được kẹp.</td>
</tr>
</tbody>
</bảng>

## WebGL 2

Những loại này được sử dụng trong {{domxref("WebGL2RenderingContext")}}. Tất cả các loại WebGL 1 cũng được sử dụng.

| Loại      | Loại IDL web | Mô tả                    |
| --------- | ------------ | ------------------------ |
| `GLint64` | `dài dài`    | Số nguyên 64 bit có dấu. |

## Tiện ích mở rộng WebGL

Những loại này được sử dụng trong [tiện ích mở rộng WebGL](/en-US/docs/Web/API/WebGL_API/Using_Extensions).

| Loại          | Loại IDL web | Mô tả                       |
| ------------- | ------------ | --------------------------- |
| `GLuint64EXT` | `dài dài`    | Số nguyên 64 bit không dấu. |

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- {{domxref("WebGLRenderingContext")}}
