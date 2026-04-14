---
title: Thuộc tính http-equiv của <meta>
short-title: <meta> http-equiv
slug: Web/HTML/Reference/Elements/meta/http-equiv
page-type: html-attribute
browser-compat: html.elements.meta.http-equiv
sidebar: htmlsidebar
---

Thuộc tính **`http-equiv`** của phần tử {{htmlelement("meta")}} cho phép bạn cung cấp các chỉ thị xử lý cho trình duyệt như thể phản hồi trả về tài liệu có chứa một số HTTP header nhất định.
Siêu dữ liệu này là _siêu dữ liệu cấp tài liệu_ áp dụng cho toàn bộ trang.

Khi một phần tử `<meta>` có thuộc tính `http-equiv`, thuộc tính [`content`](/en-US/docs/Web/HTML/Reference/Attributes/content) xác định giá trị `http-equiv` tương ứng.
Ví dụ, thẻ `<meta>` sau đây yêu cầu trình duyệt tải lại trang sau 5 phút:

```html
<meta http-equiv="Refresh" content="300" />
```

## Thuộc tính

Chỉ một tập hợp con các HTTP header được hỗ trợ làm giá trị `http-equiv`.
Bao gồm:

- `content-language` {{deprecated_inline}}
  - : Đặt ngôn ngữ mặc định cho tài liệu được sử dụng bởi các công nghệ hỗ trợ tiếp cận hoặc định kiểu bởi trình duyệt.
    Tương tự như HTTP header {{httpheader("Content-Language")}}.
    Hãy sử dụng thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) thay thế.
- `content-type`
  - : Khai báo [kiểu phương tiện (MIME type)](/en-US/docs/Web/HTTP/Guides/MIME_types) và bộ mã ký tự của tài liệu.
    Thuộc tính `content` phải là `"text/html; charset=utf-8"` nếu được chỉ định.
    Điều này tương đương với phần tử `<meta>` có thuộc tính [`charset`](/en-US/docs/Web/HTML/Reference/Elements/meta#charset) và có cùng hạn chế về vị trí trong tài liệu.
    Chỉ có thể sử dụng trong các tài liệu được phục vụ với kiểu phương tiện `text/html` — không áp dụng trong các tài liệu được phục vụ với kiểu XML (`application/xml` hoặc `application/xhtml+xml`).
    Xem HTTP header {{httpheader("Content-Type")}}.
- `content-security-policy`
  - : Cho phép tác giả trang xác định chính sách bảo mật nội dung (CSP) cho trang hiện tại, thường để chỉ định các nguồn gốc và điểm cuối script được phép nhằm bảo vệ chống lại các cuộc tấn công cross-site scripting.
    Xem HTTP header {{httpheader("Content-Security-Policy")}}.
- `default-style`
  - : Đặt tên của tập [CSS style sheet](/en-US/docs/Web/CSS) mặc định.
- `refresh`
  - : Tương đương với HTTP header {{httpheader("Refresh")}}.
    Chỉ thị này xác định:
    - Số giây cho đến khi trang sẽ được tải lại nếu thuộc tính `content` là một số nguyên không âm.
    - Số giây cho đến khi trang sẽ chuyển hướng đến URL khác nếu thuộc tính `content` là một số nguyên không âm theo sau bởi `;url=` và một URL hợp lệ.

    Bộ đếm thời gian bắt đầu khi trang được _tải hoàn toàn_, tức là sau khi cả hai sự kiện {{domxref("Window/load_event", "load")}} và {{domxref("Window/pageshow_event", "pageshow")}} đều đã kích hoạt.
    Xem phần [Vấn đề về khả năng tiếp cận](#accessibility_concerns) để biết thêm thông tin.

- `set-cookie` {{deprecated_inline}}
  - : Đặt cookie cho tài liệu.
    Các trình duyệt hiện nay bỏ qua pragma này; hãy sử dụng HTTP response header {{httpheader("Set-Cookie")}} hoặc [`document.cookie`](/en-US/docs/Web/API/Document/cookie) thay thế.
- `x-ua-compatible` {{deprecated_inline}}
  - : Được sử dụng bởi các phiên bản cũ của {{glossary("Microsoft Internet Explorer")}} đã nghỉ hưu để tuân theo hành vi được chỉ định chặt chẽ hơn.
    Nếu được chỉ định, thuộc tính `content` phải có giá trị `"IE=edge"`.
    Các user agent hiện nay bỏ qua pragma này.
    Tên xuất phát từ HTTP header `X-UA-Compatible`.

> [!WARNING]
> Một số trình duyệt xử lý các header bổ sung không được liệt kê ở trên.
> Vì các header không được nhận dạng hoặc giá trị không hợp lệ bị bỏ qua, điều này có thể dẫn đến hành vi không nhất quán giữa các triển khai trình duyệt.
> Đặc biệt, **Không đặt các security header khác** bằng cách sử dụng `<meta http-equiv=`, vì điều này có thể tạo ra cảm giác an toàn giả!

## Vấn đề về khả năng tiếp cận

Các trang được đặt với giá trị `http-equiv="Refresh"` có nguy cơ khoảng thời gian làm mới quá ngắn.
Những người điều hướng với sự trợ giúp của công nghệ hỗ trợ tiếp cận như trình đọc màn hình có thể không đủ thời gian để đọc và hiểu nội dung trang trước khi bị chuyển hướng tự động.
Các cập nhật trang đột ngột, không được thông báo cũng có thể gây mất phương hướng cho những người bị suy giảm thị lực.

- [Hướng dẫn MDN về WCAG, Giải thích Hướng dẫn 2.2](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable#guideline_2.2_—_enough_time_provide_users_enough_time_to_read_and_use_content)
- [Hướng dẫn MDN về WCAG, Giải thích Hướng dẫn 3.2](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Understandable#guideline_3.2_—_predictable_make_web_pages_appear_and_operate_in_predictable_ways)
- [Understanding Success Criterion 2.2.1 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/time-limits-required-behaviors.html)
- [Understanding Success Criterion 2.2.4 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/time-limits-postponed.html)
- [Understanding Success Criterion 3.2.5 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/consistent-behavior-no-extreme-changes-context.html)

## Ví dụ

### Vô hiệu hóa mã nội tuyến không an toàn và chỉ cho phép tài nguyên HTTPS

Phần tử HTML `<meta>` này đặt CSP mặc định để chỉ cho phép tải tài nguyên (hình ảnh, phông chữ, script, v.v.) qua HTTPS.
Vì các chỉ thị `unsafe-inline` và `unsafe-eval` không được đặt, các script nội tuyến sẽ bị chặn:

```html
<meta http-equiv="Content-Security-Policy" content="default-src https:" />
```

Các hạn chế tương tự có thể được áp dụng bằng cách sử dụng HTTP header {{httpheader("Content-Security-Policy")}}:

```http
Content-Security-Policy: default-src https:
```

### Đặt chuyển hướng trang

Ví dụ sau sử dụng `http-equiv="refresh"` để chỉ thị trình duyệt thực hiện chuyển hướng.
Thuộc tính `content="3;url=https://www.mozilla.org"` sẽ chuyển hướng trang đến `https://www.mozilla.org` sau 3 giây:

```html
<meta http-equiv="refresh" content="3;url=https://www.mozilla.org" />
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`<meta name="referrer">`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/referrer)
- [Siêu dữ liệu: phần tử `<meta>`](/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata#metadata_the_meta_element)
- [Ngăn chặn tấn công bằng `<meta>`](https://almanac.httparchive.org/en/2022/security#preventing-attacks-using-meta) httparchive.org (2022)
