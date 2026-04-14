---
title: <xmp>
slug: Web/HTML/Reference/Elements/xmp
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.xmp
sidebar: htmlsidebar
---

{{deprecated_header}}

## Tóm tắt

Phần tử **`<xmp>`** trong [HTML](/en-US/docs/Web/HTML) hiển thị văn bản giữa các thẻ bắt đầu và kết thúc mà không giải thích HTML ở giữa và sử dụng phông chữ monospace. Đặc tả HTML2 khuyến nghị rằng nó nên được hiển thị đủ rộng để cho phép 80 ký tự mỗi dòng.

> [!NOTE]
> Không dùng phần tử này.
>
> - Nó đã bị deprecated từ HTML3.2 và không được triển khai nhất quán. Nó đã bị xóa hoàn toàn khỏi HTML hiện tại.
> - Hãy dùng phần tử {{HTMLElement("pre")}} hoặc, nếu đúng ngữ nghĩa, phần tử {{HTMLElement("code")}} thay thế. Lưu ý rằng bạn cần thoát ký tự `<` thành `&lt;` và ký tự `&` thành `&amp;` để đảm bảo chúng không bị giải thích là đánh dấu.
> - Phông chữ monospace cũng có thể được áp dụng cho bất kỳ phần tử nào bằng cách áp dụng kiểu [CSS](/en-US/docs/Web/CSS) phù hợp sử dụng `monospace` làm giá trị phông chữ chung cho thuộc tính {{cssxref("font-family")}}.

## Thuộc tính

Phần tử này không có thuộc tính nào khác ngoài [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes), chung cho tất cả các phần tử.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref('HTMLElement')}}.

<!-- ## Technical summary -->

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử {{HTMLElement("pre")}} và {{HTMLElement("code")}} được dùng thay thế.
- Phần tử {{HTMLElement("plaintext")}}, tương tự `<xmp>` nhưng cũng đã lỗi thời.
