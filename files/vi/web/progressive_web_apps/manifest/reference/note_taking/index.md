---
title: note_taking
slug: Web/Progressive_web_apps/Manifest/Reference/note_taking
page-type: web-manifest-member
status:
  - experimental
browser-compat: manifests.webapp.note_taking
sidebar: pwasidebar
---

{{SeeCompatTable}}

Member `note_taking` xác định một ứng dụng web là ứng dụng ghi chú và định nghĩa thông tin liên quan, ví dụ một URL trỏ tới chức năng tạo ghi chú mới. Điều này cho phép hệ điều hành tích hợp chức năng ghi chú của ứng dụng, ví dụ đưa ra tùy chọn "New note" trong menu ngữ cảnh của ứng dụng, hoặc cung cấp ứng dụng như một lựa chọn để ghi chú trong các ứng dụng khác.

## Giá trị

Một đối tượng, có thể chứa các giá trị sau:

- `new_note_url` {{experimental_inline}}
  - : Một chuỗi đại diện cho URL mà nhà phát triển muốn tác nhân người dùng tải khi người dùng muốn tạo ghi chú mới thông qua ứng dụng web. Giá trị này chỉ là một gợi ý, và các triển khai khác nhau có thể chọn bỏ qua hoặc đưa nó thành một lựa chọn ở những vị trí phù hợp. `new_note_url` được phân tích với URL manifest của ứng dụng làm URL cơ sở và bị bỏ qua nếu không nằm trong [scope](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/scope) của manifest.

## Ví dụ

```json
{
  "name": "My Note Taking App",
  "description": "Bạn có thể ghi chú!",
  "icons": [
    {
      "src": "icon/hd_hi",
      "sizes": "128x128"
    }
  ],
  "start_url": "/index.html",
  "display": "standalone",
  "note_taking": {
    "new_note_url": "/new_note.html"
  }
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
