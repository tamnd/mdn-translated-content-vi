---
title: "HTMLLinkElement: thuộc tính href"
short-title: href
slug: Web/API/HTMLLinkElement/href
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.href
---

{{APIRef("HTML DOM")}}

Thuộc tính **`href`** của giao diện {{domxref("HTMLLinkElement")}} chứa một chuỗi là URL được liên kết với liên kết.

Nó phản ánh thuộc tính `href` của phần tử {{HTMLElement("link")}}. Nếu phần tử không có thuộc tính `href`, thì giá trị của thuộc tính này là chuỗi rỗng (`""`).

> [!NOTE]
> Mọi phần tử `<link>` phải chứa một trong hai thuộc tính `href` hoặc [`imagesrcset`](/en-US/docs/Web/HTML/Reference/Elements/link#imagesrcset) hoặc cả hai. Điều này có nghĩa, với mỗi `<link>` hợp lệ, hoặc thuộc tính này hoặc {{domxref("HTMLLinkElement.imageSrcset", "imageSrcset")}} sẽ không rỗng.

## Giá trị

Một chuỗi chứa URL, hoặc chuỗi rỗng (`""`) nếu không có phần tử `href`.

## Ví dụ

```html
<link rel="stylesheet" href="example.css" />
```

```js
const link = document.getElementsByTag("link")[0];
console.log(link.href); // 'example.css'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("HTMLLinkElement.imageSrcset")}}
- Thuộc tính {{domxref("HTMLAnchorElement.href")}}
