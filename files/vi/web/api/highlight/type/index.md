---
title: "Highlight: type property"
short-title: type
slug: Web/API/Highlight/type
page-type: web-api-instance-property
browser-compat: api.Highlight.type
---

{{APIRef("CSS Custom Highlight API")}}

Thuộc tính `type` của giao diện {{domxref("Highlight")}} là một {{jsxref("String")}} liệt kê được dùng để chỉ định ý nghĩa của vùng làm nổi bật. Điều này cho phép các công nghệ hỗ trợ, chẳng hạn như trình đọc màn hình, bao gồm ý nghĩa này khi hiển thị vùng làm nổi bật cho người dùng.

Theo mặc định, một đối tượng làm nổi bật sẽ có loại được đặt thành `highlight`, nhưng bạn có thể thay đổi nó thành `spelling-error` hoặc `grammar-error`.

## Giá trị

Các giá trị có thể có của giá trị liệt kê `type` là:

- `highlight`
  - : Đây là loại làm nổi bật mặc định. Nó không có ý nghĩa cụ thể nào.
- `spelling-error`
  - : Sử dụng loại này khi vùng làm nổi bật được dùng để nhấn mạnh nội dung bị viết sai chính tả.
- `grammar-error`
  - : Sử dụng loại này khi vùng làm nổi bật được dùng để nhấn mạnh nội dung không đúng ngữ pháp.

## Ví dụ

```js
const spellErrorRange = new Range();
spellErrorRange.setStart(textNode, 10);
spellErrorRange.setEnd(textNode, 20);

const spellErrorsHighlight = new Highlight(spellErrorRange);

spellErrorsHighlight.type = "spelling-error";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS custom highlight API](/en-US/docs/Web/CSS/Guides/Custom_highlight_API) module
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
