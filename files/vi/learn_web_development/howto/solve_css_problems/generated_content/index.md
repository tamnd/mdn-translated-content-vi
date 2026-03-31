---
title: Use CSS generated content
short-title: Use generated content
slug: Learn_web_development/Howto/Solve_CSS_problems/Generated_content
page-type: learn-faq
sidebar: learn-how-to
---

Bài viết này mô tả một số cách bạn có thể sử dụng CSS để thêm nội dung khi tài liệu được hiển thị. Bạn sửa đổi stylesheet của mình để thêm nội dung văn bản hoặc hình ảnh.

Một trong những lợi thế quan trọng của CSS là nó giúp bạn tách biệt kiểu dáng của tài liệu với nội dung của nó. Tuy nhiên, có những tình huống nơi việc chỉ định một số nội dung nhất định như một phần của stylesheet, không phải như một phần của tài liệu, có ý nghĩa. Bạn có thể chỉ định nội dung văn bản hoặc hình ảnh trong một stylesheet khi nội dung đó liên kết chặt chẽ với cấu trúc của tài liệu.

> [!NOTE]
> Nội dung được chỉ định trong stylesheet không trở thành một phần của DOM.

Việc chỉ định nội dung trong stylesheet có thể gây ra các vấn đề phức tạp. Ví dụ, bạn có thể có các phiên bản ngôn ngữ khác nhau của tài liệu chia sẻ một stylesheet. Nếu bạn chỉ định nội dung trong stylesheet của mình cần dịch, bạn phải đặt các phần đó của stylesheet trong các file khác nhau và sắp xếp để chúng được liên kết với các phiên bản ngôn ngữ phù hợp của tài liệu.

Vấn đề này không phát sinh nếu nội dung bạn chỉ định bao gồm các ký hiệu hoặc hình ảnh áp dụng trong tất cả các ngôn ngữ và văn hóa.

## Ví dụ

### Nội dung văn bản

CSS có thể chèn nội dung văn bản trước hoặc sau một phần tử, hoặc thay đổi nội dung của marker mục danh sách (như ký hiệu dấu đầu dòng hoặc số) trước một {{HTMLElement('li')}} hoặc phần tử khác với {{ cssxref("display", "display: list-item;") }}. Để chỉ định điều này, hãy tạo một quy tắc và thêm {{ cssxref("::before") }}, {{ cssxref("::after") }}, hoặc {{cssxref("::marker")}} vào selector. Trong khai báo, chỉ định thuộc tính {{ cssxref("content") }} với nội dung văn bản là giá trị của nó.

#### HTML

```html
A text where I need to <span class="ref">something</span>
```

#### CSS

```css
.ref::before {
  font-weight: bold;
  color: navy;
  content: "Reference ";
}
```

#### Kết quả

{{ EmbedLiveSample('Text_content', 600, 30) }}

Bộ ký tự của stylesheet mặc định là UTF-8, nhưng nó cũng có thể được chỉ định trong liên kết, trong chính stylesheet, hoặc theo các cách khác. Để biết chi tiết, xem tài liệu tham khảo {{cssxref("@charset")}}.

Các ký tự riêng lẻ cũng có thể được chỉ định bằng cơ chế escape sử dụng dấu gạch chéo ngược làm ký tự escape. Ví dụ, "\265B" là ký hiệu cờ vua cho quân hậu đen ♛.

### Nội dung hình ảnh

Để thêm hình ảnh trước hoặc sau một phần tử, bạn có thể chỉ định URL của một file hình ảnh trong giá trị của thuộc tính {{ cssxref("content") }}.

Quy tắc này thêm một khoảng trắng và biểu tượng sau mỗi liên kết có class `glossary`:

#### HTML

```html
<a href="developer.mozilla.org" class="glossary">developer.mozilla.org</a>
```

#### CSS

```css
a.glossary::after {
  content: " " url("glossary-icon.gif");
}
```

{{ EmbedLiveSample('Image_content', 600, 40) }}
