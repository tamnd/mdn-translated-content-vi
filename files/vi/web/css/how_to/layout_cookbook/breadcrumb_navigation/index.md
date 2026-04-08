---
title: Breadcrumb navigation
slug: Web/CSS/How_to/Layout_cookbook/Breadcrumb_navigation
page-type: how-to
sidebar: cssref
---

Breadcrumb navigation giúp người dùng hiểu vị trí của họ trên trang web bằng cách cung cấp đường dẫn {{glossary("breadcrumb")}} dẫn trở lại trang đầu. Các mục thường được hiển thị nội tuyến, với dấu phân cách giữa mỗi mục, cho thấy cấu trúc phân cấp giữa các trang riêng lẻ.

![Các liên kết hiển thị nội tuyến với dấu phân cách](breadcrumb-navigation.png)

## Yêu cầu

Hiển thị cấu trúc phân cấp của trang web bằng cách hiển thị các liên kết nội tuyến, với dấu phân cách giữa các mục, chỉ ra cấu trúc phân cấp giữa các trang riêng lẻ, với trang hiện tại xuất hiện cuối cùng.

## Công thức

Nhấp vào "Play" trong các khối code bên dưới để chỉnh sửa ví dụ trong MDN Playground:

```html live-sample___breadcrumb-example
<nav aria-label="Breadcrumb" class="breadcrumb">
  <ol>
    <li><a href="#">Home</a></li>
    <li><a href="#">Category</a></li>
    <li><a href="#">Sub Category</a></li>
    <li><a href="#">Type</a></li>
    <li><span aria-current="page">Product</span></li>
  </ol>
</nav>
```

```css live-sample___breadcrumb-example
body {
  font: 1.2em sans-serif;
}

.breadcrumb {
  padding: 0 0.5rem;
}

.breadcrumb ol {
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  margin: 0;
  padding: 0;
  align-items: end;
}

.breadcrumb li:not(:last-child)::after {
  display: inline-block;
  margin: 0 0.25rem;
  content: "→";
}
```

{{EmbedLiveSample("breadcrumb-example", "", "100px")}}

> [!NOTE]
> Ví dụ trên sử dụng bộ chọn phức tạp để chèn nội dung trước mỗi `li` trừ phần tử cuối cùng. Điều này cũng có thể đạt được bằng cách sử dụng bộ chọn phức tạp nhắm mục tiêu tất cả các phần tử `li` trừ phần tử đầu tiên:
>
> ```css
> .breadcrumb li:not(:first-child)::before {
>   content: "→";
> }
> ```
>
> Hãy thoải mái chọn giải pháp mà bạn thích.

## Các lựa chọn được thực hiện

Để hiển thị các mục danh sách nội tuyến, chúng ta sử dụng [flexbox layout](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox), từ đó minh họa cách một dòng CSS có thể tạo ra navigation cho chúng ta. Các dấu phân cách được thêm bằng cách sử dụng [CSS generated content](/en-US/docs/Web/CSS/Guides/Generated_content). Bạn có thể thay đổi chúng thành bất kỳ dấu phân cách nào bạn thích.

## Vấn đề về khả năng tiếp cận

Chúng tôi đã sử dụng các thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) và [`aria-current`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-current) để giúp người dùng công nghệ hỗ trợ hiểu navigation này là gì và trang hiện tại đang ở đâu trong cấu trúc. Xem các liên kết liên quan để biết thêm thông tin.

Hãy lưu ý rằng các mũi tên phân cách `→` được thêm qua thuộc tính CSS {{cssxref("content")}} trong ví dụ trên sẽ được phát hiện bởi các công nghệ hỗ trợ (AT), bao gồm trình đọc màn hình và màn hình chữ nổi. Để có giải pháp ít gây phiền hơn, hãy sử dụng {{HTMLElement("img")}} trang trí trong HTML với thuộc tính `alt` rỗng. Một ARIA [`role`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) được đặt thành [`none`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role) hoặc [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cũng sẽ ngăn hình ảnh bị phát hiện bởi AT.

Ngoài ra, hãy tắt [CSS generated content](/en-US/docs/Web/CSS/Guides/Generated_content) bằng cách bao gồm một chuỗi rỗng làm văn bản thay thế, đứng trước dấu gạch chéo (`/`); ví dụ: `content: url("arrow.png") / "";`.

Nếu bao gồm các dấu phân cách được tạo sẽ được phát hiện bởi AT, hãy chọn tạo generated content bằng bộ chọn pseudo-element {{cssxref("::after")}} thay vì {{cssxref("::before")}}, để nội dung dấu phân cách được thông báo sau nội dung HTML thay vì trước.

## Xem thêm

- [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout)
- [Providing a breadcrumb trail](https://www.w3.org/TR/WCAG20-TECHS/G65.html)
- [Using the `aria-current` attribute](https://tink.uk/using-the-aria-current-attribute/)
