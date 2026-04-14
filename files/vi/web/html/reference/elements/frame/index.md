---
title: <frame>
slug: Web/HTML/Reference/Elements/frame
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.frame
sidebar: htmlsidebar
---

{{Deprecated_Header}}

Phần tử **`<frame>`** trong [HTML](/vi/docs/Web/HTML) xác định một vùng cụ thể trong đó một tài liệu HTML khác có thể được hiển thị. Một khung nên được sử dụng trong một {{HTMLElement("frameset")}}.

Việc sử dụng phần tử `<frame>` không được khuyến khích vì một số nhược điểm như vấn đề về hiệu suất và thiếu khả năng tiếp cận cho người dùng sử dụng đọc màn hình. Thay vì phần tử `<frame>`, {{HTMLElement("iframe")}} có thể được ưu tiên sử dụng hơn.

## Thuộc tính

Cũng như tất cả các phần tử HTML khác, phần tử này hỗ trợ [các thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

- `src` {{Deprecated_Inline}}
  - : Thuộc tính này chỉ định tài liệu sẽ được hiển thị bởi khung.
- `name` {{Deprecated_Inline}}
  - : Thuộc tính này được sử dụng để gán nhãn cho các khung. Nếu không có nhãn, mọi liên kết sẽ mở trong khung mà nó đang ở – khung cha gần nhất. Xem thuộc tính [`target`](/vi/docs/Web/HTML/Reference/Elements/a#target) để biết thêm thông tin.
- `noresize` {{Deprecated_Inline}}
  - : Thuộc tính này ngăn người dùng thay đổi kích thước các khung.
- `scrolling` {{Deprecated_Inline}}
  - : Thuộc tính này xác định sự tồn tại của thanh cuộn. Nếu thuộc tính này không được sử dụng, trình duyệt sẽ thêm thanh cuộn khi cần thiết. Có hai lựa chọn: "yes" để buộc thanh cuộn ngay cả khi không cần thiết và "no" để buộc không có thanh cuộn ngay cả khi _cần thiết_.
- `marginheight` {{Deprecated_Inline}}
  - : Thuộc tính này xác định chiều cao của lề giữa các khung.
- `marginwidth` {{Deprecated_Inline}}
  - : Thuộc tính này xác định chiều rộng của lề giữa các khung.
- `frameborder` {{Deprecated_Inline}}
  - : Thuộc tính này cho phép bạn chỉ định đường viền của khung.

## Ví dụ

### Tài liệu frameset

Một tài liệu frameset có phần tử {{HTMLElement("frameset")}} thay vì phần tử {{HTMLElement("body")}}. Các phần tử `<frame>` được đặt trong `<frameset>`.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <!-- Document metadata goes here -->
  </head>
  <frameset cols="400, 500">
    <frame src="https://developer.mozilla.org/en/HTML/Element/iframe" />
    <frame src="https://developer.mozilla.org/en/HTML/Element/frame" />
  </frameset>
</html>
```

Nếu bạn muốn nhúng một trang HTML khác vào {{HTMLElement("body")}} của tài liệu, hãy sử dụng phần tử {{HTMLElement("iframe")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("frameset")}}
- {{HTMLElement("iframe")}}
