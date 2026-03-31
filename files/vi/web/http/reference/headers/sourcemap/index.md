---
title: SourceMap header
short-title: SourceMap
slug: Web/HTTP/Reference/Headers/SourceMap
page-type: http-header
browser-compat: http.headers.SourceMap
sidebar: http
---

Tiêu đề HTTP **`SourceMap`** {{Glossary("response header")}} cung cấp vị trí của {{Glossary("source map")}} cho tài nguyên.

Tiêu đề HTTP `SourceMap` được ưu tiên hơn chú thích nguồn (`sourceMappingURL=path-to-map.js.map`), và nếu cả hai đều có mặt, URL trong tiêu đề được sử dụng để giải quyết tệp source map.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
SourceMap: <url>
X-SourceMap: <url> (deprecated)
```

### Chỉ thị

- `<url>`
  - : URL tương đối (với URL yêu cầu) hoặc tuyệt đối trỏ đến tệp source map.

## Ví dụ

### Liên kết đến source map bằng tiêu đề `SourceMap`

Phản hồi sau chứa đường dẫn tuyệt đối trong tiêu đề `SourceMap`.

```http
HTTP/1.1 200 OK
Content-Type: text/javascript
SourceMap: /path/to/file.js.map

<optimized-javascript>
```

Công cụ dành cho nhà phát triển sử dụng source map để tái cấu trúc nguồn gốc từ JavaScript được tối ưu hóa được trả về trong phản hồi, cho phép nhà phát triển gỡ lỗi mã gốc thay vì định dạng đã được tối ưu hóa để gửi.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Glossary("Source map")}}
- [Firefox Developer Tools: using a source map](https://firefox-source-docs.mozilla.org/devtools-user/debugger/how_to/use_a_source_map/index.html)
- [What are source maps?](https://web.dev/articles/source-maps) trên web.dev (2023)
