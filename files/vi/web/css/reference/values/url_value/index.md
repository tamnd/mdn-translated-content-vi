---
title: <url>
slug: Web/CSS/Reference/Values/url_value
page-type: css-type
spec-urls: https://drafts.csswg.org/css-values/#url-value
sidebar: cssref
---

Kiểu dữ liệu **`<url>`** trong [CSS](/vi/docs/Web/CSS) là [kiểu dữ liệu](/vi/docs/Web/CSS/Reference/Values/Data_types) đại diện cho một con trỏ đến một tài nguyên.

## Cú pháp

```plain
<url> = url()
```

### Giá trị

Giá trị có thể là URL tuyệt đối hoặc URL tương đối.

- [`<url()>`](/vi/docs/Web/CSS/Reference/Values/url_function)
  - : Hàm `url()` chấp nhận một URL, có thể được viết dưới dạng chuỗi có dấu ngoặc kép hoặc dưới dạng token URL không có dấu ngoặc kép.

> [!NOTE]
> [Module giá trị và đơn vị CSS](/vi/docs/Web/CSS/Guides/Values_and_units) cũng giới thiệu hàm `src()` như một giá trị `<url>`. Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

## Mô tả

Kiểu dữ liệu `<url>`, được viết bằng hàm [`url()`](/vi/docs/Web/CSS/Reference/Values/url_function), đại diện cho một URL, là con trỏ đến tài nguyên nội bộ hoặc bên ngoài. Tài nguyên có thể là hình ảnh, video, tệp CSS, tệp font chữ, tính năng SVG, v.v. URL có thể là tuyệt đối hoặc tương đối.

```css
/* URL tương đối */
url("styles.css")
url("assets/icon.svg")
url("../assets/image.png")

/* URL tuyệt đối */
url("http://example.com/fonts/myFont.ttf")
url("https://example.com/images/background.jpg")

/* Data URL */
url("data:image/svg+xml,%3Csvg'%3E%3Cpath d='M10 10h60' stroke='%2300F' stroke-width='5'/%3E%3Cpath d='M10 20h60' stroke='%230F0' stroke-width='5'/%3E%3C/svg%3E")
url("data:image/png;base64,iVBORw0KGgoAAA...")
```

### Tài nguyên bên ngoài và CORS

Khả năng nhập tài nguyên bên ngoài thông qua giá trị `<url>` phụ thuộc vào cách triển khai và thường bị hạn chế vì lý do bảo mật.

Tùy thuộc vào thuộc tính CSS mà giá trị `<url>` tham chiếu đến tài nguyên bên ngoài được áp dụng, tài nguyên đó có thể bị ràng buộc bởi các hạn chế [Chia sẻ tài nguyên nguồn gốc chéo (CORS)](/vi/docs/Web/HTTP/Guides/CORS).

Một số thuộc tính CSS, bao gồm {{cssxref("mask-image")}}, {{cssxref("filter")}}, cũng như {{cssxref("clip-path")}} và một số thuộc tính khác khi tham chiếu đến các phần tử hình ảnh {{SVGElement("svg")}}, có thể yêu cầu xác thực CORS thành công khi chúng gây ra việc tải tài nguyên bên ngoài, nguồn gốc chéo ở chế độ CORS. Nếu xác thực CORS thất bại, tài nguyên có thể bị chặn và do đó không được sử dụng để hiển thị.

Lưu ý rằng bản thân kiểu giá trị `<url>` không thực thi xác thực CORS, nhưng các thuộc tính CSS riêng lẻ thì có.

Khi mở tệp HTML trực tiếp bằng `file://`, tài nguyên có thể thất bại vì các quy tắc CORS áp dụng cục bộ. Các trình duyệt hiện đại coi `file://` là một nguồn gốc duy nhất, có nghĩa là tài nguyên từ tệp khác có thể bị chặn. Trong trường hợp này, có thể chạy một [máy chủ HTTP](/vi/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server) để tránh lỗi CORS. Hành vi bảo mật của URL `file://` cũng thay đổi tùy thuộc vào trình duyệt và quyền tệp của hệ điều hành.

## Ví dụ

URL tương đối

```css
body {
  background-image: url("images/background.jpg");
}
```

URL tuyệt đối

```css
body {
  background-image: url("https://example.com/images/background.jpg");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- {{cssxref("url_function", "url()")}}
