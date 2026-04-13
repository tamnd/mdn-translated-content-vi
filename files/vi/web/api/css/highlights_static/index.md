---
title: "CSS: thuộc tính tĩnh highlights"
short-title: highlights
slug: Web/API/CSS/highlights_static
page-type: web-api-static-property
browser-compat: api.CSS.highlights_static
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc tĩnh **`highlights`** của giao diện {{domxref("CSS")}} cung cấp quyền truy cập vào `HighlightRegistry` dùng để tạo kiểu cho các phạm vi văn bản tùy ý bằng {{domxref("css_custom_highlight_api", "CSS Custom Highlight API", "", "nocode")}}.

## Giá trị

Đối tượng {{DOMxRef("HighlightRegistry")}}.

## Ví dụ

Ví dụ sau minh họa cách tạo nhiều phạm vi văn bản, sau đó tạo một đối tượng `Highlight` cho chúng, đăng ký highlight này trong `HighlightRegistry`, và cuối cùng tạo kiểu cho các phạm vi văn bản bằng phần tử giả {{cssxref("::highlight", "::highlight()")}}.

```js
const parentNode = document.getElementById("foo");

const range1 = new Range();
range1.setStart(parentNode, 10);
range1.setEnd(parentNode, 20);

const range2 = new Range();
range2.setStart(parentNode, 40);
range2.setEnd(parentNode, 60);

const myCustomHighlight = new Highlight(range1, range2);

CSS.highlights.set("my-custom-highlight", myCustomHighlight);
```

```css
::highlight(my-custom-highlight) {
  background-color: yellow;
  color: black;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "CSS Custom Highlight API", "", "nocode")}}
- Mô-đun [CSS custom highlight API](/en-US/docs/Web/CSS/Guides/Custom_highlight_API)
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
