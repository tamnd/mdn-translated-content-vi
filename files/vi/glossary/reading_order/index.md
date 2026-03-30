---
title: Reading order
slug: Glossary/Reading_order
page-type: glossary-definition
sidebar: glossarysidebar
---

**Thứ tự đọc** (Reading order) đề cập đến thứ tự mà nội dung được truy cập, ví dụ khi được đọc to bởi {{glossary("screen reader")}} (đọc màn hình), hoặc khi điều hướng bằng các phương thức điều hướng tuần tự như nhấn Tab qua các liên kết hoặc nút bấm. Mặc định, thứ tự đọc của trang web được xác định bởi thứ tự nguồn (source order) của tài liệu.

Nhìn chung, thứ tự nguồn nên thể hiện thứ tự đọc hợp lý cho nội dung, và điều này cũng nên được phản ánh trong thứ tự hiển thị trực quan của bố cục nội dung. Tuy nhiên, đôi khi thứ tự hiển thị trực quan và thứ tự nguồn không đồng bộ. Ví dụ, bạn có thể áp dụng các bố cục khác nhau cho một tài liệu dựa trên [media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using) để phù hợp với các yêu cầu thiết bị hoặc người dùng khác nhau, hoặc điều chỉnh thứ tự Tab qua [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex).

Những cập nhật này có thể gây ra vấn đề về khả năng tiếp cận. Ví dụ, khi người dùng đọc màn hình có thị lực nhấn Tab qua nội dung và thứ tự đọc màn hình khác với thứ tự trực quan, đây là trải nghiệm người dùng tồi và có thể không thể tiếp cận được. Thứ tự đọc nên có nghĩa đối với tất cả người dùng bất kể cách họ truy cập nội dung.

## Chỉnh sửa thứ tự đọc trong CSS

Thứ tự đọc của phần tử có thể được chỉnh sửa thông qua thuộc tính {{cssxref("reading-flow")}}, và được tinh chỉnh thêm bằng cách đặt các giá trị {{cssxref("reading-order")}} trên các phần tử con của phần tử đó.

Các định nghĩa sau đây quan trọng để hiểu thứ tự đọc được chỉnh sửa:

- Reading flow container (Vùng chứa luồng đọc)
  - : Phần tử có thứ tự đọc được chỉnh sửa dựa trên các giá trị đặt cho thuộc tính {{cssxref("reading-flow")}} và {{cssxref("reading-order")}} của nó.
- Reading flow (Luồng đọc)
  - : Thứ tự đọc được chỉnh sửa của các phần tử con của một reading flow container.

## Xem thêm

- {{cssxref("reading-flow")}}
- {{cssxref("reading-order")}}
- {{cssxref("flex-direction")}}
- {{cssxref("order")}}
- [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex)
