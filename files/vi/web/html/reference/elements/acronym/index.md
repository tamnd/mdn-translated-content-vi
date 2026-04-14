---
title: <acronym>
slug: Web/HTML/Reference/Elements/acronym
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.acronym
sidebar: htmlsidebar
---

{{deprecated_header}}

Phần tử **`<acronym>`** trong [HTML](/en-US/docs/Web/HTML) cho phép tác giả chỉ ra rõ ràng một chuỗi ký tự tạo thành từ viết tắt hoặc chữ viết tắt cho một từ.

> [!WARNING]
> Không dùng phần tử này. Hãy dùng phần tử {{HTMLElement("abbr")}} thay thế.

## Thuộc tính

Phần tử này chỉ có [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes), là các thuộc tính chung cho tất cả các phần tử.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref('HTMLElement')}}.

## Ví dụ

```html
<p>
  The <acronym title="World Wide Web">WWW</acronym> is only a component of the
  Internet.
</p>
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Kiểu dáng mặc định

Mặc dù mục đích của thẻ này chỉ là tiện lợi cho tác giả, kiểu dáng mặc định của nó khác nhau giữa các trình duyệt:

- Opera, Firefox, Chrome và một số trình duyệt khác thêm gạch chân chấm vào nội dung của phần tử.
- Một số trình duyệt không chỉ thêm gạch chân chấm, mà còn hiển thị chữ in hoa nhỏ; để tránh kiểu dáng này, thêm {{cssxref("font-variant", "font-variant: none")}} trong CSS sẽ xử lý trường hợp này.

Do đó, các tác giả web được khuyến nghị nên tạo kiểu rõ ràng cho phần tử này, hoặc chấp nhận một số biến thể giữa các trình duyệt.

<!-- ## Technical summary -->

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HTMLElement("abbr")}}
