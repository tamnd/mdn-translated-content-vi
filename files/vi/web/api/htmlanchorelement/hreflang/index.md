---
title: "HTMLAnchorElement: thuộc tính hreflang"
short-title: hreflang
slug: Web/API/HTMLAnchorElement/hreflang
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.hreflang
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`hreflang`** của giao diện {{domxref("HTMLAnchorElement")}} là một chuỗi cho biết ngôn ngữ của tài nguyên được liên kết.

Nó phản ánh thuộc tính `hreflang` của phần tử {{HTMLElement("a")}} và là chuỗi rỗng (`""`) nếu không có phần tử `hreflang`.

Trình duyệt web và công cụ tìm kiếm có thể sử dụng thông tin này để hiểu rõ hơn về ngôn ngữ của nội dung được liên kết, nhưng không bắt buộc phải tuân theo. Giá trị được cung cấp cho thuộc tính `hreflang` tuân theo định dạng {{glossary("BCP 47 language tag", "thẻ ngôn ngữ BCP 47")}}. Nếu không, nó sẽ bị bỏ qua.

Trình duyệt web không chỉ dựa vào thuộc tính `hreflang` sau khi lấy tài nguyên được liên kết. Thay vào đó, chúng sử dụng thông tin ngôn ngữ được liên kết trực tiếp với tài nguyên (ví dụ: thông qua tiêu đề HTTP) để xác định ngôn ngữ của nó.

## Giá trị

Một chuỗi chứa thẻ ngôn ngữ, hoặc chuỗi rỗng (`""`) nếu không có phần tử `hreflang`.

## Ví dụ

```html
<a id="exampleLink" href="https://example.com" hreflang="en-IN">Ví dụ liên kết</a>
<p class="hreflang"></p>
```

```css
#exampleLink {
  font-size: 1.5rem;
}
```

```js
const anchorElement = document.getElementById("exampleLink");
const pTag = document.querySelector(".hreflang");
console.log(anchorElement.hreflang); // Xuất ra: "en-IN"
pTag.textContent = anchorElement.hreflang;
```

## Kết quả

{{EmbedLiveSample("Example",100,100)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("HTMLLinkElement.hreflang")}}
