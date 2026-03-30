---
title: Truy vấn media
slug: Glossary/Media_query
page-type: glossary-definition
sidebar: glossarysidebar
---

**Truy vấn media** (media query) là một biểu thức logic — là phương pháp dùng trong CSS, JavaScript, HTML và các ngôn ngữ web khác để kiểm tra các khía cạnh của tác nhân người dùng hoặc thiết bị mà tài liệu đang được hiển thị, độc lập với nội dung tài liệu, để xác định xem có nên áp dụng khối mã hoặc tính năng liên quan hay không.

Truy vấn media được sử dụng để áp dụng có điều kiện các kiểu dáng CSS với các at-rule CSS {{cssxref("@media")}} và {{cssxref("@import")}}, và trong JavaScript để kiểm tra và giám sát trạng thái media như phương thức {{DOMxRef("Window.matchMedia", "matchMedia()")}}, thuộc tính {{DOMxRef("MediaQueryList.matches", "matches")}}, và sự kiện {{DOMxRef("MediaQueryList.change_event", "change")}}. Truy vấn media được sử dụng làm giá trị của thuộc tính `media` của các phần tử [HTML](/en-US/docs/Web/HTML) [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link#media), [`<source>`](/en-US/docs/Web/HTML/Reference/Elements/source#media), và [`<style>`](/en-US/docs/Web/HTML/Reference/Elements/style#media), áp dụng liên kết, nguồn hoặc kiểu có điều kiện nếu truy vấn media là đúng. Khi thuộc tính `media` bị bỏ qua, nó mặc định là `true`. Truy vấn media cũng được sử dụng làm giá trị của thuộc tính [`sizes`](/en-US/docs/Web/API/HTMLImageElement/sizes) của phần tử {{HTMLElement("img")}}.

Truy vấn media được tạo thành từ các bộ điều chỉnh truy vấn media tùy chọn và các loại media, và không hoặc nhiều điều kiện media, cùng với các toán tử logic.

Truy vấn media được đánh giá lại khi môi trường người dùng thay đổi, chẳng hạn khi người dùng mở rộng cửa sổ trình duyệt hoặc lật thiết bị di động thay đổi từ chiều dọc sang chiều ngang.

Nhiều truy vấn media được phân cách bằng dấu phẩy tạo ra một **danh sách truy vấn media**. Danh sách truy vấn media là đúng nếu bất kỳ truy vấn media thành phần nào là đúng, và chỉ sai khi tất cả các truy vấn media thành phần đều sai.

Một truy vấn media có thể được tiền tố tùy chọn bởi một bộ điều chỉnh truy vấn media hoặc `not` hoặc `only`, trong trường hợp `not`, thay đổi ý nghĩa của truy vấn media tiếp theo.

## Xem thêm

- [Sử dụng truy vấn media](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- Module [CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
