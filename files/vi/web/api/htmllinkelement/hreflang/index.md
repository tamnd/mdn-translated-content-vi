---
title: "HTMLLinkElement: thuộc tính hreflang"
short-title: hreflang
slug: Web/API/HTMLLinkElement/hreflang
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.hreflang
---

{{APIRef("HTML DOM")}}

Thuộc tính **`hreflang`** của giao diện {{domxref("HTMLLinkElement")}} được sử dụng để chỉ ngôn ngữ và phạm vi địa lý của một trang. Gợi ý này có thể được trình duyệt sử dụng để chọn trang phù hợp hơn hoặc cải thiện {{Glossary("SEO")}}.

Nó phản ánh thuộc tính `hreflang` của phần tử {{HTMLElement("link")}} và là chuỗi rỗng (`""`) nếu không có thuộc tính `hreflang`.

## Giá trị

Một chuỗi chứa thẻ ngôn ngữ, hoặc chuỗi rỗng (`""`) nếu không có thuộc tính `hreflang`.

## Ví dụ

```html
<link
  rel="alternate"
  href="www.example.com/fr/html"
  hreflang="fr"
  type="text/html"
  title="French HTML" />
<p class="tag"></p>
```

```css
.tag {
  margin-left: 20px;
  font-weight: bold;
  font-size: 24px;
}
```

```js
const myLink = document.querySelector("link");
const pTag = document.querySelector(".tag");
pTag.textContent = myLink.hreflang;
```

## Kết quả

{{EmbedLiveSample("Example",100,100)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("HTMLAnchorElement.hreflang")}}
