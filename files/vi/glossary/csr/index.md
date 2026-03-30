---
title: Kết xuất phía máy khách (CSR)
slug: Glossary/CSR
page-type: glossary-definition
sidebar: glossarysidebar
---

**Kết xuất phía máy khách** (CSR - Client-side rendering) đề cập đến thực hành tạo nội dung HTML bằng JavaScript trong trình duyệt. CSR trái ngược với {{glossary("SSR","kết xuất phía máy chủ")}}, nơi máy chủ tạo nội dung HTML. Cả hai kỹ thuật không loại trừ lẫn nhau và có thể được sử dụng cùng nhau trong cùng một ứng dụng.

Một ứng dụng CSR thuần túy có thể trả về nội dung HTML sau:

```html
<!doctype html>
<html lang="vi">
  <head>
    <title>Ứng dụng của tôi</title>
    <script src="bundle.js"></script>
  </head>
  <body>
    <div id="root"></div>
    <noscript>
      <p>Ứng dụng này yêu cầu JavaScript để chạy.</p>
    </noscript>
  </body>
</html>
```

Sau đó, nội dung trang thực sự được tạo bởi JavaScript trong `bundle.js`, sử dụng [thao tác DOM](/en-US/docs/Web/API/Document_Object_Model).

Ưu điểm của CSR bao gồm:

- Tính tương tác: mọi cập nhật trang, bao gồm cả chuyển đổi route, không yêu cầu tải lại toàn bộ trang. Điều này làm cho ứng dụng cảm thấy nhanh hơn và phản hồi tốt hơn.
- Hiệu năng: máy chủ chỉ cần gửi nội dung HTML ban đầu và các tài nguyên JavaScript. Các cập nhật trang tiếp theo có thể được tải từ API, có thể nhanh hơn so với việc lấy toàn bộ trang HTML, và ít tải hơn cho máy chủ.

## Xem thêm

- [Giới thiệu về các framework phía client > kết xuất phía máy chủ](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/Introduction#server-side_rendering)
- [Client-side rendering](https://en.wikipedia.org/wiki/Client-side_rendering) trên Wikipedia
- {{glossary("SSR", "Kết xuất phía máy chủ")}}
- {{glossary("SSG", "Bộ tạo trang tĩnh")}}
- {{glossary("SPA", "Ứng dụng trang đơn")}}
