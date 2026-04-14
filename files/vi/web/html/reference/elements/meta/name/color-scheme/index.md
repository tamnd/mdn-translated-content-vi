---
title: <meta name="color-scheme">
short-title: color-scheme
slug: Web/HTML/Reference/Elements/meta/name/color-scheme
page-type: html-attribute-value
browser-compat: html.elements.meta.name.color-scheme
sidebar: htmlsidebar
---

Giá trị **`color-scheme`** cho thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/meta/name) của phần tử {{htmlelement("meta")}} chỉ ra bảng màu được đề xuất mà các user agent nên sử dụng cho một trang.
Nếu được chỉ định, bạn xác định bảng màu bằng cách sử dụng thuộc tính [`content`](/en-US/docs/Web/HTML/Reference/Elements/meta#content) trong phần tử `<meta>` với một giá trị CSS {{cssxref("color-scheme")}} hợp lệ.

Màu chủ đề hoạt động ở _cấp độ tài liệu_ theo cùng cách mà thuộc tính CSS {{cssxref("color-scheme")}} chỉ định các bảng màu ưu tiên và được chấp nhận của _các phần tử riêng lẻ_.
Mục đích chính của `<meta name="color-scheme">` là chỉ ra khả năng tương thích và thứ tự ưu tiên cho chế độ màu sáng và tối.
Ví dụ, để chỉ ra rằng một tài liệu ưu tiên chế độ tối nhưng cũng hỗ trợ chế độ sáng:

```html
<meta name="color-scheme" content="dark light" />
```

Các kiểu của bạn có thể thích nghi với bảng màu hiện tại bằng cách sử dụng tính năng CSS media {{cssxref("@media/prefers-color-scheme", "prefers-color-scheme")}}.

## Ghi chú sử dụng

Một phần tử `<meta name="color-scheme">` có các thuộc tính bổ sung sau:

- [`content`](/en-US/docs/Web/HTML/Reference/Elements/meta#content)
  - : Một phần tử `<meta>` với `name=color-scheme` phải có thuộc tính `content` xác định bảng màu dưới dạng giá trị CSS {{cssxref("color-scheme")}}.
    Thuộc tính `content` có thể là một trong những giá trị sau:
    - `normal`
      - : Tài liệu không nhận biết về các bảng màu và nên được hiển thị bằng bảng màu mặc định.
    - `light`, `dark`, `light dark`, `dark light`
      - : Một hoặc nhiều bảng màu được tài liệu hỗ trợ.
        Nhiều bảng màu chỉ ra rằng bảng màu đầu tiên được tài liệu ưu tiên, nhưng bảng màu thứ hai được chấp nhận nếu người dùng ưu tiên nó.
        Chỉ định cùng một bảng màu nhiều lần có tác dụng tương đương với việc chỉ định nó một lần.
    - `only light`
      - : Chỉ ra rằng tài liệu _chỉ_ hỗ trợ chế độ sáng, với màu nền sáng và màu nền trước tối.
        `only dark` _không hợp lệ_, vì việc buộc một tài liệu hiển thị ở chế độ tối khi không tương thích có thể dẫn đến nội dung không đọc được và tất cả các trình duyệt lớn mặc định ở chế độ sáng nếu không được cấu hình khác.
- `media` {{optional_inline}}
  - : Bất kỳ loại phương tiện hoặc truy vấn hợp lệ nào.
    Nếu được cung cấp, các tùy chọn cho bảng màu của tài liệu được xác định trong thuộc tính `content` được đề xuất với trình duyệt khi media query khớp.
    Điều này hữu ích nhất cho tính năng CSS media {{cssxref("@media/prefers-color-scheme", "prefers-color-scheme")}}.

## Ví dụ

### Sử dụng từ khóa color-scheme

Ví dụ sau đây cho biết với trình duyệt rằng trang hỗ trợ cả chủ đề sáng và tối.
Việc sử dụng bảng màu sáng hay tối phụ thuộc vào tùy chọn của người dùng, chẳng hạn như cài đặt cấp độ hệ điều hành hoặc cài đặt trình duyệt:

```html
<meta name="color-scheme" content="light dark" />
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("color-scheme")}}
- Media query {{cssxref("@media/prefers-color-scheme")}}
