---
title: URL Fragment Text Directives
slug: Web/API/URL_Fragment_Text_Directives
page-type: web-api-overview
browser-compat:
  - api.Document.fragmentDirective
  - api.FragmentDirective
  - css.selectors.target-text
---

{{DefaultAPISidebar("URL Fragment Text Directives")}}

**URL fragment text directives API** cho phép các ứng dụng web tương tác với _text fragments_ trong URL. [Text fragments](/en-US/docs/Web/URI/Reference/Fragment/Text_fragments) cho phép liên kết trực tiếp đến một phần văn bản cụ thể trong tài liệu web mà không yêu cầu tác giả chú thích nó với ID, sử dụng cú pháp đặc biệt trong phần fragment của URL.

## Giao diện

- {{domxref("FragmentDirective")}}
  - : Một đối tượng (hiện tại) rỗng. Sự tồn tại của đối tượng kiểu này trong {{domxref("document.fragmentDirective")}} được sử dụng để phát hiện tính năng.

## Phần mở rộng của các giao diện khác

- {{domxref("Document.fragmentDirective")}}
  - : Thuộc tính trả về đối tượng `FragmentDirective` cho tài liệu hiện tại. Hiện chỉ được sử dụng để phát hiện tính năng.

## Bộ chọn CSS

- {{cssxref("::target-text")}}
  - : Đại diện cho văn bản đã được cuộn đến. Cho phép tác giả chọn cách làm nổi bật phần văn bản đó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [URI fragment](/en-US/docs/Web/URI/Reference/Fragment)
