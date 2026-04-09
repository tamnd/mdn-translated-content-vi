---
title: URI query
short-title: Query
slug: Web/URI/Reference/Query
page-type: uri-component
spec-urls: https://www.rfc-editor.org/rfc/rfc3986.html#section-3.4
sidebar: urlsidebar
---

**query** của một URI là phần nằm sau [path](/en-US/docs/Web/URI/Reference/Path).
Nó chứa dữ liệu không phân cấp để xác định một tài nguyên trong phạm vi [scheme](/en-US/docs/Web/URI/Reference/Schemes) và thẩm quyền đặt tên của URI, cùng với dữ liệu trong thành phần path.

## Cú pháp

```url
?query
```

- `query`
  - : Một chuỗi gồm bất kỳ ký tự nào, ngoại trừ ký tự `#`, là ký tự bắt đầu [fragment](/en-US/docs/Web/URI/Reference/Fragment).
    Định dạng chính xác của query do chính tài nguyên đó xác định.

## Mô tả

Hãy xem URL sau:

```url
http://www.example.com:80/path/to/myfile.html?key1=value1&key2=value2#SomewhereInTheDocument
```

`?key1=value1&key2=value2` là thành phần query chứa các tham số để máy chủ web xử lý.
Các tham số cụ thể trong ví dụ là một danh sách các cặp khóa/giá trị được ngăn cách bằng ký hiệu `&`.
Máy chủ web có thể dùng các tham số này để sửa đổi phản hồi, chẳng hạn như áp dụng lọc, tìm kiếm hoặc sắp xếp kết quả, mặc dù điều này phụ thuộc vào cách triển khai.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [URIs](/en-US/docs/Web/URI)
