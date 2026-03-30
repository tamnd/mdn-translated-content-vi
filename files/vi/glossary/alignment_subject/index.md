---
title: Alignment subject
slug: Glossary/Alignment_Subject
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong [căn chỉnh hộp CSS](/en-US/docs/Web/CSS/Guides/Box_alignment), **đối tượng căn chỉnh** (alignment subject) là thứ (hoặc những thứ) được căn chỉnh bên trong {{glossary("alignment container", "vùng chứa căn chỉnh")}} bởi thuộc tính.

Đối với {{cssxref("justify-self")}} và {{cssxref("align-self")}}, đối tượng căn chỉnh là hộp lề của hộp mà thuộc tính được đặt, sử dụng chế độ viết của hộp đó. Đối với {{cssxref("justify-content")}} và {{cssxref("align-content")}}, chế độ viết của hộp cũng được sử dụng.

Định nghĩa của đối tượng căn chỉnh phụ thuộc vào chế độ bố cục đang được sử dụng.

- Vùng chứa khối (bao gồm ô bảng)
  - : Toàn bộ nội dung của khối như một đơn vị duy nhất.
- Vùng chứa nhiều cột
  - : Các hộp cột, với bất kỳ khoảng cách nào được chèn giữa các hộp cột được thêm vào khoảng cách cột liên quan.
- Vùng chứa flex
  - : Đối với {{cssxref("justify-content")}}, các mục flex trong mỗi dòng flex. Đối với {{cssxref("align-content")}}, các dòng flex. Lưu ý, điều này chỉ có hiệu lực trên các vùng chứa flex nhiều dòng.
- Vùng chứa lưới
  - : Các track lưới theo trục thích hợp, với bất kỳ khoảng cách nào được chèn giữa các track được thêm vào các rãnh liên quan. Các rãnh thu gọn được coi như một cơ hội duy nhất để chèn khoảng cách.

## Xem thêm

- Mô-đun [căn chỉnh hộp CSS](/en-US/docs/Web/CSS/Guides/Box_alignment)
- Các thuật ngữ liên quan:
  - {{Glossary("alignment container")}}
