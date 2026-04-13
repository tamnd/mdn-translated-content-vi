---
title: Resolving relative references to a URL
slug: Web/API/URL_API/Resolving_relative_references
page-type: guide
---

{{DefaultAPISidebar("URL API")}}

[Hàm khởi tạo `URL()`](/en-US/docs/Web/API/URL/URL) hoặc phương thức tĩnh {{domxref("URL.parse_static", "URL.parse()")}} của [URL API](/en-US/docs/Web/API/URL_API) có thể được sử dụng để giải quyết tham chiếu tương đối và URL cơ sở thành URL tuyệt đối.

Cả hai phương thức nhận tối đa hai đối số chuỗi và trả về đối tượng [`URL()`](/en-US/docs/Web/API/URL) đại diện cho URL tuyệt đối. Đối số đầu tiên đại diện cho URL tuyệt đối hoặc tham chiếu tương đối đến URL, trong khi đối số thứ hai là URL cơ sở được sử dụng để giải quyết tham chiếu tương đối nếu một tham chiếu được chỉ định trong đối số đầu tiên. Các phương thức giải quyết tham chiếu tương đối theo cùng một cách, ngoại trừ hàm khởi tạo `URL()` ném lỗi nếu URL không hợp lệ được truyền vào, trong khi `parse()` trả về `null`.

## Tương đối với thư mục hiện tại

Tham chiếu tương đối có tiền tố `./` hoặc không có tiền tố, chẳng hạn như `./article`, `article`, hoặc `./article/`, là tương đối với thư mục hiện tại của URL được đại diện bởi đối số `base`.

```js
log(new URL("./article", "https://test.example.org/api/").href);
// => https://test.example.org/api/article
log(new URL("article", "https://test.example.org/api/v1").href);
// => https://test.example.org/api/article
```

## Tương đối với thư mục cha

Tham chiếu tương đối có tiền tố `../`, chẳng hạn như `../path`, là tương đối với thư mục _cha_ của thư mục hiện tại của URL được đại diện bởi đối số `base`.

```js
log(new URL("../path", "https://test.example.org/api/v1/v2/").href);
// => https://test.example.org/api/v1/path
```

## Tương đối với gốc trang web

Tham chiếu tương đối có tiền tố `/`, chẳng hạn như `/path`, là tương đối với gốc trang web của URL được chỉ định trong đối số `base`.

```js
log(new URL("/some/path", "https://test.example.org/api/").href);
// => https://test.example.org/some/path
```

## Xem thêm

- [RFC 3986 - Relative Resolution](https://datatracker.ietf.org/doc/html/rfc3986.html#section-5.2)
