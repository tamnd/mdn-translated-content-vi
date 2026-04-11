---
title: "HTMLScriptElement: thuộc tính fetchPriority"
short-title: fetchPriority
slug: Web/API/HTMLScriptElement/fetchPriority
page-type: web-api-instance-property
browser-compat: api.HTMLScriptElement.fetchPriority
---

{{APIRef("HTML DOM")}}

Thuộc tính **`fetchPriority`** của giao diện {{domxref("HTMLScriptElement")}} biểu diễn gợi ý cho trình duyệt về cách ưu tiên tìm nạp tập lệnh ngoài so với các tập lệnh ngoài khác.
Nó phản ánh thuộc tính nội dung [`fetchpriority`](/en-US/docs/Web/HTML/Reference/Elements/script#fetchpriority) của phần tử `<script>`.

## Giá trị

Một chuỗi. Các giá trị được phép, xem thuộc tính HTML [`fetchpriority`](/en-US/docs/Web/HTML/Reference/Attributes/fetchpriority).

## Ví dụ

```html
<script id="el" type="module" src="main.js" fetchpriority="high"></script>
```

```js
const el = document.getElementById("el");
console.log(el.fetchPriority); // Kết quả: "high"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLImageElement.fetchPriority")}}
- {{domxref("HTMLLinkElement.fetchPriority")}}
- HTTP {{httpheader("Link")}} header
- [Tối ưu hóa tải tài nguyên với Fetch Priority API](https://web.dev/articles/fetch-priority?hl=en#browser_priority_and_fetchpriority) để biết thông tin về cách API này ảnh hưởng đến ưu tiên trên Chrome.
